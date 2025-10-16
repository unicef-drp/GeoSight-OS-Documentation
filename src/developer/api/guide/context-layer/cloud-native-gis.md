---
title: Cloud native GIS context layer API Guide
summary: GeoSight is UNICEF's geospatial web-based business intelligence platform.
    - Irwan Fathurrahman
date: 2025-10-16
some_url: https://github.com/unicef-drp/GeoSight-OS
copyright: Copyright 2025, Unicef
contact: geosight-no-reply@unicef.org
license: This program is free software; you can redistribute it and/or modify it under the terms of the GNU Affero General Public License as published by the Free Software Foundation; either version 3 of the License, or (at your option) any later version.
---

# Cloud native GIS context layer

A Cloud Native GIS Context Layer is a type of context layer designed to store vector data and display it on the map.
This section explains how to manage Cloud Native GIS Context Layers through the RESTful API.

## Create Context Layer

To create a new context layer of type Cloud Native GIS Layer, send a POST request to the following endpoint.

### Endpoint
```
POST /api/v1/context-layers/
```

### Request Payload

The request body should include the following fields:

```json
{
  "name": "Name",
  "description": "Description",
  "layer_type": "Cloud Native GIS Layer",
  "category": "Category"
}
```

### Response

If successful, the API will return HTTP 201 Created along with the details of the newly created context layer:

```json
{
  "id": 1,
  "name": "Name",
  "description": "Description",
  "layer_type": "Cloud Native GIS Layer",
  "category": "Category"
}
```

Save the returned id, it will be needed for managing or updating the context layer in future API operations.

## Push geojson data

Once the context layer has been created, you can upload your GeoJSON data to it.

### Endpoint

```
POST /api/v1/context-layers/2/data/replace/
```


### Request Payload

The request payload should contain valid GeoJSON data.
This operation will delete all existing data in the layer and replace it with the new features from the payload.

```json
{
    "type": "FeatureCollection",
    "features": [
        {
            "type": "Feature",
            "properties": {
                "id": 1,
                "name": "New data",
                "category": "Category 1"
            },
            "geometry": {
                "type": "Point",
                "coordinates": [0, 0]
            }
        }
    ]
}
```

### Response

If successful, the API will return HTTP 204 No Content, indicating that the data has been successfully uploaded and is ready to use.

## Check the features

After uploading the data, you can verify it by fetching the list of features from the context layer.

### Endpoint

```
GET /api/v1/context-layers/1/data/features/?page=1&page_size=25
```

### Response

The endpoint returns a paginated list of features, allowing you to confirm that the GeoJSON data was successfully pushed to the layer.

## Replace data

To replace data, we can follow [push geojson data](#push-geojson-data) section.

## Adding data

You can also add new data to the existing context layer **without replacing** the current data.

```
POST /api/v1/context-layers/2/data/features/
```

### Request Payload

The request payload should contain valid GeoJSON data.
This operation will append the new features to the existing dataset.
If the new features contain fields that differ from the existing schema, the API will return an error.

```json
{
    "type": "FeatureCollection",
    "features": [
        {
            "type": "Feature",
            "properties": {
                "id": 2,
                "name": "New data 2",
                "category": "Category 1"
            },
            "geometry": {
                "type": "Point",
                "coordinates": [1, 1]
            }
        }
    ]
}
```

### Response

If successful, the API will return HTTP 204 No Content, indicating that the data has been successfully added and is ready to use.

## Add or update style

Each context layer has its own style configuration, which follows the Mapbox Style Specification.
In GeoSight, only the layers list (not the full Mapbox style object) is stored in the styles property.

### Endpoint

```
PATCH /api/v1/context-layers/1/
```

### Request Payload

The request body should be a JSON object containing the fields to update.
To modify the layer’s visual style, provide a styles array as shown below:

```json
{
  "styles": [
    {
      "id": "1",
      "type": "circle",
      "paint": {
        "circle-color": "#98F194",
        "circle-radius": 6,
        "circle-opacity": 1,
        "circle-stroke-width": 1
      },
      "source": "00000000-0000-0000-0000-000000000000",
      "source-layer": "default"
    },
    {
      "id": "2",
      "type": "circle",
      "paint": {
        "circle-color": "#88005C",
        "circle-radius": 6,
        "circle-opacity": 1,
        "circle-stroke-width": 1
      },
      "source": "00000000-0000-0000-0000-000000000000",
      "source-layer": "default"
    }
  ]
}
```

### Response

If successful, the API will return HTTP 204 No Content, indicating that the style has been successfully updated.

------------------------------------

## Delete features

You can also delete individual features from a context layer.
Since features do not have a primary key, you must first filter the data to identify the specific feature you want to delete.
This API will only perform the deletion if the filter query returns exactly one feature.

### Endpoint

```
DELETE /api/v1/context-layers/2/data/features/?name=New data
```

### Response

- If the query matches exactly one feature, the feature will be deleted and the API will return HTTP 204 No Content.
- If the query matches multiple features, the API will return HTTP 400 Bad Request with a detailed error message explaining the conflict.

## Update features

To update a feature, the process is similar to deleting one.
Because features do not have a unique identifier, you must first filter the data to ensure that the query returns exactly one feature.
The update will then be applied to that single feature based on the provided payload.


### Endpoint

```
PATCH /api/v1/context-layers/2/data/features/?name=New data
```

### Request Payload

The request body should be a JSON object containing the fields you want to update.

```json
{
  "category": "Category 2"
}
```

### Response

- If the query matches exactly one feature, the feature will be updated and the API will return HTTP 204 No Content.
- If the query matches multiple features, the API will return HTTP 400 Bad Request with a detailed error message explaining the conflict.