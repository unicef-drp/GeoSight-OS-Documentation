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

3.	Complete the General tab (figure 4)
    
    a.	Enter background on the indicator, including: 

         b.	Name
         c.	Description
         d.	Technical information about the data type. 
         e.	Shortcode

        A shortcode is an abbreviated name that allows for the easy computer-to-computer management of datasets. 

          f. Category 
          g. Indicator type 
              - Integers are for whole 
              numbers without decimals
              - Float allows for different 
              types of numerical data, such as decimals or percentages. 
              - Categories are text values
    A description, data source, unit as well as min and max values are optional.

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
