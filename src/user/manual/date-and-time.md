# Date and Time
Taking advantage of the date and time function in GeoSight allows users to utilize powerful analysis tools built into the program. From displaying historical data to highlighting the progression of indicator values through a time series widget, these tools can better inform users and allow them to understand their data beyond their physical locations.

Date-Time is an important dataset attribute that can be visualized and analyzed within GeoSight in several ways through project-specific configurations.

1. Date-Time Slider
2. Time Series Widget

## Data Management of Date-Time Values
![data-cube](https://github.com/user-attachments/assets/b234e1f2-d434-4e63-a99a-fe94ef1e11e1)

In GeoSight, data is imported and managed through three dimensions as the graphic above illustrates:

1. Geography/Location
2. Indicator
3. **Date-Time**

This management and storage of the date-time component enables these various analysis tools to work. By including this dimension with every import, every piece of data (a value attached to a sub-national administrative area) there is a date associated with it.

At the same time, when importing users are allowed to import multiple values across different periods, allowing for the easy streamlining of data management and the utilization of date-time-based tools.

See [Importing Data](https://unicef-drp.github.io/GeoSight-OS-Documentation/user/guide/importing_data/#long-format) for more details on how to configure date-time during the importing process.

## Project Date-Time Configurations

Within projects, users can configure various analysis tools to improve user comprehension of the datasets.

### Date-Time Slider

The Date-Time Slider allows users to see historical values for different indicators if this data has been previously imported. This is valuable because it allows for the visualization of data and enables users to observe visual changes in values overtime.

1. To activate the time slider, navigate to the the **General** tab of the [project management back-end page](https://unicef-drp.github.io/GeoSight-OS-Documentation/user/guide/creating-projects/). Here you will see the following:
![image](https://github.com/user-attachments/assets/dca16e5b-c77f-4bec-be38-b5f1211e0da4)

2. The default option (shown above) _turns off_ the time slider and only displays the most recent data. Uncheck this to turn on the time slider.

3. _(optional)_ Check "Fit to current indicator range" to prevent dates from other indicators being shown.

4. _(optional)_ Adjust the default interval

5. _(optional)_ Uncheck "Show last known values in range" to show historical values first


### Time Series Widget

The time series widget is a tool that shows a line-graph depicting the change in values for a specific indicator or administrative area over the time period available in the dataset.

They can be controlled on the Widget page of [Project Management](https://unicef-drp.github.io/GeoSight-OS-Documentation/user/guide/creating-projects/).

See [Creating Widgets](https://unicef-drp.github.io/GeoSight-OS-Documentation/user/guide/widgets-and-filters/#creating-time-series-widgets) for more details on how to configure this tool.
