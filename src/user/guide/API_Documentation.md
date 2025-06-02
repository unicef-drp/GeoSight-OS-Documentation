# API Documentation

## Data-Pipelines

**Running on Databricks**

| **Source** | **Platform** | **Type** |**Description** |**Status** |
| :--------- | :----------- | :-------------- | :-------------- | :--------- |
| ACLED | ArcGIS | Point Layer | Conflict Events | ✅ every Friday |
| ACLED | GeoSight | Indicator | Number of Conflicts in the last 30 days |✅ every Friday |
| ACLED | GeoSight | Indicator | Number of Fatalities in the last 30 days |✅ every Friday |
| ACLED | GeoSight | Indicator | % Change of Fatalities in the last 7 days |✅ every Friday |
| ACLED | GeoSight | Related Table | Conflict Events |🔜 coming soon |

The following documentation explains the ETL-scripts for pulling data into a Pandas DataFrame, geocoding the data using **GeoRepo**, and calculating indicators that can be pushed to **GeoSight**, as well as pushing the data points to an **ArcGIS** layer.

**The different stages and tasks are divided into separate functions to facilitate easier updating and modification.**

The directory `ACLED` contains all scripts specifically made for this source of data, along with **further explanation for using the ACLED API and calculating basic conflict indicators**. The general flow of data is as follows:

|-- `ACLED Data - Pull ACLED data into pandas DataFrame`<br/>
|&emsp;&emsp;Pulls data from the source and structures it into a Pandas DataFrame.<br/>
|<br/>
|-- `GeoRepo - Geocoding pandas DataFrames`<br/>
|&emsp;&emsp;Retrieves the 'ucodes' from GeoRepo for the specified administrative level.<br/>
&emsp;&emsp;|<br/>
&emsp;&emsp;|-- `GeoSight - API functions`<br/>
&emsp;&emsp;|&emsp;&emsp;|-- `GeoSight - ACLED Conflict Indicators`<br/>
&emsp;&emsp;|&emsp;&emsp;|&emsp;&ensp;Calculates indicators and pushes them to GeoSight.<br/>
&emsp;&emsp;|&emsp;&emsp;|<br/>
&emsp;&emsp;|&emsp;&emsp;|-- `GeoSight - ACLED Related Tables`<br/>
&emsp;&emsp;|&emsp;&emsp;|&emsp;&ensp;*COMING SOON*<br/>
&emsp;&emsp;|<br/>
&emsp;&emsp;|-- `ArcGIS - ACLED data pipeline`<br/>
&emsp;&emsp;|&emsp;&emsp;Updates ArcGIS layer.


&nbsp;
## GeoRepo - Geocoding pandas DataFrames
*Please note that the UUID for all boundaries is hard-coded to use the latest 'Global Administrative Boundaries'.*

### `get_georepo_batch_request_id(long_lat_list, admin_level)`
This function uses the POST request for batch-geocoding to get the request ID that is necessary for the GET request to get the results. This function is part of the `get_georepo_ucodes(long_lat_list, admin_level)` function. 

| **INPUTS**              | |
| :---------------- | :------ | 
|`long_lat_list`|takes a list of longitude and latitude values in the following format:  `[[long, lat], ...]`| 
|`admin_level`|administrative level of the ucodes that will be requested, e.g. `0`for national level|

| **OUTPUTS**              | |
| :---------------- | :------ | 
|`georepo_batch_request_id['request_id']`|returns the batch request ID that is necessary to retrieve the actual ucodes| 


The provided coordinates list is converted into a GeoJSON file:
```python
features_list = []
  for c in long_lat_list: 
    features_list.append({"type": "Feature", "properties": {}, "geometry": {"coordinates": c, "type": "Point"}})

  # Create a GeoJSON string
  geojson_data = {"type": "FeatureCollection", "features": features_list}

  with NamedTemporaryFile(mode='w+', suffix='.json') as temp_file:
    # Write the GeoJSON directly to the temporary file
    temp_file.write(geopandas.GeoDataFrame.from_features(geojson_data).geometry.to_json())
    temp_file.flush()  # Ensure all data is written before sending
    temp_file.seek(0)  # Reset file pointer to the beginning

    geo_json_file = {'file': (temp_file.name, temp_file, 'application/geo+json')}
```

As mentioned above, the UUID is set to use the latest version of the 'Global Administrative Boundaries'. The `spatial_query` is set to `ST_Intersect`, the `distance` to `0`, and `id_type` to `ucode`. Since some events might occur outside any of the official boundaries, the `find_nearest`-parameter is set to `true` to avoid not returning any ucodes.
```python
georepo_batch_request_id = requests.post(
      url=georepo_endpoint+f'/operation/view/{uuid_view_global_admin__boundaries_latest}/batch-containment-check/ST_Intersects/{distance}/{admin_level}/{id_type}/?find_nearest=true', 
      headers=georepo_header, 
      params={'admin_level': admin_level},
      files=geo_json_file
      ).json()
```
&nbsp;
### `get_georepo_response(geometry, admin_level)`
This function is not currently utilized in the ACLED pipelines. However, it can be used to directly retrieve the ucode for a provided geometry.

| **INPUTS**              | |
| :---------------- | :------ | 
|`geometry`|accepts a dictionary containing the coordinates and type of the provided geometry. e.g. `{"coordinates": [long, lat], "type": "Point"}` | 
|`admin_level`|administrative level of the ucodes that will be requested, e.g. `0`for national level|

| **OUTPUTS**              | |
| :---------------- | :------ | 
|`georepo_response']`|returns the API response in JSON format.|

The parameters for this POST request are similar to those described above. Please note that the header must specify the content type: `'Content-Type': 'application/json'`
```python
georepo_response = requests.post(
    url=georepo_endpoint+f'/operation/view/{uuid_view_global_admin__boundaries_latest}/containment-check/ST_Intersects/{distance}/{id_type}/?admin_level={admin_level}', 
    
    # the 'Content-Type' in the header has to be added for this API call 
    headers={
      'Accept': 'application/json',
      'Authorization': dbutils.secrets.get(scope = "felixs_secrets", key = "georepo_token"),
      'GeoRepo-User-Key': dbutils.secrets.get(scope = "felixs_secrets", key = "georepo_key"),
      'Content-Type': 'application/json'
      },
    data=json.dumps(
      {"type": "FeatureCollection", 
       "features": [{"type": "Feature", "properties": {}, "geometry": geometry}]
       }
      )
    ).json()
```

&nbsp;
### `get_georepo_ucodes(long_lat_list, admin_level)`
This function returns the actual ucodes requested with the `get_georepo_batch_request_id` function and presents them as a list.

| **INPUTS**              | |
| :---------------- | :------ | 
|`long_lat_list`|takes a list of longitude and latitude values in the following format:  `[[long, lat], ...]`| 
|`admin_level`|administrative level of the ucodes that will be requested, e.g. `0`for national level|

| **OUTPUTS**              | |
| :---------------- | :------ | 
|`[ucode[0] for ucode in ucodes_list]']`|returns a list of codes if a request ID is returned by the `get_georepo_batch_request_id` function| 
|`'ERROR!'`|when the batch job has failed| 
|`'CANCELLED!'`|when the batch job has been disrupted|

Depending on the size of the requested batch job, the ID might not be returned instantly. Therefore, it is necessary to use a GET request to check the status of the batch geocoding. This is done in a while-loop as long as the status returned from this GET request is equal to `'PROCESSING'`, waiting 1 second before sending a new status request. If the status request returns `'DONE'`, a GET request is sent to fetch the batch geocoding results. From this result, only the ucodes are extracted and returned as a list.

```python
status = 'PROCESSING'
  while status == 'PROCESSING':
      status = requests.get(
        url=georepo_endpoint+f'/operation/view/{uuid_view_global_admin__boundaries_latest}/batch-containment-check/status/{request_id}/', 
        headers=georepo_header, 
        ).json()['status']
      
      if status == 'DONE':
        ucodes_response = requests.get(
                  url=georepo_endpoint+f'/operation/view/{uuid_view_global_admin__boundaries_latest}/batch-containment-check/result/{request_id}/', 
                  headers=georepo_header, 
                  ).json()['features']
        
        # get list of all the ucodes
        ucodes_list = [c['properties']['ucode'] for c in ucodes_response]
        
        return [ucode[0] for ucode in ucodes_list]
      
      if status == 'ERROR':
        return print('ERROR!')
      if status == 'CANCELLED':
        return print('CANCELLED!')
      
      # wait for 1 seconds before checking again 
      time.sleep(1)
```

&nbsp;
### `get_list_of_iso_3_country_code()`
As requesting data for multiple countries at once might lead to a timeout due to the dataset size, the data is requested for one country at a time. For the ACLED API, it is necessary to provide ISO3 numeric country codes. This function retrieves all countries that are available in the latest version of the 'Global Admin Boundaries' view on GeoRepo, converts them into numeric ISO3 codes, and returns them as a list.

| **OUTPUTS**              | |
| :---------------- | :------ | 
|`numeric_codes`|returns a list of numeric ISO3 country codes| 

Since only the countries and not their subnational boundaries are needed, the GET request for finding geographical entities by level in the view is used with `admin_level` set to `0`. As the maximum number of records per page is 50, a while-loop is implemented to increment the page number while the GET request is still returning values.
```python 
alpha3_codes = []
  start_page = 1
  response = \[1\]
  
  # get the codes for every page (because the max. number per page is 50)
  while response: 
    county_codes_params = {
      'page': start_page,
    }
    response = requests.get(
          url=georepo_endpoint+f'/search/view/{uuid_view_global_admin__boundaries_latest}/entity/level/0/', 
          headers=georepo_header, 
          params=county_codes_params,
          ).json()['results']
    
    # add all the ISO3 codes to a list
    alpha3_codes.extend(list(set([c['ext_codes']['ISO3'] for c in response])))
  
    # get the next page 
    start_page += 1
```

The `alpha3_codes` list resulting from this doesn't contain the numeric ISO3 codes but the 3-letter ISO3 alpha3 abbreviations. Some of these alpha3 codes can't be converted as they are not in the official list. 

Those countries not found will be put into a separate list, displayed, and excluded from the returned numeric ISO3 list: `NOT FOUND: ['xxx', 'xUK', 'xSK', 'xAC', 'xAP', 'xSI', 'xAB', 'xPI', 'xJL', 'xSR', 'xRI', 'xFR', 'xJK']`

```python
numeric_codes = []

not_found = []
for c in alpha3_codes:
    try:
      numeric_codes.append(int(countries.get(alpha_3=c).numeric))
    except AttributeError:
      not_found.append(c)
  
print(f"Number of countries in the list: {len(alpha3_codes)}")
print(f"NOT FOUND: {not_found}")
```

&nbsp;

## GeoSight - API functions
*Please note that the UUID for all boundaries is hard-coded to use the latest 'Global Administrative Boundaries'.*

### `push_data_geosight(indicator, attributes, df, admin_level, date)`
This function pushes data from a DataFrame as indicator data via POST request to GeoSight.

| **INPUTS**              | |
| :---------------- | :------ | 
|`indicator`|short-code of the indicator that the data should be pushed to| 
|`attributes`|takes a dictionary with attributes, e.g. `description`| 
|`df`|pandas DataFrame containing the values| 
|`admin_level`|administrative level of the `geom_id` (ucode) of the data, e.g. `0`for national level| 
|`date`|date that is assigned to the data points, in UTC and this format: YYYY-MM-DD| 

- The slice of the provided DataFrame for the **`value` and `geom_id` needs to be adjusted** according to the provided DataFrame. 
- It's important to note that the **`value` expects a string**, regardless of the original data type in the DataFrame, as this is specified in GeoSight for the indicator directly.
- The **`geom_id` takes the ucodes** that were returned by the GeoRepo API.
- The administrative level of the provided **ucode and the `admin_level` must match**.

The returned status codes will be added to a list. After looping over all the rows in the DataFrame, the number of values pushed to this indicator will be displayed, along with the list of status codes to verify if any problems occurred.

```python
status_codes=[]
  for i in df.iterrows():
    geosight_params = {
      "indicator_shortcode": indicator,
      "value": str(df.at[i[0], df.columns[1]]), # str(i[1][1])
      "date": date,
      "geom_id": df.at[i[0], df.columns[0]], # i[1][0]
      "dataset_uuid": uuid_view_global_admin__boundaries_latest,
      "admin_level": admin_level,
      "attributes": attributes 
    }
    response = requests.post(url=geosight_endpoint+"/data-browser/", headers=geosight_header, json=geosight_params)
    status_codes.append(response.status_code)
    
  # get status codes and number of values pushed to GeoSight
  print(f"{indicator}: {len(status_codes)}")  
  print(status_codes)
