---
title: GeoSight-OS Indicator Layers
summary: GeoSight is UNICEF's geospatial web-based business intelligence platform.
    - Tim Sutton
    - Irwan Fathurrahman
date: 2024-11-01
some_url: https://github.com/unicef-drp/GeoSight-OS
copyright: Copyright 2023, Unicef
contact: geosight-no-reply@unicef.org
license: This program is free software; you can redistribute it and/or modify it under the terms of the GNU Affero General Public License as published by the Free Software Foundation; either version 3 of the License, or (at your option) any later version.
#context_id: 1234
---

# Indicator Layers
An important and project specific feature is that GeoSight individually considers the indicator itself from its given representation and display as a global layer. 

This difference can be noted by the inclusion of both the Indicator panel and Indicator Layer panel. 

- The _Indicator_ panel allows indicators to be connected to the project for the data. Users can connect and create widgets and filters, as well as perform any data analysis.

- _Indicator Layers_ are for the visualization of layers within the project. Users can manually create specific changes to the individual instance that do not impact the indicator site wide.

The eye symbol   represents the chosen indicator layer that will first visualize when the project is opened. ![Alt text](image-22.png)

Types of Indicator Layers include:

- _Single Layers_ are for visualizing single and simple indicators. They are the base type of Indicator Layer, and simply display one dataset and within the chosen reference dataset.
- _Multi-Indicator Layers_ are analysis tools that visualize multiple layer values in proportion to one another via pie or bar charts. 
    a. When defining this style, users will be prompted to select the desired indicators as well as determine one appropriate color for that indicator. 

-  _Dynamic Layers_ are customizable layers that can be created by using a custom expression tailored by user feedback.

    a. Users will be prompted to define SQL expressions that allow for data to be filtered and selected from other datasets for visualization.

- _SDMX Indicator Layers_ read their data directly from an SDMX (Statistical Data and Metadata eXchange) API, such as the UNICEF Data Warehouse, instead of from an indicator stored in GeoSight. See [Configuring SDMX Indicator Layers](#configuring-sdmx-indicator-layers).

- _Related Tables_ are layers that allow for Splicing and the manipulation of previously uploaded related tables. See Related Tables for more details.

## Configuring Indicator Layers
Users can access and view indicator layers within the Indicator Layer panel of projects. By selecting the Configuration      option, users can control General Information (Name, Administrative Levels), Styles and Labels

### General

1.	Users can change the name as well as the description

    a.	For example, if the indicator description indicates one source, but the given layer is from a different context. 

2.	Select Override admin level configuration which will allow users to override the project admin level configuration and dictate it on a layer specific basis.

    a.	Default level determines the level the layer first visualizes at.

    b.	Available levels determine which levels the layer can be switched to.

### Styles

Users can control styles so that they are specific to a project's visualization and data.

1.	Users can change a style by selecting Override style from indicator

2.	Select the Style Type

    a. Style Library allows you to select a defined style/color rules. 
    
    b. Predefined style/color rules allow users to create their own color rules specific to that layer.

### Labels

Users are able to set layer specific labels that are unique to this individual instance. See Creating Indicators for more details.

### Pop-Ups

Pop-Ups are useful tools that appear when a specific polygon/administrative area is selected. They display all aspects of the appropriate dataset and provide metadata information that is not available by the visualization of an indicator.

To configure Pop-Ups

1.	Select the Pop-Ups tab

2.	Users can change the Alias or name of the field in the Pop-Up

3.	They can Turn OFF the field by clicking the check box

4.	They can control the data type

5.	To customize the Pop-Up, users can click Customize and adjust the code of the display if desired.

### Expression (Dynamic Indicator Layers ONLY)

Dynamic indicators require a bit of skill, as they necessitate that users develop custom expressions by using the coding language Jinja, similar to Python. 

These layers can mathematically compare layers and/or provide customizable weighting for end-users. A complex guide is provided to users and can be found on the page.

1.	Select the Expression tab

2.	Enter a valid expression.

An example expression that compares two indicators (A & B) while allowing for an exposed variable to adjust the weight, resulting in customizable values:

{% set a = (context.values['SOM_TEST2_IND_A']) %} –> A = Indicator A

{% set b = (context.values['SOM_TEST2_IND_B']) %} -> B =  Indicator B

{% set i = (context.values['Increase']) %} -> Exposed Variable

{% set result = (a + b) + ((a + b) * i / 100) %} -> Mathematical Expression

{{ result }} -> Display Result

3.	Decide on a (if any) exposed variable.


    a.	A front-end customizable value that users can use to adjust the outputs of your chosen expression.

    b.	This can be used as an example of an independent indicator, or weight that users can use to measure severity, and see how results may change.

## Configuring Multi-Indicator Layers
To create multi-Indicator layers, navigate to the Indicator Layer tab under project managemnt (See _Analysis Tools_ for more details)

1.	Select Add Indicator Layer and then Multi Indicators Layer in the pop-up

2.	Complete the filter to select your indicators, it is identical to other layer filters such as time series widgets (see Widgets for more details)

    a.	Determine the color by using the color selection tool (see Styles for more details).

3.	Determine the chart type and size

    a. Users can display a pie chart or bar chart

    b. Size can be standardized or flexible.

4. Apply any visualization changes (it is same process as all other layers).

## Configuring SDMX Indicator Layers
An SDMX indicator layer shows data that GeoSight reads directly from an SDMX API. The data isn't imported into GeoSight; the layer asks the API for it whenever the project is opened.

To create one, open the project's Indicator Layers tab and select **Add Indicator Layer**, then **SDMX Indicators Layer**. If the **SDMX layer** tool is turned on in the project's Tools tab, the **Create SDMX layer** button in the project's toolbar opens the same window.

The **General** tab of the configuration window has four sections.

![SDMX indicator layer configuration](img/sdmx-indicator-layer-config.png)

### Layer Metadata

1.	Enter the layer's name and description.

2.	**Source** is filled in with the agency of the selected dataflow. You can change it.

### SDMX Config

1.	Choose the **SDMX Mode**:

    a.	**config**: pick the source step by step from an SDMX configuration set up by an administrator: **SDMX Config**, **Agency**, **Dataflow** and **Dataflow Version**. GeoSight builds the **SDMX URL** for you.

    b.	**url**: paste a complete SDMX data URL.

2.	SDMX configurations (the base URL of an SDMX API) are managed by administrators in the Django admin, under **Sdmx configs**.

### Filter Dimensions

1.	Limit the data to the dimension values you need, for example one indicator or a set of areas. Leave a dimension empty to include all its values.

2.	Use the time period fields to limit the data to a date range. Dates before 1900-01-01 aren't applied, and the end date must be after the start date.

### Data Config

Tell GeoSight how to read the data. GeoSight fills in the fields it can recognise:

1.	**Column Geograph Code**: the column with the area codes (REF_AREA by default). The codes must match the project's reference dataset.

2.	**Value Column**: the column with the values (OBS_VALUE by default).

3.	**Aggregation**: how to combine several values for the same area and date (SUM by default).

4.	**Date Time Column/Field**: the column with the date (TIME_PERIOD by default).

5.	**Date Time Format**: the format of the dates in that column. GeoSight detects it from the data, for example **Date (YYYY-MM-DD)** or **Year-Month (YYYY-MM)**.

    a.	If you choose another format, GeoSight keeps your choice when you change other settings, such as the time period or the aggregation. It only detects the format again if the data changes to a different date format, for example after you choose another dataflow.

All required fields must be filled in before **Apply Changes** becomes available.

Use the **Data Preview** tab to check the data the layer will show, and the **Style**, **Label** and **Popup** tabs as for other indicator layers.
