---
title: GeoSight-OS Project Page
summary: GeoSight is UNICEF's geospatial web-based business intelligence platform.
    - Tim Sutton
    - Irwan Fathurrahman
    - Ketan Bamniya
date: 2024-09-01
some_url: https://github.com/unicef-drp/GeoSight-OS
copyright: Copyright 2024, Unicef
contact: geosight-no-reply@unicef.org
license: This program is free software; you can redistribute it and/or modify it under the terms of the GNU Affero General Public License as published by the Free Software Foundation; either version 3 of the License, or (at your option) any later version.
#context_id: 1234
---

# Context Layers Page

[![Home Page](./img/context-layer-img-1.png)](./img/context-layer-img-1.png)

1. **Context Layers:** Allows users to access the `Context Layers` page.

[![Home Page 2](./img/context-layer-img-2.png)](./img/context-layer-img-2.png)

1. **Search Context Layer:** Allows users to search for a specific `Context Layer`.

2. **Create New Context Layer:** Users can use this button to create new context layers.

3. **Edit:** Allows users to edit the available context layers.

4. **Delete:** Allows users to delete the available context layer.

5. **Table:** Users can see all the available context layers here.

6. **Pagination:** Users can see the number of records on the current page along with the total record count.

## Create New Context Layer

### General

[![Create Context Layer](./img/context-layer-img-3.png)](./img/context-layer-img-3.png)

1. **General:** Users can fill in the general information of the context layer here.

    * **Name:** The name of the context layer.
    * **Description:** The description of the context layer.
    * **Category:** The category name to which the context layer belongs to.
    * **Url:** The URL needed to access the context layer.
    * **Layer type:** Users are required to choose the type of layer from the drop down manu.
        ```
        The type of layer for this context layer.
        For ArcGIS, put feature server of REST. e.g : https://{host}/rest/services/ {layer}/FeatureServer/1.
        For GeoJson, put url of geojson.    
        For Raster tile, put XYZ url.   
        For Raster COG, put url of cog. 
        For Related table, select existing related table name.
        For Vector tile, put XYZ url.
        For Cloud native gis layer, select the layer from cloud native gis.
        ```
    * **Arcgis config:** Users can select the `Arcgis config` from the drop down menu. The ArcGIS configuration contains the username and password required to automatically generate authentication tokens. This is essential for connecting and accessing the arcgis Enterprise Portal securely.

    * **URL legend:** The URL Legend provides a reference for the URLs used within the application, detailing their purpose and functionality for easier navigation and understanding.

    * These fields are only accessible if the `Arcgis config` is none.

        * **Token:** Token to access the layer if needed.

        * **Username:** Username to access the layer if needed.

        * **Password:** Password to access the layer if needed.
    
2. **Save:** Users can use this button to save the context layer. An alert notification will confirm that the context layer has been saved successfully.

    ![Saved](./img/context-layer-img-4.png)

### Preview

[![Preview](./img/context-layer-img-5.png)](./img/context-layer-img-5.png)

1. **Preview:** Users can use the preview by clicking on this preview tab.

### Fields

[![Fields](./img/context-layer-img-6.png)](./img/context-layer-img-6.png)

1. **Fields:** Users can add fields to the context layer here.

### Label

[![Label](./img/context-layer-img-7.png)](./img/context-layer-img-7.png)

1. **Label:** Users can click here to access the label tab.

### Share

[![Create Context Layer](./img/context-layer-img-8.png)](./img/context-layer-img-8.png)

1. **Share:** Allows users to share the layer with other users. Click [here](../share.md) to see how to share the context layers.

![Share Icon](./img/context-layer-img-20.png)

1. **![Share Icon](./img/context-layer-img-21.png) Icon:** Users can click on this icon to share the layer. Click [here](../share.md) to see how to share the context layers.

## Edit Context Layers

[![Edit](./img/context-layer-img-9.png)](./img/context-layer-img-9.png)

1. **Edit:** First users are required to check the checkbox of the respective context layer, only then users will able to edit the layer.

[![Edit UI](./img/context-layer-img-10.png)](./img/context-layer-img-10.png)

* The edit page is same as add new context layers page, the only thing is that users are required to check the checkbox of the respective field to enable the editing of that field.

* After edit the context layer, users are required to click on the save button to save the changes.

## Delete Context Layers

[![Delete](./img/context-layer-img-11.png)](./img/context-layer-img-11.png)

1. **Delete:** First users are required to check the checkbox of the respective context layer, only then users will able to delete the layer. After clicking on the delete button , users will be asked to confirm the deletion.

    ![Delete Confirmation](./img/context-layer-img-12.png)

    * **Cancel:** Users can cancel the deletion by clicking on the cancel button.

    * **Confirm:** Users can confirm the deletion by clicking on the confirm button.

    * **X:** Users can also cancel the deletion by clicking on the X button.

## Sort Context Layers

![Sort Data](./img/context-layer-img-13.png)

Users can sort the context layers by clicking on any column header to arrange them in ascending or descending order.

* Users also sort the data by clicking on the three dots.

    ![More Options To Sort](./img/context-layer-img-14.png)

    * **Unsort:** Allows users to unsort the data.
    * **Sort by ASC:** Allows users to sort the data in ascending order.
    * **Sort by DESC:** Allows users to sort the data in descending order.
    * **Hide:** Users can hide the specific column by clicking on the hide option.
    * **Show columns:** Users can change the visibility of the columns by clicking on this option.

        ![Show Columns](./img/context-layer-img-15.png)

        * **Find Column:** Users can search the specific column by entering the name of the column in the search field.
        
        * **![Toggle Button](./img/context-layer-img-16.png) Button:** Users can change the visibility of the column by clicking on this toggle button. Blue color indicates that the column is visible and gray color indicates that the column is hidden.
        
        * **Hide all:** Users can hide all the columns by clicking on this option.

        * **Show all:** Users can show all the columns by clicking on this option.

## Filter Data

![Filter](./img/context-layer-img-17.png)

1. **![Filter Icon](./img/context-layer-img-18.png) Icon:** Users can use this button to filter the data.

    ![Filter Panel](./img/context-layer-img-19.png)

    * **Apply Filter:** First users are required to fill the field on the basis of they want to filter the data. After selecting the filter, users can apply it by clicking on this button.
