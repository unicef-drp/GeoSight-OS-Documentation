---
title: GeoSight-OS Indicator Page
summary: GeoSight is UNICEF's geospatial web-based business intelligence platform.
    - Tim Sutton
date: 2024-01-09
some_url: https://github.com/unicef-drp/GeoSight-OS
copyright: Copyright 2024, Unicef
contact: geosight-no-reply@unicef.org
license: This program is free software; you can redistribute it and/or modify it under the terms of the GNU Affero General Public License as published by the Free Software Foundation; either version 3 of the License, or (at your option) any later version.
#context_id: 1234
---
# Indicators
The Indicator Page allows for users to see, catalog and manage indicators they have control over. 

A name, color rule and basic information is applied before any data is imported. In pursuit of open data sharing and ease of access, Indicators are formatted so data can exist across multiple dimensions (time and geographical location/reference dataset) within one common indicator as opposed to repeating indicators for separate countries.

Indicators are standard across GeoSight, and for the purposes of data management are treated as buckets where all data for each and every country can be added to. As such, users should only create indicators if they do not already exist.



![Indicator concept art showing the different dimensions of Geography, Time and Data all within one singular indicator](image-16.png)

Accessible indicators are highlighted with _blue_ text.

## Creating an Indicator

1.	Navigate to the Indicators tab via the Admin Panel. 

    a.	Users can see all existing indicators to search for and manage them. 
2.	Select the Add New Indicator button on the top right.

![Add New Indicator Button Location](image-5.png)

## General Tab

3.	Fill in basic information in the General tab

  a. **Name** - indicator name. 
  b. **Description** - description of the indicator, including methodology, and other relevant metadata 
  c. **Source** - information about data sources used by the indicator
  d. **Shortcode** - a globally unique indicator shortcode. It is recommneded to use abbreviated safe names, e.g. `pop_total_flood_risk_high` for the total population exposed to a high flood risk. Also, note that the same indicator can store observation values for many different dates and geographies, so there is **no need to create separate indicators**, such as `demo_ind_a_2010` and `demo_ind_a_2020` or `demo_ind_angola` and `demo_ind_kenya` as the same indicator `demo_ind` can store data for all dates and countries.
  e. **Category** - choose one of the categories.
  f. **Unit** - type in the name of units in which indicator is calculated (e.g. people, %, ha)
  g. **Indicator type** - the system supports the following data types for indicators:
        - **Integer**  
         Used for whole numbers without any decimal places.  
         _Example: `0`, `25`, `-10`_

 - **Float**  
  Used for real numbers that include decimal values.  
  _Example: `3.14`, `0.75`, `-2.0`_

 - **Category**  
  Used for categorical values represented as text, selected from a predefined code list. **Please note that currently only admins can create new code lists.**  
  _Example: `"Low"`, `"Medium"`, `"High"`_
    A description, data source, unit as well as min and max values are optional.

### Duplicated Indicators

As a part of the data management strategy of GeoSight, the goal is to prevent creating duplicated indicators as all data should be stored within the same indicator across time series and geographies. 

Because of this, GeoSight has a tool developed to prevent this and alert users of similar indicators during the creation process. 

This tool will be activated when users enter a name for their indicator. GeoSight will then compare the similarity of the name/indicator details to the one you are creating as a way to help users determine whether or not this indicator already exists.


![image](https://github.com/unicef-drp/GeoSight-OS-Documentation/assets/110991093/4f1c5d79-2836-401a-9925-8d846625ca10)

## Aggregations Tab

4.	Complete the Aggregations tab which allows for the summarization of high level sub-national data into larger administrative districts. (optional)

    a.	Check the box “Allow aggregation upper level”.

    b.	Select an option from the Aggregation upper level 

        - COUNT is the number of datapoints (or sub-districts) 
        - SUM is the total of the indicator within the sub-districts 
        - MAX and MIN are the highest and lowest values
        - AVG is the average of the data within the appropriate sub-districts. 
    Aggregation multiple values is for the management of different instances of the dataset over a period of time. 

## Style Tab 

5. Complete the Style tab (figure 6) to decide how your data is visualized (see Styles for details).

     a.	Either create a custom style, use a pre-made one from the library OR a dynamic style

## Label Tab

6.	Complete the Label (figure 7) to create labels for the administrative polygons. (optional)

     a.	Complete the textbox to decide the contents of the label in brackets "{ }".
     
        "code" = geography code
        "date"= date of data
        "label" = label of data based on
        "name" = geography name
        "value" = value of data

     b.	Complete the above section to change the display of the label including zoom,  color, font style, size, boldness and halo.

7.	Select Save in the top right. 

    a.	This will confirm and save your indicator settings. 


## Editing Indicators

8.	To make changes to an indicator, select the blue name on the main indicator page and the same tabs will appear. (optional)

9.	Batch Editing allows for users to make the same feature changes to multiple indicators at once. 

    a.	Select desired indicators

    b.	Select Batch Edit 

    c.	Determine desired shared changes

    d.	Save
