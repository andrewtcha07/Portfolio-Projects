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

![1 1 User Type Distribution Chart](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/5cee319c-6729-4e3a-b8de-d47552ecda91)
![1  User Type Distribution](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/c8f63938-6459-4a9f-9c9f-cca604fb7427)
+ Based on the data presented, it's evident that the platform has facilitated a significant number of rides, totaling **5,251,702** rides across all user types.
+ Casual riders account for approximately **35%** at **1,834,314** of the total rides, indicating a notable portion of one-time or infrequent users.
+ In contrast, annual members make up the majority, comprising about **65%** at **3,417,388** of the total rides.

![1 3 Average Ride Length by User Type Chart](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/5ab3bf73-c6cf-498c-aebf-a6918b429e29)
![1 2 Ride Length Statistic Summary](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/8a9458b3-fc75-4e16-a5df-b2f1a07febb2)
+ This chart illustrated a notable difference in average ride duration between casual and member users.
+ Casual users, on average, tend to take longer rides, with an average ride length of approximately **19.75 minutes**, suggesting a preference for leisurely or extended biking activities.
+ In contrast, member users exhibit shorter average ride durations, approximately **12.15 minutes**, indicative of more useful or short-distance travel patterns, such as commuting or running errands within the city.

![1 5 Average Ride Distance by User Type Chart](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/28db9763-744a-44d9-a658-ec34c695ebf4)
![1 4 Ride Distance Statistic Summary](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/740a39e0-d6fd-4451-9c48-577eeb7c9263)
+ The analysis reveals a slight difference between casual and member users.
+ Casual users, on average, cover a distance of approximately 1.44 miles per ride, whereas member users travel slightly shorter distances, averaging around 1.37 miles per ride.
+ While the disparity is minimal, it suggests that casual users may be more inclined to take slightly longer rides, perhaps indicating a preference for leisurely biking or exploring new areas. Conversely, member users tend to undertake shorter, more focused trips, likely for commuting or routine travel purposes.

--------------------------------------
#### **Summary of User Type Trends**
+ The analysis of user type trends provides a comprehensive understanding of the dynamics within Cyclistic's user community. The analysis indicates:
   * **Casual Users**: Approximately **35%** of Cyclistic's user base consists of casual users. They tend to prefer longer rides, resulting in slightly longer average ride durations and distances. Casual users typically utilize Cyclistic bikes for recreational purposes, city exploration, or leisurely rides. Their usage patterns, preferences, and motivations may differ from those of members.
   * **Member Users**: Around **65%** of Cyclistic's users are members who exhibit consistent usage patterns, characterized by shorter average ride durations and distances. Members are likely regular users of the Cyclistic service, often employing it for daily commuting or routine transportation needs. Their approach to using Cyclistic bikes is more purposeful and focused.
#### **Key Questions**:
1. **How do annual members and casual riders use Cyclistic bikes differently?**
   * Casual riders tend to have longer average ride durations and distances compared to members.
   * Members typically focus on shorter rides, likely for commuting or regular transportation purposes.
2. **Why would casual riders buy Cyclistic annual memberships?**
   * Casual riders may consider purchasing annual memberships if they find value in using Cyclistic bikes regularly for longer periods.
   * An annual membership could offer cost savings and convenience for casual riders who anticipate frequent usage throughout the year.
3. **How can Cyclistic use digital media to influence casual riders to become members?**
    * Cyclistic can utilize digital media platforms to highlight the benefits of membership, such as cost savings, access to additional features, or exclusive perks.
    * Targeted advertising campaigns can emphasize the convenience and value of an annual membership, tailored to the specific needs and preferences of casual riders.
    * Offering incentives, discounts, or limited-time promotions through digital channels can incentivize casual riders to explore membership options and experience the associated benefits firsthand.
+ The user-type trend data provides valuable insights into the behaviors, preferences, and habits of casual users and members. Understanding these differences enables Cyclistic to optimize its offerings, tailor marketing strategies, and enhance the user experience for both user types. By recognizing the unique needs of casual users and implementing targeted approaches through digital media, Cyclistic can encourage casual riders to become members, leading to increased engagement, loyalty, and long-term business growth. Further analysis of ride frequency, duration, and distances across different temporal and rideable trends can offer deeper insights into user engagement patterns and perceived values.

### **Hourly Trends**

![2 1 Hourly User Overview Chart](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/f29db0ce-e457-4c50-bf5a-d1285f3251c5)
![2  Hourly Total Count](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/4cfb93fd-81ca-4080-91e0-bb5b37d579ce)
+ This chart reveals distinct patterns in bike usage between casual and member users throughout the day.
+ Casual users demonstrate a notable range of ride counts, with the lowest recorded at 4 AM (**5,355 rides**) and the highest at 5 PM (**140,876 rides**), potentially indicating utilization for early morning recreational activities or leisurely commutes, peaking again during evening hours.
+ Member users consistently exhibit higher ride counts across all hours, with the lowest recorded at 3 AM (**7,306 rides**) and the highest at 5 PM (**363,705 rides**), suggesting a reliance on Cyclistic bikes for daily commuting or routine travel purposes.
+ Peaks in member user activity coincide with typical morning and evening commuting hours, while casual users show more dispersed patterns, peaking during morning recreational periods and evening leisure rides.
+ A substantial difference in activity levels between casual and member users during peak hours, particularly during the morning commute, underscores the program's popularity among regular commuters and the impact of annual memberships in fostering consistent bike usage.

![2 3 Hourly Ride Length Average Chart](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/d309b650-7751-4822-85f8-8f3153bf7e48)
![2 2 Hourly Ride Length Average](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/b7e2d824-b558-45bf-b687-54882087b031)
+ The analysis reveals distinct patterns in ride duration between casual and member users throughout the day.
+ Casual users display varying ride lengths, with the shortest average ride occurring at 5 AM (**12.88 minutes**) and the longest at 11 AM (**23.92 minutes**). This suggests that casual users tend to engage in longer rides (17-24 minutes) during mid-morning to early afternoon hours, indicating a preference for leisurely or exploratory trips.
+ In contrast, member users consistently maintain shorter average ride lengths (11-13 minutes). The shortest recorded average ride for members is at 5 AM (**9.99 minutes**), while the longest is at 5 PM (**12.97 minutes**). Member users' ride lengths remain relatively consistent throughout the day, with slightly longer rides during peak commuting times.
+ These findings suggest potential differences in user behavior and motivations. Casual users may be more inclined towards longer, recreational rides, while member users tend to opt for shorter, more utilitarian trips.

![2 5 Hourly Ride Distance Average Chart](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/1f8fbd51-302c-41f0-af6d-bbe45867ad0b)
![2 4 Hourly Ride Distance Average](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/6dd7200d-cbb5-4026-b8e8-6396ba6cec03)
+ The chart offers valuable insights into the typical duration of bike rides taken by both casual and member users throughout the day.
+ Casual users experienced their shortest average ride duration at 12 AM (**1.28 miles**) and their longest at 11 AM (**1.53 miles**), showing fluctuating durations throughout the day, with a peak around midday.
+ On the other hand, member users maintained relatively consistent average ride durations, with the shortest at 12 PM (**1.27 miles**) and the longest at 5 PM (**1.45 miles**), showing minor fluctuations.
+ Casual users generally have slightly longer average ride durations compared to member users across most hours of the day, ranging from approximately 1.28 to 1.53 miles per hour, with peaks observed during the mid-morning to early afternoon hours.
+ In contrast, member users consistently maintain shorter average ride durations, typically ranging from approximately 1.27 to 1.45 miles per hour.
+ There's a slight increase in average ride duration during the early morning hours, followed by a decrease during the afternoon and evening hours, aligning with expectations for practical commuting purposes.
+ The highest average ride durations for both casual and member users are observed during different hours, suggesting varying usage patterns or preferences between the two user groups.
+ Despite this trend, both user groups demonstrate peak durations at different times, indicating diverse patterns or purposes of usage.

--------------------------------------
#### **Summary of Hourly Trends**
+ The analysis of hourly trends data reveals distinct utilization patterns among casual and member users throughout the day. While both user types exhibit peaks in usage during certain hours, variations in ride counts, average ride lengths, and durations provide valuable insights into user behavior and preferences. Several crucial observations can be recognized:
   * Casual Users: Casual riders exhibit diverse usage patterns, with varying ride volumes, distances, and durations throughout the day. They often engage in longer rides, indicating a more leisurely and exploratory approach to bike usage. Casual users may use the service for recreational purposes, sightseeing, or occasional transportation needs.
   * Member Users: Annual member users demonstrate more consistent and predictable usage patterns. They tend to have shorter ride durations, suggesting a more purposeful and efficient approach to bike usage. Member users are likely to use the service for regular commuting, daily transportation needs, or planned activities.
#### **Key Questions**
1. **How do annual members and casual riders use Cyclistic bikes differently?**
   * Annual members tend to use Cyclistic bikes consistently throughout the day for shorter, purposeful rides, likely for daily commuting or regular transportation needs.
   * Casual riders show more varied usage patterns, with longer and exploratory rides, potentially using the bikes for recreational purposes or city exploration.
2. **Why would casual riders buy Cyclistic annual memberships?**
   * Casual riders might consider purchasing annual memberships if they find value in using Cyclistic bikes regularly for their transportation needs, such as commuting to work or running errands.
   * Promotions highlighting the cost-saving benefits, convenience, and flexibility of annual memberships can incentivize casual riders to make the switch.
3. **How can Cyclistic use digital media to influence casual riders to become members?**
   * Cyclistic can leverage digital media by showcasing the benefits of annual memberships, such as cost savings, convenience, and access to a reliable transportation option.
   * Targeted advertisements and personalized offers can be used to engage casual riders and highlight the advantages of becoming a member.
   * Social media campaigns, influencer collaborations, and user testimonials can also be effective in showcasing the positive experiences of Cyclistic members.
+ By analyzing the hourly trends and understanding the habits of casual users and members, Cyclistic can tailor its marketing tactics to attract and retain both user groups. The data-driven approach allows for targeted promotions, personalized messaging, and an enhanced user experience, ultimately driving user engagement and membership conversions. Further analysis of trends is likely to unveil even more detailed insights into user behavior, enabling Cyclistic to refine its strategies and maximize its effectiveness in the market.

### **Weekly Trends**

![5 1 Weekly User Overview Chart](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/84c9cd0d-a1ef-4511-bcbd-b6760f2a902b)
![5  Weekly User Overview](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/3924e5d9-d4d0-411c-8f17-ecbf325b1f94)
+ The analysis reveals interesting trends in user counts for casual and member users throughout the week.
+ Casual users show higher numbers on weekends, with Saturday having a peak count of **363,139 users**, indicating a preference for weekend bike rides.
+ Monday has the lowest count for casual users at **208,486**, suggesting a decrease in casual user activity at the start of the week.
+ The data suggests that casual users prefer weekend usage, potentially for leisure or recreational bike rides, aligning with their higher counts on Saturdays.
+ Member users exhibit consistent usage patterns on weekdays, with Thursday recording the highest count of **551,430 users**, suggesting regular and focused usage for commuting or daily transportation needs.
+ Sunday has the lowest count for member users at **378,440**, indicating relatively lower activity among members on weekends.
+ Member users demonstrate regular and focused usage patterns, likely for commuting or daily transportation needs, as reflected in their consistent counts on weekdays.


![5 3 Weekly Ride Length Average Chart](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/4742cc3f-b53a-4291-8517-170d4de1b3b5)
![5 2 Weekly Ride Length Average](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/ac32155a-8809-4a29-a4e9-015dfe2b7530)

![5 5 Weekly Ride Distance Average Chart](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/ef63d912-4f64-4f31-8a85-dde7bc64f0fe)
![5 4 Weekly Ride Distance Average](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/0009f772-6d35-4094-b18a-522ecd82fc4c)

--------------------------------------
#### **Summary of Weekly Trends**

### **Monthly Trends**

![3 1 Monthly User Overview Chart](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/2f60ae82-0990-4c0d-98ee-b90f58b8ae81)
![3  Monthly User Overview](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/b6364053-7604-4119-ae7b-ae52b71fe6ac)

![3 3 Monthly Ride Length Average Chart](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/c4b86ad4-a710-4989-9171-2f4f11d0acf6)
![3 2 Monthly Ride Length Average](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/500016a9-133c-4f0b-b396-5543fdb23bf3)

![3 5 Monthly Ride Distance Average Chart](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/56264ee6-1999-4549-b257-3491c788cac0)
![3 4 Monthly Ride Distance Average](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/a23387e0-56a6-4290-9bdd-5d30668394b4)

--------------------------------------
#### **Summary of Monthly Trends**

### **Quarterly Trends**

![4 1 Quarterly User Overview Chart](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/b70d45d3-f1d6-4d4d-bdc2-a4d228fdf6f8)
![4  Quarterly User Overview](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/4adcd2b7-9ceb-4ac9-87f5-34eaca4fe0c0)

![4 3 Quarterly Ride Length Average Chart](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/b9adc9be-7237-48ec-9a5a-b21fbc9485fa)
![4 2 Quarterly Ride Length Average](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/8c665930-3bc5-48d2-abb0-208d6cf5f66b)

![4 5 Quarterly Ride Distance Average Chart](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/0eb3fadf-9cc3-4a66-bb28-ab90c3f446c4)
![4 4 Quarterly Ride Distance Average](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/0560680f-3b8c-405a-bcc0-b4190fecf809)

--------------------------------------
#### **Summary of Quarterly Trends**

### **Rideable Trends**

![6 1 Rideable Type Trends Chart](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/42cf7774-b7ea-4000-a197-319836b7c1cd)
![6  Rideable Type Trends](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/5b6196e0-b2d8-4fc6-91c1-341953573a3d)


--------------------------------------
#### **Summary of Rideable Trends**

![Dashboard](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/114cf143-f290-4bae-9c17-790143560a74)


### Key Tasks
- [x]  Aggregate your data so it’s useful and accessible.
- [x]  Organize and format your data.
- [x]  Perform calculations.
- [x]  Identify trends and relationships.

### Deliverable 
- [x]  A summary of your analysis.
