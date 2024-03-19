# GeoSight - API functions
_Please note that the UUID for all boundaries is hard-coded to use the latest 'Global Administrative Boundaries'._

### push_data_geosight(indicator, attributes, df, admin_level, date)

This function pushes data from a DataFrame as indicator data via POST request to GeoSight.

INPUTS---indicator	short-code of the indicator that the data should be pushed to
attributes	takes a dictionary with attributes, e.g. description
df	pandas DataFrame containing the values
admin_level	administrative level of the geom_id (ucode) of the data, e.g. 0for national level
date	date that is assigned to the data points, in UTC and this format: YYYY-MM-DD
The slice of the provided DataFrame for the value and geom_id needs to be adjusted according to the provided DataFrame.
It's important to note that the value expects a string, regardless of the original data type in the DataFrame, as this is specified in GeoSight for the indicator directly.
The geom_id takes the ucodes that were returned by the GeoRepo API.
The administrative level of the provided ucode and the admin_level must match.
The returned status codes will be added to a list. After looping over all the rows in the DataFrame, the number of values pushed to this indicator will be displayed, along with the list of status codes to verify if any problems occurred.

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
