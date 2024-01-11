---
title: GeoSight-OS Data Importer Page 
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
# Data Importer
Within GeoSight, information uploading, and harvesting are essential features that can intake a variety of data formats in a single instance or repeatedly at established intervals. A variety of formats are accepted, such as:

-	APIs

-	Excel files

-	SharePoint sites

-	SDMX files 

Data imports can be scheduled, changes in data on these sites will be incorporated into GeoSight on a regular basis. 
Importantly, due to the construction of indicators, data is imported around indicators (and indicators are not constructed around datasets). As such, before importing data, ensure that an indicator has been created.

Importing data requires clarifying a few things for GeoSight:

1.	General – to define the type of data import and its format.

2.	Attributes – connects GeoSight and the indicator to the source.

3.	Reference Layer & Time – connects the data to GeoRepo and helps define the indicator for storage in GeoSight.

4.	Schedule – allows users to set up repeat uploads.

5.	Aggregations – if enabled for an indicator, users can define and overrule how they want their import combined. Creates additional values to store in GeoSight for all administrative levels.
