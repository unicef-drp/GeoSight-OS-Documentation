---
title: Dashboard API Guide
summary: GeoSight is UNICEF's geospatial web-based business intelligence platform.
date: 2026-11-24
some_url: https://github.com/unicef-drp/GeoSight-OS
copyright: Copyright 2026, Unicef
contact: geosight-no-reply@unicef.org
license: This program is free software; you can redistribute it and/or modify it under the terms of the GNU Affero General Public License as published by the Free Software Foundation; either version 3 of the License, or (at your option) any later version.
---

# Dashboard (project)

A dashboard, called a project in the GeoSight interface, combines indicator layers, context layers, basemaps, widgets and filters on a map.
This section explains how to create a dashboard, read its configuration and update it through the RESTful API.
A script or an AI assistant can use these endpoints to build dashboards from a JSON configuration; see [Generate dashboards with AI](#generate-dashboards-with-ai).

For authentication details, see the [API Guide](index.md#authentication).

| Action | Endpoint | Who can do it |
|---|---|---|
| Create a dashboard | `POST /api/v1/dashboards/` | Creator role or higher |
| Read the configuration | `GET /api/v1/dashboards/<slug>/config/` | Users with read permission on the dashboard |
| Update a dashboard | `PUT /api/v1/dashboards/<slug>/` | Contributor role or higher, with edit permission on the dashboard |
| Delete a dashboard | `DELETE /api/v1/dashboards/<slug>/` | Users with delete permission on the dashboard |

------------------------------------

## The configuration

The create and update endpoints accept the same JSON configuration, and the config endpoint returns it in the same shape.
The easiest way to learn the shape is to read the configuration of an existing dashboard.

The configuration has two parts:

- **Top-level settings:** `name`, `slug`, `description`, `overview`, `group` (the category), `geoField`, `featured` (admins only), `show_splash_first_open`, `truncate_indicator_layer_name`, `layer_tabs_visibility`, `default_time_mode`, `show_map_toolbar` and `transparency_config`.
- **`data`:** the map and its content.

| Key in `data` | What it holds |
|---|---|
| `reference_layer` | Identifier of the reference dataset (the geographic boundaries). |
| `extent` | Map extent: `[min longitude, min latitude, max longitude, max latitude]`. |
| `level_config` | Admin levels shown, e.g. `{"levels": [0, 1, 2], "default_level": 1}`. |
| `indicators` | Indicators used by the dashboard, by `id`. |
| `indicator_layers` | Indicator layers. Each has an `id`, a `name`, a `type` and its `indicators` (by `id`). |
| `context_layers` | Context layers, by `id`. |
| `basemaps_layers` | Basemaps, by `id`. |
| `related_tables` | Related tables, by `id`. |
| `widgets` | Widgets, each with a `name`, a `type` and a `config`. |
| `filters` | Filters, as a group of expressions. |
| `tools` | Map tools and whether they are visible by default. |
| `*_structure` | How layers and widgets are grouped and ordered. |

Every `id` of an indicator, context layer, basemap or related table must already exist in GeoSight.
Find them with the list endpoints:

| To fill | Use | Field |
|---|---|---|
| `reference_layer`, `extent`, `level_config` | `GET /api/v1/reference-datasets/` | `uuid` (the identifier), `bbox` (the extent), `dataset_levels` (the admin levels) |
| `indicators`, the indicators of `indicator_layers` | `GET /api/v1/indicators/` | `id`, `name` |
| `basemaps_layers` | `GET /api/v1/basemaps/` | `id`, `name` |
| `context_layers` | `GET /api/v1/context-layers/` | `id`, `name` |
| `related_tables` | `GET /api/v1/related-tables/` | `id`, `name` |

Filters refer to indicators by id, in the form `indicator_<id>.value`. For example, `indicator_318.value` with the operator `<` and the value `50` keeps the areas where indicator 318 is below 50.

------------------------------------

## Create a dashboard

### Endpoint
```
POST /api/v1/dashboards/
```

The request can be `application/json`, or `multipart/form-data` to upload an icon. With multipart, send `data` as a JSON string.

### Request payload

Only `name`, `data.reference_layer` and `data.extent` are required.
Lists default to empty, and layers are listed in the order they are sent.
The example below creates a dashboard with one indicator layer, the OpenStreetMap basemap, a context layer, a widget and a filter:

```json
{
  "name": "Sample Indicator A",
  "slug": "sample-indicator-a",
  "group": "API",
  "description": "Created through the API",
  "data": {
    "reference_layer": "<reference-dataset-identifier>",
    "extent": [32.9, -5.6, 54.2, 13.6],
    "level_config": {"levels": [0, 1, 2], "default_level": 1},
    "indicators": [{"id": 318}],
    "indicator_layers": [
      {
        "id": 1,
        "name": "Sample Indicator A",
        "visible_by_default": true,
        "indicators": [{"id": 318}]
      }
    ],
    "basemaps_layers": [{"id": 1, "visible_by_default": true}],
    "context_layers": [{"id": 2, "visible_by_default": true}],
    "widgets": [
      {
        "name": "Total of Sample Indicator A",
        "type": "GenericSummaryWidget",
        "config": {
          "indicators": [{"id": 318, "name": "Sample Indicator A", "color": "#000000"}],
          "indicatorsType": "Predefined list",
          "indicatorsPaletteColor": 0,
          "seriesType": "None",
          "aggregation": {"method": "SUM", "decimalPlace": 1, "useAutoUnits": false, "useDecimalPlace": true},
          "sort": {"topN": 0, "field": "Name", "method": "Ascending", "useTopN": false},
          "dateTimeType": "Sync with dashboard",
          "dateTimeConfig": {"interval": "Daily", "minDateFilter": null, "maxDateFilter": null},
          "geographicalUnit": [],
          "geographicalUnitType": "Sync with the current map",
          "geographicalUnitPaletteColor": 0
        }
      }
    ],
    "filters": {
      "type": "GROUP",
      "operator": "AND",
      "queries": [
        {
          "name": "Sample Indicator A above 50",
          "type": "EXPRESSION",
          "field": "indicator_318.value",
          "operator": ">",
          "value": "50",
          "active": true,
          "allowModify": true
        }
      ]
    }
  }
}
```

Each widget type needs its own complete `config`; a widget with missing keys can stop the dashboard page from loading.
The safest way is to add the widget once in the dashboard editor and copy its `config` from the configuration of that dashboard.

The `id` of a new indicator layer can be any unused number.
Widgets refer to it in their `config` (for example `"layer_id": 1`), and GeoSight replaces it with the saved id.

To copy a dashboard, read its configuration, change `name` and `slug`, and send it to this endpoint.

### Response

If successful, the API returns `HTTP 201 Created` with the new dashboard:

```json
{
  "id": "sample-indicator-a",
  "slug": "sample-indicator-a",
  "name": "Sample Indicator A",
  "group": "API",
  "created_at": "2026-11-24 14:56:25",
  "created_by": "creator",
  "modified_at": "2026-11-24 14:56:25",
  "modified_by": "creator"
}
```

The person who creates the dashboard becomes its owner.

------------------------------------

## Read the configuration

### Endpoint
```
GET /api/v1/dashboards/<slug>/config/
```

### Response

`HTTP 200 OK` with the top-level settings, `modified_at` and `data`, in the same shape as the create payload.
The ids in the response are the saved ids, so they can be used to update items.
Sharing settings are not part of the configuration.

```json
{
  "name": "Sample Indicator A",
  "slug": "sample-indicator-a",
  "description": "Created through the API",
  "group": "API",
  "geoField": "geometry_code",
  "modified_at": "2026-11-24T14:59:02.620502+00:00",
  "data": {
    "reference_layer": "<reference-dataset-identifier>",
    "extent": [32.9, -5.6, 54.2, 13.6],
    "indicator_layers": [{"id": 1381, "name": "Sample Indicator A", "...": "..."}],
    "widgets": [{"id": 770, "name": "Total of Sample Indicator A", "...": "..."}],
    "...": "..."
  }
}
```

------------------------------------

## Update a dashboard

### Endpoint
```
PUT /api/v1/dashboards/<slug>/
```

The dashboard is updated in place.
Its creator, creation date, sharing settings, bookmarks and embeds stay. Only the modification date, the modifying user and the version change.

### What is changed

- **Keys that are not sent keep their current value.** This applies to the top-level settings and to every key of `data`. To change only the description, send `{"description": "New text"}`.
- **A list that is sent replaces the current list.** Items with their `id` from the configuration are updated, items without a known id are added, and items left out are removed.
- Keep the `id` of every layer and widget you want to keep. Bookmarks and embeds refer to indicator layers by id, so a layer that is removed and added again loses its place in them.

The recommended workflow:

1. Read the configuration with `GET /api/v1/dashboards/<slug>/config/`.
2. Change what you need, keeping the ids.
3. Send the changed parts, or the whole configuration, with `PUT`.

Example: rename a widget and keep everything else.

```json
{
  "modified_at": "2026-11-24T14:59:02.620502+00:00",
  "data": {
    "widgets": [
      {"id": 770, "name": "Total of Sample Indicator A (2026)", "type": "GenericSummaryWidget", "config": {"...": "..."}}
    ]
  }
}
```

### Avoid overwriting someone else's change

Send the `modified_at` value from the configuration you read.
If the dashboard was saved after that, the update is refused with `HTTP 409 Conflict`.
Read the configuration again and reapply your change.
Without `modified_at`, the update is always applied.

### Sharing

Sharing settings stay unchanged unless the payload contains `data.permission`.
Changing them needs the share permission on the dashboard; without it, the update is refused with `HTTP 403 Forbidden` and nothing is saved.

### Response

If successful, the API returns `HTTP 200 OK` with the updated configuration, including the new `modified_at` and the ids of added items.

------------------------------------

## Generate dashboards with AI

Because a dashboard is a JSON configuration, an AI assistant (or any script) can write it, and the API checks and saves it.
The API checks every id and required field before saving, and answers with a list of problems if something is wrong, so the assistant can correct its own output.

### What the assistant needs

1. **An example configuration.** Read the configuration of an existing dashboard that has the kinds of layers and widgets you want (`GET /api/v1/dashboards/<slug>/config/`). Widget configurations in particular are easiest to copy from an example, because each widget type has its own settings.
2. **The building blocks it may use.** The results of the list endpoints in the table above: the reference datasets, indicators, basemaps, context layers and related tables, with their ids and names.
3. **The rules on this page.** In short:
    - use only ids from the lists;
    - send `reference_layer`, `extent` and `name`; everything else is optional;
    - give each new indicator layer an unused number as `id`;
    - copy widget configurations from the example and change only the indicators, names and aggregation;
    - leave out `permission`, unless the sharing settings should change;
    - when updating, keep the `id` of every item that should stay, and send `modified_at`.

### Create a dashboard from a request

For example, ask:

> Create a dashboard called "Sample Indicator A in Somalia" on the Somalia reference dataset, opening at admin level 2, with the OpenStreetMap basemap, the "Somalia healthsites" context layer, an indicator layer for Sample Indicator A, a filter that keeps the areas where Sample Indicator A is below 50, and a summary widget with the total of Sample Indicator A.

The assistant looks up the ids, writes the configuration and sends it with `POST /api/v1/dashboards/`.

- On `201 Created`, open the dashboard (`/project/<slug>`) and check it.
- On `400 Bad Request`, give the assistant the `errors` list from the response. Each entry names the field, for example `data.indicator_layers[0].indicators[0].id`, so it can fix the configuration and send it again. Nothing is saved until the whole configuration is valid.

### Update a dashboard from a request

For example, ask:

> In the dashboard "Sample Indicator A in Somalia", change the filter to keep the areas where Sample Indicator A is above 50, and rename the widget to "Total above 50".

1. The assistant reads the current configuration with `GET /api/v1/dashboards/<slug>/config/`.
2. It changes only what was asked, keeping the ids of everything else. It can send only the changed parts, for example only `data.filters` and `data.widgets`.
3. It sends the change with `PUT /api/v1/dashboards/<slug>/`, including the `modified_at` it read.
4. On `409 Conflict`, someone else saved the dashboard in the meantime: the assistant reads the configuration again and reapplies the change.

The dashboard keeps its address, creator, creation date, sharing settings, bookmarks and embeds.

### Access

The assistant works with the API key of a GeoSight user, and can only do what that user is allowed to do:

- creating dashboards needs the creator role or higher;
- updating needs edit permission on the dashboard;
- changing sharing needs share permission.

Dashboards it creates belong to that user. Use an account whose rights match what the assistant should be able to change, and keep the API key secret.

------------------------------------

## Errors

| Status | Meaning |
|---|---|
| `400 Bad Request` | The configuration is not valid. Nothing was saved. |
| `403 Forbidden` | Missing or invalid API token, or the user is not allowed to do this. |
| `404 Not Found` | No dashboard with this slug. |
| `405 Method Not Allowed` | `PATCH` is not supported; use `PUT`. |
| `409 Conflict` | The dashboard was saved after the `modified_at` that was sent. |

A `400` response lists every problem with the path of the field:

```json
{
  "detail": "data.indicator_layers[0].indicators[0].id: Indicator 999999 does not exist.",
  "errors": [
    {
      "field": "data.indicator_layers[0].indicators[0].id",
      "message": "Indicator 999999 does not exist."
    }
  ]
}
```

The full list of fields and responses is in the [API Reference](../manual/index.md).
