## 🔄 The 'Process' Phase

### Tool
>*Microsoft Excel and Power Query*
+ **Microsoft Excel** and **Power Query** were chosen for this analysis due to their widespread accessibility, robust data manipulation capabilities, and seamless integration with external data sources.
+ Excel Functions provide powerful tools for performing various calculations, aggregations, and data manipulations, enhancing the analytical capabilities of the platform.
+ Power Query complements Excel's functionalities by offering advanced data shaping and transformation capabilities. Leveraging Power Query M Language simplifies tasks such as data cleaning, integration, and transformation, streamlining the data preparation process.
+ Additionally, Excel's visualization tools enable effective summarization and presentation of analysis results, facilitating insightful data visualization for stakeholders.

### Data Exploration
+ Conducted an initial data review.
+ Generated table charts noting record counts, duplicates, and null/blank values, and identified specific stations and IDs related to testing, warehouses, charging stations, and repairs.

#### Counts of Records, Duplicates, and Null/Blank Values
>Calculated using `=COLUMNS`, `=ROWS`, `=COUNTIF`, and `=COUNTBLANK` functions.

![1](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/2ae1b0b0-96aa-4533-a7df-fc56d724f48d)

#### Count of Stations and IDs for Testing, Warehouses, Charging, and Repairs
>Calculated using `=COUNTIF` functions.

![2](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/49743962-c223-4b9d-8e6c-4179f8e515b1)

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
+ Using Power Query to combine all 12 CSV files into one file, following the initial review.
```ruby
= Table.TransformColumnTypes(
    #"Expanded Table Column1",
    {
        {"Source.Name", type text}, 
        {"ride_id", type text}, 
        {"rideable_type", type text}, 
        {"started_at", type datetime}, 
        {"ended_at", type datetime}, 
        {"start_station_name", type text}, 
        {"start_station_id", type text}, 
        {"end_station_name", type text}, 
        {"end_station_id", type text}, 
        {"start_lat", type number}, 
        {"start_lng", type number}, 
        {"end_lat", type number}, 
        {"end_lng", type number}, 
        {"member_casual", type text}
    }
)
```

### Data Transformation and Cleaning

#### Removing Duplicates
+ Removing duplicates from column `ride_id`.
```ruby
= Table.Distinct(#"Removed Columns", {"ride_id"})
```

#### Replace Values
+ Replace blank/empty values with `null`.
```ruby
= Table.ReplaceValue(
    #"Removed Duplicates",
    "",
    null,
    Replacer.ReplaceValue,
    {
        "ride_id", 
        "rideable_type", 
        "started_at", 
        "ended_at", 
        "start_station_name", 
        "start_station_id", 
        "end_station_name", 
        "end_station_id", 
        "start_lat", 
        "start_lng", 
        "end_lat", 
        "end_lng", 
        "member_casual"
    }
)
```
#### Text Transformation
+ Cleaning columns using `Trimmed Text`, trimming any leading and trailing spaces.
```ruby
= Table.TransformColumns(
    Table.TransformColumnTypes(
        #"Replaced Value", 
        {
            {"started_at", type text}, 
            {"ended_at", type text}, 
            {"start_lat", type text}, 
            {"start_lng", type text}, 
            {"end_lat", type text}, 
            {"end_lng", type text}
        }, 
        "en-US"
    ),
    {
        {"ride_id", Text.Trim, type text}, 
        {"rideable_type", Text.Trim, type text}, 
        {"started_at", Text.Trim, type text}, 
        {"ended_at", Text.Trim, type text}, 
        {"start_station_name", Text.Trim, type text}, 
        {"start_station_id", Text.Trim, type text}, 
        {"end_station_name", Text.Trim, type text}, 
        {"end_station_id", Text.Trim, type text}, 
        {"start_lat", Text.Trim, type text}, 
        {"start_lng", Text.Trim, type text}, 
        {"end_lat", Text.Trim, type text}, 
        {"end_lng", Text.Trim, type text}, 
        {"member_casual", Text.Trim, type text}
    }
)
```
+ Cleaning columns using `Cleaned Text`, removing any non-printable characters.
```ruby
= Table.TransformColumns(
    #"Trimmed Text",
    {
        {"ride_id", Text.Clean, type text}, 
        {"rideable_type", Text.Clean, type text}, 
        {"started_at", Text.Clean, type text}, 
        {"ended_at", Text.Clean, type text}, 
        {"start_station_name", Text.Clean, type text}, 
        {"start_station_id", Text.Clean, type text}, 
        {"end_station_name", Text.Clean, type text}, 
        {"end_station_id", Text.Clean, type text}, 
        {"start_lat", Text.Clean, type text}, 
        {"start_lng", Text.Clean, type text}, 
        {"end_lat", Text.Clean, type text}, 
        {"end_lng", Text.Clean, type text}, 
        {"member_casual", Text.Clean, type text}
    }
)
```

#### Renaming a Column
+ `member_casual` to `user_type`.
```ruby
= Table.RenameColumns(#"Changed Type1",{{"member_casual", "user_type"}})
```

#### Adding Columns
+ Duplicating the column `started_at` (i.e. 1/21/2023 8:16:33 PM) and splitting column into six different column.
+ `month` (i.e. **1**/21/2023 8:16:33 PM)
```ruby
= Table.AddColumn(#"Renamed Columns", "month", each Date.MonthName([started_at]))
```
+ `day` (i.e. 1/**21**/2023 8:16:33 PM)
```ruby
= Table.AddColumn(#"Added Custom", "day", each Date.Day([started_at]))
```
+ `year` (i.e. 1/21/**2023** 8:16:33 PM)
```ruby
= Table.AddColumn(#"Added Custom1", "year", each Date.Year([started_at]))
```
+ `day_of_week` (i.e. 1/**21**/2023 8:16:33 PM)
```ruby
= Table.AddColumn(#"Added Custom2", "day_of_week", each Date.DayOfWeekName([started_at]))
```
+ `hour` (i.e. 1/21/2023 **8**:16:33 PM)
```ruby
= Table.AddColumn(#"Added Custom3", "hour", each Time.Hour([started_at]))
```
+ `quarter`
```ruby
= Table.AddColumn(#"Added Custom4", "quarter", each Date.QuarterOfYear([started_at]))
```

#### Adding a Custom Column `ride_length_min`
+ Add a custom column called `ride_length_min` measuring the difference between `ended_at` and `started_at`.
```ruby
= Table.AddColumn(#"Added Custom5", "ride_length_minute", each [ended_at] - [started_at])
```

#### Adding Custom Column `ride_distance`
+ Add a custom column called `ride_distance` measuring the distance between the start and end points and converting from kilometers to miles.
```ruby
= Table.AddColumn(
    #"Added Custom6", 
    "ride_distance", 
    each 
        let
            startLat = [start_lat],
            startLng = [start_lng],
            endLat = [end_lat],
            endLng = [end_lng],
            earthRadiusMiles = 3958.8, // Earth radius in miles
            toRadians = (angle) => angle * (Number.PI / 180),
            dLat = toRadians(endLat - startLat),
            dLon = toRadians(endLng - startLng),
            a = Number.Sin(dLat / 2) * Number.Sin(dLat / 2) + Number.Cos(toRadians(startLat)) * Number.Cos(toRadians(endLat)) * Number.Sin(dLon / 2) * Number.Sin(dLon / 2),
            c = 2 * Number.Atan2(Number.Sqrt(a), Number.Sqrt(1 - a)),
            distanceMiles = earthRadiusMiles * c
        in
            distanceMiles
)
```

#### Updating Columns
+ Changing all columns to the correct data type.
```ruby
= Table.TransformColumnTypes(
    #"Added Custom7",
    {
        {"month", type text}, 
        {"day_of_week", type text}, 
        {"day", Int64.Type}, 
        {"year", Int64.Type}, 
        {"hour", Int64.Type}, 
        {"quarter", Int64.Type}, 
        {"ride_length_minute", type duration}, 
        {"ride_distance", type number}
    }
)
```
+ Converting the `ride_length_min` measurement from hours to minutes to get a more accurate reading.
```ruby
= Table.TransformColumns(#"Changed Type2",{{"ride_length_minute", Duration.TotalMinutes, type number}})
```
+ Rounding up `ride_length_min` and `ride_distance` by 2 decimal.
```ruby
= Table.TransformColumns(
    #"Calculated Total Minutes",
    {
        {"ride_length_minute", each Number.Round(_, 2), type number}, 
        {"ride_distance", each Number.Round(_, 2), type number}
    }
)
```

#### Filtering
+ Filtering out outliers from the `ride_length_min` column. Eliminating any ride length that is less or equal (`<=`) to 1 ( 60 seconds) and greater or equal (`>=`) to 1440 (24 hours).
```ruby
= Table.SelectRows(#"Rounded Off", each [ride_length_minute] >= 1 and [ride_length_minute] <= 1440)
```
+ Filtering out any distances where the start latitude and longitude match the end latitude and longitude in the `ride_distance` column.
```ruby
= Table.SelectRows(#"Filtered Rows", each [ride_distance] > 0)
```
+ Filtering out test, warehouse, or charging stations from start_station_name, start_station_id, end_station_name, and end_station_name columns.
```ruby
= Table.SelectRows(#"Filtered Rows1", each [start_station_name] <> "OH Charging Stx - Test" and
    [start_station_name] <> "chargingstx5" and
    [start_station_name] <> "chargingstx4" and
    [start_station_name] <> "chargingstx3" and
    [start_station_name] <> "chargingstx2" and
    [start_station_name] <> "chargingstx1" and
    [start_station_name] <> "chargingstx07" and
    [start_station_name] <> "chargingstx06" and
    [start_station_name] <> "chargingstx0" and
    [start_station_name] <> "Hubbard Bike-checking (LBS-WH-TEST)" and
    [start_station_name] <> "DIVVY CASSETTE REPAIR MOBILE STATION" and
    [start_station_name] <> "2059 Hastings Warehouse Station" and
    [start_station_name] <> "OH - BONFIRE - TESTING")
```
```ruby
= Table.SelectRows(#"Filtered Rows2", each [start_station_id] <> "OH Charging Stx - Test" and
    [start_station_id] <> "chargingstx5" and
    [start_station_id] <> "chargingstx4" and
    [start_station_id] <> "chargingstx3" and
    [start_station_id] <> "chargingstx2" and
    [start_station_id] <> "chargingstx1" and
    [start_station_id] <> "chargingstx07" and
    [start_station_id] <> "chargingstx06" and
    [start_station_id] <> "chargingstx0" and
    [start_station_id] <> "Hubbard Bike-checking (LBS-WH-TEST)" and
    [start_station_id] <> "DIVVY CASSETTE REPAIR MOBILE STATION" and
    [start_station_id] <> "2059 Hastings Warehouse Station" and
    [start_station_id] <> "OH - BONFIRE - TESTING")
```
```ruby
= Table.SelectRows(#"Filtered Rows3", each [end_station_name] <> "OH Charging Stx - Test" and
    [end_station_name] <> "chargingstx5" and
    [end_station_name] <> "chargingstx4" and
    [end_station_name] <> "chargingstx3" and
    [end_station_name] <> "chargingstx2" and
    [end_station_name] <> "chargingstx1" and
    [end_station_name] <> "chargingstx07" and
    [end_station_name] <> "chargingstx06" and
    [end_station_name] <> "chargingstx0" and
    [end_station_name] <> "Hubbard Bike-checking (LBS-WH-TEST)" and
    [end_station_name] <> "DIVVY CASSETTE REPAIR MOBILE STATION" and
    [end_station_name] <> "2059 Hastings Warehouse Station" and
    [end_station_name] <> "OH - BONFIRE - TESTING")
```
```ruby
= Table.SelectRows(#"Filtered Rows4", each [end_station_id] <> "OH Charging Stx - Test" and
    [end_station_id] <> "chargingstx5" and
    [end_station_id] <> "chargingstx4" and
    [end_station_id] <> "chargingstx3" and
    [end_station_id] <> "chargingstx2" and
    [end_station_id] <> "chargingstx1" and
    [end_station_id] <> "chargingstx07" and
    [end_station_id] <> "chargingstx06" and
    [end_station_id] <> "chargingstx0" and
    [end_station_id] <> "Hubbard Bike-checking (LBS-WH-TEST)" and
    [end_station_id] <> "DIVVY CASSETTE REPAIR MOBILE STATION" and
    [end_station_id] <> "2059 Hastings Warehouse Station" and
    [end_station_id] <> "OH - BONFIRE - TESTING")
```

### Summary of Updated Data
+ Total columns have increased to 21, reflecting additional data transformations.
+ The dataset now contains 5,251,702 rows, indicating the inclusion of new records.
+ Remaining null/blank values amount to 3,109,229 after data updates.

#### Data Transformation and Cleaning
+ Combined 12 CSV files into one using Power Query.
+ Removed duplicates based on the ride_id.
+ Replaced blank/empty values with null across multiple columns.
+ Trimmed leading and trailing spaces from text columns.
+ Cleaned non-printable characters from text columns.
+ Renamed the column member_casual to user_type.
+ Added new columns. (`month`, `day`, `year`, `day_of_week`, `hour`, `quarter`, `ride_length_minute`, and `ride_distance`)
+ Changed data types of various columns accordingly.
+ Converted ride_length_minute from hours to minutes for accuracy.
+ Rounded ride_length_minute and ride_distance to 2 decimal places.
+ Filtered out outliers in ride_length_minute where values are less than 1 minute or greater than 24 hours.
+ Removed rides where the start and end points are identical.
+ Filtered out entries related to test, warehouse, or charging stations from start and end station columns.

#### Handling Missing Data
+ After the cleaning process, it was observed that the `end_lat` and `end_lng` columns no longer contain any null values. This outcome was achieved by filtering out entries where the start and end latitude and longitude values were identical, effectively eliminating any potential null values in these columns.
+ Notably, the columns retaining null values are `start_station_name`, `start_station_id`, `end_station_name`, and `end_station_id`.
+ The decision to keep the missing data in these columns was based on the substantial volume of missing entries, which, if removed, could potentially introduce biases or conflicts with the analysis.
+ Retaining the missing data allows for a more comprehensive exploration of the dataset, ensuring that insights drawn from the analysis are not skewed by data removal.

![Picture1](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/fea18b56-8ce5-45a3-8940-d8c4171e51e8)


### Key Tasks
- [x]  Check the data for errors.
- [x]  Choose your tools.
- [x]  Transform the data so you can work with it effectively.
- [x]  Document the cleaning process.

### Deliverable 
- [x]  A summary of your analysis.

## 🔍 The 'Analyze' Phase
