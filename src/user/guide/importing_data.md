---
title: GeoSight-OS Documentation Home - User Account Enrolement 
summary: GeoSight is UNICEF's geospatial web-based business intelligence platform.
    - Tim Sutton
date: 2023-08-03
some_url: https://github.com/unicef-drp/GeoSight-OS
copyright: Copyright 2023, Unicef
contact: geosight-no-reply@unicef.org
license: This program is free software; you can redistribute it and/or modify it under the terms of the GNU Affero General Public License as published by the Free Software Foundation; either version 3 of the License, or (at your option) any later version.
#context_id: 1234
---

# Importing Data
Within GeoSight, information uploading, and harvesting are essential features that can intake a variety of data formats in a single instance or repeatedly at established intervals. A variety of formats are accepted, such as:
-	APIs
-	Excel files
-	SharePoint sites
-	SDMX files 
Data imports can be scheduled, changes in data on these sites will be incorporated into GeoSight on a regular basis. 
Importantly, due to the construction of indicators, data is imported around indicators (and indicators are not constructed around datasets). As such, before importing data, ensure that an indicator has been created.

## How to Import Data
1.	Prepare data for intake to conform to how the program reads data. 

     a.	There are two formats: 

  	    LONG format can import multiple indicators, geographies, and dates at once.
            - Geography Code to connect it to administrative datasets. 
                  - Often an OCHA PCODE but may be a UCODE.
            - Indicator code 
                  - The shortcode and connects the data to an indicator. 
            - Date
                  - This is used to identify the timeline of the data incase of multiple uploads.
            - Value column
  	
         WIDE format allows for a larger number of datasets to be uploaded at once for a single date only. 
            - Geography code 
            - Value column
For all formats there are two essential columns, a geography code and a value that must be included.
   
2.	Complete Form Type
   
    a.	Select the “Import type”
      - Indicator value OR Related table
        
    b.	Select the input format
  	
        i.	API 
        ii.	Excel 
        iii.	SharePoint 
        iv.	Vector context layers.
        v.	SDMX files

If uploading a related table to an indicator the ‘Import type’ must be the related table. 

  -	Once the table has been uploaded, the user can return and reuse the related table to upload to the indicator. 
  -	You must connect with a pre-existing related table and creating it before you upload to an indicator is the only way to create one.

3.	Complete the Attributes tab (figure 10)

    a.	Connect to the origin of the data. 
  
        i.	Excel file: identify it on your computer 
        ii.	API/SDMX/SharePoint: paste the link or path.
        iii.	Vector Context Layer: pick the context layer
b.	Identify the column that contains your geography code.

c.	Select the indicator. 

       i.	Click the “Select an Indicator” button OR the “Data-Driven Indicator Column”. (Codes must match indicator shortcodes.)
       ii.	Identify the column that contains the value for the indicator (ie; the shortcode).



