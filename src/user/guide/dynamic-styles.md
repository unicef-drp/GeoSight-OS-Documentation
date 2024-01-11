---
title: GeoSight-OS Documentation Home - Dynamic Styles 
summary: GeoSight is UNICEF's geospatial web-based business intelligence platform.
    - Tim Sutton
date: 2024-11-01
some_url: https://github.com/unicef-drp/GeoSight-OS
copyright: Copyright 2023, Unicef
contact: geosight-no-reply@unicef.org
license: This program is free software; you can redistribute it and/or modify it under the terms of the GNU Affero General Public License as published by the Free Software Foundation; either version 3 of the License, or (at your option) any later version.
#context_id: 1234
---

# Dynamic Styles
Dynamic styles are an important feature to GeoSight that allows for the efficient creation and display of color rules. This can be useful, as creating individual color rules can be tedious and time consuming. 

Dynamic styles allow for data-driven palettes that cover a number of classifications and enable for the use of customary classifications, including:

- Jenks-Natural Breaks

- Standard Deviation

- Quantile

- Equidistant 

- Geometric Progression

- Arithmetic Progression

Similarly, there are two types of dynamic styles.

## Dynamic Quantitative Styles

Dynamic Quantitative styles are numerically driven styles, that based on the above classifications, display the data in four to five classes. The different dimensions of the dataset allow for users to customize their data-driven narrative and highlight statistically significant areas of interest. 

NOTE: Actual statistical significance/p-value is not given.

## Dynamic Qualitative Styles

Dynamic Qualitative Indicators are category driven styles, that allow for the ingestion and display of text values throughout the dataset. Based on data-points that share the same textual values, Dynamic Indicators can automatically apply pre-set palettes.

## Creating Dynamic Styles

1.	Navigate to the Indicator Layer of your choice.

    a.	This is within the project pane.

2.	Configure your layer of choice and navigate to the Style tab

3.	Under Style Type Select Dynamic Quantitative OR Qualitative Styles

4.	Select your color palette 
a.	Both single and double color scales are available

5.	Determine a classification and number of classes

6.	Sync fill and outline if you wish to hide borders and decide whether to enable styles for filters.

7.	Click apply changes and then save your project. 
