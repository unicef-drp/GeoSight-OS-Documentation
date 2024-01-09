---
title: GeoSight-OS Documentation Home - User Account Enrolement 
summary: GeoSight is UNICEF's geospatial web-based business intelligence platform.
    - Tim Sutton
date: 2023-08-03
some_url: https://github.com/unicef-drp/GeoSight-OS
copyright: Copyright 2024, Unicef
contact: geosight-no-reply@unicef.org
license: This program is free software; you can redistribute it and/or modify it under the terms of the GNU Affero General Public License as published by the Free Software Foundation; either version 3 of the License, or (at your option) any later version.
#context_id: 1234
---
# Styles
When indicators are created, users must specify Color Rules  to define the value(s) that are to be associated with a specific color on the map within the dashboard. 

In short, the user is determining the legend and how the data is visualized. 

To create color rules, users simply need to follow the color matrix presented to them.

### Name 
the Label you wish to assign to the class of values. This can be any text or numerical values and will appear (next to the chosen color) on the legend.

### Rule

Determines the values/categories that are assigned the chosen color. 

    Numbers

    Numerical values that can either be a singular value or a range of values. Users can only enter in one box, or the other. 

        a. Ranges are written as: Greater than the value on the left & Less than or Equal to the value on the right. 

    Categories
    
    The category data type allows for string/text fields to be imported as datasets for total data visualization.
    
    If appropriate, users may set this for their color rules.

### Color
    
The interior color of the administrative polygon (including when using the compare layers tool). This color will also be what is next to the label/name in the legend. 

    a. Users can select a color or, enter the hex code.

    b. We recommend https://colorbrewer2.org/ for useful color palettes

    c. Outline Color- The color of the exterior line features of the administrative polygon. 

    d. No Data/Other Data- Automatic fields that are used to visualize datasets if no data within the color rules is available.  

![Creating Styles](image-8.png)

## Creating Styles

1.	Users are able to create, manage and remove styles within the “Style” tab of the Administrative Panel or while creating/editing an indicator.

2.	Navigate to the "Add New Style" button to begin creating a new style.

3.	The general tab allows for users to determine the characteristics of the style including name, description and data type.

4.	Style Config determines the color rules of the style (see above)

5.	Finally, complete the Share tab to allow specific users or groups to access the style.

6.	Click save to preserve the new style.
