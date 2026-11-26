---
title: GeoSight-OS Chart Widget
summary: GeoSight is UNICEF's geospatial web-based business intelligence platform.
date: 2026-11-24
some_url: https://github.com/unicef-drp/GeoSight-OS
copyright: Copyright 2026, Unicef
contact: geosight-no-reply@unicef.org
license: This program is free software; you can redistribute it and/or modify it under the terms of the GNU Affero General Public License as published by the Free Software Foundation; either version 3 of the License, or (at your option) any later version.
#context_id: 1234
---

# Chart Widget

The chart widget (`ChartWidget`) draws indicator data with [Apache ECharts](https://echarts.apache.org/) (Apache-2.0).
User documentation: [Chart Widgets](../../user/guide/chart-widgets.md).

## Where the code is

| Path (under `django_project/frontend/src/components/Widget/`) | What it does |
|---|---|
| `ChartWidget/View.tsx` | Builds the statistic request for the chart type, turns the response into chart input, the indicator picker, the link to the map. |
| `ChartWidget/buildOption.tsx` | Pure functions from (chart config, chart input) to an ECharts option. Also the guard for the advanced overrides. |
| `ChartWidget/capabilities.tsx` | Which generic settings each chart type uses. The editor, the info popup and the view read this one table. |
| `ChartWidget/EChart.tsx` | A thin React wrapper around one ECharts instance (SVG renderer). Errors stay inside the widget. |
| `ChartWidget/echartsSetup.tsx` | Registers only the ECharts parts the widget uses. Loaded with `import()`, so ECharts is a separate chunk that is downloaded only when a dashboard shows a chart widget. |
| `Form/ChartConfig.tsx` | The chart settings in the widget editor. |
| `Information/index.tsx` | The info popup of every widget; chart widgets list only the settings their type uses. |
| `Form/WidgetTypeTiles.tsx` | The widget type tiles of the editor (value(s), chart types, text; time series for existing widgets only). |
| `TextWidget/View.tsx`, `Form/TextConfig.tsx` | The text widget: Markdown/HTML, sanitised. |
| `areaLink.tsx` | `useAreaLink()`: selects an area on the map from a widget (chart, summary table by area). |
| `Form/editor-layout.scss` | The layout shared by all widget editors: general settings, data settings, live preview. |

New frontend modules must be `.tsx`: the webpack config resolves `.js`, `.jsx` and `.tsx` only.

## Config format

A chart widget is a `DashboardWidget` with `type = "ChartWidget"`. Its `config` holds the generic widget settings
(`seriesType`, `indicators`, `indicatorsType`, `geographicalUnit`, `geographicalUnitType`, `aggregation`, `sort`,
`dateTimeType`, `dateTimeConfig`), the same as the Summary and Time Series widgets, plus a versioned `chart` object.
No model change or migration is needed: `type` is free text and `config` is JSON.

```json
{
  "chart": {
    "version": 1,
    "type": "bar",
    "layout": "simple",
    "horizontal": true,
    "target": 50,
    "area": false,
    "period": "yearly",
    "x": 12, "y": 13, "size": null,
    "pulse": 1,
    "min": 0, "max": null,
    "labels": false,
    "colors": "map-style",
    "linkAreas": true,
    "overrides": { "legend": { "top": 0 } }
  }
}
```

| Key | Values | Used by |
|---|---|---|
| `version` | `1` | all; bump it when the format changes in a way older code can't read. |
| `type` | `bar`, `line`, `donut`, `scatter`, `heatmap`, `treemap`, `gauge`, `kpi` | all |
| `layout` | `simple`, `stacked`, `grouped`, `percent` | bar |
| `horizontal` | boolean | bar |
| `target` | number or `null` | bar (dashed line), gauge (tick and colour) |
| `area` | boolean | line |
| `period` | `date`, `monthly`, `yearly` | line, heatmap, KPI |
| `x`, `y`, `size` | indicator ids | scatter |
| `pulse` | `1` = the area selected on the map pulses, `0` = off | scatter |
| `min`, `max` | numbers; `max: null` = automatic | gauge |
| `labels` | boolean | all but gauge and KPI |
| `areaLabels` | `name` (default) or `code` (the area ucode); used only when `labels` is on | charts that show areas |
| `colors` | `map-style` (the indicator's style classes), `palette`, `custom` (the `color` of each item of the predefined list given by `customColorList()` in `capabilities.tsx`: the series list, the other list for stacked/grouped bars, the units for scatter) | all but gauge and KPI (line: no `map-style`) |
| `palette` | id of a colour palette (`/api/color/palette/list`) | palette mode, line |
| `linkAreas` | boolean; clicking an area selects it on the map | charts that show areas |
| `overrides` | a JSON object merged last into the ECharts option | all |

Missing keys take the defaults of `DEFAULT_CHART_CONFIG` in `Widget/Definition.tsx`, so older configs keep working.

**Advanced overrides** are plain JSON. Before they are merged, keys that could run code or inject HTML or CSS are
removed: `formatter`, `valueFormatter`, `renderMode`, `extraCssText`, `className`, `appendTo`, `appendToBody`, `link`,
`sublink`, `image`, `backgroundImage`, `__proto__`, `constructor` and `prototype`.

## Data

All chart types read `POST /api/v1/indicators/data/statistic/` (through `IndicatorData().statistic()`), with the
parameters of the generic widget controls (`GenericWidget/RequestParameter`) plus:

| Chart type | `group_by` | Other parameters |
|---|---|---|
| bar (simple), donut, treemap | `geom_id,entity_name,admin_level` or `indicator_id` (Series) | `latest_value=true` |
| bar (stacked, grouped, 100%) | `indicator_id,geom_id,entity_name,admin_level` | `latest_value=true` |
| line, heatmap | `date` (or `period`) plus the Series fields | `frequency` when the period is monthly or yearly |
| KPI | `date` (or `period`) | `frequency` |
| gauge | none (one aggregate) | `latest_value=true` |
| scatter | `indicator_id,geom_id,entity_name,admin_level` for the X, Y and size indicators | `latest_value=true` |

`frequency=daily|monthly|yearly` adds a `period` field (the date truncated to the day, month or year) that can be used
in `group_by`.

**Aggregation** (`usesAggregation()`): applied only where values are combined (series by indicator, gauge, KPI, a
monthly or yearly period); elsewhere the request uses `SUM` of the single value, whatever the saved method. The number format
(`aggregation.useDecimalPlace`, `decimalPlace`, `useAutoUnits`) is shown for every chart type and formats every value
(tooltips, labels, targets, gauge, KPI) through `formatWidgetNumber()` in `utils/Utilities.tsx`: decimal places on =
exactly N decimals; off = up to 2 decimals for charts (0 for the summary widgets, as before). Axis labels use
`formatNumber()` without trailing zeros.

**Several indicators:** with the indicators synced with the map, a multi-indicator layer gives several ids in
`indicator_id__in`. Chart types that can show only one indicator (`needsOneIndicator()` in `capabilities.tsx`) show a
picker and request one indicator, so values of different indicators are never added up.

## Legend

ECharts' own legend is configured with `show: false`; it still applies `legend.selected`, so entries the viewer hides
are filtered out. The builders return the entries (`BuiltChart.legend`: name and colour) and `ChartLegend.tsx` draws
them below the chart: the first six, with a **Show all (n)** / **Show less** button, each entry a toggle button
(`aria-pressed`).

## Link to the map

Clicking an area (`params.name`, `params.seriesName` or a category axis label with `triggerEvent`, or an area name in
a summary table) goes through `useAreaLink()` in `areaLink.tsx`, which gets the area's bbox with `GeorepoRequest.getBbox(dataset, "ucode", [geom_id])` and dispatches
`Actions.Map.updateSelectedEntities([entity])`. The existing `SearchGeometryInputController` then zooms the main map
to the bbox and outlines the area. The chart reads `state.map.selectedEntities` to outline the selected area itself.
The editor preview never changes the selection.

## Tests

- `playwright/ci-test/tests/admin/project_features_2/chart_widget.ts`: the editor (every type, options, advanced JSON,
  preview, saved config) and the French labels.
- `playwright/ci-test/tests/admin/project_features_2/chart_widget_dashboard.ts`: every chart variant on the
  dashboard, the info popup of each one, the link to the map, the indicator picker with a multi-indicator layer.
- `playwright/ci-test/tests/admin/project_view_mobile/chart_widget.ts`: a chart in the phone widget panel.
- `playwright/ci-test/tests/admin/project_features_2/widget_tiles.ts`: the tiles, custom colours, and the text widget
  (Markdown, kept styles, and that scripts, handlers and `javascript:` links are removed). Read-only.
- `playwright/ci-test/tests/admin/project_view/summary_table_link.ts`: area names of a table select the area on the map.
- `geosight/data/tests/api/v1/indicator_data.py`: the statistic endpoint with `group_by` and `frequency`.

The specs create their own project copies and delete them at the end.

## Widget types and tiles

New widgets are created from one grid of tiles. Each tile maps to a stored `type`; saved widgets keep theirs, so no
migration is needed:

| Tile | `type` | Notes |
|---|---|---|
| Value(s) | `GenericSummaryWidget` | the default tile (`seriesType` `None` = one value, else a table) |
| Bar … KPI | `ChartWidget` | `config.chart.type` |
| Text | `TextWidget` | `config.text` |
| Time series | `GenericTimeSeriesWidget` | shown only when editing an existing widget of this type; new ones use Line |

Legacy types (`SummaryWidget`, `SummaryGroupWidget`, `TimeSeriesChartWidget`) keep their own editors and still render.

## Text widget

`config.text` is Markdown (GitHub flavour, `remark-gfm`) with optional HTML (`rehype-raw`), shown with `react-markdown`.
It is written by editors and shown to every viewer, so it goes through `rehype-sanitize` (GitHub's schema, plus `style`
on any element, `target`/`rel` on links and `width`/`height` on images; `href` http, https and mailto; `src` http and
https). A last rehype step keeps only the CSS properties in `ALLOWED_STYLES` (text colour, background, font, size,
weight, alignment, spacing, border, size) and drops values with `url(`, `expression(`, `javascript:`, `@import` or
backslashes; links get `target="_blank"` and `rel="noopener noreferrer"`.

