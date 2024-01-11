---
title: GeoSight-OS Indicator Editing
summary: GeoSight is UNICEF's geospatial web-based business intelligence platform.
    - Tim Sutton
    - Irwan Fathurrahman
date: 2024-09-01
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

![Indicator concept art showing the different dimensions of Geography, Time and Data all within one singular indicator](image.png)

Accessible indicators are highlighted with _blue_ text.


# Indicator Editing

The indicator creation page allows users to add, edit and manipulate indicators that they have access to. Remember, any changes made to an indicator on this page are global. Project specific changes should be done under the “Indicator Layers” section of the project creation page. Creating an indicator requires 5 different elements.
1.	General – metadata including a name, description, short code and category.
2.	Aggregation -  determines if/how data will be aggregated across administrative boundaries as well as time. 
3.	Style – determines the visualization and front-end display of an indicator.
4.	Labels -  determines if/how a label looks on a project for each administrative area.
5.	Share – allows those with access to control, add and remove permissions for users, groups and the public.

**DO NOT CREATE ANY COUNTRY SPECIFIC INDICATORS THAT MIGHT ALREADY EXIST AS GLOBAL INDICATORS**