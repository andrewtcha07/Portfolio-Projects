## 🔄 The 'Process' Phase

### Tool Used
<img src= "https://img.shields.io/badge/Microsoft_Excel-217346?style=for-the-badge&logo=microsoft-excel&logoColor=white"/>

+ **Microsoft Excel**, **Power Query**, and **Pivot Table**, **Pivot Charts** were chosen for this analysis due to their widespread accessibility, robust data manipulation capabilities, and seamless integration with external data sources.
+ Excel Functions provide powerful tools for performing various calculations, aggregations, and data manipulations, enhancing the analytical capabilities of the platform.
+ Power Query complements Excel's functionalities by offering advanced data shaping and transformation capabilities. Leveraging Power Query M Language simplifies tasks such as data cleaning, integration, and transformation, streamlining the data preparation process.
+ Additionally, Excel's visualization tools (pivot table and pivot charts) enable effective summarization and presentation of analysis results, facilitating insightful data visualization for stakeholders.

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
    * `start_station_name`
    * `start_station_id`
    * `end_station_name`
    * `end_station_id`
    * `end_lat`
    * `end_lng`
+ Following further exploration, a decision will be made regarding whether to keep or drop missing data.

### Data Consolidation
+ Utilized Power Query to merge all 12 CSV files into a single file post-initial review.

#### Combining Files
```ruby
= Table.TransformColumnTypes(
    #"Expanded Table Column1",
    {
        {"Source.Name", type text}, 
        {"ride_id", type text}, 
        {"rideable_type", type text}, 
        {"started_at", type datetime}, 
        {"ended_at", type datetime}, 
        {"`start_station_name`", type text}, 
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
+ Removed duplicates from unique identifiers to maintain data integrity.
+ Replaced blank values with null values to ensure consistency.
+ Performed text transformations to enhance data quality and integrity.
+ Renamed a column for clarity and better understanding.
+ Added new columns derived from existing data.
+ Updated values in new columns based on specified conditions for accuracy.
+ Applied filtering to select specific rows based on defined criteria.

#### Removing Duplicates
+ Removing duplicates from column `ride_id`.
```ruby
= Table.Distinct(
    #"Removed Columns", 
    {"ride_id"}
)
```

#### Replacing Values
+ Replacing blank/empty values with **_null_**.
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
+ Cleaning columns using **_Trimmed Text_**, trimming any leading and trailing spaces.
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
+ Cleaning columns using **_Cleaned Text_**, removing any non-printable characters.
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
+ Duplicating the column `started_at` (e.g. 1/21/2023 8:16:33 PM) and splitting column into six different column.
+ `month` (e.g. **1**/21/2023 8:16:33 PM)
```ruby
= Table.AddColumn(
    #"Renamed Columns", 
    "month", 
    each Date.MonthName([started_at])
```
+ `day` (e.g. 1/**21**/2023 8:16:33 PM)
```ruby
= Table.AddColumn(
    #"Added Custom", 
    "day", 
    each Date.Day([started_at])
)
```
+ `year` (e.g. 1/21/**2023** 8:16:33 PM)
```ruby
= Table.AddColumn(
    #"Added Custom1", 
    "year", 
    each Date.Year([started_at])
)
```
+ `day_of_week` (e.g. 1/**21**/2023 8:16:33 PM)
```ruby
= Table.AddColumn(
    #"Added Custom2", 
    "day_of_week", 
    each Date.DayOfWeekName([started_at])
)
```
+ `hour` (e.g. 1/21/2023 **8**:16:33 PM)
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
+ Filtering out test, warehouse, or charging stations from `start_station_name`, `start_station_id`, `end_station_name`, and `end_station_name` columns.
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
+ The dataset underwent extensive manipulation, transformations, filtering, and cleaning processes, resulting in a significant enhancement in data quality.
+ The total columns have increased to 21, reflecting additional data transformations.
+ The dataset now comprises 5,251,702 rows, implying a reduction in the number of records following the implementation of cleaning and filtering processes.
+ The remaining null/blank values amount to 3,109,229 after data updates.

#### Data Transformation and Cleaning
+ Combined 12 CSV files into one using Power Query.
+ Removed duplicates based on the ride_id.
+ Replaced blank/empty values with null across multiple columns.
+ Trimmed leading and trailing spaces from text columns.
+ Cleaned non-printable characters from text columns.
+ Renamed the column `member_casual` to `user_type`.
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

#### User Type Distribution
![1  User Type Distribution](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/c8f63938-6459-4a9f-9c9f-cca604fb7427)
+ Based on the data presented, it's evident that the platform has facilitated a significant number of rides, totaling **5,251,702 rides** across all user types.
+ Casual riders account for approximately **35%** at **1,834,314 of the total rides**, indicating a notable portion of one-time or infrequent users.
+ In contrast, annual members make up the majority, comprising about **65%** at **3,417,388 of the total rides**.

#### Average Ride Length (minutes) by User Type
![1 2 Ride Length Statistic Summary](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/8a9458b3-fc75-4e16-a5df-b2f1a07febb2)
+ The table illustrated a notable difference in average ride duration between casual and member users.
+ Casual users, on average, tend to take longer rides, with an average ride length of approximately **19.75 minutes**, suggesting a preference for leisurely or extended biking activities.
+ In contrast, member users exhibit shorter average ride durations, approximately **12.15 minutes**, indicative of more useful or short-distance travel patterns, such as commuting or running errands within the city.

#### Average Ride Distance (miles) by User Type
![1 4 Ride Distance Statistic Summary](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/740a39e0-d6fd-4451-9c48-577eeb7c9263)
+ The table reveals a slight difference between casual and member users.
+ Casual users, on average, cover a distance of approximately **1.44 miles** per ride
+ Whereas member users travel slightly shorter distances, averaging around **1.37 miles per** ride.
+ While the disparity is minimal, it suggests that casual users may be more inclined to take slightly longer rides, perhaps indicating a preference for leisurely biking or exploring new areas. Conversely, member users tend to undertake shorter, more focused trips, likely for commuting or routine travel purposes.

--------------------------------------

### **Hourly Trends**

#### Hourly User Overview
![2  Hourly Total Count](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/4cfb93fd-81ca-4080-91e0-bb5b37d579ce)
+ The table reveals distinct patterns in bike usage between casual and member users throughout the day.
+ Casual users demonstrate a notable range of ride counts, with the lowest recorded at **4 AM** (**5,355 rides**) and the highest at **5 PM** (**140,876 rides**), potentially indicating utilization for early morning recreational activities or leisurely commutes, peaking again during evening hours.
+ Member users consistently exhibit higher ride counts across all hours, with the lowest recorded at **3 AM** (**7,306 rides**) and the highest at **5 PM** (**363,705 rides**), suggesting a reliance on Cyclistic bikes for daily commuting or routine travel purposes.
+ Peaks in member user activity coincide with typical morning and evening commuting hours, while casual users show more dispersed patterns, peaking during morning recreational periods and evening leisure rides.
+ A substantial difference in activity levels between casual and member users during peak hours, particularly during the morning commute, underscores the program's popularity among regular commuters and the impact of annual memberships in fostering consistent bike usage.

#### Hourly Ride Length Average (minutes)
![2 2 Hourly Ride Length Average](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/b7e2d824-b558-45bf-b687-54882087b031)
+ The table reveals distinct patterns in ride duration between casual and member users throughout the day.
+ Casual users display varying ride lengths, with the shortest average ride occurring at **5 AM** (**12.88 minutes**) and the longest at **11 AM** (**23.92 minutes**). This suggests that casual users tend to engage in longer rides (17-24 minutes) during mid-morning to early afternoon hours, indicating a preference for leisurely or exploratory trips.
+ In contrast, member users consistently maintain shorter average ride lengths (11-13 minutes). The shortest recorded average ride for members is at **5 AM** (**9.99 minutes**), while the longest is at **5 PM** (**12.97 minutes**). Member users' ride lengths remain relatively consistent throughout the day, with slightly longer rides during peak commuting times.
+ These findings suggest potential differences in user behavior and motivations. Casual users may be more inclined towards longer, recreational rides, while member users tend to opt for shorter, more utilitarian trips.

#### Hourly Ride Distance Average (miles)
![2 4 Hourly Ride Distance Average](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/6dd7200d-cbb5-4026-b8e8-6396ba6cec03)
+ The table offers valuable insights into the typical duration of bike rides taken by both casual and member users throughout the day.
+ Casual users experienced their shortest average ride duration at **12 AM** (**1.28 miles**) and their longest at **11 AM** (**1.53 miles**), showing fluctuating durations throughout the day, with a peak around midday.
+ On the other hand, member users maintained relatively consistent average ride durations, with the shortest at **12 PM** (**1.27 miles**) and the longest at **5 PM** (**1.45 miles**), showing minor fluctuations.
+ Casual users generally have slightly longer average ride durations compared to member users across most hours of the day, ranging from approximately 1.28 to 1.53 miles per hour, with peaks observed during the mid-morning to early afternoon hours.
+ In contrast, member users consistently maintain shorter average ride durations, typically ranging from approximately 1.27 to 1.45 miles per hour.
+ There's a slight increase in average ride duration during the early morning hours, followed by a decrease during the afternoon and evening hours, aligning with expectations for practical commuting purposes.
+ The highest average ride durations for both casual and member users are observed during different hours, suggesting varying usage patterns or preferences between the two user groups.
+ Despite this trend, both user groups demonstrate peak durations at different times, indicating diverse patterns or purposes of usage.

--------------------------------------

### **Weekly Trends**

#### Weekly User Overview
![5  Weekly User Overview](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/3924e5d9-d4d0-411c-8f17-ecbf325b1f94)
+ The table reveals interesting trends in user counts for casual and member users throughout the week.
+ Casual users show higher numbers on weekends, with **Saturday** having a peak count of **363,139 users**, indicating a preference for weekend bike rides.
+ **Monday** has the lowest count for casual users at **208,486**, suggesting a decrease in casual user activity at the start of the week.
+ The data suggests that casual users prefer weekend usage, potentially for leisure or recreational bike rides, aligning with their higher counts on Saturdays.
+ Member users exhibit consistent usage patterns on weekdays, with **Thursday** recording the highest count of **551,430 users**, suggesting regular and focused usage for commuting or daily transportation needs.
+ **Sunday** has the lowest count for member users at **378,440**, indicating relatively lower activity among members on weekends.
+ Member users demonstrate regular and focused usage patterns, likely for commuting or daily transportation needs, as reflected in their consistent counts on weekdays.

#### Weekly Ride Length Average (minutes)
![5 2 Weekly Ride Length Average](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/ac32155a-8809-4a29-a4e9-015dfe2b7530)
+ The table highlights the variations in average ride lengths based on user type and day of the week.
+ Casual users, who ride more sporadically, exhibit a weekly trend in their ride lengths. The lowest average ride length for casual users is **16.92 minutes**, observed on **Wednesdays**. On this day, casual users tend to have shorter rides, potentially due to midweek commitments or time constraints. The highest average ride length for casual users is **22.97 minutes**, occurring on **Sundays**. On average, Sundays attract casual users who have more free time, allowing them to engage in longer, leisurely rides, possibly exploring the city or enjoying outdoor activities.
+ Member users, who have subscribed to the membership plan, also demonstrate a weekly pattern in their ride lengths. The lowest average ride length for member users is **11.48 minutes**, observed on **Mondays**. Member users often have shorter rides at the beginning of the week, possibly due to commuting to work or engaging in shorter, purposeful trips. The highest average ride length for member users is **13.56 minutes**, occurring on **Sundays**. Even for member users, Sundays serve as a day for longer rides, potentially for recreational purposes or exploring the city at a more relaxed pace.
+ Member users, with shorter average ride lengths, are likely utilizing the bikes for more practical purposes, such as commuting to work or running errands, which often involve shorter distances.
+ Sundays, with the highest average ride lengths for both casual and member users, may indicate that users have more free time on weekends to engage in longer rides.
+ Mondays and Wednesdays, with the lowest average ride lengths for casual and member users respectively, could be attributed to users having busier schedules during the midweek and at the start of the week, resulting in shorter rides.
+ Cyclistic can leverage this information to optimize its bike fleet distribution, ensuring that there are enough bikes available for casual users seeking longer rides on weekends, while also focusing on meeting the commuting needs of member users during weekdays.

#### Weekly Ride Distance Average (miles)
![5 4 Weekly Ride Distance Average](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/0009f772-6d35-4094-b18a-522ecd82fc4c)
+ The table offers insights into usage patterns of casual and member users throughout the week, comparing average ride distances.
+ **Wednesdays** show the lowest average ride distance for casual users of **1.37 miles**, possibly due to time constraints or specific purposes. **Saturdays** exhibit the highest average ride distance of **1.53 miles**, suggesting popular extended weekend rides.
+ Casual users generally ride longer distances than member users, with consistent averages from Monday to Thursday (ranging from 1.37 to 1.39 miles), indicating stable weekday usage.
+ **Mondays** have the lowest average ride distance for member users of **1.32 miles**, possibly reflecting shorter commuting trips or essential travel at the week's start. **Saturdays** have the highest average ride distance of **1.44 miles** for member users, similar to casual users.
+ Fridays see a slightly lower average ride distance for member users (1.35 miles), indicating potentially shorter rides leading into the weekend.
+ Tuesdays, Wednesdays, and Thursdays show relatively consistent average ride distances for member users, ranging from 1.36 to 1.37 miles.
+ Both casual and member users demonstrate similar usage patterns, with higher average ride distances on weekends, particularly on Saturdays.
+ Weekdays exhibit relatively stable average ride distances for both user types, indicating consistent usage during the workweek.
+ Mondays and Wednesdays tend to have the lowest average ride distances for member users and casual users, respectively, suggesting shorter midweek rides and at the week's start.
+ Overall, member users consistently ride slightly shorter distances compared to casual users.

--------------------------------------

### **Monthly Trends**

#### Monthly User Overview
![3  Monthly User Overview](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/b6364053-7604-4119-ae7b-ae52b71fe6ac)
+ The table presents the monthly counts of casual and member users, revealing user trends and seasonal variations.
+ Casual user counts show a clear seasonal pattern. The user numbers tend to be lower during the winter months (January to March) and increase significantly from April to August. The highest number of casual users is observed in **July** (**293,336**), indicating a peak in summertime usage. Following the peak in July, casual users gradually decline from September to December. The lowest count of casual users is seen in **January** (**36,047**).
+ Similar to casual users, member user counts also exhibit a seasonal pattern. The numbers are lower during the winter months and experience a notable increase from April to August, peaking in **August** (**428,986**). From September to December, the number of member users shows a gradual decline. The lowest count of member users is observed in **February** (**137,340**).
+ The summer months show the highest user counts for both casual and member users. This indicates that the warm weather and vacation season contribute to increased bike usage.
+ The winter months have lower user counts for both casual and member users, which can be attributed to colder weather and less favorable biking conditions.

#### Monthly Ride Length Average (minutes)
![3 2 Monthly Ride Length Average](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/500016a9-133c-4f0b-b396-5543fdb23bf3)
+ The table presents the average duration of rides for casual and member users over the course of a year, broken down by month.
+ Casual users exhibit a clear seasonal pattern, with longer rides during the warmer months and shorter rides in the colder months. The highest average ride length for casual users is in **July**, at **21.74 minutes**, indicating that casual users tend to take longer rides during the summer months. The lowest average ride length for casual users is observed in **January**, at **13.44 minutes,** which coincides with the winter season.
+ The gradual increase in average ride length from April to July, followed by a decline from August to December, suggests that casual users' riding habits are influenced by seasonal changes and weather conditions.
+ Similarly, member users also show a seasonal pattern in their average ride length, with longer rides during the summer months and shorter rides in the winter. The highest average ride length for member users is in **July**, at **13.30 minutes**, coinciding with the peak summer period. The lowest average ride length for member users is in **January**, at **10.26 minutes**, aligning with the winter season.
+ While member users follow a similar seasonal trend as casual users, their average ride lengths are generally shorter across all months, indicating a potential difference in riding habits or preferences between the two user groups.
+ It suggested that weather conditions and seasonal changes significantly influence the riding habits and preferences of both user groups.

#### Monthly Ride Distance Average (miles)
![3 4 Monthly Ride Distance Average](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/a23387e0-56a6-4290-9bdd-5d30668394b4)
+ The table presents the average distance of rides for users, broken down by month.
+ Casual users follow a seasonal pattern, with longer distances covered during the warmer months and shorter distances in the colder months. The highest average ride distance for casual users is in **June**, at **1.52 miles**, indicating that casual users tend to cover longer distances during the summer months. The lowest average ride distance for casual users is observed in **January**, at **1.12 miles**, coinciding with the winter season.
+ The gradual increase from April to August, followed by a decline from September to December, suggests that casual users' riding distances are influenced by seasonal changes and weather conditions, similar to their riding duration patterns.
+ Similarly, member users also exhibit a seasonal pattern in their average ride distance, with longer distances covered during the summer months and shorter distances in the winter. The highest average ride distance for member users is in **July** at **1.47 miles**, coinciding with the peak summer period. The lowest average ride distance for member users is in **January** at **1.15 miles**, aligning with the winter season.
+ While member users follow a similar seasonal trend as casual users, their average ride distances are generally shorter across most months, indicating a potential difference in riding habits or preferences between the two user groups, consistent with the observations from the ride length data.
+ It's worth noting that member users generally have shorter average distances compared to casual users.

--------------------------------------

### **Quarterly Trends**

#### Quarterly User Overview
![4  Quarterly User Overview](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/4adcd2b7-9ceb-4ac9-87f5-34eaca4fe0c0)
+ This table displays the total count of rides per quarter for both casual and member users.
+ Both casual and member user counts exhibit a distinct seasonal pattern, with the highest numbers observed in the 3rd quarter (July-September) and the lowest numbers in the 1st quarter (January-March).
+ Casual users' peak in the **3rd quarter** (**802,411 rides**) aligns with the summer months, suggesting a higher propensity for leisure or recreational activities during this period.
+ Member users also experience their highest usage in the **3rd quarter** (**1,215,380 rides**), potentially due to favorable weather conditions and increased outdoor activities.
+ The lowest user counts for both groups occur in the **1st quarter**, with casual users at **130,509 rides** and member users at **459,225 rides**, likely influenced by colder weather conditions.

#### Quarterly Ride Length Average (minutes)
![4 2 Quarterly Ride Length Average](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/8c665930-3bc5-48d2-abb0-208d6cf5f66b)
+ This table displays the quarterly average ride length in minutes for both casual and member users.
+ Casual users consistently have longer average ride lengths compared to member users across all quarters, reinforcing the notion of a more leisurely or recreational approach to bike usage.
+ The longest average ride length for casual users is observed in the **3rd quarter** (**21.01 minutes**), coinciding with the peak summer season and favorable weather conditions.
+ Member users also experienced their longest average ride length in the **3rd quarter** (**13.07 minutes**), although it is significantly shorter than casual users, potentially indicating a more commuting-oriented usage pattern.
+ The shortest average ride lengths for both groups occurred in the **1st quarter**, with casual users at **14.51 minutes** and member users at **10.36 minutes**, likely influenced by colder weather conditions and shorter daylight hours.

#### Quarterly Ride Distance Average (miles)
![4 4 Quarterly Ride Distance Average](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/0560680f-3b8c-405a-bcc0-b4190fecf809)
+ This table displays the quarterly average ride distance in miles for both casual and member users.
+ Similar to the ride length trend, casual users consistently cover longer average ride distances compared to member users across all quarters, further reinforcing the leisurely or recreational nature of their bike usage.
+ The longest average ride distance for casual users is observed in the **3rd quarter** (**1.50 miles**), aligning with the peak summer season and favorable weather conditions.
+ Member users also experienced their longest average ride distance in the **3rd quarter** (**1.45 miles**), although it is slightly shorter than casual users, potentially indicating a more commuting-oriented usage pattern with shorter distances.
+ The shortest average ride distances for both groups occurred in the **1st quarter**, with casual users at **1.18 miles** and member users at **1.19 miles**, likely influenced by colder weather conditions and shorter daylight hours.

--------------------------------------

### **Rideable Trends**

![6  Rideable Type Trends](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/5b6196e0-b2d8-4fc6-91c1-341953573a3d)
+ The table provides valuable insights into the bike preferences of both casual and member users.
+ Casual users predominantly opt for **electric_bikes**, with **1,003,443 rides**, followed by **classic_bikes** with **769,843 rides**, and **docked_bikes** with **61,028 rides**. This suggests that casual users prioritize convenience and ease of use, as electric_bikes offer a more effortless riding experience, which may be particularly appealing for leisure or recreational rides.
+ Similarly, member users also favor **electric_bikes**, accounting for **1,711,173 rides**, closely trailed by **classic_bikes** with **1,706,215 rides**. This indicates that both options cater to their commuting or transportation needs, with electric_bikes offering a more efficient and less physically demanding commuting experience, while classic_bikes may be preferred for cost-effectiveness, environmental consciousness, or a traditional bike-riding experience.
+ Notably, the **docked_bike** option appears to be the least popular among both user groups, possibly due to the inconvenience of returning the bike to a docking station, which may not align with the flexibility and convenience desired by users.

--------------------------------------

### **Summary of the Analysis**
This analysis reveals valuable insights into the behavior, trends, and preferences of two distinct user segments: casual and member users. By delving into the intricacies of rider behaviors and preferences, Cyclistic can strategically customize its marketing approach.

### Key Tasks
- [x]  Aggregate your data so it’s useful and accessible.
- [x]  Organize and format your data.
- [x]  Perform calculations.
- [x]  Identify trends and relationships.

### Deliverable 
- [x]  A summary of your analysis.

## 🎁 The 'Share' Phase

### **User Type Trends**

![1 1 User Type Distribution Chart](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/5cee319c-6729-4e3a-b8de-d47552ecda91)

![1 3 Average Ride Length by User Type Chart](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/5ab3bf73-c6cf-498c-aebf-a6918b429e29)

![1 5 Average Ride Distance by User Type Chart](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/28db9763-744a-44d9-a658-ec34c695ebf4)

#### **Summary of User Type Trends**
The analysis of "**User Type Trends**" provides a comprehensive understanding of the dynamics within Cyclistic's user community. The analysis indicates:
+ **Casual User Behavior**: Approximately **35%** of Cyclistic's user base consists of casual users. They tend to prefer longer rides, resulting in slightly longer average ride durations and distances. Casual users typically utilize Cyclistic bikes for recreational purposes, city exploration, or leisurely rides. Their usage patterns, preferences, and motivations may differ from those of members.
+ **Member Users Behavior**: Around **65%** of Cyclistic's users are members who exhibit consistent usage patterns, characterized by shorter average ride durations and distances. Members are likely regular users of the Cyclistic service, often employing it for daily commuting or routine transportation needs. Their approach to using Cyclistic bikes is more purposeful and focused.
#### **Key Questions**:
1. **How do annual members and casual riders use Cyclistic bikes differently?**
   - Casual riders tend to have longer average ride durations and distances compared to members.
   - Members typically focus on shorter rides, likely for commuting or regular transportation purposes.
2. **Why would casual riders buy Cyclistic annual memberships?**
   - Casual riders may consider purchasing annual memberships if they find value in using Cyclistic bikes regularly for longer periods.
   - An annual membership could offer cost savings, convenience, and access to additional features for casual riders who anticipate frequent usage throughout the year.
3. **How can Cyclistic use digital media to influence casual riders to become members?**
   - Cyclistic can utilize digital media platforms to highlight the benefits of membership, such as cost savings, access to additional features, or exclusive perks.
   - Targeted advertising campaigns should emphasize the convenience and value of an annual membership, tailored to the specific needs and preferences of casual riders.
   - Offering incentives, discounts, or limited-time promotions through digital channels can incentivize casual riders to explore membership options and experience the associated benefits firsthand.

The user-type trend data provides valuable insights into the behaviors, preferences, and habits of casual users and members. Understanding these differences enables Cyclistic to optimize its offerings, tailor marketing strategies, and enhance the user experience for both user types. By recognizing the unique needs of casual users and implementing targeted approaches through digital media, Cyclistic can effectively encourage casual riders to become members, leading to increased engagement, loyalty, and long-term business growth. Further analysis of ride frequency, duration, and distances across different temporal and rideable trends can provide deeper insights into user engagement patterns and perceived values, enabling Cyclistic to refine its strategies and maximize its effectiveness in the market.

--------------------------------------

### **Hourly Trends**

![2 1 Hourly User Overview Chart](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/f29db0ce-e457-4c50-bf5a-d1285f3251c5)

![2 3 Hourly Ride Length Average Chart](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/d309b650-7751-4822-85f8-8f3153bf7e48)

![2 5 Hourly Ride Distance Average Chart](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/1f8fbd51-302c-41f0-af6d-bbe45867ad0b)

#### **Summary of Hourly Trends**
The analysis of "**Hourly Trends**" data reveals distinct utilization patterns among casual and member users throughout the day. While both user types exhibit peaks in usage during certain hours, variations in ride counts, average ride lengths, and durations provide valuable insights into user behavior and preferences. Several crucial observations can be recognized:
+ **Casual Users Behavior**: Casual riders exhibit diverse usage patterns, with varying ride volumes, distances, and durations throughout the day. They often engage in longer rides, indicating a more leisurely and exploratory approach to bike usage. Casual users may use the service for recreational purposes, sightseeing, or occasional transportation needs.
+ **Member Users Behavior**: Annual member users demonstrate more consistent and predictable usage patterns. They tend to have shorter ride durations, suggesting a more purposeful and efficient approach to bike usage. Member users are likely to use the service for regular commuting, daily transportation needs, or planned activities.
#### **Key Questions**
1. **How do annual members and casual riders use Cyclistic bikes differently?**
   - Annual members tend to use Cyclistic bikes consistently throughout the day for shorter, purposeful rides, likely for daily commuting or regular transportation needs.
   - Casual riders show more varied usage patterns, with longer and exploratory rides, potentially using the bikes for recreational purposes or city exploration.
2. **Why would casual riders buy Cyclistic annual memberships?**
   - Casual riders might consider purchasing annual memberships if they find value in using Cyclistic bikes regularly for their transportation needs, such as commuting to work or running errands.
   - Promotions highlighting the cost-saving benefits, convenience, and flexibility of annual memberships can incentivize casual riders to make the switch.
3. **How can Cyclistic use digital media to influence casual riders to become members?**
   - Cyclistic can leverage digital media by showcasing the benefits of annual memberships, such as cost savings, convenience, and access to a reliable transportation option.
   - Targeted advertisements and personalized offers can be used to engage casual riders and highlight the advantages of becoming a member.
   - Social media campaigns, influencer collaborations, and user testimonials can also be effective in showcasing the positive experiences of Cyclistic members.

By analyzing the hourly trends and understanding the habits of casual users and members, Cyclistic can tailor its marketing tactics to attract and retain both user groups. This data-driven approach allows for targeted promotions, personalized messaging, and an enhanced user experience, ultimately driving user engagement and membership conversions. Furthermore, conducting further analysis of trends is likely to unveil even more detailed insights into user behavior, enabling Cyclistic to refine its strategies and maximize its effectiveness in the market.

--------------------------------------

### **Weekly Trends**

![5 1 Weekly User Overview Chart](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/84c9cd0d-a1ef-4511-bcbd-b6760f2a902b)

![5 3 Weekly Ride Length Average Chart](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/4742cc3f-b53a-4291-8517-170d4de1b3b5)

![5 5 Weekly Ride Distance Average Chart](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/ef63d912-4f64-4f31-8a85-dde7bc64f0fe)

#### **Summary of Weekly Trends**
The analysis of “**Weekly Trends**” uncovers significant utilization patterns among casual and member users throughout the week. By analyzing ride counts, average ride lengths, and durations, valuable insights into user behavior and preferences emerge. Notably, both user types experience peaks in bike usage during specific hours, yet variations in these metrics shed light on distinct patterns. This analysis yields crucial observations:
+ **Casual User Behavior:** Casual users demonstrate a preference for longer rides, utilizing the service for recreational purposes and leisurely exploration. They tend to cover greater average distances compared to member users, indicating a desire for extended biking experiences. Casual users show higher average ride distances on weekends, particularly on Saturdays, suggesting that they take advantage of their free time for leisurely rides. During weekdays, their average ride distances remain relatively stable, indicating a consistent level of engagement with the service. However, there may be a slight increase in ride distances on Fridays, possibly reflecting the anticipation of the upcoming weekend and a desire for longer rides as the workweek concludes.
+ **Member User Behavior:** In contrast to casual users, member users exhibit slightly shorter ride distances on average. This indicates that member users tend to employ the service for more focused and utilitarian purposes, such as commuting or running errands. Similarly, member users also display higher average ride distances on weekends, particularly on Saturdays, suggesting that members also enjoy longer rides during their leisure time. Weekdays show consistent average ride distances for member users, highlighting a regular and predictable usage pattern. However, there may be a slight decrease in ride distances on Fridays, potentially reflecting shorter rides as members prepare for the weekend or a shift in usage patterns.

#### **Key Questions**:
1. **How do annual members and casual riders use Cyclistic bikes differently?**
    - Annual members tend to have slightly shorter average ride distances compared to casual riders, indicating more focused and regular usage, potentially for commuting or daily transportation needs.
    - Casual riders, on the other hand, exhibit higher average ride distances, suggesting a preference for longer and more recreational rides.
2. **Why would casual riders buy Cyclistic annual memberships?**
    - Cyclistic can highlight the advantages of membership, such as cost savings, access to exclusive features, and priority bike availability, in order to encourage casual riders to purchase annual memberships.
    - Offering incentives like discounted rates or extended rental times for first-time members could also attract casual riders to purchase annual memberships.
    - Personalized recommendations based on riding patterns and preferences can showcase the value of membership, such as tailored route suggestions or curated lists of popular destinations.
3. **How can Cyclistic use digital media to influence casual riders to become members?**
    - Cyclistic can leverage digital media platforms to target casual riders with personalized advertisements highlighting the benefits of annual membership, such as convenience, cost-effectiveness, access to a wider range of bikes, and the ability to track and monitor usage patterns.
    - Engaging social media campaigns, targeted email marketing, and incentives like referral programs or limited-time promotions can encourage casual riders to consider the benefits and value of becoming annual members.
    - Sharing success stories or testimonials from satisfied members on digital platforms can create a sense of community and inspire casual riders to envision the benefits of joining.

By understanding the specific preferences and behaviors of casual users and annual members, Cyclistic can tailor its marketing strategies, promotional offers, and digital media campaigns to effectively influence and attract casual riders to become loyal members. Providing a seamless user experience, highlighting the value of membership, and addressing the unique needs of each user type will contribute to the growth and success of Cyclistic. Further analysis of trends is anticipated to reveal even more detailed perspectives.

--------------------------------------

### **Monthly Trends**

![3 1 Monthly User Overview Chart](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/2f60ae82-0990-4c0d-98ee-b90f58b8ae81)

![3 3 Monthly Ride Length Average Chart](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/c4b86ad4-a710-4989-9171-2f4f11d0acf6)

![3 5 Monthly Ride Distance Average Chart](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/56264ee6-1999-4549-b257-3491c788cac0)

#### **Summary of Monthly Trends**
The analysis of “**Monthly Trends**” unveils dynamic usage dynamics among both casual and member users of Cyclistic bikes throughout the months. Fluctuations in user counts, ride length, and ride distance, which mirror seasonal changes, provide insight into the nuanced preferences and behaviors of this diverse clientele. Understanding these patterns is crucial for informing strategic decisions and enhancing user experiences. This analysis shows the following insights:
+ **Casual User Behavior**: Casual users exhibit a strong seasonal pattern, with peak usage occurring during the warmer months, particularly in July. Their average ride lengths and distances are consistently longer compared to member users across all months, suggesting a more leisurely or recreational approach to bike usage. This pattern indicates that casual users are more likely to ride for enjoyment or leisure activities when the weather is favorable, potentially exploring different parts of the city or using bikes for recreational purposes rather than commuting or transportation. The highest number of casual users is observed in July, coinciding with the peak summer season and vacation periods.
+ **Member User Behavior**: In contrast, while member users also exhibit seasonal patterns with higher numbers during the summer months and lower numbers in the winter, their peak usage occurs slightly later in August. Unlike casual users, member users generally have shorter average ride lengths and distances, which could indicate a preference for more efficient and direct rides, likely for commuting or transportation purposes. Moreover, member users' usage remains more consistent throughout the year compared to casual users, suggesting a reliance on Cyclistic bikes for regular commuting or transportation needs, rather than solely for leisure or recreational purposes. This behavior aligns with the common observation in bike-sharing services of higher usage among member users during weekdays, as they commute to and from work or run errands, further reinforcing the notion that member users primarily use Cyclistic bikes for practical transportation purposes.

#### **Key Questions**:
1. **How do annual members and casual riders use Cyclistic bikes differently?**
   - Casual riders tend to engage in leisurely or recreational rides, as indicated by longer average ride lengths and distances, particularly during warmer months.
   - Annual members primarily use the bikes for commuting or transportation needs, resulting in shorter and more efficient rides throughout the year.
2. **Why would casual riders buy Cyclistic annual memberships?**
   - Casual riders may opt for annual memberships due to frequent utilization of Cyclistic bikes for leisure or recreational purposes, especially during the warmer months.
   - Potential cost savings compared to paying per ride.
   - Continuous accessibility to the bike-sharing service throughout the year.
   - Flexibility to adapt to changing usage patterns or transition to commuting without worrying about individual ride costs.
3. **How can Cyclistic use digital media to influence casual riders to become members?**
   - Targeted advertising campaigns during peak usage months, highlighting the benefits and convenience of annual membership.
   - Personalized promotions or discounts for consistent casual riders during warmer months.
   - Social media campaigns emphasizing accessibility, convenience, and environmental benefits.
   - Partnerships with local events to promote annual membership as a city exploration option during the summer.
   - Utilization of user data and analytics for targeted offers or recommendations.
   - Collaboration with influencers or user-generated content to provide social proof of membership benefits.

By understanding the distinct habits and preferences of casual and member users, as well as leveraging digital media and targeted marketing strategies, Cyclistic can effectively promote its annual membership offerings and convert more casual riders into loyal, long-term members. Further analysis of trends is anticipated to reveal even more detailed perspectives, offering valuable insights for the continued optimization of user engagement and retention strategies.

--------------------------------------

### **Quarterly Trends**

![4 1 Quarterly User Overview Chart](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/b70d45d3-f1d6-4d4d-bdc2-a4d228fdf6f8)

![4 3 Quarterly Ride Length Average Chart](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/b9adc9be-7237-48ec-9a5a-b21fbc9485fa)

![4 5 Quarterly Ride Distance Average Chart](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/0eb3fadf-9cc3-4a66-bb28-ab90c3f446c4)

#### **Summary of Quarterly Trends**
The analysis of “**Quarterly Trend**” provides a comprehensive understanding of the patterns and fluctuations in bike usage among casual and member users throughout the different quarters. By examining key metrics such as total user counts, average ride lengths, and distances on a quarterly basis, we can uncover underlying behaviors, preferences, and demand motivations. This analysis illuminates:
+ **Casual User Behavior**: Casual users of Cyclistic bikes demonstrate a pronounced seasonal preference, with peak usage observed during the warmer months, particularly in the 3rd quarter (July-September). This trend suggests that their bike usage is strongly influenced by favorable weather conditions and the desire for outdoor leisure activities. Throughout all quarters, casual users consistently display longer average ride lengths and distances compared to member users, indicating a more leisure-oriented approach to bike usage. They may use the bikes for recreational purposes, sightseeing, or exploring various parts of the city. The notable fluctuations in casual user counts between quarters suggest a high degree of flexibility and spontaneity in their usage patterns. This aligns with the concept that casual users are not constrained by regular commuting schedules or routines, allowing them to utilize the bikes on an as-needed basis for leisure or recreational purposes. Furthermore, the peak usage and extended ride durations/distances during the third quarter imply that casual users are particularly responsive to favorable weather conditions. Warm temperatures and longer daylight hours during the summer months likely encourage increased outdoor activities and bike usage for leisure purposes.
+ **Member User Behavior**: In contrast to casual users, member users demonstrate more consistent usage patterns throughout the year, albeit still exhibiting seasonal variations. This consistency implies that member users rely on Cyclistic bikes for regular commuting or transportation needs rather than solely for leisure or recreational purposes. Compared to casual users, member users typically have shorter average ride lengths and distances across all quarters. This trend suggests that they prioritize efficiency and shorter travel times, which aligns with the common usage scenario of commuting or transportation. Member users are more inclined to opt for shorter and more direct routes, further supporting the notion that they predominantly use Cyclistic bikes for commuting or transportation purposes. The higher usage among member users during weekdays, as observed in various bike-sharing services, indicates that a substantial portion of their bike usage is associated with commuting to and from work or completing errands. Additionally, the decision to invest in an annual membership signifies that member users value the cost savings and convenience provided by Cyclistic's bike-sharing service. This makes it an appealing option for regular commuters or individuals who frequently rely on the service for transportation needs within the city.

#### **Key Questions**:
1. **How do annual members and casual riders use Cyclistic bikes differently?**
   - Casual users and member users exhibit distinct usage patterns and habits.
   - Casual users tend to use the bikes for leisure or recreational purposes, with longer ride lengths and distances, particularly during warmer months.
   - In contrast, member users are more inclined to use the bikes for commuting or transportation needs, displaying shorter and more efficient ride patterns consistently throughout the year.
2. **Why would casual riders buy Cyclistic annual memberships?**
   - Annual membership offers potential cost savings compared to paying per ride, especially for frequent users.
   - With an annual membership, casual users can enjoy the convenience of accessing bikes without the need to pay each time, making it easier to incorporate bike rides into their routine.
   - As casual users become more familiar with the bike-sharing service, some may consider transitioning to using Cyclistic bikes for commuting purposes, making an annual membership more practical.
3. **How can Cyclistic use digital media to influence casual riders to become members?**
   - Use data-driven advertising campaigns on social media platforms and relevant websites to promote the benefits of an annual membership, highlighting cost savings and convenience.
   - Collaborate with influencers or local personalities who align with the brand's values and can showcase the leisure and recreational aspects of using Cyclistic bikes, potentially inspiring casual riders to consider a membership.
   - Encourage and amplify user-generated content showcasing the enjoyable experiences of casual riders, fostering a sense of community and highlighting the benefits of regular bike usage.
   - Utilize data on casual riders' usage patterns and preferences to deliver personalized recommendations and offers for an annual membership, making it more appealing and relevant.

Analyzing the quarterly trend data provides a comprehensive understanding of the seasonal fluctuations and usage patterns exhibited by both casual and member users. These insights enable Cyclistic to make informed decisions regarding marketing strategies, product offerings, and operational planning, better catering to the needs of both casual and member users. By leveraging digital media effectively, Cyclistic can raise awareness, highlight the advantages of an annual membership, and ultimately influence casual riders to transition into becoming members, fostering a more loyal and engaged customer base. This can be achieved through data-driven advertising campaigns, collaborations with influencers, showcasing user-generated content, and delivering personalized recommendations and offers. Such efforts will effectively communicate the cost savings, convenience, and community aspects of an annual membership, making it more appealing and relevant to casual riders. Continued analysis and optimization of user engagement and retention strategies will further enhance Cyclistic's ability to attract and convert casual riders into valued members.

--------------------------------------

### **Rideable Trends**

![6 1 Rideable Type Trends Chart](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/42cf7774-b7ea-4000-a197-319836b7c1cd)

#### **Summary of Rideable Trends**
The analysis of "**Rideable Trends**" offers valuable insights into the preferences and behaviors of Cyclistic's diverse user base, encompassing both casual and member users. By examining the demand for specific bike types (classic_bikes, docked_bikes, and electric_bikes) the aim is to uncover the underlying motivations guiding users' choices. This analysis not only highlights the most popular and least preferred bike types among both user groups but also provides clarity on their priorities, whether it be convenience, comfort, or performance. Through a comparative study of rideable type preferences between casual and member users, potential disparities in their needs and usage patterns are discerned. As this analysis marks the culmination of the series, it presents significant findings:
+ **Casual User Behavior**: Casual users demonstrate clear preferences when selecting bikes for their rides. Electric bikes emerge as the top choice, constituting 54.7% of their overall usage. This substantial preference underscores the appeal of convenience and ease of use offered by electric bikes. It suggests that casual users find these bikes particularly suitable for leisure or recreational rides, as they provide a seamless and effortless riding experience. Following closely behind, classic bikes rank as the second most favored option among casual users, representing 42.0% of their usage. This indicates that a portion of casual users still relish the traditional bike-riding experience or opt for a more physically engaging leisure pursuit. It implies a preference for a conventional biking experience or a desire for increased physical activity during leisure time. Conversely, docked bikes exhibit the lowest usage among casual users, with a mere 3.3% of their usage. This trend suggests that casual users prioritize flexibility and the freedom to conclude their rides at their desired destinations, rather than being constrained by docking stations. Casual users predominantly favor electric bikes due to their convenience and reduced physical exertion. However, the substantial usage of classic bikes indicates that some users still cherish traditional biking or seek more active leisure activities. The limited uptake of docked bikes underscores casual users' emphasis on flexibility and the ability to conclude rides at their preferred spots.
+ **Member User Behavior**: Member users exhibit a relatively balanced preference between classic bikes and electric bikes, with 49.9% of their overall usage on classic bikes and 50.1% on electric bikes. This indicates that both options effectively cater to their commuting or transportation needs. The popularity of electric bikes among member users suggests a desire for a more efficient and less physically demanding commuting experience, potentially reducing travel time and exertion. Simultaneously, the high usage of classic bikes indicates possible factors such as cost-effectiveness, environmental consciousness, or a preference for traditional bike-riding experiences. Member users may value the cost savings, and sustainability, or enjoy the experience of riding a traditional bike. Similar to casual users, member users also demonstrate a low preference for docked bikes, likely due to the added inconvenience of returning the bike to a docking station. This preference aligns with their need for flexibility and convenience in their bike usage. Overall, member users exhibit a balanced preference between classic bikes and electric bikes, emphasizing their consideration of efficiency, cost-effectiveness, and the desire for a convenient commuting or transportation experience.

#### **Key Questions**:
1. **How do annual members and casual riders use Cyclistic bikes differently?**
   - Casual users predominantly gravitate towards electric bikes due to their convenience and ease of use, particularly for leisure or recreational rides.
   - On the other hand, annual members exhibit a more balanced preference, utilizing both electric and classic bikes. Electric bikes are often chosen for commuting due to their efficiency, while classic bikes are favored for their cost-effectiveness and environmental benefits.
2. **Why would casual riders buy Cyclistic annual memberships?**
   - An annual membership offers cost savings compared to paying per ride, especially for frequent users who engage in leisure or recreational bike rides.
   - With an annual membership, casual riders can enjoy the convenience of accessing bikes without the need to pay for each ride, seamlessly incorporating bike rides into their routine.
   - As casual riders become more familiar with the bike-sharing service, they may consider transitioning to using Cyclistic bikes for commuting purposes, making an annual membership more practical.
3. **How can Cyclistic use digital media to influence casual riders to become members?**
   - Launch data-driven advertising campaigns on social media and relevant websites to highlight the benefits of an annual membership, emphasizing cost savings, convenience, and the availability of electric bikes for leisure rides.
   - Promote user-generated content that showcases the enjoyable experiences of casual riders, regardless of whether they use electric or classic bikes for leisure or recreation, fostering a sense of community.
   - Collaborate with influencers or local personalities whose values align with the brand to promote the leisure and recreational benefits of using Cyclistic bikes, particularly electric bikes.
   - Utilize data on casual riders' usage patterns and preferences to provide personalized recommendations and offers for an annual membership, tailoring these offers based on their preferred bike types to make the membership more relevant and appealing.

By analyzing the rideable type trend data and conducting a detailed analysis, we can gain a deep understanding of user preferences, operational considerations, and potential areas for product development or marketing strategies. This analysis can guide us in crafting effective strategies to convert casual riders into annual members, highlighting the cost savings of an annual membership, promoting the convenience of unrestricted bike access, and capitalizing on the popularity of electric bikes. By leveraging digital media, Cyclistic can influence casual riders by showcasing the benefits of an annual membership, fostering a sense of community, and providing personalized offers based on their preferences. These strategies will contribute to the conversion of casual riders into long-term, engaged members.

### **Cyclistic Bike-Share Dashboard**
Welcome to the Cyclistic Bike-Share Dashboard, the ultimate destination for unraveling user behavior and discovering trends. This comprehensive hub offers insightful analysis across various dimensions, including user types, usage patterns, and rideable preferences. Gain invaluable insights to optimize services, enhance user experiences, and drive long-term engagement. Get ready to explore a world of bike-sharing possibilities!

![Dashboard](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/114cf143-f290-4bae-9c17-790143560a74)

### **Cyclistic Bike-Share Program Analysis Summary**
This analysis delves into user behavior, preferences, and trends across various dimensions, including user types, hourly usage, weekly engagement, monthly dynamics, quarterly fluctuations, and rideable preferences.

+ **User Segmentation:** Cyclistic's user base primarily consists of two segments: casual users (35%) and member users (65%). Casual users tend to prefer longer rides for leisure, while member users prioritize shorter rides for commuting or routine transportation needs.
+ **Hourly Usage Trends:** Hourly trends indicate that casual users exhibit diverse usage patterns throughout the day, with peaks in the late morning to early afternoon hours, reflecting leisurely exploration. Member users maintain consistent and higher activity levels, particularly during typical commuting hours.
+ **Weekly Engagement Patterns:** Both user types experience peaks in bike usage during weekdays, with casual users showing higher engagement on weekends, possibly for leisurely rides. Member users exhibit consistent usage patterns throughout the week, reflecting reliance on Cyclistic bikes for regular commuting or transportation.
+ **Monthly Dynamics:** Casual users show peak usage during warmer months, with longer average ride lengths and distances compared to member users, who maintain consistent usage throughout the year. Member users prioritize efficiency and shorter rides, with peak usage observed slightly later in the summer months.
+ **Quarterly Fluctuations:** Analyzing quarterly trends, casual users demonstrate pronounced seasonal peaks during warmer months, reflecting a preference for outdoor leisure activities. Member users exhibit more consistent usage, aligning with commuting needs and transportation purposes throughout the year.
+ **Rideable Preferences:** Regarding rideable preferences, casual users favor electric bikes for leisurely rides, while member users show balanced usage between classic and electric bikes, emphasizing efficiency and convenience.

These insights provide valuable information for Cyclistic to optimize its services, enhance user experiences, and tailor marketing strategies. Furthermore, there's an opportunity to convert casual users into member users by emphasizing the benefits of membership and offering promotional incentives. Converting casual users into member users not only increases the user base but also fosters stronger customer loyalty and engagement, contributing to the sustainability and growth of the bike-share program.

### **Key Questions and Summarized Key Answers**
1. **How do annual members and casual riders use Cyclistic bikes differently?**
	- Across all analyzed trends, it's evident that annual members and casual riders exhibit distinct usage patterns. Annual members primarily opt for shorter, purposeful rides, often for commuting or regular transportation, while casual riders engage in longer and more exploratory rides, reflecting a preference for recreational or leisurely biking experiences. This distinction holds true across various timeframes, including hourly, weekly, monthly, and quarterly trends. Additionally, casual riders tend to choose electric bikes for their convenience and ease of use. Recognizing these differences in usage patterns is crucial for tailoring effective marketing strategies to target each group.
2. **Why would casual riders buy Cyclistic annual memberships?**
	- The motivations behind casual riders purchasing Cyclistic annual memberships can be attributed to several factors identified across all trends. Key drivers include cost savings compared to paying per ride, the convenience of accessing bikes without individual payments, and the flexibility to seamlessly incorporate biking into their routine. Promotional offers, discounts, and extended rental times for first-time members serve as incentives for casual riders to opt for annual memberships. As casual riders become more acquainted with the service and its benefits, particularly if they frequently engage in leisure or recreational biking activities, they may transition to annual memberships. Highlighting these benefits and offering attractive incentives can effectively persuade casual riders to consider becoming members.
3. **How can Cyclisitc use digital media to influence casual riders to become members?**
	- Leveraging digital media platforms presents a potent strategy for Cyclistic to entice casual riders into becoming members. Through targeted advertising campaigns spotlighting the advantages of annual memberships, Cyclistic can captivate the interest of casual riders. Tailoring these campaigns to address the specific needs and preferences of casual riders, such as emphasizing cost savings, convenience, and bike variety, is crucial. Collaborating with influencers or local figures who resonate with Cyclistic's ethos and can showcase the recreational appeal of using Cyclistic bikes, particularly electric ones, can wield significant influence. User-generated content and personalized promotions contribute to fostering a sense of community and inspiring casual riders to explore membership options. Moreover, exclusive limited-time promotions, discounts, or referral programs offered solely through digital channels create a sense of urgency, motivating casual riders to transition toward membership.
	- In summary, by comprehending the unique usage patterns of annual members and casual riders, highlighting the benefits of annual memberships, and adeptly utilizing digital media platforms, Cyclistic can effectively sway casual riders towards membership. Tailored marketing strategies, influencer collaborations, user-generated content, and enticing incentives constitute pivotal elements in capturing the attention and interest of casual riders.

### Key Tasks
- [x]  Determine the best way to share your findings.
- [x]  Create effective data visualizations.
- [x]  Present your findings.
- [x]  Ensure your work is accessible.

### Deliverable 
- [x]  Supporting visualizations and key findings.

## 🎭 The 'Act' Phase

### **Top 3 Recommendation**
1. **Targeted Digital Advertising**: Utilize digital advertising platforms such as Google Ads, social media ads, and programmatic advertising to target casual users with personalized messages promoting the benefits of membership. Use demographic and behavioral data to target specific audiences who are likely to be interested in becoming members. This will help increase the visibility of Cyclistic's membership program to the right users at the right time.
2. **Remarketing Campaigns**: Implement remarketing campaigns to re-engage casual users who have previously interacted with Cyclistic's website or app. Show them tailored ads highlighting the advantages of membership and any ongoing promotions or incentives. Utilize dynamic remarketing to display personalized offers based on the user's previous interactions, such as abandoned registration forms or browsing specific membership-related pages.
3. **Engaging Content Marketing**: Develop compelling content that showcases the advantages of becoming a member. Create blog posts, videos, or infographics that highlight the convenience, cost savings, and unique features of Cyclistic's membership program. Share member success stories, tips for maximizing membership benefits, and any exclusive events or activities available to members. Promote this content through various digital channels to drive awareness and engagement.

### **Optional Recommendation**
+ **Influencer Partnerships**: Collaborate with influential individuals in the cycling or fitness community to promote Cyclistic's membership program. Identify influencers who align with Cyclistic's values and target audience, and work with them to create sponsored content or social media campaigns that highlight the benefits and experiences of being a member. This can help generate buzz, and credibility, and attract the attention of casual users.
+ **Social Media Engagement**: Actively engage with casual users on social media platforms to encourage them to convert into members. Respond to comments, direct messages, and inquiries in a timely manner. Share user-generated content that highlights the positive experiences of Cyclistic's members. Encourage casual users to share their own experiences and tag Cyclistic, further increasing the visibility and desirability of membership.
+ **Email Marketing Automation**: Utilize email marketing automation to nurture casual users and guide them toward membership conversion. Develop a series of personalized emails that provide valuable information about the benefits of becoming a member, success stories, and limited-time offers. Segment the email list based on user behavior and engagement levels to deliver relevant content and incentives that encourage conversion.

### **Conclusion**
Drawing insights from our comprehensive analysis of user behavior, trends, and preferences, Cyclistic has gained valuable perspectives to drive strategic decision-making and elevate our marketing initiatives. Here are the key takeaways from our analysis:
1. **User Segmentation**: We have identified two distinct user segments - casual and member users - each with their own unique traits and preferences. Understanding these segments will help us tailor our strategies to effectively target and engage with each group.
2. **Usage Patterns**: By examining usage patterns, we have uncovered valuable insights such as peak hours, preferred rideable types, and popular locations. This information allows us to optimize resource allocation and enhance user experiences by ensuring availability during high-demand periods and locations.
3. **Conversion Opportunities**: Our analysis has highlighted potential strategies to convert casual riders into committed, long-term members. By understanding the factors that differentiate the two groups, we can develop targeted initiatives to drive conversions and foster loyalty.
4. **Marketing Optimization**: The insights gained from user preferences and behaviors provide a solid foundation for optimizing our marketing strategies. By tailoring messaging, promotions, and incentives based on user segments, we can increase engagement and foster stronger loyalty among our users.

To further improve our understanding and drive continuous improvement, we recommend the following actions:
1. **User Surveys**: Conduct qualitative surveys or interviews to gather deeper insights into user experiences, satisfaction levels, and suggestions for improvement. This will provide valuable qualitative data to inform our decision-making and identify areas for enhancement.
2. **Pricing Analysis**: Evaluate the impact of our pricing plans on user behavior and conversion rates. By analyzing the relationship between pricing, usage patterns, and membership conversions, we can refine our pricing strategies to attract and retain more members.
3. **Competitive Analysis**: Conduct comparative assessments with our industry peers to identify areas for differentiation and innovation. Understanding our competitor's strengths and weaknesses will enable us to refine our offerings and stay ahead in the market.
4. **A/B Testing**: Implement A/B testing methodologies to measure the effectiveness of different marketing strategies, promotions, and user experiences. This experimentation will provide valuable insights into what resonates best with our users and guide future marketing efforts.

By prioritizing these recommendations and leveraging the insights gained from our analysis, we can refine our services, enhance user experiences, and foster sustained engagement with our users.

### Key Tasks
- [x]  Create your portfolio.
- [x]  Add your case study.
- [x]  Practice presenting your case study to a friend or family member.

### Deliverable 
- [x]  Your top three recommendations are based on your analysis.

## ℹ️ Source Citation
+ [`Website`](https://divvybikes.com/)
  - [`Divvy Data`](https://divvybikes.com/system-data)
  - [`Annual Membership`](https://help.divvybikes.com/hc/en-us/articles/360033483191-Annual-Membership)
  - [`Purchasing a Day Pass`](https://help.divvybikes.com/hc/en-us/articles/360033483151-Purchasing-a-Day-Pass)
  - [`Take a Single ride`](https://help.divvybikes.com/hc/en-us/articles/360033121032-Taking-a-Single-ride)
  - [`Meet the Bikes`](https://divvybikes.com/how-it-works/meet-the-bikes)
  - [`Pricing`](https://divvybikes.com/pricing)
  - [`What is a station? A dock? A kiosk?`](https://help.divvybikes.com/hc/en-us/articles/360033124372-What-is-a-station-A-dock-A-kiosk)
+ [`License`](https://divvybikes.com/data-license-agreement)
+ [`Location`](https://en.wikipedia.org/wiki/Module:Location_map/data/United_States_Chicago)
