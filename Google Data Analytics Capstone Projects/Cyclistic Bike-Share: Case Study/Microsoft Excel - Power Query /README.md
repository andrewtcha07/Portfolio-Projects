## 🔄 The 'Process' Phase

### Tool Used
<img src= "https://img.shields.io/badge/Microsoft_Excel-217346?style=for-the-badge&logo=microsoft-excel&logoColor=white"/>

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
= Table.Distinct(
    #"Removed Columns", 
    {"ride_id"}
)
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
= Table.RenameColumns(
    #"Changed Type1",
    {
        {"member_casual", "user_type"}
    }
)
```

#### Adding Columns
+ Duplicating the column `started_at` (i.e. 1/21/2023 8:16:33 PM) and splitting column into six different column.
+ `month` (i.e. **1**/21/2023 8:16:33 PM)
```ruby
= Table.AddColumn(
    #"Renamed Columns", 
    "month", 
    each Date.MonthName([started_at])
```
+ `day` (i.e. 1/**21**/2023 8:16:33 PM)
```ruby
= Table.AddColumn(
    #"Added Custom", 
    "day", 
    each Date.Day([started_at])
)
```
+ `year` (i.e. 1/21/**2023** 8:16:33 PM)
```ruby
= Table.AddColumn(
    #"Added Custom1", 
    "year", 
    each Date.Year([started_at])
)
```
+ `day_of_week` (i.e. 1/**21**/2023 8:16:33 PM)
```ruby
= Table.AddColumn(
    #"Added Custom2", 
    "day_of_week", 
    each Date.DayOfWeekName([started_at])
)
```
+ `hour` (i.e. 1/21/2023 **8**:16:33 PM)
```ruby
= Table.AddColumn(
    #"Added Custom3", 
    "hour", 
    each Time.Hour([started_at])
)
```
+ `quarter`
```ruby
= Table.AddColumn(
    #"Added Custom4", 
    "quarter", 
    each Date.QuarterOfYear([started_at])
)
```

#### Adding a Custom Column `ride_length_minute`
+ Add a custom column called `ride_length_minute` measuring the difference between `ended_at` and `started_at`.
```ruby
= Table.AddColumn(
    #"Added Custom5", 
    "ride_length_minute", 
    each [ended_at] - [started_at]
)
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
+ Converting the `ride_length_minute` measurement from hours to minutes to get a more accurate reading.
```ruby
= Table.TransformColumns(
    #"Changed Type2",
    {
        {"ride_length_minute", Duration.TotalMinutes, type number}
    }
)
```
+ Rounding up `ride_length_minute` and `ride_distance` by 2 decimal.
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
+ Filtering out outliers from the `ride_length_minute` column. Eliminating any ride length that is less or equal (`<=`) to 1 ( 60 seconds) and greater or equal (`>=`) to 1440 (24 hours).
```ruby
= Table.SelectRows(
    #"Rounded Off", 
    each [ride_length_minute] >= 1 and [ride_length_minute] <= 1440
)
```
+ Filtering out any distances where the start latitude and longitude match the end latitude and longitude in the `ride_distance` column.
```ruby
= Table.SelectRows(
    #"Filtered Rows",
    each [ride_distance] > 0
)
```
+ Filtering out test, warehouse, or charging stations from start_station_name, start_station_id, end_station_name, and end_station_name columns.
```ruby
= Table.SelectRows(
    #"Filtered Rows1", 
    each 
        [start_station_name] <> "OH Charging Stx - Test" and
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
        [start_station_name] <> "OH - BONFIRE - TESTING"
)
```
```ruby
= Table.SelectRows(
    #"Filtered Rows2", 
    each 
        [start_station_id] <> "OH Charging Stx - Test" and
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
        [start_station_id] <> "OH - BONFIRE - TESTING"
)
```
```ruby
= Table.SelectRows(
    #"Filtered Rows3", 
    each 
        [end_station_name] <> "OH Charging Stx - Test" and
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
        [end_station_name] <> "OH - BONFIRE - TESTING"
)
```
```ruby
= Table.SelectRows(
    #"Filtered Rows4", 
    each 
        [end_station_id] <> "OH Charging Stx - Test" and
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
        [end_station_id] <> "OH - BONFIRE - TESTING"
)
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

![3](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/e2418cd2-5c39-4dd6-9ad7-7974597584e1)

### Key Tasks
- [x]  Check the data for errors.
- [x]  Choose your tools.
- [x]  Transform the data so you can work with it effectively.
- [x]  Document the cleaning process.

### Deliverable 
- [x]  Documentation of any cleaning or manipulation of data.

## 🔍 The 'Analyze' Phase

### **User Type Trends**

![1 1 User Type Distribution Chart](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/54bdc3c3-d406-4852-b1af-11706f5744a8)
+ Based on the data presented, it's evident that the platform has facilitated a significant number of rides, totaling **5,251,702** rides across all user types.
+ Casual riders account for approximately **35%** (**1,834,314**) of the total rides, indicating a notable portion of one-time or infrequent users.
+ In contrast, annual members make up the majority, comprising about **65%** (**3,417,388**) of the total rides.

![1 3 Average Ride Length by User Type Chart](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/3e3dedbd-c6fc-4399-a09f-a523330034c5)
+ This chart illustrated a notable difference in average ride duration between casual and member users.
+ Casual users, on average, tend to take longer rides, with an average ride length of approximately **19.75 minutes**, suggesting a preference for leisurely or extended biking activities.
+ In contrast, member users exhibit shorter average ride durations, approximately **12.15 minutes**, indicative of more useful or short-distance travel patterns, such as commuting or running errands within the city.

![1 5 Average Ride Distance by User Type Chart](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/1537441c-852b-43fb-8996-d14b2e8b6272)
+ The analysis of average ride distance by user type reveals a slight difference between casual and member users.
+ Casual users, on average, cover a distance of approximately 1.44 miles per ride, whereas member users travel slightly shorter distances, averaging around 1.37 miles per ride.
+ While the disparity is minimal, it suggests that casual users may be more inclined to take slightly longer rides, perhaps indicating a preference for leisurely biking or exploring new areas. Conversely, member users tend to undertake shorter, more focused trips, likely for commuting or routine travel purposes.

--------------------------------------
#### **Summary of User Type Trends**

The analysis of user type distribution, average ride length, and average ride distance provides a comprehensive understanding of the dynamics within Cyclistic's user community. The analysis points to:

1. **Dominance of Annual Membership Users**: The higher representation of annual membership users in the dataset underscores the program's appeal and success in fostering long-term commitment among riders. Additionally, the differences observed in ride length and distance shed light on varying usage patterns and preferences between casual and member users.

2. **Consistent Usage among Member Users**: The higher representation of member users in the total ride count suggests a consistent and committed user base. These users likely leverage the convenience and cost-effectiveness offered by annual memberships, perceiving Cyclistic as a reliable mode of transportation for their daily commutes or regular biking needs.

3. **Preference for Longer Rides among Casual Users**: In contrast, casual users, while constituting a smaller proportion of the user base, demonstrate a preference for longer rides. This indicates a propensity for leisurely exploration or occasional usage scenarios among casual riders.

Acknowledging the possibility that this data might not fully represent the entire user community, it's reasonable to consider it accurate based on previous discussions. However, it's essential to recognize that high ride numbers alone may not necessarily indicate active usage and additional factors such as user demographics and external influences may influence user behavior.

Further analysis of ride frequency, duration, and distances across different temporal and rideable trends can offer deeper insights into user engagement patterns and perceived values.

### **Hourly Trends**

### **Daily Trends**

### **Monthly Trends**

### **Quarterly Trends**

### **Rideable Trends**


### Key Tasks
- [x]  Aggregate your data so it’s useful and accessible.
- [x]  Organize and format your data.
- [x]  Perform calculations.
- [x]  Identify trends and relationships.

### Deliverable 
- [x]  A summary of your analysis.
