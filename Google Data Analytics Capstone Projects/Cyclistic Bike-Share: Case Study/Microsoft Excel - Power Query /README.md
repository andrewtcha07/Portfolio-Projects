## 🔄 The 'Process' Phase

### Tool
>*Microsoft Excel and Power Query*
+ **Microsoft Excel** and **Power Query** were chosen for this analysis due to their widespread accessibility, robust data manipulation capabilities, and seamless integration with external data sources.
+ Excel Functions provide powerful tools for performing various calculations, aggregations, and data manipulations, enhancing the analytical capabilities of the platform.
+ Power Query complements Excel's functionalities by offering advanced data shaping and transformation capabilities. Leveraging Power Query M Language, it simplifies tasks such as data cleaning, integration, and transformation, streamlining the data preparation process.
+ Additionally, Excel's visualization tools enable effective summarization and presentation of analysis results, facilitating insightful data visualization for stakeholders.

### Data Preparation
+ Imported the 12 CSV files into Excel, converting them to XLSX for enhanced formatting and analysis.
+ Conducted an initial data review.

### Data Exploration
+ Generated table charts noting record counts, duplicates, and null/blank values, and identified specific stations and IDs related to testing, warehouses, charging stations, and repairs.

#### Counts of Records, Duplicates, and Null/Blank Values
>Calculated using `=COLUMNS`, `=ROWS`, `=COUNTIF`, and `=COUNTBLANK` functions.

![1](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/2ae1b0b0-96aa-4533-a7df-fc56d724f48d)

#### Count of Stations and IDs for Testing, Warehouses, Charging, and Repairs
>Calculated using `=COUNTIF` functions.

![2](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/841785a3-55fd-4418-b76f-1d7aec974b51)

### Summary of Initial Review
+ Each file consists of 13 columns.
+ Total number of rows across all files is 5,719,877.
+ Total count of null/blank values is 3,624,089.
+ Missing data primarily occurs in columns:
    * start_station_name
    * start_station_id
    * end_station_name
    * end_station_id
    * end_lat
    * end_lng
+ Following further exploration, a decision will be made regarding whether to keep or drop missing data.

### Data Consolidation
+ Using Power Query to combine all 12 XLSX files into one file, following the initial review.

```ruby
= Table.TransformColumnTypes(#"Expanded Table Column1",{{"ride_id", type text}, {"rideable_type", type text}, {"started_at", type datetime}, {"ended_at", type datetime}, {"start_station_name", type text}, {"start_station_id", type text}, {"end_station_name", type text}, {"end_station_id", type text}, {"start_lat", type number}, {"start_lng", type number}, {"end_lat", type number}, {"end_lng", type number}, {"member_casual", type text}})
```

### Data Transformation

#### Renaming a Column
+ `member_casual` to `user_type`.
```ruby
= Table.RenameColumns(#"Changed Type",{{"member_casual", "user_type"}})
```

#### Removing Duplicates
+ Removing duplicates from column `ride_id`.
```ruby
= Table.Distinct(#"Rounded Off", {"ride_id"})
```

#### Ensure Consistency 
+ Rounding up `start_lat`, `start_lng`, `end_lat`, and `end_lng` by 2 decmial. 
```ruby
= Table.TransformColumns(#"Replaced Value",{{"start_lat", each Number.Round(_, 2), type number}, {"start_lng", each Number.Round(_, 2), type number}, {"end_lat", each Number.Round(_, 2), type number}, {"end_lng", each Number.Round(_, 2), type number}})
```

#### Adding Columns
+ Duplicating the column `started_at` (i.e. 1/21/2023 8:16:33 PM) and splitting column into six different column.
   * `month` (i.e. **1**/21/2023 8:16:33 PM)
```ruby
= Table.RenameColumns(#"Extracted Month",{{"started_at - Copy", "month"}})
```
   * `day` (i.e. 1/**21**/2023 8:16:33 PM)
```ruby
= Table.TransformColumns(#"Renamed Columns1",{{"started_at - Copy - Copy", Date.Day, Int64.Type}})
```
   * `year` (i.e. 1/21/**2023** 8:16:33 PM)
```ruby
= Table.TransformColumns(#"Renamed Columns2",{{"year", Date.Year, Int64.Type}})
```
   * `day_of_week` (i.e. 1/**21**/2023 8:16:33 PM)
```ruby
= Table.TransformColumns(#"Renamed Columns3", {{"day_of_week", each Date.DayOfWeekName(_), type text}})
```
   * `hour` (i.e. 1/21/2023 **8**:16:33 PM)
```ruby
= Table.TransformColumns(#"Extracted Day Name",{{"started_at - Copy - Copy.1 - Copy.1", Time.Hour, Int64.Type}})
```
   * `quarter`
```ruby
= Table.TransformColumns(#"Duplicated Column5",{{"started_at - Copy", Date.QuarterOfYear, Int64.Type}})
```
+ Add a custom column called `ride_length_min` measuring the difference between `ended_at` and `started_at`.
    * `ride_length_min`
```ruby
= Table.AddColumn(#"Renamed Columns5", "Custom", each [ended_at] - [started_at])
```
   * Converting the `ride_length_min` measurement from hours to minutes to get a more accurate reading.
```ruby
= Table.TransformColumns(#"Renamed Columns6",{{"ride_length_min", Duration.TotalMinutes, type number}})
```
   * Rounding up `ride_length_min` by 2 decmial.
```ruby
= Table.TransformColumns(#"Calculated Total Minutes",{{"ride_length_min", each Number.Round(_, 2), type number}})
```


### Key Tasks
- [ ]  Check the data for errors.
- [ ]  Choose your tools.
- [ ]  Transform the data so you can work with it effectively.
- [ ]  Document the cleaning process.

### Deliverable 
- [ ]  A summary of your analysis.
