## 🔄 The 'Process' Phase

### Tools Used
![MicrosoftSQLServer](https://img.shields.io/badge/Microsoft%20SQL%20Server-CC2927?style=for-the-badge&logo=microsoft%20sql%20server&logoColor=white)
![Tableau](https://img.shields.io/badge/Tableau-E97627.svg?style=for-the-badge&logo=Tableau&logoColor=white)

+ **Microsoft SQL Server**: Chosen for its robust data management capabilities, scalability, and reliability in handling large datasets. SQL Server provides a comprehensive platform for database management, data warehousing, and business intelligence.
  - **Data Management**: SQL Server offers advanced features for storing, retrieving, and manipulating data, ensuring data integrity and security.
  - **Scalability**: SQL Server's scalability allows it to efficiently handle growing datasets and workloads, making it suitable for organizations of all sizes.
  - **Reliability**: With built-in features for data redundancy, backup, and recovery, SQL Server ensures the reliability and availability of critical data.
  - **Automatic Handling of Blank Values**: When importing data into Microsoft SQL Server, any blank or empty values are automatically replaced with NULLs, ensuring consistency and facilitating data analysis and management. This automatic handling helps maintain data integrity and enhances the usability of the database.
+ **Tableau**: Selected for its intuitive data visualization capabilities and ease of use in creating interactive dashboards and reports.
  - **Data Visualization**: Tableau offers a wide range of visualization options, allowing users to create compelling charts, graphs, and maps to explore and communicate insights from data.
  - **Interactivity**: Tableau's interactive features enable users to drill down into data, filter visualizations dynamically, and uncover hidden patterns or trends.
  - **Dashboard Creation**: With Tableau, the ability to easily design interactive dashboards that consolidate multiple visualizations into a single view, providing a holistic overview of key metrics.
  - **Integration**: Tableau seamlessly integrates with various data sources, including databases like Microsoft SQL Server.

### Create the Database Framework
+ Created the new database named **`bellabeatproject`**.
+ Created tables for each specified grouped CSV files into the new database.
+ Inserted and merged data from the specified grouped CSV files into the new tables.

#### Create the Database
```sql
create database bellabeatproject;
```

#### Table Creation and Data Insertion
+ **"daily_activity"** table
```sql
create table
    daily_activity (
        Id bigint
      , ActivityDate date
      , TotalSteps int
      , TotalDistance float
      , TrackerDistance float
      , LoggedActivitiesDistance float
      , VeryActiveDistance float
      , ModeratelyActiveDistance float
      , LightActiveDistance float
      , SedentaryActiveDistance float
      , VeryActiveMinutes smallint
      , FairlyActiveMinutes smallint
      , LightlyActiveMinutes smallint
      , SedentaryMinutes smallint
      , Calories smallint
    );
```

```sql
bulk insert daily_activity
from
    'D:\chaanlyst\Case Studies\Bellabeat-Case_Study\Data_Used\Fitbase Data 3.12.16-5.12.16\dailyActivity_merged.csv'
with
    (
        fieldterminator = ','
      , rowterminator = '\n'
      , firstrow = 2
      , format = 'csv'
    );

bulk insert daily_activity
from
    'D:\chaanlyst\Case Studies\Bellabeat-Case_Study\Data_Used\Fitbase Data 3.12.16-5.12.16\dailyActivity_merged2.csv'
with
    (
        fieldterminator = ','
      , rowterminator = '\n'
      , firstrow = 2
      , format = 'csv'
    );
```

`(457 rows affected)`

`(940 rows affected)`

+ **"heart_rate"** table
```sql
create table
    heart_rate (
        Id bigint
      , Time datetime
      , Value smallint
    );
```

```sql
bulk insert heart_rate
from
    'D:\chaanlyst\Case Studies\Bellabeat-Case_Study\Data_Used\Fitbase Data 3.12.16-5.12.16\heartrate_seconds_merged.csv'
with
    (
        fieldterminator = ','
      , rowterminator = '\n'
      , firstrow = 2
      , format = 'csv'
    );

bulk insert heart_rate
from
    'D:\chaanlyst\Case Studies\Bellabeat-Case_Study\Data_Used\Fitbase Data 3.12.16-5.12.16\heartrate_seconds_merged2.csv'
with
    (
        fieldterminator = ','
      , rowterminator = '\n'
      , firstrow = 2
      , format = 'csv'
    );
```

`(1154681 rows affected)`

`(2483658 rows affected)`

+ **"minute_calories"** table
```sql
create table
    minute_calories(
        Id bigint
      , ActivityMinute datetime
      , Calories float
    );
```

```sql
bulk insert minute_calories
from
    'D:\chaanlyst\Case Studies\Bellabeat-Case_Study\Data_Used\Fitbase Data 3.12.16-5.12.16\minuteCaloriesNarrow_merged.csv'
with
    (
        fieldterminator = ','
      , rowterminator = '\n'
      , firstrow = 2
      , format = 'csv'
    );

bulk insert minute_calories
from
    'D:\chaanlyst\Case Studies\Bellabeat-Case_Study\Data_Used\Fitbase Data 3.12.16-5.12.16\minuteCaloriesNarrow_merged2.csv'
with
    (
        fieldterminator = ','
      , rowterminator = '\n'
      , firstrow = 2
      , format = 'csv'
    );
```
`(1445040 rows affected)`

`(1325580 rows affected)`

+ **"minute_intensities"** table
```sql
create table
    minute_intensities (
        Id bigint
      , ActivityMinute datetime
      , Intensity tinyint
    );
```

```sql
bulk insert minute_intensities
from
    'D:\chaanlyst\Case Studies\Bellabeat-Case_Study\Data_Used\Fitbase Data 3.12.16-5.12.16\minuteIntensitiesNarrow_merged.csv'
with
    (
        fieldterminator = ','
      , rowterminator = '\n'
      , firstrow = 2
      , format = 'csv'
    );

bulk insert minute_intensities
from
    'D:\chaanlyst\Case Studies\Bellabeat-Case_Study\Data_Used\Fitbase Data 3.12.16-5.12.16\minuteIntensitiesNarrow_merged2.csv'
with
    (
        fieldterminator = ','
      , rowterminator = '\n'
      , firstrow = 2
      , format = 'csv'
    );
```

`(1445040 rows affected)`

`(1325580 rows affected)`

+  **"minute_mets"** table
```sql
create table
    minute_mets (
        Id bigint
      , ActivityMinute datetime
      , METS tinyint
    );
```

```sql
bulk insert minute_mets
from
    'D:\chaanlyst\Case Studies\Bellabeat-Case_Study\Data_Used\Fitbase Data 3.12.16-5.12.16\minuteMETsNarrow_merged.csv'
with
    (
        fieldterminator = ','
      , rowterminator = '\n'
      , firstrow = 2
      , format = 'csv'
    );

bulk insert minute_mets
from
    'D:\chaanlyst\Case Studies\Bellabeat-Case_Study\Data_Used\Fitbase Data 3.12.16-5.12.16\minuteMETsNarrow_merged2.csv'
with
    (
        fieldterminator = ','
      , rowterminator = '\n'
      , firstrow = 2
      , format = 'csv'
    );
```

`(1445040 rows affected)`

`(1325580 rows affected)`

+ **"minute_sleep"** table
```sql
create table
    minute_sleep (
        Id bigint
      , date datetime
      , value tinyint
      , logId bigint
    );
```

```sql
bulk insert minute_sleep
from
    'D:\chaanlyst\Case Studies\Bellabeat-Case_Study\Data_Used\Fitbase Data 3.12.16-5.12.16\minuteSleep_merged.csv'
with
    (
        fieldterminator = ','
      , rowterminator = '\n'
      , firstrow = 2
      , format = 'csv'
    );

bulk insert minute_sleep
from
    'D:\chaanlyst\Case Studies\Bellabeat-Case_Study\Data_Used\Fitbase Data 3.12.16-5.12.16\minuteSleep_merged2.csv'
with
    (
        fieldterminator = ','
      , rowterminator = '\n'
      , firstrow = 2
      , format = 'csv'
    );
```

`(198559 rows affected)`

`(188521 rows affected)`

+ **"minute_steps"** table
```sql
create table
    minute_steps (
        Id bigint
      , ActivityMinute datetime
      , Steps smallint
    );
```

```sql
bulk insert minute_steps
from
    'D:\chaanlyst\Case Studies\Bellabeat-Case_Study\Data_Used\Fitbase Data 3.12.16-5.12.16\minuteStepsNarrow_merged.csv'
with
    (
        fieldterminator = ','
      , rowterminator = '\n'
      , firstrow = 2
      , format = 'csv'
    );

bulk insert minute_steps
from
    'D:\chaanlyst\Case Studies\Bellabeat-Case_Study\Data_Used\Fitbase Data 3.12.16-5.12.16\minuteStepsNarrow_merged2.csv'
with
    (
        fieldterminator = ','
      , rowterminator = '\n'
      , firstrow = 2
      , format = 'csv'
    );
```

`(1445040 rows affected)`

`(1325580 rows affected)`

+ **"weight_logs"** table
```sql
create table
    weight_logs (
        Id bigint
      , date datetime
      , WeightKg float
      , WeightPounds float
      , Fat float
      , BMI float
      , IsManualReport text
      , LogId bigint
    );
```

```sql
bulk insert weight_logs
from
    'D:\chaanlyst\Case Studies\Bellabeat-Case_Study\Data_Used\Fitbase Data 3.12.16-5.12.16\weightLogInfo_merged.csv'
with
    (
        fieldterminator = ','
      , rowterminator = '\n'
      , firstrow = 2
      , format = 'csv'
    );

bulk insert weight_logs
from
    'D:\chaanlyst\Case Studies\Bellabeat-Case_Study\Data_Used\Fitbase Data 3.12.16-5.12.16\weightLogInfo_merged2.csv'
with
    (
        fieldterminator = ','
      , rowterminator = '\n'
      , firstrow = 2
      , format = 'csv'
    );
```

`(33 rows affected)`

`(67 rows affected)`

### Summary of Creation of Database
+ A new database named `bellabeatproject` was created.
+ Each CSV file grouping underwent analysis to determine the most appropriate table structure for accommodating the specific data.
+ Data from multiple CSV files was merged to bring together related information and then inserted into the new tables.

### Initial Data Exploration
+ Reviewed the schema of each table.
+ Determined the total number of rows and columns in each individual table.
+ Inspected distinct values in each table.

#### Table Schema Reviews
> Querying table schema details for each individual tables. 

+ **"daily_activity"** schema
```sql
select
    column_name
  , data_type
  , character_maximum_length
  , is_nullable
  , column_default
from
    information_schema.columns
where
    table_name = 'daily_activity'
    and table_schema = 'dbo'
    and table_catalog = 'bellabeatproject';
```

<details>
    <summary><b>Field Details</b></summary>

| column_name              | data_type | character_maximum_length | is_nullable | column_default |
|--------------------------|-----------|--------------------------|-------------|----------------|
| Id                       | bigint    | NULL                     | YES         | NULL           |
| ActivityDate             | date      | NULL                     | YES         | NULL           |
| TotalSteps               | int       | NULL                     | YES         | NULL           |
| TotalDistance            | float     | NULL                     | YES         | NULL           |
| TrackerDistance          | float     | NULL                     | YES         | NULL           |
| LoggedActivitiesDistance | float     | NULL                     | YES         | NULL           |
| VeryActiveDistance       | float     | NULL                     | YES         | NULL           |
| ModeratelyActiveDistance | float     | NULL                     | YES         | NULL           |
| LightActiveDistance      | float     | NULL                     | YES         | NULL           |
| SedentaryActiveDistance  | float     | NULL                     | YES         | NULL           |
| VeryActiveMinutes        | smallint  | NULL                     | YES         | NULL           |
| FairlyActiveMinutes      | smallint  | NULL                     | YES         | NULL           |
| LightlyActiveMinutes     | smallint  | NULL                     | YES         | NULL           |
| SedentaryMinutes         | smallint  | NULL                     | YES         | NULL           |
| Calories                 | smallint  | NULL                     | YES         | NULL           |

</details>

+ **"heart_rate"** schema
```sql
select
    column_name
  , data_type
  , character_maximum_length
  , is_nullable
  , column_default
from
    information_schema.columns
where
    table_name = 'heart_rate'
    and table_schema = 'dbo'
    and table_catalog = 'bellabeatproject';
```

<details>
    <summary><b>Field Details</b></summary>

| column_name | data_type | character_maximum_length | is_nullable | column_default |
|-------------|-----------|--------------------------|-------------|----------------|
| Id          | bigint    | NULL                     | YES         | NULL           |
| Time        | datetime  | NULL                     | YES         | NULL           |
| Value       | smallint  | NULL                     | YES         | NULL           |

</details>

+ **"minute_calories"** schema
```sql
select
    column_name
  , data_type
  , character_maximum_length
  , is_nullable
  , column_default
from
    information_schema.columns
where
    table_name = 'minute_calories'
    and table_schema = 'dbo'
    and table_catalog = 'bellabeatproject';
```

<details>
    <summary><b>Field Details</b></summary>

| column_name    | data_type | character_maximum_length | is_nullable | column_default |
|----------------|-----------|--------------------------|-------------|----------------|
| Id             | bigint    | NULL                     | YES         | NULL           |
| ActivityMinute | datetime  | NULL                     | YES         | NULL           |
| Calories       | float     | NULL                     | YES         | NULL           |

</details>

+ **"minute_intensities"** schema
```sql
select
    column_name
  , data_type
  , character_maximum_length
  , is_nullable
  , column_default
from
    information_schema.columns
where
    table_name = 'minute_intensities'
    and table_schema = 'dbo'
    and table_catalog = 'bellabeatproject';
```

<details>
    <summary><b>Field Details</b></summary>

| column_name    | data_type | character_maximum_length | is_nullable | column_default |
|----------------|-----------|--------------------------|-------------|----------------|
| Id             | bigint    | NULL                     | YES         | NULL           |
| ActivityMinute | datetime  | NULL                     | YES         | NULL           |
| Intensity      | tinyint   | NULL                     | YES         | NULL           |

</details>

+ **"minute_mets"** schema
```sql
select
    column_name
  , data_type
  , character_maximum_length
  , is_nullable
  , column_default
from
    information_schema.columns
where
    table_name = 'minute_mets'
    and table_schema = 'dbo'
    and table_catalog = 'bellabeatproject';
```

<details>
    <summary><b>Field Details</b></summary>

| column_name    | data_type | character_maximum_length | is_nullable | column_default |
|----------------|-----------|--------------------------|-------------|----------------|
| Id             | bigint    | NULL                     | YES         | NULL           |
| ActivityMinute | datetime  | NULL                     | YES         | NULL           |
| METS           | tinyint   | NULL                     | YES         | NULL           |

</details>

+ **"minute_sleep"** schema
```sql
select
    column_name
  , data_type
  , character_maximum_length
  , is_nullable
  , column_default
from
    information_schema.columns
where
    table_name = 'minute_sleep'
    and table_schema = 'dbo'
    and table_catalog = 'bellabeatproject';
```

<details>
    <summary><b>Field Details</b></summary>

| column_name | data_type | character_maximum_length | is_nullable | column_default |
|-------------|-----------|--------------------------|-------------|----------------|
| Id          | bigint    | NULL                     | YES         | NULL           |
| date        | datetime  | NULL                     | YES         | NULL           |
| value       | tinyint   | NULL                     | YES         | NULL           |
| logId       | bigint    | NULL                     | YES         | NULL           |

</details>

+ **"minute_steps"** schema
```sql
select
    column_name
  , data_type
  , character_maximum_length
  , is_nullable
  , column_default
from
    information_schema.columns
where
    table_name = 'minute_steps'
    and table_schema = 'dbo'
    and table_catalog = 'bellabeatproject';
```

<details>
    <summary><b>Field Details</b></summary>

| column_name    | data_type | character_maximum_length | is_nullable | column_default |
|----------------|-----------|--------------------------|-------------|----------------|
| Id             | bigint    | NULL                     | YES         | NULL           |
| ActivityMinute | datetime  | NULL                     | YES         | NULL           |
| Steps          | smallint  | NULL                     | YES         | NULL           |

</details>

+ **"weight_logs"** schema
```sql
select
    column_name
  , data_type
  , character_maximum_length
  , is_nullable
  , column_default
from
    information_schema.columns
where
    table_name = 'weight_logs'
    and table_schema = 'dbo'
    and table_catalog = 'bellabeatproject';
```

<details>
    <summary><b>Field Details</b></summary>

| column_name    | data_type | character_maximum_length | is_nullable | column_default |
|----------------|-----------|--------------------------|-------------|----------------|
| Id             | bigint    | NULL                     | YES         | NULL           |
| date           | datetime  | NULL                     | YES         | NULL           |
| WeightKg       | float     | NULL                     | YES         | NULL           |
| WeightPounds   | float     | NULL                     | YES         | NULL           |
| Fat            | float     | NULL                     | YES         | NULL           |
| BMI            | float     | NULL                     | YES         | NULL           |
| IsManualReport | text      | 2147483647               | YES         | NULL           |
| LogId          | bigint    | NULL                     | YES         | NULL           |

</details>

#### Complete Size Inspection
> Fetching information on row and column quantities for each individual tables.
```sql
select
    t.name as table_name
  , p.rows as row_counts
  , c.column_count
from
    sys.tables t
    inner join sys.partitions p on t.object_id = p.object_id
    inner join (
        select
            table_name
          , table_schema
          , count(*) as column_count
        from
            information_schema.columns
        group by
            table_name
          , table_schema
    ) c on t.name = c.table_name
    and schema_name(t.schema_id) = c.table_schema
where
    t.is_ms_shipped = 0
    and p.index_id in (1, 0)
group by
    t.name
  , p.rows
  , c.column_count;
```

<details>
    <summary><b>Field Details</b></summary>

| table_name         | row_counts | column_count |
|--------------------|------------|--------------|
| daily_activity     | 1397       | 15           |
| heart_rate         | 3638339    | 3            |
| minute_calories    | 2770620    | 3            |
| minute_intensities | 2770620    | 3            |
| minute_mets        | 2770620    | 3            |
| minute_sleep       | 387080     | 4            |
| minute_steps       | 2770620    | 3            |
| weight_logs        | 100        | 8            |

</details>

#### Distinct Values Inspection
> Analyzing the total number of distinct values in each individual table column **Id**.
```sql
select
    'daily_activity' as table_name
  , count(distinct Id) as distinct_id_count
from
    daily_activity
union all
select
    'heart_rate' as table_name
  , count(distinct Id) as distinct_id_count
from
    heart_rate
union all
select
    'minute_calories' as table_name
  , count(distinct Id) as distinct_id_count
from
    minute_calories
union all
select
    'minute_intensities' as table_name
  , count(distinct Id) as distinct_id_count
from
    minute_intensities
union all
select
    'minute_mets' as table_name
  , count(distinct Id) as distinct_id_count
from
    minute_mets
union all
select
    'minute_sleep' as table_name
  , count(distinct Id) as distinct_id_count
from
    minute_sleep
union all
select
    'minute_steps' as table_name
  , count(distinct Id) as distinct_id_count
from
    minute_steps
union all
select
    'weight_logs' as table_name
  , count(distinct Id) as distinct_id_count
from
    weight_logs;
```

<details>
    <summary><b>Field Details</b></summary>

| table_name         | distinct_id_count |
|--------------------|-------------------|
| daily_activity     | 35                |
| heart_rate         | 15                |
| minute_calories    | 35                |
| minute_intensities | 35                |
| minute_mets        | 35                |
| minute_sleep       | 25                |
| minute_steps       | 35                |
| weight_logs        | 13                |

</details>

#### NULL Values Inspection
> Analyzing the total number of NULL values in each individual table.

+  **"daily_activity"**
```sql
select
    sum(
        case
            when Id is null then 1
            else 0
        end + case
            when ActivityDate is null then 1
            else 0
        end + case
            when TotalSteps is null then 1
            else 0
        end + case
            when TotalDistance is null then 1
            else 0
        end + case
            when TrackerDistance is null then 1
            else 0
        end + case
            when LoggedActivitiesDistance is null then 1
            else 0
        end + case
            when VeryActiveDistance is null then 1
            else 0
        end + case
            when ModeratelyActiveDistance is null then 1
            else 0
        end + case
            when LightActiveDistance is null then 1
            else 0
        end + case
            when SedentaryActiveDistance is null then 1
            else 0
        end + case
            when VeryActiveMinutes is null then 1
            else 0
        end + case
            when FairlyActiveMinutes is null then 1
            else 0
        end + case
            when LightlyActiveMinutes is null then 1
            else 0
        end + case
            when SedentaryMinutes is null then 1
            else 0
        end + case
            when Calories is null then 1
            else 0
        end
    ) as total_null
from
    daily_activity;
```

<details>
    <summary><b>Field Details</b></summary>

| total_null |
|------------|
| 0          |

</details>

+ **"heart_rate"**
```sql
select
    sum(
        case
            when Id is null then 1
            else 0
        end + case
            when time is null then 1
            else 0
        end + case
            when value is null then 1
            else 0
        end
    ) as total_null
from
    heart_rate;
```

<details>
    <summary><b>Field Details</b></summary>

| total_null |
|------------|
| 0          |

</details>

+ **"minute_calories"**
```sql
select
    sum(
        case
            when Id is null then 1
            else 0
        end + case
            when ActivityMinute is null then 1
            else 0
        end + case
            when Calories is null then 1
            else 0
        end
    ) as total_null
from
    minute_calories;
```

<details>
    <summary><b>Field Details</b></summary>

| total_null |
|------------|
| 0          |


</details>

+ **"minute_intensities"**
```sql
select
    sum(
        case
            when Id is null then 1
            else 0
        end + case
            when ActivityMinute is null then 1
            else 0
        end + case
            when Intensity is null then 1
            else 0
        end
    ) as total_null
from
    minute_intensities;
```

<details>
    <summary><b>Field Details</b></summary>

| total_null |
|------------|
| 0          |

</details>

+ **"minute_mets"**
```sql
select
    sum(
        case
            when Id is null then 1
            else 0
        end + case
            when ActivityMinute is null then 1
            else 0
        end + case
            when METs is null then 1
            else 0
        end
    ) as total_null
from
    minute_mets;
```

<details>
    <summary><b>Field Details</b></summary>

| total_null |
|------------|
| 0          |

</details>

+ **"minute_sleep"**
```sql
select
    sum(
        case
            when Id is null then 1
            else 0
        end + case
            when date is null then 1
            else 0
        end + case
            when value is null then 1
            else 0
        end + case
            when logId is null then 1
            else 0
        end
    ) as total_null
from
    minute_sleep;
```

<details>
    <summary><b>Field Details</b></summary>

| total_null |
|------------|
| 0          |

</details>

+ **"minute_steps"**
```sql
select
    sum(
        case
            when Id is null then 1
            else 0
        end + case
            when ActivityMinute is null then 1
            else 0
        end + case
            when Steps is null then 1
            else 0
        end
    ) as total_null
from
    minute_steps;
```

`(0 rows affected)`

+ **"weight_logs"**
```sql
select
    sum(
        case
            when Id is null then 1
            else 0
        end + case
            when date is null then 1
            else 0
        end + case
            when WeightKg is null then 1
            else 0
        end + case
            when WeightPounds is null then 1
            else 0
        end + case
            when Fat is null then 1
            else 0
        end + case
            when BMI is null then 1
            else 0
        end + case
            when IsManualReport is null then 1
            else 0
        end + case
            when LogId is null then 1
            else 0
        end
    ) as total_null
from
    weight_logs;
```

<details>
    <summary><b>Field Details</b></summary>

| total_null |
|------------|
| 96         |

</details>

### Summary of Initial Data Exploration:
+ Each table exhibits a different size in terms of rows and columns, showcasing the diversity of data types and structures present in the dataset.
+ Each table's "Id" column contains unique values, but there are overlaps between some "Id" values across different tables, indicating potential inconsistencies.
+ The **"weight_logs"** table stands out for having NULL values, which need to be addressed during data preprocessing to prevent potential biases in analyses.
+ Further investigation is warranted to identify any additional data quality issues and ensure the integrity of the dataset before proceeding with analyses.
  
> [!NOTE]
> + Blank values were not explicitly searched for during the initial data exploration as they were automatically filled with nulls by the sql server system itself.

### Data Pre-Processing

#### Transforming Staging Tables
> Establishing dedicated staging tables for each dataset, incorporating data type transformation processes and row numbering to aid in duplicate row removal, and implementing column renaming strategies within staging tables.

+ **"daily_activity"** to **"daily_activity_sg****
```sql
select
    cast(Id as bigint) as Id
  , cast(ActivityDate as date) as Date
  , cast(TotalSteps as int) as TotalSteps
  , cast(TotalDistance * 0.621371 as decimal(4, 2)) as TotalMiles
  , cast(TrackerDistance * 0.621371 as decimal(4, 2)) as TrackerMiles
  , cast(LoggedActivitiesDistance * 0.621371 as decimal(3, 2)) as LoggedActivitiesMiles
  , cast(VeryActiveDistance * 0.621371 as decimal(5, 2)) as VeryActiveMiles
  , cast(ModeratelyActiveDistance * 0.621371 as decimal(5, 2)) as ModeratelyActiveMiles
  , cast(LightActiveDistance * 0.621371 as decimal(5, 2)) as LightActiveMiles
  , cast(SedentaryActiveDistance * 0.621371 as decimal(5, 2)) as SedentaryActiveMiles
  , cast(VeryActiveMinutes as smallint) as VeryActiveMinutes
  , cast(FairlyActiveMinutes as smallint) as FairlyActiveMinutes
  , cast(LightlyActiveMinutes as smallint) as LightlyActiveMinutes
  , cast(SedentaryMinutes as smallint) as SedentaryMinutes
  , cast(Calories as smallint) as CaloriesKcal
  , cast(
        row_number() over (
            partition by
                Id
              , ActivityDate
              , TotalSteps
              , TotalDistance
              , TrackerDistance
              , LoggedActivitiesDistance
              , VeryActiveDistance
              , ModeratelyActiveDistance
              , LightActiveDistance
              , SedentaryActiveDistance
              , VeryActiveMinutes
              , FairlyActiveMinutes
              , LightlyActiveMinutes
              , SedentaryMinutes
              , Calories
            order by
                Id
        ) as int
    ) as row_num
into
    daily_activity_sg
from
    daily_activity;
```

`(1397 rows affected)`

+ **"heart_rate"** to **"heart_rate_sg****
```sql
select
    cast(Id as bigint) as Id
  , cast(time as datetime) as DateTime
  , cast(value as tinyint) as HeartRate
  , cast(
        row_number() over (
            partition by
                Id
              , time
              , value
            order by
                Id
        ) as int
    ) as row_num
into
    heart_rate_sg
from
    heart_rate;
```

`(3638339 rows affected)`

+ **"minute_calories"** to **"minute_calories_sg****
```sql
select
    cast(Id as bigint) as Id
  , cast(ActivityMinute as datetime) as DateTime
  , cast(Calories as decimal(8, 2)) as CaloriesKcal
  , cast(
        row_number() over (
            partition by
                Id
              , ActivityMinute
              , Calories
            order by
                Id
        ) as int
    ) as row_num
into
    minute_calories_sg
from
    minute_calories;
```

`(2770620 rows affected)`

+ **"minute_intensities"** to **"minute_intensities_sg****
```sql
select
    cast(Id as bigint) as Id
  , cast(ActivityMinute as datetime) as DateTime
  , cast(Intensity as tinyint) as Intensity
  , cast(
        row_number() over (
            partition by
                Id
              , ActivityMinute
              , Intensity
            order by
                Id
        ) as int
    ) as row_num
into
    minute_intensities_sg
from
    minute_intensities;
```

`(2770620 rows affected)`

+ **"minute_mets"** to **"minute_mets_sg****
```sql
select
    cast(Id as bigint) as Id
  , cast(ActivityMinute as datetime) as DateTime
  , cast(METs / 10 as decimal(3, 1)) as METs
  , cast(
        row_number() over (
            partition by
                Id
              , ActivityMinute
              , METs
            order by
                Id
        ) as int
    ) as row_num
into
    minute_mets_sg
from
    minute_mets;
```

`(2770620 rows affected)`

+ **"minute_sleep"** to **"minute_sleep_sg****
```sql
select
    cast(Id as bigint) as Id
  , cast(date as datetime) as DateTime
  , cast(value as smallint) as SleepState
  , cast(logId as bigint) as LogId
  , cast(
        row_number() over (
            partition by
                Id
              , date
              , value
              , logId
            order by
                Id
        ) as int
    ) as row_num
into
    minute_sleep_sg
from
    minute_sleep;
```

`(387080 rows affected)`

+ **"minute_steps"** to **"minute_steps_sg****
```sql
select
    cast(Id as bigint) as Id
  , cast(ActivityMinute as datetime) as DateTime
  , cast(Steps as tinyint) as Steps
  , cast(
        row_number() over (
            partition by
                Id
              , ActivityMinute
              , Steps
            order by
                Id
        ) as int
    ) as row_num
into
    minute_steps_sg
from
    minute_steps;
```

`(2770620 rows affected)`

+ **"weight_logs"** to **"weight_logs_sg****
```sql
select
    cast(Id as bigint) as Id
  , cast(date as date) as Date
  , cast(WeightKg as decimal(6, 2)) as WeightKg
  , cast(WeightPounds as decimal(6, 2)) as WeightPounds
  , cast(Fat as float) as Fat
  , cast(BMI as decimal(4, 1)) as BMI
  , cast(IsManualReport as varchar(10)) as IsManualReport
  , cast(LogId as bigint) as LogId
  , cast(
        row_number() over (
            partition by
                Id
              , date
              , WeightKg
              , WeightPounds
              , Fat
              , BMI
              , cast(IsManualReport as varchar(10))
              , LogId
            order by
                Id
        ) as int
    ) as row_num
into
    weight_logs_sg
from
    weight_logs;
```

`(100 rows affected)`

#### Eliminating Redundant Data
> Utilizing **"row_num"** column to spot duplicate entries within each individual table, removing redundant data based on predetermined criteria, and meticulously verifying the final results for accuracy.

+ **"daily_activity_sg"**
```sql
select
    *
from
    daily_activity_sg
where
    row_num > 1;
```

`(0 rows affected)`

+ **"heart_rate_sg"**
```sql
select
    *
from
    heart_rate_sg
where
    row_num > 1;
```

<details>
    <summary><b>Field Details</b></summary>

| Id         | DateTime                | HeartRate | row_num |
|------------|-------------------------|-----------|---------|
| 2022484408 | 2016-04-12 07:21:00.000 | 97        | 2       |
| 2022484408 | 2016-04-12 07:21:05.000 | 102       | 2       |
| 2022484408 | 2016-04-12 07:21:10.000 | 105       | 2       |
| 2022484408 | 2016-04-12 07:21:20.000 | 103       | 2       |
| 2022484408 | 2016-04-12 07:21:25.000 | 101       | 2       |
| 2022484408 | 2016-04-12 07:22:05.000 | 95        | 2       |
| 2022484408 | 2016-04-12 07:22:10.000 | 91        | 2       |
| 2022484408 | 2016-04-12 07:22:15.000 | 93        | 2       |
| 2022484408 | 2016-04-12 07:22:20.000 | 94        | 2       |
| 2022484408 | 2016-04-12 07:22:25.000 | 93        | 2       |

</details>

`(10-23424 rows affected)`

```sql
delete from heart_rate_sg
where
    row_num > 1;
```

`(23424 rows affected)`

```sql
select
    count(*) as total_dup
from
    heart_rate_sg
where
    row_num > 1;
```

<details>
    <summary><b>Field Details</b></summary>

| total_dup |
|-----------|
| 0         |

</details>

+ **"minute_calories_sg"**
```sql
select
    *
from
    minute_calories_sg
where
    row_num > 1;
```

<details>
    <summary><b>Field Details</b></summary>

| Id         | DateTime                | CaloriesKcal | row_num |
|------------|-------------------------|--------------|---------|
| 1624580081 | 2016-04-12 00:00:00.000 | 0.83         | 2       |
| 1624580081 | 2016-04-12 00:01:00.000 | 0.83         | 2       |
| 1624580081 | 2016-04-12 00:02:00.000 | 0.83         | 2       |
| 1624580081 | 2016-04-12 00:03:00.000 | 0.83         | 2       |
| 1624580081 | 2016-04-12 00:04:00.000 | 0.83         | 2       |
| 1624580081 | 2016-04-12 00:05:00.000 | 0.83         | 2       |
| 1624580081 | 2016-04-12 00:06:00.000 | 0.83         | 2       |
| 1624580081 | 2016-04-12 00:07:00.000 | 0.83         | 2       |
| 1624580081 | 2016-04-12 00:08:00.000 | 0.83         | 2       |
| 1624580081 | 2016-04-12 00:09:00.000 | 0.83         | 2       |

</details>

`(10-10500 rows affected)`

```sql
delete from minute_calories_sg
where
    row_num > 1;
```

`(10500 rows affected)`

```sql
select
    count(*) as total_dup
from
    minute_calories_sg
where
    row_num > 1;
```

<details>
    <summary><b>Field Details</b></summary>

| total_dup |
|-----------|
| 0         |

</details>

+ **"minute_intensities_sg"**
```sql
select
    *
from
    minute_intensities_sg
where
    row_num > 1;
```

<details>
    <summary><b>Field Details</b></summary>

| Id         | DateTime                | Intensity | row_num |
|------------|-------------------------|-----------|---------|
| 1624580081 | 2016-04-12 00:00:00.000 | 0         | 2       |
| 1624580081 | 2016-04-12 00:01:00.000 | 0         | 2       |
| 1624580081 | 2016-04-12 00:02:00.000 | 0         | 2       |
| 1624580081 | 2016-04-12 00:03:00.000 | 0         | 2       |
| 1624580081 | 2016-04-12 00:04:00.000 | 0         | 2       |
| 1624580081 | 2016-04-12 00:05:00.000 | 0         | 2       |
| 1624580081 | 2016-04-12 00:06:00.000 | 0         | 2       |
| 1624580081 | 2016-04-12 00:07:00.000 | 0         | 2       |
| 1624580081 | 2016-04-12 00:08:00.000 | 0         | 2       |
| 1624580081 | 2016-04-12 00:09:00.000 | 0         | 2       |

</details>

`(10-10500 rows affected)`

```sql
delete from minute_intensities_sg
where
    row_num > 1;
```

`(10500 rows affected)`

```sql
select
    count(*) as total_dup
from
    minute_intensities_sg
where
    row_num > 1;
```

<details>
    <summary><b>Field Details</b></summary>

| total_dup |
|-----------|
| 0         |

</details>

+ **"minute_mets_sg"**
```sql
select
    *
from
    minute_mets_sg
where
    row_num > 1;
```

<details>
    <summary><b>Field Details</b></summary>

| Id         | DateTime                | METs | row_num |
|------------|-------------------------|------|---------|
| 1624580081 | 2016-04-12 00:00:00.000 | 1.0  | 2       |
| 1624580081 | 2016-04-12 00:01:00.000 | 1.0  | 2       |
| 1624580081 | 2016-04-12 00:02:00.000 | 1.0  | 2       |
| 1624580081 | 2016-04-12 00:03:00.000 | 1.0  | 2       |
| 1624580081 | 2016-04-12 00:04:00.000 | 1.0  | 2       |
| 1624580081 | 2016-04-12 00:05:00.000 | 1.0  | 2       |
| 1624580081 | 2016-04-12 00:06:00.000 | 1.0  | 2       |
| 1624580081 | 2016-04-12 00:07:00.000 | 1.0  | 2       |
| 1624580081 | 2016-04-12 00:08:00.000 | 1.0  | 2       |
| 1624580081 | 2016-04-12 00:09:00.000 | 1.0  | 2       |

</details>

`(10-10500 rows affected)`

```sql
delete from minute_mets_sg
where
    row_num > 1;
```

`(10500 rows affected)`

```sql
select
    count(*) as total_dup
from
    minute_mets_sg
where
    row_num > 1;
```

<details>
    <summary><b>Field Details</b></summary>

| total_dup |
|-----------|
| 0         |

</details>

+ **"minute_sleep_sg"**
```sql
select
    *
from
    minute_sleep_sg
where
    row_num > 1;
```

<details>
    <summary><b>Field Details</b></summary>

| Id         | DateTime                | SleepState | LogId       | row_num |
|------------|-------------------------|------------|-------------|---------|
| 1927972279 | 2016-04-11 21:56:00.000 | 1          | 11372414035 | 2       |
| 1927972279 | 2016-04-11 21:57:00.000 | 1          | 11372414035 | 2       |
| 1927972279 | 2016-04-11 21:58:00.000 | 1          | 11372414035 | 2       |
| 1927972279 | 2016-04-11 21:59:00.000 | 1          | 11372414035 | 2       |
| 1927972279 | 2016-04-11 22:00:00.000 | 1          | 11372414035 | 2       |
| 1927972279 | 2016-04-11 22:01:00.000 | 1          | 11372414035 | 2       |
| 1927972279 | 2016-04-11 22:02:00.000 | 1          | 11372414035 | 2       |
| 1927972279 | 2016-04-11 22:03:00.000 | 1          | 11372414035 | 2       |
| 1927972279 | 2016-04-11 22:04:00.000 | 1          | 11372414035 | 2       |
| 1927972279 | 2016-04-11 22:05:00.000 | 1          | 11372414035 | 2       |

</details>

`(10-4300 rows affected)`

```sql
delete from minute_sleep_sg
where
    row_num > 1;
```

`(4300 rows affected)`

```sql
select
    count(*) as total_dup
from
    minute_sleep_sg
where
    row_num > 1;
```

<details>
    <summary><b>Field Details</b></summary>

| total_dup |
|-----------|
| 0         |

</details>

+ **"minute_steps_sg"**
```sql
select
    *
from
    minute_steps_sg
where
    row_num > 1;
```

<details>
    <summary><b>Field Details</b></summary>

| Id         | DateTime                | Steps | row_num |
|------------|-------------------------|-------|---------|
| 1624580081 | 2016-04-12 00:00:00.000 | 0     | 2       |
| 1624580081 | 2016-04-12 00:01:00.000 | 0     | 2       |
| 1624580081 | 2016-04-12 00:02:00.000 | 0     | 2       |
| 1624580081 | 2016-04-12 00:03:00.000 | 0     | 2       |
| 1624580081 | 2016-04-12 00:04:00.000 | 0     | 2       |
| 1624580081 | 2016-04-12 00:05:00.000 | 0     | 2       |
| 1624580081 | 2016-04-12 00:06:00.000 | 0     | 2       |
| 1624580081 | 2016-04-12 00:07:00.000 | 0     | 2       |
| 1624580081 | 2016-04-12 00:08:00.000 | 0     | 2       |
| 1624580081 | 2016-04-12 00:09:00.000 | 0     | 2       |

</details>

`(10-10500 rows affected)`

```sql
delete from minute_steps_sg
where
    row_num > 1;
```

`(10500 rows affected)`

```sql
select
    count(*) as total_dup
from
    minute_steps_sg
where
    row_num > 1;
```

<details>
    <summary><b>Field Details</b></summary>

| total_dup |
|-----------|
| 0         |

</details>

+ **"weight_logs_sg"**
```sql
select
    *
from
    weight_logs_sg
where
    row_num > 1;
```

<details>
    <summary><b>Field Details</b></summary>

| Id         | Date                    | WeightKg | WeightPounds | Fat  | BMI  | IsManualReport | LogId         | row_num |
|------------|-------------------------|----------|--------------|------|------|----------------|---------------|---------|
| 6962181067 | 2016-04-12 23:59:59.000 | 62.50    | 137.79       | NULL | 24.4 | True           | 1460505599000 | 2       |
| 8877689391 | 2016-04-12 06:47:11.000 | 85.80    | 189.16       | NULL | 25.7 | False          | 1460443631000 | 2       |

</details>

```sql
delete from weight_logs_sg
where
    row_num > 1;
```

`(2 rows affected)`

```sql
select
    count(*) as total_dup
from
    weight_logs_sg
where
    row_num > 1;
```

<details>
    <summary><b>Field Details</b></summary>

| total_dup |
|-----------|
| 0         |

</details>

#### Column Cleanup
> Removing **"row_num"** column from staging tables after deletion of duplicate rows.

```sql
alter table daily_activity_sg
drop column row_num;
alter table heart_rate_sg
drop column row_num;
alter table minute_calories_sg
drop column row_num;
alter table minute_intensities_sg
drop column row_num;
alter table minute_mets_sg
drop column row_num;
alter table minute_sleep_sg
drop column row_num;
alter table minute_steps_sg
drop column row_num;
alter table weight_logs_sg
drop column row_num;
```

#### Aggregation and Transformation
> Aggregate data from staging tables by daily and hourly intervals, grouping by ID, separating the timestamp into date and hour, and adding total and average columns, resulting in new tables.

+ **"heart_rate_sg"**
```sql
select
    Id
  , convert(date, DateTime) as Date
  , sum(HeartRate) as TotalHeartRate
  , avg(HeartRate) as AvgHeartRate
from
    heart_rate_sg
group by
    Id
  , convert(date, DateTime)
order by
	  Id
  , Date;
```

<details>
    <summary><b>Field Details</b></summary>

| Id         | Date       | TotalHeartRate | AvgHeartRate |
|------------|------------|----------------|--------------|
| 2022484408 | 2016-04-01 | 328395         | 88           |
| 2022484408 | 2016-04-02 | 309535         | 72           |
| 2022484408 | 2016-04-03 | 387094         | 74           |
| 2022484408 | 2016-04-04 | 367127         | 78           |
| 2022484408 | 2016-04-05 | 450344         | 83           |
| 2022484408 | 2016-04-06 | 450513         | 82           |
| 2022484408 | 2016-04-07 | 437450         | 90           |
| 2022484408 | 2016-04-08 | 448887         | 81           |
| 2022484408 | 2016-04-09 | 503944         | 84           |
| 2022484408 | 2016-04-10 | 401380         | 80           |

</details>

`(10-469 rows affected)`

```sql
select
    Id
  , convert(date, DateTime) as Date
  , datepart(hour, DateTime) AS Hour
  , sum(HeartRate) as TotalHeartRate
  , avg(HeartRate) as AvgHeartRate
from
    heart_rate_sg
group by
    Id
  , convert(date, DateTime)
  , datepart(hour, DateTime)
order by
	  Id
  , Date
  , Hour;
```

<details>
    <summary><b>Field Details</b></summary>

| Id         | Date       | Hour | TotalHeartRate | AvgHeartRate |
|------------|------------|------|----------------|--------------|
| 2022484408 | 2016-04-01 | 7    | 4916           | 100          |
| 2022484408 | 2016-04-01 | 8    | 27916          | 71           |
| 2022484408 | 2016-04-01 | 9    | 63754          | 121          |
| 2022484408 | 2016-04-01 | 10   | 38172          | 97           |
| 2022484408 | 2016-04-01 | 11   | 360            | 90           |
| 2022484408 | 2016-04-01 | 14   | 12646          | 126          |
| 2022484408 | 2016-04-01 | 15   | 31372          | 74           |
| 2022484408 | 2016-04-01 | 16   | 35549          | 81           |
| 2022484408 | 2016-04-01 | 17   | 36707          | 89           |
| 2022484408 | 2016-04-01 | 18   | 29022          | 76           |

</details>

`(10-8499 rows affected)`

```sql
select
    Id
  , convert(date, DateTime) as Date
  , sum(HeartRate) as TotalHeartRate
  , avg(HeartRate) as AvgHeartRate
into
	  daily_heart_rate_sg
from
    heart_rate_sg
group by
    Id
  , convert(date, DateTime)
order by
	  Id
  , Date;
```

`(469 rows affected)`

```sql
select
    Id
  , convert(date, DateTime) as Date
  , datepart(hour, DateTime) AS Hour
  , sum(HeartRate) as TotalHeartRate
  , avg(HeartRate) as AvgHeartRate
into
    hourly_heart_rate_sg
from
    heart_rate_sg
group by
    Id
  , convert(date, DateTime)
  , datepart(hour, DateTime)
order by
	  Id
  , Date
  , Hour;
```

`(8499 rows affected)`

+ **"minute_calories_sg"**
```sql
select
    Id
  , convert(date, DateTime) as Date
  , sum(CaloriesKcal) as TotalCaloriesKcal
  , cast(avg(CaloriesKcal) as decimal(6,2)) as AvgCaloriesKcal
from
    minute_calories_sg
group by
    Id
  , convert(date, DateTime)
order by
  	Id
  , Date;
```

<details>
    <summary><b>Field Details</b></summary>

| Id         | Date       | TotalCaloriesKcal | AvgCaloriesKcal |
|------------|------------|-------------------|-----------------|
| 1503960366 | 2016-03-12 | 2230.18           | 1.55            |
| 1503960366 | 2016-03-13 | 2103.60           | 1.46            |
| 1503960366 | 2016-03-14 | 1830.94           | 1.27            |
| 1503960366 | 2016-03-15 | 2113.73           | 1.47            |
| 1503960366 | 2016-03-16 | 1967.29           | 1.37            |
| 1503960366 | 2016-03-17 | 2041.29           | 1.42            |
| 1503960366 | 2016-03-18 | 2005.98           | 1.39            |
| 1503960366 | 2016-03-19 | 2062.34           | 1.43            |
| 1503960366 | 2016-03-20 | 2092.14           | 1.45            |
| 1503960366 | 2016-03-21 | 1845.58           | 1.28            |

</details>

`(10-1935 rows affected)`

```sql
select
    Id
  , convert(date, DateTime) as Date
  , datepart(hour, DateTime) AS Hour
  , sum(CaloriesKcal) as TotalCaloriesKcal
  , cast(avg(CaloriesKcal) as decimal(5,2)) as AvgCaloriesKcal
from
    minute_calories_sg
group by
    Id
  , convert(date, DateTime)
  , datepart(hour, DateTime)
order by
	Id
  , Date
  , Hour;
```

<details>
    <summary><b>Field Details</b></summary>

| Id         | Date       | Hour | TotalCaloriesKcal | AvgCaloriesKcal |
|------------|------------|------|-------------------|-----------------|
| 1503960366 | 2016-03-12 | 0    | 48.00             | 0.80            |
| 1503960366 | 2016-03-12 | 1    | 48.00             | 0.80            |
| 1503960366 | 2016-03-12 | 2    | 48.00             | 0.80            |
| 1503960366 | 2016-03-12 | 3    | 48.00             | 0.80            |
| 1503960366 | 2016-03-12 | 4    | 48.00             | 0.80            |
| 1503960366 | 2016-03-12 | 5    | 48.00             | 0.80            |
| 1503960366 | 2016-03-12 | 6    | 48.00             | 0.80            |
| 1503960366 | 2016-03-12 | 7    | 48.00             | 0.80            |
| 1503960366 | 2016-03-12 | 8    | 48.00             | 0.80            |
| 1503960366 | 2016-03-12 | 9    | 49.59             | 0.83            |

</details>

`(10-46002 rows affected)`

```sql
select
    Id
  , convert(date, DateTime) as Date
  , sum(CaloriesKcal) as TotalCaloriesKcal
  , cast(avg(CaloriesKcal) as decimal(5,2)) as AvgCaloriesKcal
into
	daily_calories_sg
from
    minute_calories_sg
group by
    Id
  , convert(date, DateTime)
order by
	Id
  , Date;
```

`(1935 rows affected)`

```sql
select
    Id
  , convert(date, DateTime) as Date
  , datepart(hour, DateTime) AS Hour
  , sum(CaloriesKcal) as TotalCaloriesKcal
  , cast(avg(CaloriesKcal) as decimal(5,2)) as AvgCaloriesKcal
into
		hourly_calories_sg
from
    minute_calories_sg
group by
    Id
  , convert(date, DateTime)
  , datepart(hour, DateTime)
order by
	  Id
  , Date
  , Hour;
```

`(46002 rows affected)`

+ **"minute_intensities_sg"**
```sql
select
    Id
  , convert(date, DateTime) as Date
  , sum(Intensity) as TotalIntensity
  , avg(Intensity) as AvgIntensity
from
    minute_intensities_sg
group by
    Id
  , convert(date, DateTime)
order by
	  Id
  , Date;
```

<details>
    <summary><b>Field Details</b></summary>

| Id         | Date       | TotalIntensity | AvgIntensity |
|------------|------------|----------------|--------------|
| 1503960366 | 2016-03-12 | 596            | 0            |
| 1503960366 | 2016-03-13 | 557            | 0            |
| 1503960366 | 2016-03-14 | 369            | 0            |
| 1503960366 | 2016-03-15 | 495            | 0            |
| 1503960366 | 2016-03-16 | 434            | 0            |
| 1503960366 | 2016-03-17 | 435            | 0            |
| 1503960366 | 2016-03-18 | 414            | 0            |
| 1503960366 | 2016-03-19 | 473            | 0            |
| 1503960366 | 2016-03-20 | 461            | 0            |
| 1503960366 | 2016-03-21 | 344            | 0            |

</details>

`(10-1935 rows affected)`

```sql
select
    Id
  , convert(date, DateTime) as Date
  , datepart(hour, DateTime) AS Hour
  , sum(Intensity) as TotalIntensity
  , avg(Intensity) as AvgIntensity
from
    minute_intensities_sg
group by
    Id
  , convert(date, DateTime)
  , datepart(hour, DateTime)
order by
	  Id
  , Date
  , Hour;
```

<details>
    <summary><b>Field Details</b></summary>

| Id         | Date       | Hour | TotalIntensity | AvgIntensity |
|------------|------------|------|----------------|--------------|
| 1503960366 | 2016-03-12 | 0    | 0              | 0            |
| 1503960366 | 2016-03-12 | 1    | 0              | 0            |
| 1503960366 | 2016-03-12 | 2    | 0              | 0            |
| 1503960366 | 2016-03-12 | 3    | 0              | 0            |
| 1503960366 | 2016-03-12 | 4    | 0              | 0            |
| 1503960366 | 2016-03-12 | 5    | 0              | 0            |
| 1503960366 | 2016-03-12 | 6    | 0              | 0            |
| 1503960366 | 2016-03-12 | 7    | 0              | 0            |
| 1503960366 | 2016-03-12 | 8    | 0              | 0            |
| 1503960366 | 2016-03-12 | 9    | 1              | 0            |

</details>

`(10-46002 rows affected)`

```sql
select
    Id
  , convert(date, DateTime) as Date
  , sum(Intensity) as TotalIntensity
  , avg(Intensity) as AvgIntensity
into
	  daily_intensities_sg
from
    minute_intensities_sg
group by
    Id
  , convert(date, DateTime)
order by
  	Id
  , Date;
```

`(1935 rows affected)`

```sql
select
    Id
  , convert(date, DateTime) as Date
  , datepart(hour, DateTime) AS Hour
  , sum(Intensity) as TotalIntensity
  , avg(Intensity) as AvgIntensity
into
		hourly_intensities_sg
from
    minute_intensities_sg
group by
    Id
  , convert(date, DateTime)
  , datepart(hour, DateTime)
order by
	  Id
  , Date
  , Hour;
```

`(46002 rows affected)`

+ **"minute_mets_sg"**
```sql
select
    Id
  , convert(date, DateTime) as Date
  , sum(METs) as TotalMETs
  , cast(avg(METs) as decimal(5,2)) as AvgMETs
from
    minute_mets_sg
group by
    Id
  , convert(date, DateTime)
order by
	  Id
  , Date;
```

<details>
    <summary><b>Field Details</b></summary>

| Id         | Date       | TotalMETs | AvgMETs |
|------------|------------|-----------|---------|
| 1503960366 | 2016-03-12 | 2567.0    | 1.78    |
| 1503960366 | 2016-03-13 | 2408.0    | 1.67    |
| 1503960366 | 2016-03-14 | 2085.0    | 1.45    |
| 1503960366 | 2016-03-15 | 2359.0    | 1.64    |
| 1503960366 | 2016-03-16 | 2231.0    | 1.55    |
| 1503960366 | 2016-03-17 | 2282.0    | 1.58    |
| 1503960366 | 2016-03-18 | 2280.0    | 1.58    |
| 1503960366 | 2016-03-19 | 2358.0    | 1.64    |
| 1503960366 | 2016-03-20 | 2390.0    | 1.66    |
| 1503960366 | 2016-03-21 | 2080.0    | 1.44    |

</details>

`(10-1935 rows affected)`

```sql
select
    Id
  , convert(date, DateTime) as Date
  , datepart(hour, DateTime) AS Hour
  , sum(METs) as TotalMETs
  , cast(avg(METs) as decimal(5,2)) as AvgMETs
from
    minute_mets_sg
group by
    Id
  , convert(date, DateTime)
  , datepart(hour, DateTime)
order by
  	Id
  , Date
  , Hour;
```

<details>
    <summary><b>Field Details</b></summary>

| Id         | Date       | Hour | TotalMETs | AvgMETs |
|------------|------------|------|-----------|---------|
| 1503960366 | 2016-03-12 | 0    | 60.0      | 1.00    |
| 1503960366 | 2016-03-12 | 1    | 60.0      | 1.00    |
| 1503960366 | 2016-03-12 | 2    | 60.0      | 1.00    |
| 1503960366 | 2016-03-12 | 3    | 60.0      | 1.00    |
| 1503960366 | 2016-03-12 | 4    | 60.0      | 1.00    |
| 1503960366 | 2016-03-12 | 5    | 60.0      | 1.00    |
| 1503960366 | 2016-03-12 | 6    | 60.0      | 1.00    |
| 1503960366 | 2016-03-12 | 7    | 60.0      | 1.00    |
| 1503960366 | 2016-03-12 | 8    | 60.0      | 1.00    |
| 1503960366 | 2016-03-12 | 9    | 61.0      | 1.02    |

</details>

`(10-46002 rows affected)`

```sql
select
    Id
  , convert(date, DateTime) as Date
  , sum(METs) as TotalMETs
  , cast(avg(METs) as decimal(5,2)) as AvgMETs
into
	daily_mets_sg
from
    minute_mets_sg
group by
    Id
  , convert(date, DateTime)
order by
	Id
  , Date;
```

`(1935 rows affected)`

```sql
select
    Id
  , convert(date, DateTime) as Date
  , datepart(hour, DateTime) AS Hour
  , sum(METs) as TotalMETs
  , cast(avg(METs) as decimal(5,2)) as AvgMETs
into
	hourly_mets_sg
from
    minute_mets_sg
group by
    Id
  , convert(date, DateTime)
  , datepart(hour, DateTime)
order by
	Id
  , Date
  , Hour;
```

`(46002 rows affected)`

+ **"minute_sleep_sg"**
```sql
select
    Id
  , convert(date, DateTime) as Date
  , sum(SleepState) as TotalSleepState
  , avg(SleepState) as AvgSleepState
from
    minute_sleep_sg
group by
    Id
  , convert(date, DateTime)
order by
  	Id
  , Date;
```

<details>
    <summary><b>Field Details</b></summary>

| Id         | Date       | TotalSleepState | AvgSleepState |
|------------|------------|-----------------|---------------|
| 1503960366 | 2016-03-13 | 441             | 1             |
| 1503960366 | 2016-03-14 | 423             | 1             |
| 1503960366 | 2016-03-15 | 365             | 1             |
| 1503960366 | 2016-03-16 | 404             | 1             |
| 1503960366 | 2016-03-17 | 473             | 1             |
| 1503960366 | 2016-03-18 | 449             | 1             |
| 1503960366 | 2016-03-19 | 490             | 1             |
| 1503960366 | 2016-03-20 | 483             | 1             |
| 1503960366 | 2016-03-21 | 471             | 1             |
| 1503960366 | 2016-03-23 | 316             | 1             |

</details>

`(10-901 rows affected)`

```sql
select
    Id
  , convert(date, DateTime) as Date
  , datepart(hour, DateTime) AS Hour
  , sum(SleepState) as TotalSleepState
  , avg(SleepState) as AvgSleepState
from
    minute_sleep_sg
group by
    Id
  , convert(date, DateTime)
  , datepart(hour, DateTime)
order by
	  Id
  , Date
  , Hour;
```

<details>
    <summary><b>Field Details</b></summary>

| Id         | Date       | Hour | TotalSleepState | AvgSleepState |
|------------|------------|------|-----------------|---------------|
| 1503960366 | 2016-03-13 | 2    | 25              | 1             |
| 1503960366 | 2016-03-13 | 3    | 60              | 1             |
| 1503960366 | 2016-03-13 | 4    | 62              | 1             |
| 1503960366 | 2016-03-13 | 5    | 60              | 1             |
| 1503960366 | 2016-03-13 | 6    | 61              | 1             |
| 1503960366 | 2016-03-13 | 7    | 63              | 1             |
| 1503960366 | 2016-03-13 | 8    | 63              | 1             |
| 1503960366 | 2016-03-13 | 9    | 47              | 1             |
| 1503960366 | 2016-03-14 | 1    | 34              | 1             |
| 1503960366 | 2016-03-14 | 2    | 80              | 1             |

</details>

`(10-7302 rows affected)

```sql
select
    Id
  , convert(date, DateTime) as Date
  , sum(SleepState) as TotalSleepState
  , avg(SleepState) as AvgSleepState
into
	  daily_sleep_sg
from
    minute_sleep_sg
group by
    Id
  , convert(date, DateTime)
order by
	  Id
  , Date;
```

`(901 rows affected)`

```sql
select
    Id
  , convert(date, DateTime) as Date
  , datepart(hour, DateTime) AS Hour
  , sum(SleepState) as TotalSleepState
  , avg(SleepState) as AvgSleepState
into
	  hourly_sleep_sg
from
    minute_sleep_sg
group by
    Id
  , convert(date, DateTime)
  , datepart(hour, DateTime)
order by
	  Id
  , Date
  , Hour;
```

`(7302 rows affected)`

+ **"minute_steps_sg"**
```sql
select
    Id
  , convert(date, DateTime) as Date
  , sum(Steps) as TotalSteps
  , avg(Steps) as AvgSteps
from
    minute_steps_sg
group by
    Id
  , convert(date, DateTime)
order by
	  Id
  , Date;
```

<details>
    <summary><b>Field Details</b></summary>

| Id         | Date       | TotalSteps | AvgSteps |
|------------|------------|------------|----------|
| 1503960366 | 2016-03-12 | 19675      | 13       |
| 1503960366 | 2016-03-13 | 17106      | 11       |
| 1503960366 | 2016-03-14 | 10023      | 6        |
| 1503960366 | 2016-03-15 | 15384      | 10       |
| 1503960366 | 2016-03-16 | 13498      | 9        |
| 1503960366 | 2016-03-17 | 14027      | 9        |
| 1503960366 | 2016-03-18 | 14544      | 10       |
| 1503960366 | 2016-03-19 | 15424      | 10       |
| 1503960366 | 2016-03-20 | 15128      | 10       |
| 1503960366 | 2016-03-21 | 10020      | 6        |

</details>

`(10-1935 rows affected)`

```sql
select
    Id
  , convert(date, DateTime) as Date
  , datepart(hour, DateTime) AS Hour
  , sum(Steps) as TotalSteps
  , avg(Steps) as AvgSteps
from
    minute_steps_sg
group by
    Id
  , convert(date, DateTime)
  , datepart(hour, DateTime)
order by
	  Id
  , Date
  , Hour;
```

<details>
    <summary><b>Field Details</b></summary>

| Id         | Date       | Hour | TotalSteps | AvgSteps |
|------------|------------|------|------------|----------|
| 1503960366 | 2016-03-12 | 0    | 0          | 0        |
| 1503960366 | 2016-03-12 | 1    | 0          | 0        |
| 1503960366 | 2016-03-12 | 2    | 0          | 0        |
| 1503960366 | 2016-03-12 | 3    | 0          | 0        |
| 1503960366 | 2016-03-12 | 4    | 0          | 0        |
| 1503960366 | 2016-03-12 | 5    | 0          | 0        |
| 1503960366 | 2016-03-12 | 6    | 0          | 0        |
| 1503960366 | 2016-03-12 | 7    | 0          | 0        |
| 1503960366 | 2016-03-12 | 8    | 0          | 0        |
| 1503960366 | 2016-03-12 | 9    | 8          | 0        |

</details>

`(10-46002 rows affected)`

```sql
select
    Id
  , convert(date, DateTime) as Date
  , sum(Steps) as TotalSteps
  , avg(Steps) as AvgSteps
into
	  daily_steps_sg
from
    minute_steps_sg
group by
    Id
  , convert(date, DateTime)
order by
	  Id
  , Date;
```

`(1935 rows affected)`

```sql
select
    Id
  , convert(date, DateTime) as Date
  , datepart(hour, DateTime) AS Hour
  , sum(Steps) as TotalSteps
  , avg(Steps) as AvgSteps
into
	  hourly_steps_sg
from
    minute_steps_sg
group by
    Id
  , convert(date, DateTime)
  , datepart(hour, DateTime)
order by
	  Id
  , Date
  , Hour;
```

`(46002 rows affected)`

**"weight_logs_sg"**
```sql
select
    Id
  , convert(date, Date) as Date
	, WeightKg
	, WeightPounds
	, BMI
from
    weight_logs_sg
group by
    Id
  , convert(date, Date)
  , WeightKg
  , WeightPounds
  , BMI
order by
	  Id
  , Date;
```

<details>
    <summary><b>Field Details</b></summary>

| Id         | Date       | WeightKg | WeightPounds | BMI  |
|------------|------------|----------|--------------|------|
| 1503960366 | 2016-04-05 | 53.30    | 117.51       | 23.0 |
| 1503960366 | 2016-05-02 | 52.60    | 115.96       | 22.6 |
| 1503960366 | 2016-05-03 | 52.60    | 115.96       | 22.6 |
| 1927972279 | 2016-04-10 | 129.60   | 285.72       | 46.2 |
| 1927972279 | 2016-04-13 | 133.50   | 294.32       | 47.5 |
| 2347167796 | 2016-04-03 | 63.40    | 139.77       | 24.8 |
| 2873212765 | 2016-04-06 | 56.70    | 125.00       | 21.5 |
| 2873212765 | 2016-04-07 | 57.20    | 126.10       | 21.6 |
| 2873212765 | 2016-04-21 | 56.70    | 125.00       | 21.5 |
| 2873212765 | 2016-05-12 | 57.30    | 126.32       | 21.7 |

</details>

`(10-98 rows affected)`

```sql
select
    Id
  , convert(date, Date) as Date
  , WeightKg
  , WeightPounds
  , BMI
into
	  daily_weight_logs_sg
from
    weight_logs_sg
group by
    Id
  , convert(date, Date)
  , WeightKg
  , WeightPounds
  , BMI
order by
	  Id
  , Date;
```

`(98 rows affected)`

#### Dropping Tables
```sql
drop table heart_rate_sg;
drop table minute_calories_sg;
drop table minute_intensities_sg;
drop table minute_mets_sg;
drop table minute_sleep_sg;
drop table minute_steps_sg;
drop table weight_logs_sg;
```
