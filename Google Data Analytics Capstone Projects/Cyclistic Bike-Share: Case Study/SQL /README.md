## 🔄 The 'Process' Phase

### Tools Used
![MicrosoftSQLServer](https://img.shields.io/badge/Microsoft%20SQL%20Server-CC2927?style=for-the-badge&logo=microsoft%20sql%20server&logoColor=white)
![Tableau](https://img.shields.io/badge/Tableau-E97627.svg?style=for-the-badge&logo=Tableau&logoColor=white)

+ **Microsoft SQL Server:** Chosen for its robust data management capabilities, scalability, and reliability in handling large datasets. SQL Server provides a comprehensive platform for database management, data warehousing, and business intelligence.
  - **Data Management:** SQL Server offers advanced features for storing, retrieving, and manipulating data, ensuring data integrity and security.
  - **Scalability:** SQL Server's scalability allows it to efficiently handle growing datasets and workloads, making it suitable for organizations of all sizes.
  - **Reliability:** With built-in features for data redundancy, backup, and recovery, SQL Server ensures the reliability and availability of critical data.
+ **Tableau:** Selected for its intuitive data visualization capabilities and ease of use in creating interactive dashboards and reports.
  - **Data Visualization:** Tableau offers a wide range of visualization options, allowing users to create compelling charts, graphs, and maps to explore and communicate insights from data.
  - **Interactivity:** Tableau's interactive features enable users to drill down into data, filter visualizations dynamically, and uncover hidden patterns or trends.
  - **Dashboard Creation:** With Tableau, the ability to easily design interactive dashboards that consolidate multiple visualizations into a single view, providing a holistic overview of key metrics.
  - **Integration:** Tableau seamlessly integrates with various data sources, including databases like Microsoft SQL Server.

### Establishing the Database Framework
+ Created a new database titled **`cyclisticproject`**.
+ Imported the 12 CSV files into the database.
+ Generated separate tables for each of the 12 CSV files.

#### Building the Database
```sql
create database
    cyclisticproject;
```

#### Importing the 12 CSV files
+ Employing the Microsoft SQL Server tool's "Import Flat Files" feature.

| File Name             |
|-----------------------|
| 202301-divvy-tripdata |
| 202302-divvy-tripdata |
| 202303-divvy-tripdata |
| 202304-divvy-tripdata |
| 202305-divvy-tripdata |
| 202306-divvy-tripdata |
| 202307-divvy-tripdata |
| 202308-divvy-tripdata |
| 202309-divvy-tripdata |
| 202310-divvy-tripdata |
| 202311-divvy-tripdata |
| 202312-divvy-tripdata |

### Initial Data Investigation
+ Retrieved details about the columns in each table.
+ Assessed the number of rows and the scale of each dataset.
+ Detected missing values, including null and blank entries, within specified columns.

#### Column Metadata Extraction
+ Utilizing a system view to generate a report on each table's columns.

**January 2023**
```sql
select
    table_name -- Name of the table
  , column_name -- Name of the column
  , data_type -- Data type of the column
  , character_maximum_length -- Maximum length of character data type columns
  , is_nullable -- Indicates whether the column allows NULL values
  , column_default -- Default value of the column
from
    information_schema.columns
where
    table_name = '202301-divvy-tripdata' -- Filtering by a single table
    and table_schema = 'dbo'; -- Filter by the schema 'dbo'
```

| table_name            | column_name        | data_type | character_maximum_length | is_nullable | column_default |
|-----------------------|--------------------|-----------|--------------------------|-------------|----------------|
| 202301-divvy-tripdata | ride_id            | nvarchar  | 50                       | NO          | NULL           |
| 202301-divvy-tripdata | rideable_type      | nvarchar  | 50                       | YES         | NULL           |
| 202301-divvy-tripdata | started_at         | datetime2 | NULL                     | YES         | NULL           |
| 202301-divvy-tripdata | ended_at           | datetime2 | NULL                     | YES         | NULL           |
| 202301-divvy-tripdata | start_station_name | nvarchar  | 50                       | YES         | NULL           |
| 202301-divvy-tripdata | start_station_id   | nvarchar  | 50                       | YES         | NULL           |
| 202301-divvy-tripdata | end_station_name   | nvarchar  | 50                       | YES         | NULL           |
| 202301-divvy-tripdata | end_station_id     | nvarchar  | 50                       | YES         | NULL           |
| 202301-divvy-tripdata | start_lat          | float     | NULL                     | YES         | NULL           |
| 202301-divvy-tripdata | start_lng          | float     | NULL                     | YES         | NULL           |
| 202301-divvy-tripdata | end_lat            | float     | NULL                     | YES         | NULL           |
| 202301-divvy-tripdata | end_lng            | float     | NULL                     | YES         | NULL           |
| 202301-divvy-tripdata | member_casual      | nvarchar  | 50                       | YES         | NULL           |


**February 2023**
```sql
select
    table_name -- Name of the table
  , column_name -- Name of the column
  , data_type -- Data type of the column
  , character_maximum_length -- Maximum length of character data type columns
  , is_nullable -- Indicates whether the column allows NULL values
  , column_default -- Default value of the column
from
    information_schema.columns
where
    table_name = '202302-divvy-tripdata' -- Filtering by a single table
    and table_schema = 'dbo'; -- Filter by the schema 'dbo'
```

| table_name            | column_name        | data_type | character_maximum_length | is_nullable | column_default |
|-----------------------|--------------------|-----------|--------------------------|-------------|----------------|
| 202302-divvy-tripdata | ride_id            | nvarchar  | 50                       | NO          | NULL           |
| 202302-divvy-tripdata | rideable_type      | nvarchar  | 50                       | YES         | NULL           |
| 202302-divvy-tripdata | started_at         | datetime2 | NULL                     | YES         | NULL           |
| 202302-divvy-tripdata | ended_at           | datetime2 | NULL                     | YES         | NULL           |
| 202302-divvy-tripdata | start_station_name | nvarchar  | 50                       | YES         | NULL           |
| 202302-divvy-tripdata | start_station_id   | nvarchar  | 50                       | YES         | NULL           |
| 202302-divvy-tripdata | end_station_name   | nvarchar  | 50                       | YES         | NULL           |
| 202302-divvy-tripdata | end_station_id     | nvarchar  | 50                       | YES         | NULL           |
| 202302-divvy-tripdata | start_lat          | float     | NULL                     | YES         | NULL           |
| 202302-divvy-tripdata | start_lng          | float     | NULL                     | YES         | NULL           |
| 202302-divvy-tripdata | end_lat            | float     | NULL                     | YES         | NULL           |
| 202302-divvy-tripdata | end_lng            | float     | NULL                     | YES         | NULL           |
| 202302-divvy-tripdata | member_casual      | nvarchar  | 50                       | YES         | NULL           |

**March 2023**
```sql
select
    table_name -- Name of the table
  , column_name -- Name of the column
  , data_type -- Data type of the column
  , character_maximum_length -- Maximum length of character data type columns
  , is_nullable -- Indicates whether the column allows NULL values
  , column_default -- Default value of the column
from
    information_schema.columns
where
    table_name = '202303-divvy-tripdata' -- Filtering by a single table
    and table_schema = 'dbo'; -- Filter by the schema 'dbo'
```

| table_name            | column_name        | data_type | character_maximum_length | is_nullable | column_default |
|-----------------------|--------------------|-----------|--------------------------|-------------|----------------|
| 202303-divvy-tripdata | ride_id            | nvarchar  | 50                       | NO          | NULL           |
| 202303-divvy-tripdata | rideable_type      | nvarchar  | 50                       | YES         | NULL           |
| 202303-divvy-tripdata | started_at         | datetime2 | NULL                     | YES         | NULL           |
| 202303-divvy-tripdata | ended_at           | datetime2 | NULL                     | YES         | NULL           |
| 202303-divvy-tripdata | start_station_name | nvarchar  | -1                       | YES         | NULL           |
| 202303-divvy-tripdata | start_station_id   | nvarchar  | 50                       | YES         | NULL           |
| 202303-divvy-tripdata | end_station_name   | nvarchar  | -1                       | YES         | NULL           |
| 202303-divvy-tripdata | end_station_id     | nvarchar  | 50                       | YES         | NULL           |
| 202303-divvy-tripdata | start_lat          | float     | NULL                     | YES         | NULL           |
| 202303-divvy-tripdata | start_lng          | float     | NULL                     | YES         | NULL           |
| 202303-divvy-tripdata | end_lat            | float     | NULL                     | YES         | NULL           |
| 202303-divvy-tripdata | end_lng            | float     | NULL                     | YES         | NULL           |
| 202303-divvy-tripdata | member_casual      | nvarchar  | 50                       | YES         | NULL           |

**April 2023**
```sql
select
    table_name -- Name of the table
  , column_name -- Name of the column
  , data_type -- Data type of the column
  , character_maximum_length -- Maximum length of character data type columns
  , is_nullable -- Indicates whether the column allows NULL values
  , column_default -- Default value of the column
from
    information_schema.columns
where
    table_name = '202304-divvy-tripdata' -- Filtering by a single table
    and table_schema = 'dbo'; -- Filter by the schema 'dbo'
```

| table_name            | column_name        | data_type | character_maximum_length | is_nullable | column_default |
|-----------------------|--------------------|-----------|--------------------------|-------------|----------------|
| 202304-divvy-tripdata | ride_id            | nvarchar  | 50                       | NO          | NULL           |
| 202304-divvy-tripdata | rideable_type      | nvarchar  | 50                       | YES         | NULL           |
| 202304-divvy-tripdata | started_at         | datetime2 | NULL                     | YES         | NULL           |
| 202304-divvy-tripdata | ended_at           | datetime2 | NULL                     | YES         | NULL           |
| 202304-divvy-tripdata | start_station_name | nvarchar  | -1                       | YES         | NULL           |
| 202304-divvy-tripdata | start_station_id   | nvarchar  | 50                       | YES         | NULL           |
| 202304-divvy-tripdata | end_station_name   | nvarchar  | -1                       | YES         | NULL           |
| 202304-divvy-tripdata | end_station_id     | nvarchar  | 50                       | YES         | NULL           |
| 202304-divvy-tripdata | start_lat          | float     | NULL                     | YES         | NULL           |
| 202304-divvy-tripdata | start_lng          | float     | NULL                     | YES         | NULL           |
| 202304-divvy-tripdata | end_lat            | float     | NULL                     | YES         | NULL           |
| 202304-divvy-tripdata | end_lng            | float     | NULL                     | YES         | NULL           |
| 202304-divvy-tripdata | member_casual      | nvarchar  | 50                       | YES         | NULL           |

**May 2023**
```sql
select
    table_name -- Name of the table
  , column_name -- Name of the column
  , data_type -- Data type of the column
  , character_maximum_length -- Maximum length of character data type columns
  , is_nullable -- Indicates whether the column allows NULL values
  , column_default -- Default value of the column
from
    information_schema.columns
where
    table_name = '202305-divvy-tripdata' -- Filtering by a single table
    and table_schema = 'dbo'; -- Filter by the schema 'dbo'
```

| table_name            | column_name        | data_type | character_maximum_length | is_nullable | column_default |
|-----------------------|--------------------|-----------|--------------------------|-------------|----------------|
| 202305-divvy-tripdata | ride_id            | nvarchar  | 50                       | NO          | NULL           |
| 202305-divvy-tripdata | rideable_type      | nvarchar  | 50                       | YES         | NULL           |
| 202305-divvy-tripdata | started_at         | datetime2 | NULL                     | YES         | NULL           |
| 202305-divvy-tripdata | ended_at           | datetime2 | NULL                     | YES         | NULL           |
| 202305-divvy-tripdata | start_station_name | nvarchar  | -1                       | YES         | NULL           |
| 202305-divvy-tripdata | start_station_id   | nvarchar  | 50                       | YES         | NULL           |
| 202305-divvy-tripdata | end_station_name   | nvarchar  | -1                       | YES         | NULL           |
| 202305-divvy-tripdata | end_station_id     | nvarchar  | 50                       | YES         | NULL           |
| 202305-divvy-tripdata | start_lat          | float     | NULL                     | YES         | NULL           |
| 202305-divvy-tripdata | start_lng          | float     | NULL                     | YES         | NULL           |
| 202305-divvy-tripdata | end_lat            | float     | NULL                     | YES         | NULL           |
| 202305-divvy-tripdata | end_lng            | float     | NULL                     | YES         | NULL           |
| 202305-divvy-tripdata | member_casual      | nvarchar  | 50                       | YES         | NULL           |

**June 2023**
```sql
select
    table_name -- Name of the table
  , column_name -- Name of the column
  , data_type -- Data type of the column
  , character_maximum_length -- Maximum length of character data type columns
  , is_nullable -- Indicates whether the column allows NULL values
  , column_default -- Default value of the column
from
    information_schema.columns
where
    table_name = '202306-divvy-tripdata' -- Filtering by a single table
    and table_schema = 'dbo'; -- Filter by the schema 'dbo'
```

| table_name            | column_name        | data_type | character_maximum_length | is_nullable | column_default |
|-----------------------|--------------------|-----------|--------------------------|-------------|----------------|
| 202306-divvy-tripdata | ride_id            | nvarchar  | 50                       | NO          | NULL           |
| 202306-divvy-tripdata | rideable_type      | nvarchar  | 50                       | YES         | NULL           |
| 202306-divvy-tripdata | started_at         | datetime2 | NULL                     | YES         | NULL           |
| 202306-divvy-tripdata | ended_at           | datetime2 | NULL                     | YES         | NULL           |
| 202306-divvy-tripdata | start_station_name | nvarchar  | -1                       | YES         | NULL           |
| 202306-divvy-tripdata | start_station_id   | nvarchar  | 50                       | YES         | NULL           |
| 202306-divvy-tripdata | end_station_name   | nvarchar  | -1                       | YES         | NULL           |
| 202306-divvy-tripdata | end_station_id     | nvarchar  | 50                       | YES         | NULL           |
| 202306-divvy-tripdata | start_lat          | float     | NULL                     | YES         | NULL           |
| 202306-divvy-tripdata | start_lng          | float     | NULL                     | YES         | NULL           |
| 202306-divvy-tripdata | end_lat            | float     | NULL                     | YES         | NULL           |
| 202306-divvy-tripdata | end_lng            | float     | NULL                     | YES         | NULL           |
| 202306-divvy-tripdata | member_casual      | nvarchar  | 50                       | YES         | NULL           |

**July 2023**
```sql
select
    table_name -- Name of the table
  , column_name -- Name of the column
  , data_type -- Data type of the column
  , character_maximum_length -- Maximum length of character data type columns
  , is_nullable -- Indicates whether the column allows NULL values
  , column_default -- Default value of the column
from
    information_schema.columns
where
    table_name = '202307-divvy-tripdata' -- Filtering by a single table
    and table_schema = 'dbo'; -- Filter by the schema 'dbo'
```

| table_name            | column_name        | data_type | character_maximum_length | is_nullable | column_default |
|-----------------------|--------------------|-----------|--------------------------|-------------|----------------|
| 202307-divvy-tripdata | ride_id            | nvarchar  | 50                       | YES         | NULL           |
| 202307-divvy-tripdata | rideable_type      | nvarchar  | 50                       | YES         | NULL           |
| 202307-divvy-tripdata | started_at         | datetime2 | NULL                     | YES         | NULL           |
| 202307-divvy-tripdata | ended_at           | datetime2 | NULL                     | YES         | NULL           |
| 202307-divvy-tripdata | start_station_name | nvarchar  | -1                       | YES         | NULL           |
| 202307-divvy-tripdata | start_station_id   | nvarchar  | 50                       | YES         | NULL           |
| 202307-divvy-tripdata | end_station_name   | nvarchar  | -1                       | YES         | NULL           |
| 202307-divvy-tripdata | end_station_id     | nvarchar  | 50                       | YES         | NULL           |
| 202307-divvy-tripdata | start_lat          | float     | NULL                     | YES         | NULL           |
| 202307-divvy-tripdata | start_lng          | float     | NULL                     | YES         | NULL           |
| 202307-divvy-tripdata | end_lat            | float     | NULL                     | YES         | NULL           |
| 202307-divvy-tripdata | end_lng            | float     | NULL                     | YES         | NULL           |
| 202307-divvy-tripdata | member_casual      | nvarchar  | 50                       | YES         | NULL           |

**August 2023**
```sql
select
    table_name -- Name of the table
  , column_name -- Name of the column
  , data_type -- Data type of the column
  , character_maximum_length -- Maximum length of character data type columns
  , is_nullable -- Indicates whether the column allows NULL values
  , column_default -- Default value of the column
from
    information_schema.columns
where
    table_name = '202308-divvy-tripdata' -- Filtering by a single table
    and table_schema = 'dbo'; -- Filter by the schema 'dbo'
```

| table_name            | column_name        | data_type | character_maximum_length | is_nullable | column_default |
|-----------------------|--------------------|-----------|--------------------------|-------------|----------------|
| 202308-divvy-tripdata | ride_id            | nvarchar  | 50                       | NO          | NULL           |
| 202308-divvy-tripdata | rideable_type      | nvarchar  | 50                       | YES         | NULL           |
| 202308-divvy-tripdata | started_at         | datetime2 | NULL                     | YES         | NULL           |
| 202308-divvy-tripdata | ended_at           | datetime2 | NULL                     | YES         | NULL           |
| 202308-divvy-tripdata | start_station_name | nvarchar  | -1                       | YES         | NULL           |
| 202308-divvy-tripdata | start_station_id   | nvarchar  | 50                       | YES         | NULL           |
| 202308-divvy-tripdata | end_station_name   | nvarchar  | -1                       | YES         | NULL           |
| 202308-divvy-tripdata | end_station_id     | nvarchar  | 50                       | YES         | NULL           |
| 202308-divvy-tripdata | start_lat          | float     | NULL                     | YES         | NULL           |
| 202308-divvy-tripdata | start_lng          | float     | NULL                     | YES         | NULL           |
| 202308-divvy-tripdata | end_lat            | float     | NULL                     | YES         | NULL           |
| 202308-divvy-tripdata | end_lng            | float     | NULL                     | YES         | NULL           |
| 202308-divvy-tripdata | member_casual      | nvarchar  | 50                       | YES         | NULL           |

**September 2023**
```sql
select
    table_name -- Name of the table
  , column_name -- Name of the column
  , data_type -- Data type of the column
  , character_maximum_length -- Maximum length of character data type columns
  , is_nullable -- Indicates whether the column allows NULL values
  , column_default -- Default value of the column
from
    information_schema.columns
where
    table_name = '202309-divvy-tripdata' -- Filtering by a single table
    and table_schema = 'dbo'; -- Filter by the schema 'dbo'
```

| table_name            | column_name        | data_type | character_maximum_length | is_nullable | column_default |
|-----------------------|--------------------|-----------|--------------------------|-------------|----------------|
| 202309-divvy-tripdata | ride_id            | nvarchar  | 50                       | NO          | NULL           |
| 202309-divvy-tripdata | rideable_type      | nvarchar  | 50                       | YES         | NULL           |
| 202309-divvy-tripdata | started_at         | datetime2 | NULL                     | YES         | NULL           |
| 202309-divvy-tripdata | ended_at           | datetime2 | NULL                     | YES         | NULL           |
| 202309-divvy-tripdata | start_station_name | nvarchar  | -1                       | YES         | NULL           |
| 202309-divvy-tripdata | start_station_id   | nvarchar  | 50                       | YES         | NULL           |
| 202309-divvy-tripdata | end_station_name   | nvarchar  | -1                       | YES         | NULL           |
| 202309-divvy-tripdata | end_station_id     | nvarchar  | 50                       | YES         | NULL           |
| 202309-divvy-tripdata | start_lat          | float     | NULL                     | YES         | NULL           |
| 202309-divvy-tripdata | start_lng          | float     | NULL                     | YES         | NULL           |
| 202309-divvy-tripdata | end_lat            | float     | NULL                     | YES         | NULL           |
| 202309-divvy-tripdata | end_lng            | float     | NULL                     | YES         | NULL           |
| 202309-divvy-tripdata | member_casual      | nvarchar  | 50                       | YES         | NULL           |

**October 2023**
```sql
select
    table_name -- Name of the table
  , column_name -- Name of the column
  , data_type -- Data type of the column
  , character_maximum_length -- Maximum length of character data type columns
  , is_nullable -- Indicates whether the column allows NULL values
  , column_default -- Default value of the column
from
    information_schema.columns
where
    table_name = '202310-divvy-tripdata' -- Filtering by a single table
    and table_schema = 'dbo'; -- Filter by the schema 'dbo'
```

| table_name            | column_name        | data_type | character_maximum_length | is_nullable | column_default |
|-----------------------|--------------------|-----------|--------------------------|-------------|----------------|
| 202310-divvy-tripdata | ride_id            | nvarchar  | 50                       | NO          | NULL           |
| 202310-divvy-tripdata | rideable_type      | nvarchar  | 50                       | YES         | NULL           |
| 202310-divvy-tripdata | started_at         | datetime2 | NULL                     | YES         | NULL           |
| 202310-divvy-tripdata | ended_at           | datetime2 | NULL                     | YES         | NULL           |
| 202310-divvy-tripdata | start_station_name | nvarchar  | -1                       | YES         | NULL           |
| 202310-divvy-tripdata | start_station_id   | nvarchar  | 50                       | YES         | NULL           |
| 202310-divvy-tripdata | end_station_name   | nvarchar  | -1                       | YES         | NULL           |
| 202310-divvy-tripdata | end_station_id     | nvarchar  | 50                       | YES         | NULL           |
| 202310-divvy-tripdata | start_lat          | float     | NULL                     | YES         | NULL           |
| 202310-divvy-tripdata | start_lng          | float     | NULL                     | YES         | NULL           |
| 202310-divvy-tripdata | end_lat            | float     | NULL                     | YES         | NULL           |
| 202310-divvy-tripdata | end_lng            | float     | NULL                     | YES         | NULL           |
| 202310-divvy-tripdata | member_casual      | nvarchar  | 50                       | YES         | NULL           |

**November 2023**
```sql
select
    table_name -- Name of the table
  , column_name -- Name of the column
  , data_type -- Data type of the column
  , character_maximum_length -- Maximum length of character data type columns
  , is_nullable -- Indicates whether the column allows NULL values
  , column_default -- Default value of the column
from
    information_schema.columns
where
    table_name = '202311-divvy-tripdata' -- Filtering by a single table
    and table_schema = 'dbo'; -- Filter by the schema 'dbo'
```

| table_name            | column_name        | data_type | character_maximum_length | is_nullable | column_default |
|-----------------------|--------------------|-----------|--------------------------|-------------|----------------|
| 202311-divvy-tripdata | ride_id            | nvarchar  | 50                       | NO          | NULL           |
| 202311-divvy-tripdata | rideable_type      | nvarchar  | 50                       | YES         | NULL           |
| 202311-divvy-tripdata | started_at         | datetime2 | NULL                     | YES         | NULL           |
| 202311-divvy-tripdata | ended_at           | datetime2 | NULL                     | YES         | NULL           |
| 202311-divvy-tripdata | start_station_name | nvarchar  | -1                       | YES         | NULL           |
| 202311-divvy-tripdata | start_station_id   | nvarchar  | 50                       | YES         | NULL           |
| 202311-divvy-tripdata | end_station_name   | nvarchar  | -1                       | YES         | NULL           |
| 202311-divvy-tripdata | end_station_id     | nvarchar  | 50                       | YES         | NULL           |
| 202311-divvy-tripdata | start_lat          | float     | NULL                     | YES         | NULL           |
| 202311-divvy-tripdata | start_lng          | float     | NULL                     | YES         | NULL           |
| 202311-divvy-tripdata | end_lat            | float     | NULL                     | YES         | NULL           |
| 202311-divvy-tripdata | end_lng            | float     | NULL                     | YES         | NULL           |
| 202311-divvy-tripdata | member_casual      | nvarchar  | 50                       | YES         | NULL           |

**December 2023**
```sql
select
    table_name -- Name of the table
  , column_name -- Name of the column
  , data_type -- Data type of the column
  , character_maximum_length -- Maximum length of character data type columns
  , is_nullable -- Indicates whether the column allows NULL values
  , column_default -- Default value of the column
from
    information_schema.columns
where
    table_name = '202312-divvy-tripdata' -- Filtering by a single table
    and table_schema = 'dbo'; -- Filter by the schema 'dbo'
```

| table_name            | column_name        | data_type | character_maximum_length | is_nullable | column_default |
|-----------------------|--------------------|-----------|--------------------------|-------------|----------------|
| 202312-divvy-tripdata | ride_id            | nvarchar  | 50                       | NO          | NULL           |
| 202312-divvy-tripdata | rideable_type      | nvarchar  | 50                       | YES         | NULL           |
| 202312-divvy-tripdata | started_at         | datetime2 | NULL                     | YES         | NULL           |
| 202312-divvy-tripdata | ended_at           | datetime2 | NULL                     | YES         | NULL           |
| 202312-divvy-tripdata | start_station_name | nvarchar  | -1                       | YES         | NULL           |
| 202312-divvy-tripdata | start_station_id   | nvarchar  | 50                       | YES         | NULL           |
| 202312-divvy-tripdata | end_station_name   | nvarchar  | -1                       | YES         | NULL           |
| 202312-divvy-tripdata | end_station_id     | nvarchar  | 50                       | YES         | NULL           |
| 202312-divvy-tripdata | start_lat          | float     | NULL                     | YES         | NULL           |
| 202312-divvy-tripdata | start_lng          | float     | NULL                     | YES         | NULL           |
| 202312-divvy-tripdata | end_lat            | float     | NULL                     | YES         | NULL           |
| 202312-divvy-tripdata | end_lng            | float     | NULL                     | YES         | NULL           |
| 202312-divvy-tripdata | member_casual      | nvarchar  | 50                       | YES         | NULL           |

#### Table Size Assessment
+ Computing the overall sum of rows present in each table.
```sql
select
    t.name as table_name -- Alias the name column from the sys.tables view as TableName
  , p.rows as row_counts -- Alias the rows column from the sys.partitions view as RowCounts
from
    sys.tables t -- Get information about tables from the sys.tables system catalog view
    inner join sys.partitions p on t.object_id = p.object_id -- Join the sys.tables and sys.partitions views based on object_id
where
    t.is_ms_shipped = 0 -- Filter out system tables (is_ms_shipped = 0 indicates user-defined tables)
    and p.index_id in (1, 0); -- Filter partitions based on index ID (1 for clustered index, 0 for heap)
```

| table_name            | row_counts  |
|-----------------------|-------------|
| 202301-divvy-tripdata | 190,301     |
| 202302-divvy-tripdata | 190,445     |
| 202303-divvy-tripdata | 258,678     |
| 202304-divvy-tripdata | 426,590     |
| 202305-divvy-tripdata | 604,827     |
| 202307-divvy-tripdata | 767,650     |
| 202306-divvy-tripdata | 719,618     |
| 202308-divvy-tripdata | 771,693     |
| 202309-divvy-tripdata | 666,371     |
| 202310-divvy-tripdata | 537,113     |
| 202311-divvy-tripdata | 362,518     |
| 202312-divvy-tripdata | 224,073     |

#### Complete Data Row Calculation
+ Computing the overall quantity of rows stored in the database.
```sql
select
    sum(p.rows) as total_row_count -- Calculate the sum of rows from the sys.partitions view and alias it as total_row_count
from
    sys.tables as t -- Get information about tables from the sys.tables system catalog view
  , sys.partitions as p -- Get information about partitions from the sys.partitions system catalog view
where
    t.object_id = p.object_id -- Join the sys.tables and sys.partitions views based on object_id
    and t.is_ms_shipped = 0 -- Filter out system tables (is_ms_shipped = 0 indicates user-defined tables)
    and p.index_id in (1, 0); -- Filter partitions based on index ID (1 for clustered index, 0 for heap)
```

| total_row_count   |
|-------------------|
| 5,719,877         |

#### NULL Value Identification
+ Examining the frequency of NULL values inside individual columns and calculating the overall number throughout each table.
**January 2023**
```sql
select
    -- Count NULL values for each column
    sum(case when ride_id is null then 1 else 0 end) as ride_id_null
  , sum(case when rideable_type is null then 1 else 0 end) as rideable_type_null
  , sum(case when started_at is null then 1 else 0 end) as started_at_null
  , sum(case when ended_at is null then 1 else 0 end) as ended_at_null
  , sum(case when start_station_name is null then 1 else 0 end) as start_station_name_null
  , sum(case when start_station_id is null then 1 else 0 end) as start_station_id_null
  , sum(case when end_station_name is null then 1 else 0 end) as end_station_name_null
  , sum(case when end_station_id is null then 1 else 0 end) as end_station_id_null
  , sum(case when start_lat is null then 1 else 0 end) as start_lat_null
  , sum(case when start_lng is null then 1 else 0 end) as start_lng_null
  , sum(case when end_lat is null then 1 else 0 end) as end_lat_null
  , sum(case when end_lng is null then 1 else 0 end) as end_lng_null
  , sum(case when member_casual is null then 1 else 0 end) as member_casual_null
  -- Count total number of NULL values
  , sum(
        case when ride_id is null then 1 else 0 end +
        case when rideable_type is null then 1 else 0 end +
        case when started_at is null then 1 else 0 end +
        case when ended_at is null then 1 else 0 end +
        case when start_station_name is null then 1 else 0 end +
        case when start_station_id is null then 1 else 0 end +
        case when end_station_name is null then 1 else 0 end +
        case when end_station_id is null then 1 else 0 end +
        case when start_lat is null then 1 else 0 end +
        case when start_lng is null then 1 else 0 end +
        case when end_lat is null then 1 else 0 end +
        case when end_lng is null then 1 else 0 end +
        case when member_casual is null then 1 else 0 end
      ) as totalnullcount
from
    [dbo].[202301-divvy-tripdata];
```

| ride_id_null | rideable_type_null | started_at_null | ended_at_null | start_station_name_null | start_station_id_null | end_station_name_null | end_station_id_null | start_lat_null | start_lng_null | end_lat_null | end_lng_null | member_casual_null | totalnullcount |
|--------------|--------------------|-----------------|---------------|-------------------------|-----------------------|-----------------------|---------------------|----------------|----------------|--------------|--------------|--------------------|----------------|
| 0            | 0                  | 0               | 0             | 26,721                  | 26,721                | 27,840                | 27,840              | 0              | 0              | 127          | 127          | 0                  | 109,376        |

**February 2023**
```sql
select
    -- Count NULL values for each column
    sum(case when ride_id is null then 1 else 0 end) as ride_id_null
  , sum(case when rideable_type is null then 1 else 0 end) as rideable_type_null
  , sum(case when started_at is null then 1 else 0 end) as started_at_null
  , sum(case when ended_at is null then 1 else 0 end) as ended_at_null
  , sum(case when start_station_name is null then 1 else 0 end) as start_station_name_null
  , sum(case when start_station_id is null then 1 else 0 end) as start_station_id_null
  , sum(case when end_station_name is null then 1 else 0 end) as end_station_name_null
  , sum(case when end_station_id is null then 1 else 0 end) as end_station_id_null
  , sum(case when start_lat is null then 1 else 0 end) as start_lat_null
  , sum(case when start_lng is null then 1 else 0 end) as start_lng_null
  , sum(case when end_lat is null then 1 else 0 end) as end_lat_null
  , sum(case when end_lng is null then 1 else 0 end) as end_lng_null
  , sum(case when member_casual is null then 1 else 0 end) as member_casual_null
  -- Count total number of NULL values
  , sum(
        case when ride_id is null then 1 else 0 end +
        case when rideable_type is null then 1 else 0 end +
        case when started_at is null then 1 else 0 end +
        case when ended_at is null then 1 else 0 end +
        case when start_station_name is null then 1 else 0 end +
        case when start_station_id is null then 1 else 0 end +
        case when end_station_name is null then 1 else 0 end +
        case when end_station_id is null then 1 else 0 end +
        case when start_lat is null then 1 else 0 end +
        case when start_lng is null then 1 else 0 end +
        case when end_lat is null then 1 else 0 end +
        case when end_lng is null then 1 else 0 end +
        case when member_casual is null then 1 else 0 end
      ) as totalnullcount
from
    [dbo].[202302-divvy-tripdata];
```

| ride_id_null | rideable_type_null | started_at_null | ended_at_null | start_station_name_null | start_station_id_null | end_station_name_null | end_station_id_null | start_lat_null | start_lng_null | end_lat_null | end_lng_null | member_casual_null | totalnullcount |
|--------------|--------------------|-----------------|---------------|-------------------------|-----------------------|-----------------------|---------------------|----------------|----------------|--------------|--------------|--------------------|----------------|
| 0            | 0                  | 0               | 0             | 25,473                  | 25,605                | 26,738                | 26,879              | 0              | 0              | 116          | 116          | 0                  | 104,927        |

**March 2023**
```sql
select
    -- Count NULL values for each column
    sum(case when ride_id is null then 1 else 0 end) as ride_id_null
  , sum(case when rideable_type is null then 1 else 0 end) as rideable_type_null
  , sum(case when started_at is null then 1 else 0 end) as started_at_null
  , sum(case when ended_at is null then 1 else 0 end) as ended_at_null
  , sum(case when start_station_name is null then 1 else 0 end) as start_station_name_null
  , sum(case when start_station_id is null then 1 else 0 end) as start_station_id_null
  , sum(case when end_station_name is null then 1 else 0 end) as end_station_name_null
  , sum(case when end_station_id is null then 1 else 0 end) as end_station_id_null
  , sum(case when start_lat is null then 1 else 0 end) as start_lat_null
  , sum(case when start_lng is null then 1 else 0 end) as start_lng_null
  , sum(case when end_lat is null then 1 else 0 end) as end_lat_null
  , sum(case when end_lng is null then 1 else 0 end) as end_lng_null
  , sum(case when member_casual is null then 1 else 0 end) as member_casual_null
  -- Count total number of NULL values
  , sum(
        case when ride_id is null then 1 else 0 end +
        case when rideable_type is null then 1 else 0 end +
        case when started_at is null then 1 else 0 end +
        case when ended_at is null then 1 else 0 end +
        case when start_station_name is null then 1 else 0 end +
        case when start_station_id is null then 1 else 0 end +
        case when end_station_name is null then 1 else 0 end +
        case when end_station_id is null then 1 else 0 end +
        case when start_lat is null then 1 else 0 end +
        case when start_lng is null then 1 else 0 end +
        case when end_lat is null then 1 else 0 end +
        case when end_lng is null then 1 else 0 end +
        case when member_casual is null then 1 else 0 end
      ) as totalnullcount
from
    [dbo].[202303-divvy-tripdata];
```

| ride_id_null | rideable_type_null | started_at_null | ended_at_null | start_station_name_null | start_station_id_null | end_station_name_null | end_station_id_null | start_lat_null | start_lng_null | end_lat_null | end_lng_null | member_casual_null | totalnullcount |
|--------------|--------------------|-----------------|---------------|-------------------------|-----------------------|-----------------------|---------------------|----------------|----------------|--------------|--------------|--------------------|----------------|
| 0            | 0                  | 0               | 0             | 35,910                  | 35,910                | 38,438                | 38,438              | 0              | 0              | 183          | 183          | 0                  | 149,062        |

**April 2023**
```sql
select
    -- Count NULL values for each column
    sum(case when ride_id is null then 1 else 0 end) as ride_id_null
  , sum(case when rideable_type is null then 1 else 0 end) as rideable_type_null
  , sum(case when started_at is null then 1 else 0 end) as started_at_null
  , sum(case when ended_at is null then 1 else 0 end) as ended_at_null
  , sum(case when start_station_name is null then 1 else 0 end) as start_station_name_null
  , sum(case when start_station_id is null then 1 else 0 end) as start_station_id_null
  , sum(case when end_station_name is null then 1 else 0 end) as end_station_name_null
  , sum(case when end_station_id is null then 1 else 0 end) as end_station_id_null
  , sum(case when start_lat is null then 1 else 0 end) as start_lat_null
  , sum(case when start_lng is null then 1 else 0 end) as start_lng_null
  , sum(case when end_lat is null then 1 else 0 end) as end_lat_null
  , sum(case when end_lng is null then 1 else 0 end) as end_lng_null
  , sum(case when member_casual is null then 1 else 0 end) as member_casual_null
  -- Count total number of NULL values
  , sum(
        case when ride_id is null then 1 else 0 end +
        case when rideable_type is null then 1 else 0 end +
        case when started_at is null then 1 else 0 end +
        case when ended_at is null then 1 else 0 end +
        case when start_station_name is null then 1 else 0 end +
        case when start_station_id is null then 1 else 0 end +
        case when end_station_name is null then 1 else 0 end +
        case when end_station_id is null then 1 else 0 end +
        case when start_lat is null then 1 else 0 end +
        case when start_lng is null then 1 else 0 end +
        case when end_lat is null then 1 else 0 end +
        case when end_lng is null then 1 else 0 end +
        case when member_casual is null then 1 else 0 end
      ) as totalnullcount
from
    [dbo].[202304-divvy-tripdata];
```

| ride_id_null | rideable_type_null | started_at_null | ended_at_null | start_station_name_null | start_station_id_null | end_station_name_null | end_station_id_null | start_lat_null | start_lng_null | end_lat_null | end_lng_null | member_casual_null | totalnullcount |
|--------------|--------------------|-----------------|---------------|-------------------------|-----------------------|-----------------------|---------------------|----------------|----------------|--------------|--------------|--------------------|----------------|
| 0            | 0                  | 0               | 0             | 63,814                  | 63,814                | 68,630                | 68,630              | 0              | 0              | 435          | 435          | 0                  | 265,758        |

**May 2023**
```sql
select
    -- Count NULL values for each column
    sum(case when ride_id is null then 1 else 0 end) as ride_id_null
  , sum(case when rideable_type is null then 1 else 0 end) as rideable_type_null
  , sum(case when started_at is null then 1 else 0 end) as started_at_null
  , sum(case when ended_at is null then 1 else 0 end) as ended_at_null
  , sum(case when start_station_name is null then 1 else 0 end) as start_station_name_null
  , sum(case when start_station_id is null then 1 else 0 end) as start_station_id_null
  , sum(case when end_station_name is null then 1 else 0 end) as end_station_name_null
  , sum(case when end_station_id is null then 1 else 0 end) as end_station_id_null
  , sum(case when start_lat is null then 1 else 0 end) as start_lat_null
  , sum(case when start_lng is null then 1 else 0 end) as start_lng_null
  , sum(case when end_lat is null then 1 else 0 end) as end_lat_null
  , sum(case when end_lng is null then 1 else 0 end) as end_lng_null
  , sum(case when member_casual is null then 1 else 0 end) as member_casual_null
  -- Count total number of NULL values
  , sum(
        case when ride_id is null then 1 else 0 end +
        case when rideable_type is null then 1 else 0 end +
        case when started_at is null then 1 else 0 end +
        case when ended_at is null then 1 else 0 end +
        case when start_station_name is null then 1 else 0 end +
        case when start_station_id is null then 1 else 0 end +
        case when end_station_name is null then 1 else 0 end +
        case when end_station_id is null then 1 else 0 end +
        case when start_lat is null then 1 else 0 end +
        case when start_lng is null then 1 else 0 end +
        case when end_lat is null then 1 else 0 end +
        case when end_lng is null then 1 else 0 end +
        case when member_casual is null then 1 else 0 end
      ) as totalnullcount
from
    [dbo].[202305-divvy-tripdata];
```

| ride_id_null | rideable_type_null | started_at_null | ended_at_null | start_station_name_null | start_station_id_null | end_station_name_null | end_station_id_null | start_lat_null | start_lng_null | end_lat_null | end_lng_null | member_casual_null | totalnullcount |
|--------------|--------------------|-----------------|---------------|-------------------------|-----------------------|-----------------------|---------------------|----------------|----------------|--------------|--------------|--------------------|----------------|
| 0            | 0                  | 0               | 0             | 89,240                  | 89,240                | 95,267                | 95,267              | 0              | 0              | 710          | 710          | 0                  | 370,434        |

**June 2023**
```sql
select
    -- Count NULL values for each column
    sum(case when ride_id is null then 1 else 0 end) as ride_id_null
  , sum(case when rideable_type is null then 1 else 0 end) as rideable_type_null
  , sum(case when started_at is null then 1 else 0 end) as started_at_null
  , sum(case when ended_at is null then 1 else 0 end) as ended_at_null
  , sum(case when start_station_name is null then 1 else 0 end) as start_station_name_null
  , sum(case when start_station_id is null then 1 else 0 end) as start_station_id_null
  , sum(case when end_station_name is null then 1 else 0 end) as end_station_name_null
  , sum(case when end_station_id is null then 1 else 0 end) as end_station_id_null
  , sum(case when start_lat is null then 1 else 0 end) as start_lat_null
  , sum(case when start_lng is null then 1 else 0 end) as start_lng_null
  , sum(case when end_lat is null then 1 else 0 end) as end_lat_null
  , sum(case when end_lng is null then 1 else 0 end) as end_lng_null
  , sum(case when member_casual is null then 1 else 0 end) as member_casual_null
  -- Count total number of NULL values
  , sum(
        case when ride_id is null then 1 else 0 end +
        case when rideable_type is null then 1 else 0 end +
        case when started_at is null then 1 else 0 end +
        case when ended_at is null then 1 else 0 end +
        case when start_station_name is null then 1 else 0 end +
        case when start_station_id is null then 1 else 0 end +
        case when end_station_name is null then 1 else 0 end +
        case when end_station_id is null then 1 else 0 end +
        case when start_lat is null then 1 else 0 end +
        case when start_lng is null then 1 else 0 end +
        case when end_lat is null then 1 else 0 end +
        case when end_lng is null then 1 else 0 end +
        case when member_casual is null then 1 else 0 end
      ) as totalnullcount
from
    [dbo].[202306-divvy-tripdata];
```

| ride_id_null | rideable_type_null | started_at_null | ended_at_null | start_station_name_null | start_station_id_null | end_station_name_null | end_station_id_null | start_lat_null | start_lng_null | end_lat_null | end_lng_null | member_casual_null | totalnullcount |
|--------------|--------------------|-----------------|---------------|-------------------------|-----------------------|-----------------------|---------------------|----------------|----------------|--------------|--------------|--------------------|----------------|
| 0            | 0                  | 0               | 0             | 116,259                 | 116,259               | 124,050               | 124,050             | 0              | 0              | 889          | 889          | 0                  | 482,396        |

**July 2023**
```sql
select
    -- Count NULL values for each column
    sum(case when ride_id is null then 1 else 0 end) as ride_id_null
  , sum(case when rideable_type is null then 1 else 0 end) as rideable_type_null
  , sum(case when started_at is null then 1 else 0 end) as started_at_null
  , sum(case when ended_at is null then 1 else 0 end) as ended_at_null
  , sum(case when start_station_name is null then 1 else 0 end) as start_station_name_null
  , sum(case when start_station_id is null then 1 else 0 end) as start_station_id_null
  , sum(case when end_station_name is null then 1 else 0 end) as end_station_name_null
  , sum(case when end_station_id is null then 1 else 0 end) as end_station_id_null
  , sum(case when start_lat is null then 1 else 0 end) as start_lat_null
  , sum(case when start_lng is null then 1 else 0 end) as start_lng_null
  , sum(case when end_lat is null then 1 else 0 end) as end_lat_null
  , sum(case when end_lng is null then 1 else 0 end) as end_lng_null
  , sum(case when member_casual is null then 1 else 0 end) as member_casual_null
  -- Count total number of NULL values
  , sum(
        case when ride_id is null then 1 else 0 end +
        case when rideable_type is null then 1 else 0 end +
        case when started_at is null then 1 else 0 end +
        case when ended_at is null then 1 else 0 end +
        case when start_station_name is null then 1 else 0 end +
        case when start_station_id is null then 1 else 0 end +
        case when end_station_name is null then 1 else 0 end +
        case when end_station_id is null then 1 else 0 end +
        case when start_lat is null then 1 else 0 end +
        case when start_lng is null then 1 else 0 end +
        case when end_lat is null then 1 else 0 end +
        case when end_lng is null then 1 else 0 end +
        case when member_casual is null then 1 else 0 end
      ) as totalnullcount
from
    [dbo].[202307-divvy-tripdata];
```

| ride_id_null | rideable_type_null | started_at_null | ended_at_null | start_station_name_null | start_station_id_null | end_station_name_null | end_station_id_null | start_lat_null | start_lng_null | end_lat_null | end_lng_null | member_casual_null | totalnullcount |
|--------------|--------------------|-----------------|---------------|-------------------------|-----------------------|-----------------------|---------------------|----------------|----------------|--------------|--------------|--------------------|----------------|
| 0            | 0                  | 0               | 0             | 122,943                 | 122,943               | 130,304               | 130,304             | 0              | 0              | 1,254        | 1,254        | 0                  | 509,002        |

**August 2023**
```sql
select
    -- Count NULL values for each column
    sum(case when ride_id is null then 1 else 0 end) as ride_id_null
  , sum(case when rideable_type is null then 1 else 0 end) as rideable_type_null
  , sum(case when started_at is null then 1 else 0 end) as started_at_null
  , sum(case when ended_at is null then 1 else 0 end) as ended_at_null
  , sum(case when start_station_name is null then 1 else 0 end) as start_station_name_null
  , sum(case when start_station_id is null then 1 else 0 end) as start_station_id_null
  , sum(case when end_station_name is null then 1 else 0 end) as end_station_name_null
  , sum(case when end_station_id is null then 1 else 0 end) as end_station_id_null
  , sum(case when start_lat is null then 1 else 0 end) as start_lat_null
  , sum(case when start_lng is null then 1 else 0 end) as start_lng_null
  , sum(case when end_lat is null then 1 else 0 end) as end_lat_null
  , sum(case when end_lng is null then 1 else 0 end) as end_lng_null
  , sum(case when member_casual is null then 1 else 0 end) as member_casual_null
  -- Count total number of NULL values
  , sum(
        case when ride_id is null then 1 else 0 end +
        case when rideable_type is null then 1 else 0 end +
        case when started_at is null then 1 else 0 end +
        case when ended_at is null then 1 else 0 end +
        case when start_station_name is null then 1 else 0 end +
        case when start_station_id is null then 1 else 0 end +
        case when end_station_name is null then 1 else 0 end +
        case when end_station_id is null then 1 else 0 end +
        case when start_lat is null then 1 else 0 end +
        case when start_lng is null then 1 else 0 end +
        case when end_lat is null then 1 else 0 end +
        case when end_lng is null then 1 else 0 end +
        case when member_casual is null then 1 else 0 end
      ) as totalnullcount
from
    [dbo].[202308-divvy-tripdata];
```

| ride_id_null | rideable_type_null | started_at_null | ended_at_null | start_station_name_null | start_station_id_null | end_station_name_null | end_station_id_null | start_lat_null | start_lng_null | end_lat_null | end_lng_null | member_casual_null | totalnullcount |
|--------------|--------------------|-----------------|---------------|-------------------------|-----------------------|-----------------------|---------------------|----------------|----------------|--------------|--------------|--------------------|----------------|
| 0            | 0                  | 0               | 0             | 118,919                 | 118,919               | 125,568               | 125,568             | 0              | 0              | 1,257        | 1,257        | 0                  | 491,488        |

**September 2023**
```sql
select
    -- Count NULL values for each column
    sum(case when ride_id is null then 1 else 0 end) as ride_id_null
  , sum(case when rideable_type is null then 1 else 0 end) as rideable_type_null
  , sum(case when started_at is null then 1 else 0 end) as started_at_null
  , sum(case when ended_at is null then 1 else 0 end) as ended_at_null
  , sum(case when start_station_name is null then 1 else 0 end) as start_station_name_null
  , sum(case when start_station_id is null then 1 else 0 end) as start_station_id_null
  , sum(case when end_station_name is null then 1 else 0 end) as end_station_name_null
  , sum(case when end_station_id is null then 1 else 0 end) as end_station_id_null
  , sum(case when start_lat is null then 1 else 0 end) as start_lat_null
  , sum(case when start_lng is null then 1 else 0 end) as start_lng_null
  , sum(case when end_lat is null then 1 else 0 end) as end_lat_null
  , sum(case when end_lng is null then 1 else 0 end) as end_lng_null
  , sum(case when member_casual is null then 1 else 0 end) as member_casual_null
  -- Count total number of NULL values
  , sum(
        case when ride_id is null then 1 else 0 end +
        case when rideable_type is null then 1 else 0 end +
        case when started_at is null then 1 else 0 end +
        case when ended_at is null then 1 else 0 end +
        case when start_station_name is null then 1 else 0 end +
        case when start_station_id is null then 1 else 0 end +
        case when end_station_name is null then 1 else 0 end +
        case when end_station_id is null then 1 else 0 end +
        case when start_lat is null then 1 else 0 end +
        case when start_lng is null then 1 else 0 end +
        case when end_lat is null then 1 else 0 end +
        case when end_lng is null then 1 else 0 end +
        case when member_casual is null then 1 else 0 end
      ) as totalnullcount
from
    [dbo].[202309-divvy-tripdata];
```

| ride_id_null | rideable_type_null | started_at_null | ended_at_null | start_station_name_null | start_station_id_null | end_station_name_null | end_station_id_null | start_lat_null | start_lng_null | end_lat_null | end_lng_null | member_casual_null | totalnullcount |
|--------------|--------------------|-----------------|---------------|-------------------------|-----------------------|-----------------------|---------------------|----------------|----------------|--------------|--------------|--------------------|----------------|
| 0            | 0                  | 0               | 0             | 101,312                 | 101,312               | 107,291               | 107,291             | 0              | 0              | 838          | 838          | 0                  | 418,882        |

**October 2023**
```sql
select
    -- Count NULL values for each column
    sum(case when ride_id is null then 1 else 0 end) as ride_id_null
  , sum(case when rideable_type is null then 1 else 0 end) as rideable_type_null
  , sum(case when started_at is null then 1 else 0 end) as started_at_null
  , sum(case when ended_at is null then 1 else 0 end) as ended_at_null
  , sum(case when start_station_name is null then 1 else 0 end) as start_station_name_null
  , sum(case when start_station_id is null then 1 else 0 end) as start_station_id_null
  , sum(case when end_station_name is null then 1 else 0 end) as end_station_name_null
  , sum(case when end_station_id is null then 1 else 0 end) as end_station_id_null
  , sum(case when start_lat is null then 1 else 0 end) as start_lat_null
  , sum(case when start_lng is null then 1 else 0 end) as start_lng_null
  , sum(case when end_lat is null then 1 else 0 end) as end_lat_null
  , sum(case when end_lng is null then 1 else 0 end) as end_lng_null
  , sum(case when member_casual is null then 1 else 0 end) as member_casual_null
  -- Count total number of NULL values
  , sum(
        case when ride_id is null then 1 else 0 end +
        case when rideable_type is null then 1 else 0 end +
        case when started_at is null then 1 else 0 end +
        case when ended_at is null then 1 else 0 end +
        case when start_station_name is null then 1 else 0 end +
        case when start_station_id is null then 1 else 0 end +
        case when end_station_name is null then 1 else 0 end +
        case when end_station_id is null then 1 else 0 end +
        case when start_lat is null then 1 else 0 end +
        case when start_lng is null then 1 else 0 end +
        case when end_lat is null then 1 else 0 end +
        case when end_lng is null then 1 else 0 end +
        case when member_casual is null then 1 else 0 end
      ) as totalnullcount
from
    [dbo].[202310-divvy-tripdata];
```

| ride_id_null | rideable_type_null | started_at_null | ended_at_null | start_station_name_null | start_station_id_null | end_station_name_null | end_station_id_null | start_lat_null | start_lng_null | end_lat_null | end_lng_null | member_casual_null | totalnullcount |
|--------------|--------------------|-----------------|---------------|-------------------------|-----------------------|-----------------------|---------------------|----------------|----------------|--------------|--------------|--------------------|----------------|
| 0            | 0                  | 0               | 0             | 84,412                  | 84,412                | 89,253                | 89,253              | 0              | 0              | 592          | 592          | 0                  | 348,514        |

**November 2023**
```sql
select
    -- Count NULL values for each column
    sum(case when ride_id is null then 1 else 0 end) as ride_id_null
  , sum(case when rideable_type is null then 1 else 0 end) as rideable_type_null
  , sum(case when started_at is null then 1 else 0 end) as started_at_null
  , sum(case when ended_at is null then 1 else 0 end) as ended_at_null
  , sum(case when start_station_name is null then 1 else 0 end) as start_station_name_null
  , sum(case when start_station_id is null then 1 else 0 end) as start_station_id_null
  , sum(case when end_station_name is null then 1 else 0 end) as end_station_name_null
  , sum(case when end_station_id is null then 1 else 0 end) as end_station_id_null
  , sum(case when start_lat is null then 1 else 0 end) as start_lat_null
  , sum(case when start_lng is null then 1 else 0 end) as start_lng_null
  , sum(case when end_lat is null then 1 else 0 end) as end_lat_null
  , sum(case when end_lng is null then 1 else 0 end) as end_lng_null
  , sum(case when member_casual is null then 1 else 0 end) as member_casual_null
  -- Count total number of NULL values
  , sum(
        case when ride_id is null then 1 else 0 end +
        case when rideable_type is null then 1 else 0 end +
        case when started_at is null then 1 else 0 end +
        case when ended_at is null then 1 else 0 end +
        case when start_station_name is null then 1 else 0 end +
        case when start_station_id is null then 1 else 0 end +
        case when end_station_name is null then 1 else 0 end +
        case when end_station_id is null then 1 else 0 end +
        case when start_lat is null then 1 else 0 end +
        case when start_lng is null then 1 else 0 end +
        case when end_lat is null then 1 else 0 end +
        case when end_lng is null then 1 else 0 end +
        case when member_casual is null then 1 else 0 end
      ) as totalnullcount
from
    [dbo].[202311-divvy-tripdata];
```

| ride_id_null | rideable_type_null | started_at_null | ended_at_null | start_station_name_null | start_station_id_null | end_station_name_null | end_station_id_null | start_lat_null | start_lng_null | end_lat_null | end_lng_null | member_casual_null | totalnullcount |
|--------------|--------------------|-----------------|---------------|-------------------------|-----------------------|-----------------------|---------------------|----------------|----------------|--------------|--------------|--------------------|----------------|
| 0            | 0                  | 0               | 0             | 55,003                  | 55,003                | 57,899                | 57,899              | 0              | 0              | 350          | 350          | 0                  | 226,504        |

**December 2023**
```sql
select
    -- Count NULL values for each column
    sum(case when ride_id is null then 1 else 0 end) as ride_id_null
  , sum(case when rideable_type is null then 1 else 0 end) as rideable_type_null
  , sum(case when started_at is null then 1 else 0 end) as started_at_null
  , sum(case when ended_at is null then 1 else 0 end) as ended_at_null
  , sum(case when start_station_name is null then 1 else 0 end) as start_station_name_null
  , sum(case when start_station_id is null then 1 else 0 end) as start_station_id_null
  , sum(case when end_station_name is null then 1 else 0 end) as end_station_name_null
  , sum(case when end_station_id is null then 1 else 0 end) as end_station_id_null
  , sum(case when start_lat is null then 1 else 0 end) as start_lat_null
  , sum(case when start_lng is null then 1 else 0 end) as start_lng_null
  , sum(case when end_lat is null then 1 else 0 end) as end_lat_null
  , sum(case when end_lng is null then 1 else 0 end) as end_lng_null
  , sum(case when member_casual is null then 1 else 0 end) as member_casual_null
  -- Count total number of NULL values
  , sum(
        case when ride_id is null then 1 else 0 end +
        case when rideable_type is null then 1 else 0 end +
        case when started_at is null then 1 else 0 end +
        case when ended_at is null then 1 else 0 end +
        case when start_station_name is null then 1 else 0 end +
        case when start_station_id is null then 1 else 0 end +
        case when end_station_name is null then 1 else 0 end +
        case when end_station_id is null then 1 else 0 end +
        case when start_lat is null then 1 else 0 end +
        case when start_lng is null then 1 else 0 end +
        case when end_lat is null then 1 else 0 end +
        case when end_lng is null then 1 else 0 end +
        case when member_casual is null then 1 else 0 end
      ) as totalnullcount
from
    [dbo].[202312-divvy-tripdata];
```

| ride_id_null | rideable_type_null | started_at_null | ended_at_null | start_station_name_null | start_station_id_null | end_station_name_null | end_station_id_null | start_lat_null | start_lng_null | end_lat_null | end_lng_null | member_casual_null | totalnullcount |
|--------------|--------------------|-----------------|---------------|-------------------------|-----------------------|-----------------------|---------------------|----------------|----------------|--------------|--------------|--------------------|----------------|
| 0            | 0                  | 0               | 0             | 35,710                  | 35,710                | 37,924                | 37,924              | 0              | 0              | 239          | 239          | 0                  | 147,746        |

#### Blank Value Identification
+ Examining the absence of blank values in particular columns across several tables, and integrating the results.
```sql
select
    '202301-divvy-tripdata' as table_name
  , count(*) as totalblankcount
from
    [dbo].[202301-divvy-tripdata]
where
    -- Check if each column is blank using COALESCE and NULLIF functions
    coalesce(nullif(ride_id, ''), '') = ''
    and coalesce(nullif(rideable_type, ''), '') = ''
    and coalesce(nullif(started_at, ''), '') = ''
    and coalesce(nullif(ended_at, ''), '') = ''
    and coalesce(nullif(start_station_name, ''), '') = ''
    and coalesce(nullif(start_station_id, ''), '') = ''
    and coalesce(nullif(end_station_name, ''), '') = ''
    and coalesce(nullif(end_station_id, ''), '') = ''
    and coalesce(nullif(member_casual, ''), '') = ''
    -- Combine the results with the results from other tables using UNION ALL
union all
select
    '202302-divvy-tripdata' as table_name
  , count(*) as totalblankcount
from
    [dbo].[202302-divvy-tripdata]
where
    coalesce(nullif(ride_id, ''), '') = ''
    and coalesce(nullif(rideable_type, ''), '') = ''
    and coalesce(nullif(started_at, ''), '') = ''
    and coalesce(nullif(ended_at, ''), '') = ''
    and coalesce(nullif(start_station_name, ''), '') = ''
    and coalesce(nullif(start_station_id, ''), '') = ''
    and coalesce(nullif(end_station_name, ''), '') = ''
    and coalesce(nullif(end_station_id, ''), '') = ''
    and coalesce(nullif(member_casual, ''), '') = ''
union all
select
    '202303-divvy-tripdata' as table_name
  , count(*) as totalblankcount
from
    [dbo].[202303-divvy-tripdata]
where
    coalesce(nullif(ride_id, ''), '') = ''
    and coalesce(nullif(rideable_type, ''), '') = ''
    and coalesce(nullif(started_at, ''), '') = ''
    and coalesce(nullif(ended_at, ''), '') = ''
    and coalesce(nullif(start_station_name, ''), '') = ''
    and coalesce(nullif(start_station_id, ''), '') = ''
    and coalesce(nullif(end_station_name, ''), '') = ''
    and coalesce(nullif(end_station_id, ''), '') = ''
    and coalesce(nullif(member_casual, ''), '') = ''
union all
select
    '202304-divvy-tripdata' as table_name
  , count(*) as totalblankcount
from
    [dbo].[202304-divvy-tripdata]
where
    coalesce(nullif(ride_id, ''), '') = ''
    and coalesce(nullif(rideable_type, ''), '') = ''
    and coalesce(nullif(started_at, ''), '') = ''
    and coalesce(nullif(ended_at, ''), '') = ''
    and coalesce(nullif(start_station_name, ''), '') = ''
    and coalesce(nullif(start_station_id, ''), '') = ''
    and coalesce(nullif(end_station_name, ''), '') = ''
    and coalesce(nullif(end_station_id, ''), '') = ''
    and coalesce(nullif(member_casual, ''), '') = ''
union all
select
    '202305-divvy-tripdata' as table_name
  , count(*) as totalblankcount
from
    [dbo].[202305-divvy-tripdata]
where
    coalesce(nullif(ride_id, ''), '') = ''
    and coalesce(nullif(rideable_type, ''), '') = ''
    and coalesce(nullif(started_at, ''), '') = ''
    and coalesce(nullif(ended_at, ''), '') = ''
    and coalesce(nullif(start_station_name, ''), '') = ''
    and coalesce(nullif(start_station_id, ''), '') = ''
    and coalesce(nullif(end_station_name, ''), '') = ''
    and coalesce(nullif(end_station_id, ''), '') = ''
    and coalesce(nullif(member_casual, ''), '') = ''
union all
select
    '202306-divvy-tripdata' as table_name
  , count(*) as totalblankcount
from
    [dbo].[202306-divvy-tripdata]
where
    coalesce(nullif(ride_id, ''), '') = ''
    and coalesce(nullif(rideable_type, ''), '') = ''
    and coalesce(nullif(started_at, ''), '') = ''
    and coalesce(nullif(ended_at, ''), '') = ''
    and coalesce(nullif(start_station_name, ''), '') = ''
    and coalesce(nullif(start_station_id, ''), '') = ''
    and coalesce(nullif(end_station_name, ''), '') = ''
    and coalesce(nullif(end_station_id, ''), '') = ''
    and coalesce(nullif(member_casual, ''), '') = ''
union all
select
    '202307-divvy-tripdata' as table_name
  , count(*) as totalblankcount
from
    [dbo].[202307-divvy-tripdata]
where
    coalesce(nullif(ride_id, ''), '') = ''
    and coalesce(nullif(rideable_type, ''), '') = ''
    and coalesce(nullif(started_at, ''), '') = ''
    and coalesce(nullif(ended_at, ''), '') = ''
    and coalesce(nullif(start_station_name, ''), '') = ''
    and coalesce(nullif(start_station_id, ''), '') = ''
    and coalesce(nullif(end_station_name, ''), '') = ''
    and coalesce(nullif(end_station_id, ''), '') = ''
    and coalesce(nullif(member_casual, ''), '') = ''
union all
select
    '202308-divvy-tripdata' as table_name
  , count(*) as totalblankcount
from
    [dbo].[202308-divvy-tripdata]
where
    coalesce(nullif(ride_id, ''), '') = ''
    and coalesce(nullif(rideable_type, ''), '') = ''
    and coalesce(nullif(started_at, ''), '') = ''
    and coalesce(nullif(ended_at, ''), '') = ''
    and coalesce(nullif(start_station_name, ''), '') = ''
    and coalesce(nullif(start_station_id, ''), '') = ''
    and coalesce(nullif(end_station_name, ''), '') = ''
    and coalesce(nullif(end_station_id, ''), '') = ''
    and coalesce(nullif(member_casual, ''), '') = ''
union all
select
    '202309-divvy-tripdata' as table_name
  , count(*) as totalblankcount
from
    [dbo].[202309-divvy-tripdata]
where
    coalesce(nullif(ride_id, ''), '') = ''
    and coalesce(nullif(rideable_type, ''), '') = ''
    and coalesce(nullif(started_at, ''), '') = ''
    and coalesce(nullif(ended_at, ''), '') = ''
    and coalesce(nullif(start_station_name, ''), '') = ''
    and coalesce(nullif(start_station_id, ''), '') = ''
    and coalesce(nullif(end_station_name, ''), '') = ''
    and coalesce(nullif(end_station_id, ''), '') = ''
    and coalesce(nullif(member_casual, ''), '') = ''
union all
select
    '202310-divvy-tripdata' as table_name
  , count(*) as totalblankcount
from
    [dbo].[202310-divvy-tripdata]
where
    coalesce(nullif(ride_id, ''), '') = ''
    and coalesce(nullif(rideable_type, ''), '') = ''
    and coalesce(nullif(started_at, ''), '') = ''
    and coalesce(nullif(ended_at, ''), '') = ''
    and coalesce(nullif(start_station_name, ''), '') = ''
    and coalesce(nullif(start_station_id, ''), '') = ''
    and coalesce(nullif(end_station_name, ''), '') = ''
    and coalesce(nullif(end_station_id, ''), '') = ''
    and coalesce(nullif(member_casual, ''), '') = ''
union all
select
    '202311-divvy-tripdata' as table_name
  , count(*) as totalblankcount
from
    [dbo].[202311-divvy-tripdata]
where
    coalesce(nullif(ride_id, ''), '') = ''
    and coalesce(nullif(rideable_type, ''), '') = ''
    and coalesce(nullif(started_at, ''), '') = ''
    and coalesce(nullif(ended_at, ''), '') = ''
    and coalesce(nullif(start_station_name, ''), '') = ''
    and coalesce(nullif(start_station_id, ''), '') = ''
    and coalesce(nullif(end_station_name, ''), '') = ''
    and coalesce(nullif(end_station_id, ''), '') = ''
    and coalesce(nullif(member_casual, ''), '') = ''
union all
select
    '202312-divvy-tripdata' as table_name
  , count(*) as totalblankcount
from
    [dbo].[202312-divvy-tripdata]
where
    coalesce(nullif(ride_id, ''), '') = ''
    and coalesce(nullif(rideable_type, ''), '') = ''
    and coalesce(nullif(started_at, ''), '') = ''
    and coalesce(nullif(ended_at, ''), '') = ''
    and coalesce(nullif(start_station_name, ''), '') = ''
    and coalesce(nullif(start_station_id, ''), '') = ''
    and coalesce(nullif(end_station_name, ''), '') = ''
    and coalesce(nullif(end_station_id, ''), '') = ''
    and coalesce(nullif(member_casual, ''), '') = ''
-- Order the final results by table name
order by
    table_name;
```

| table_name            | totalblankcount |
|-----------------------|-----------------|
| 202301-divvy-tripdata | 0               |
| 202302-divvy-tripdata | 0               |
| 202303-divvy-tripdata | 0               |
| 202304-divvy-tripdata | 0               |
| 202305-divvy-tripdata | 0               |
| 202306-divvy-tripdata | 0               |
| 202307-divvy-tripdata | 0               |
| 202308-divvy-tripdata | 0               |
| 202309-divvy-tripdata | 0               |
| 202310-divvy-tripdata | 0               |
| 202311-divvy-tripdata | 0               |
| 202312-divvy-tripdata | 0               |

### Overview of Initial Data
+ Each CSV contains **13 columns**.
+ Total of **5,719,877 rows** across all tables.
+ NULL values occur in columns and total across all tables:
    - **start_station_name**: **875,716 rows**
    - **start_station_id**: **875,848 rows**
    - **end_station_name**: **929,202 rows**
    - **end_station_id**: **929,343 rows**
    - **end_lat**: **6,990 rows**
    - **end_lng**: **6,990 rows**
+ Blank values do not occur in any tables, possibly due to the import flat files feature, which converts empty values into NULL values.
+ After completion of data consolidation and further exploration, a decision will be made regarding the retention or exclusion of incomplete data, with potential exploration of methods for addressing missing values.

### Integrated Data Management
+ Concatenated the initial 12 tables into a single unified table following the initial review.
+ Eliminated all individual tables post-concatenation.
+ Adjusted the data types in the unified table.
+ Implemented a primary key to maintain uniqueness across rows.

#### Aggregating Monthly Tables
+ Compiling records from each distinct table into a singular table named **'2023-divvy-tripdata'**.
```sql
select
    *
into
    [2023-divvy-tripdata]
from -- Select all columns from the 12 tables and union them into a single table
    (
        select
            *
        from
            [dbo].[202301-divvy-tripdata]
        union all
        select
            *
        from
            [dbo].[202302-divvy-tripdata]
        union all
        select
            *
        from
            [dbo].[202303-divvy-tripdata]
        union all
        select
            *
        from
            [dbo].[202304-divvy-tripdata]
        union all
        select
            *
        from
            [dbo].[202305-divvy-tripdata]
        union all
        select
            *
        from
            [dbo].[202306-divvy-tripdata]
        union all
        select
            *
        from
            [dbo].[202307-divvy-tripdata]
        union all
        select
            *
        from
            [dbo].[202308-divvy-tripdata]
        union all
        select
            *
        from
            [dbo].[202309-divvy-tripdata]
        union all
        select
            *
        from
            [dbo].[202310-divvy-tripdata]
        union all
        select
            *
        from
            [dbo].[202311-divvy-tripdata]
        union all
        select
            *
        from
            [dbo].[202312-divvy-tripdata]
    ) as tripdata; -- Alias for the subquery
```

`(5719877 rows affected)`

#### Purging Separate Monthly Tables
+ Dropping all individual tables to prevent redundancy and streamline data management processes.
```sql
drop table if exists 
    [dbo].[202301-divvy-tripdata]
  , [dbo].[202302-divvy-tripdata]
  , [dbo].[202303-divvy-tripdata]
  , [dbo].[202304-divvy-tripdata]
  , [dbo].[202305-divvy-tripdata]
  , [dbo].[202306-divvy-tripdata]
  , [dbo].[202307-divvy-tripdata]
  , [dbo].[202308-divvy-tripdata]
  , [dbo].[202309-divvy-tripdata]
  , [dbo].[202310-divvy-tripdata]
  , [dbo].[202311-divvy-tripdata]
  , [dbo].[202312-divvy-tripdata];
```

#### Table Structure Enhancement
+ Modifying the structure of the table by altering the data type and nullability constraints of several columns to ensure data integrity.
```sql
alter table [dbo].[2023-divvy-tripdata] alter column ride_id nvarchar(255) not null;
alter table [dbo].[2023-divvy-tripdata] alter column rideable_type nvarchar(50) not null;
alter table [dbo].[2023-divvy-tripdata] alter column started_at datetime2(0) not null;
alter table [dbo].[2023-divvy-tripdata] alter column ended_at datetime2(0) not null;
alter table [dbo].[2023-divvy-tripdata] alter column start_station_name nvarchar(100) null;
alter table [dbo].[2023-divvy-tripdata] alter column start_station_id nvarchar(100) null;
alter table [dbo].[2023-divvy-tripdata] alter column end_station_name nvarchar(100) null;
alter table [dbo].[2023-divvy-tripdata] alter column end_station_id nvarchar(100) null;
alter table [dbo].[2023-divvy-tripdata] alter column start_lat decimal(18, 2) null;
alter table [dbo].[2023-divvy-tripdata] alter column start_lng decimal(18, 2) null;
alter table [dbo].[2023-divvy-tripdata] alter column end_lat decimal(18, 2) null;
alter table [dbo].[2023-divvy-tripdata] alter column end_lng decimal(18, 2) null;
alter table [dbo].[2023-divvy-tripdata] alter column member_casual nvarchar(50) not null;
```

#### Key Constraint Addition
+ Adding a "**Primary Key**" constraint to the **ride_id** column of the table ensures that each row in the table has a unique value.
```sql
alter table [dbo].[2023-divvy-tripdata] add constraint PK_2023_divvy_tripdata primary key (ride_id);
```

#### Verifying Schema of Combined Tables
+ Reusing a system view to generate a report detailing the columns of the newly combined table.
```sql
select
    table_name -- Name of the table
  , column_name -- Name of the column
  , data_type -- Data type of the column
  , character_maximum_length -- Maximum length of character data type columns
  , is_nullable -- Indicates whether the column allows NULL values
  , column_default -- Default value of the column
from
    information_schema.columns
where
    table_name = '2023-divvy-tripdata'
    and
    table_schema = 'dbo';
```

| table_name          | column_name        | data_type | character_maximum_length | is_nullable | column_default |
|---------------------|--------------------|-----------|--------------------------|-------------|----------------|
| 2023-divvy-tripdata | ride_id            | nvarchar  | 255                      | NO          | NULL           |
| 2023-divvy-tripdata | rideable_type      | nvarchar  | 50                       | NO          | NULL           |
| 2023-divvy-tripdata | started_at         | datetime2 | NULL                     | NO          | NULL           |
| 2023-divvy-tripdata | ended_at           | datetime2 | NULL                     | NO          | NULL           |
| 2023-divvy-tripdata | start_station_name | nvarchar  | 100                      | YES         | NULL           |
| 2023-divvy-tripdata | start_station_id   | nvarchar  | 100                      | YES         | NULL           |
| 2023-divvy-tripdata | end_station_name   | nvarchar  | 100                      | YES         | NULL           |
| 2023-divvy-tripdata | end_station_id     | nvarchar  | 100                      | YES         | NULL           |
| 2023-divvy-tripdata | start_lat          | decimal   | NULL                     | YES         | NULL           |
| 2023-divvy-tripdata | start_lng          | decimal   | NULL                     | YES         | NULL           |
| 2023-divvy-tripdata | end_lat            | decimal   | NULL                     | YES         | NULL           |
| 2023-divvy-tripdata | end_lng            | decimal   | NULL                     | YES         | NULL           |
| 2023-divvy-tripdata | member_casual      | nvarchar  | 50                       | NO          | NULL           |

#### Extracting Top 5 Rows
+ Retrieving the top 5 records for a quick inspection.
```sql
select top (5) *
from [dbo].[2023-divvy-tripdata];
```

| ride_id          | rideable_type | started_at          | ended_at            | start_station_name          | start_station_id | end_station_name          | end_station_id | start_lat | start_lng | end_lat | end_lng | member_casual |
|------------------|---------------|---------------------|---------------------|-----------------------------|------------------|---------------------------|----------------|-----------|-----------|---------|---------|---------------|
| 00000065B3150FF2 | electric_bike | 2023-09-24 12:56:50 | 2023-09-24 13:00:43 | Sheridan Rd & Noyes St (NU) | 604              | University Library (NU)   | 605            | 42.06     | -87.68    | 42.05   | -87.67  | casual        |
| 0000085FE82E5429 | electric_bike | 2023-04-13 17:52:05 | 2023-04-13 18:10:33 | NULL                        | NULL             | Halsted St & 18th St      | 13099          | 41.88     | -87.63    | 41.86   | -87.65  | member        |
| 0000089D36728778 | docked_bike   | 2023-05-08 13:22:50 | 2023-05-08 13:28:53 | Clark St & Lake St          | KA1503000012     | Sedgwick St & Huron St    | TA1307000062   | 41.89     | -87.63    | 41.89   | -87.64  | casual        |
| 00000B15294F9057 | electric_bike | 2023-12-08 17:52:37 | 2023-12-08 18:00:54 | NULL                        | NULL             | NULL                      | NULL           | 41.90     | -87.75    | 41.90   | -87.76  | casual        |
| 000010D58FFC4A2B | electric_bike | 2023-11-10 17:46:50 | 2023-11-10 17:59:41 | NULL                        | NULL             | Ashland Ave & Division St | 13061          | 41.88     | -87.65    | 41.90   | -87.67  | member        |

#### Checking Row Count of Combined Table
+ Utilizing system catalog views to provide insights into the number of rows.
```sql
declare @schemaName nvarchar(128) = 'dbo';
-- Specify the schema name here
declare @tableName nvarchar(128) = '2023-divvy-tripdata'; 

-- Specify the table name here
select
    t.name as table_name, -- Alias the name column from the sys.tables view as table_name
    p.rows as row_counts -- Alias the rows column from the sys.partitions view as row_counts
from
    sys.tables t -- Get information about tables from the sys.tables system catalog view
    inner join sys.partitions p on t.object_id = p.object_id -- Join the sys.tables and sys.partitions views based on object_id
    inner join sys.schemas s on t.schema_id = s.schema_id -- Join to sys.schemas to get schema information
where
    s.name = @schemaName -- Filter by schema name
    and t.name = @tableName -- Filter by table name
    and t.is_ms_shipped = 0 -- Filter out system tables (is_ms_shipped = 0 indicates user-defined tables)
    and p.index_id in (1, 0); -- Filter partitions based on index ID (1 for clustered index, 0 for heap)
```
| table_name          | row_counts |
|---------------------|------------|
| 2023-divvy-tripdata | 5,719,877  |

### Data Adjustments and Expansions
+ Renamed existing column for clarity and consistency.
+ Added new columns to enrich the dataset with additional information.
+ Enhanced the dataset by adding columns for months, days of the week, hours, and quarters.
+ Computed new columns based on existing data to derive meaningful insights.
+ Expanded the structure of the dataset to accommodate new dimensions and attributes, including columns for ride length and ride distance.
+ Improved data accessibility and usability through clearer column name and additional informative columns.

#### Column Name Adjustment
+ Renaming the column **member_casual** to **user_type**
```sql
EXEC sp_rename 'dbo.2023-divvy-tripdata.member_casual', 'user_type', 'COLUMN';
```

#### Introducing New Columns
+ Extracting the month component from **started_at** to produce an additional column labeled **month**.
```sql
-- Add 'month' column
alter table [dbo].[2023-divvy-tripdata]
add month nvarchar(20);
```

```sql
-- Update the 'month' column based on the 'started_at' datetime column
update [dbo].[2023-divvy-tripdata]
set
    month = case month(started_at) -- Extract month from 'started_at' datetime column
        when 1 then 'Jan' -- If the month is 1, set it to 'Jan'
        when 2 then 'Feb' -- If the month is 2, set it to 'Feb'
        when 3 then 'Mar' -- If the month is 3, set it to 'Mar'
        when 4 then 'Apr' -- If the month is 4, set it to 'Apr'
        when 5 then 'May' -- If the month is 5, set it to 'May'
        when 6 then 'Jun' -- If the month is 6, set it to 'Jun'
        when 7 then 'Jul' -- If the month is 7, set it to 'Jul'
        when 8 then 'Aug' -- If the month is 8, set it to 'Aug'
        when 9 then 'Sep' -- If the month is 9, set it to 'Sep'
        when 10 then 'Oct' -- If the month is 10, set it to 'Oct'
        when 11 then 'Nov' -- If the month is 11, set it to 'Nov'
        else 'Dec' -- For any other month (12), set it to 'Dec'
    end;
```

`(5719877 rows affected)`

+ Extracting the day component from **started_at** to produce an additional column labeled **day_of_week**.
```sql
-- Add 'day_of_week' column
alter table [dbo].[2023-divvy-tripdata]
add day_of_week nvarchar(20);
```

```sql
-- Update the 'day_of_week' column based on the 'started_at' datetime column
update [dbo].[2023-divvy-tripdata]
set
    day_of_week = case datepart(WEEKDAY, started_at) -- Extract the day of the week from the 'started_at' datetime column
        when 1 then 'Mon' -- If the day is 1 (Sunday), set it to 'Mon'
        when 2 then 'Tue' -- If the day is 2 (Monday), set it to 'Tue'
        when 3 then 'Wed' -- If the day is 3 (Tuesday), set it to 'Wed'
        when 4 then 'Thu' -- If the day is 4 (Wednesday), set it to 'Thu'
        when 5 then 'Fri' -- If the day is 5 (Thursday), set it to 'Fri'
        when 6 then 'Sat' -- If the day is 6 (Friday), set it to 'Sat'
        else 'Sun' -- For any other day (7, Saturday), set it to 'Sun'
    end;
```

`(5719877 rows affected)`

+ Extracting the hour component from **started_at** to produce an additional column labeled **hour**, converting the values to AM/PM format.
```sql
-- Add 'hour' column
alter table [dbo].[2023-divvy-tripdata]
add hour nvarchar(10);
```

```sql
-- Update the 'hour' column based on the 'started_at' column
update [dbo].[2023-divvy-tripdata]
set
    hour = case
    -- If the hour is less than 12, convert it to AM format
        when datepart(hour, started_at) < 12 then convert(nvarchar(2), datepart(hour, started_at)) + ' AM'
        -- If the hour is 12, it's noon
        when datepart(hour, started_at) = 12 then '12 PM'
        -- For other hours, convert them to PM format
        else convert(nvarchar(2), datepart(hour, started_at) - 12) + ' PM'
    end;
```

`(5719877 rows affected)`

+ Extracting the quarter component from **started_at** to produce an additional column labeled **quarter**.
```sql
-- Add 'quarter' column
alter table [dbo].[2023-divvy-tripdata]
add quarter nvarchar(2);
```

```sql
-- Update the 'quarter' column based on the 'started_at' datetime column
update [dbo].[2023-divvy-tripdata]
set
    quarter = case
        -- Determine the quarter based on the month of the 'started_at' datetime column
        when month(started_at) between 1
        and 3 then 'Q1' -- If the month is between January and March, set it to 'Q1'
        when month(started_at) between 4
        and 6 then 'Q2' -- If the month is between April and June, set it to 'Q2'
        when month(started_at) between 7
        and 9 then 'Q3' -- If the month is between July and September, set it to 'Q3'
        else 'Q4' -- For any other month (October to December), set it to 'Q4'
    end;
```

`(5719877 rows affected)`

+ Calculating the ride length by converting the difference in seconds between **started_at** and **ended_at** columns into minutes to produce an additional column labeled **ride_length_minutes**.
```sql
-- Add 'ride_length_minute' column
alter table [dbo].[2023-divvy-tripdata]
add ride_length_minute as
-- Convert the difference in seconds between 'started_at' and 'ended_at' to minutes
    convert(decimal(10, 2)
    , datediff(second, started_at, ended_at) / 60.0);
```

`(5719877 rows affected)`

+ Calculating the ride distance values based on start and end coordinates using the Haversine formula to produce an additional column labeled **ride_distance**.
```sql
-- Add 'ride_distance' column
alter table [dbo].[2023-divvy-tripdata]
add ride_distance decimal(10, 2);
```

```sql
-- Update the newly added ride_distance column with calculated values
update [dbo].[2023-divvy-tripdata]
set ride_distance = (
    -- Use the Haversine formula to calculate the distance between start and end points
    3959 * acos(
        cos(radians(start_lat)) * cos(radians(end_lat)) * cos(radians(end_lng) - radians(start_lng)) +
        sin(radians(start_lat)) * sin(radians(end_lat))
    )
);
```

`(5719877 rows affected)`

### Data Preparation and Transformation
+ Established an updated table to incorporate necessary alterations.
+ Identified and addressed issues with missing values, outliers, and duplicates to ensure data quality.
+ Prepared the table by trimming spaces, filling missing entries, removing duplicates, and applying filters to focus on relevant subsets of the data for further analysis.
+ Created an updated table after performing all preprocessing steps.

#### Generating Updated Table
+ Creating a new table named **`2023-divvy-tripdata-updated`** by copying all columns and data from the existing table.
```sql
select
    * -- Select all columns
into
    [2023-divvy-tripdataupdated] -- Insert into a new table named '2023-divvy-tripdataupdated'
from
    [dbo].[2023-divvy-tripdata]; -- Select data from the table '2023-divvy-tripdata'
```

`(5719877 rows affected)`

#### Null Value Examination
+ Performing an evaluation on the columns flagged for missing values, including the newly added columns.
```sql
select
    count(*) - count(start_station_name) as start_station_name_null
  , count(*) - count(start_station_id) as start_station_id_null
  , count(*) - count(end_station_name) as end_station_name_null
  , count(*) - count(end_station_id) as end_station_id_null
  , count(*) - count(end_lat) as end_lat_null
  , count(*) - count(end_lng) as end_lng_null
  , count(*) - count(user_type) as user_type_null
  , count(*) - count(month) as month_null
  , count(*) - count(day_of_week) as day_of_week_null
  , count(*) - count(hour) as hour_null
  , count(*) - count(quarter) as quarter_null
  , count(*) - count(ride_length_minute) as ride_length_minute_null
  , count(*) - count(ride_distance) as ride_distance_null
from
    [dbo].[2023-divvy-tripdataupdated];
```

| start_station_name_null 	| start_station_id_null 	| end_station_name_null 	| end_station_id_null 	| end_lat_null 	| end_lng_null 	| user_type_null 	| month_null 	| day_of_week_null 	| hour_null 	| quarter_null 	| ride_length_minute_null 	| ride_distance_null |
|-------------------------	|-----------------------	|-----------------------	|---------------------	|--------------	|--------------	|----------------	|------------	|------------------	|-----------	|--------------	|-------------------------	|--------------------|
| 875,716                 	| 875,848               	| 929,202               	| 929,343             	| 6,990        	| 6,990        	| 0              	| 0          	| 0                	| 0         	| 0            	| 0                       	| 6,990              |

+ Calculating the total count of missing values across all columns in the table.
```sql
-- Count the total number of null values
select
    count(*) as totalnullcount
from
    (
        select
            *
        from
            [dbo].[2023-divvy-tripdataupdated]
        where
            start_station_name is null
            or start_station_id is null
            or end_station_name is null
            or end_station_id is null
            or end_lat is null
            or end_lng is null
            or user_type is null
			or month is null
			or day_of_week is null
			or hour is null
			or quarter is null
			or ride_length_minute is null
			or ride_distance is null
    ) as nullvalues;
```

| totalnullcount |
|----------------|
| 1,388,170      |

#### Null Value Handling
+ Adding start_coordinates and end_coordinates columns to aid in filling missing values by combining latitude and longitude coordinates.
```sql
alter table [dbo].[2023-divvy-tripdataupdated] 
add start_coordinates as concat(start_lat, ',', start_lng), -- Add start_coordinates column combining start_lat and start_lng
    end_coordinates as concat(end_lat, ',', end_lng); -- Add end_coordinates column combining end_lat and end_lng
```

+ Populating missing values in **start_station_name** using geographical coordinates (**start_lat** and **start_lng**).
```sql
with
    CTE as (
        select
            start_coordinates
          , start_station_name
          , lag(start_station_name) over (
                partition by
                    start_coordinates
                order by
                    started_at
            ) as lag_start_station_name
          , lead(start_station_name) over (
                partition by
                    start_coordinates
                order by
                    started_at
            ) as lead_start_station_name
        from
            [dbo].[2023-divvy-tripdataupdated]
    )
    -- Update NULL start_station_name values based on lag and lead values
update CTE
-- Set start_station_name to the first non-NULL value from lag and lead columns
set
    start_station_name = coalesce(lag_start_station_name, lead_start_station_name)
    -- Update only rows where start_station_name is NULL
where
    start_station_name is null;
```

`(875716 rows affected)`

+ Populating missing values in **end_station_name** using geographical coordinates (**end_lat** and **end_lng**).
```sql
with
    CTE as (
        select
            end_lat
          , end_lng
          , end_station_name
          , lag(end_station_name) over (
                partition by
                    end_lat
                  , end_lng
                order by
                    ended_at
            ) as lag_end_station_name
          , lead(end_station_name) over (
                partition by
                    end_lat
                  , end_lng
                order by
                    ended_at
            ) as lead_end_station_name
        from
            [dbo].[2023-divvy-tripdataupdated]
    )
-- Update NULL end_station_name values based on lag and lead values
update CTE
-- Set end_station_name to the first non-NULL value from lag and lead columns
set
    end_station_name = coalesce(lag_end_station_name, lead_end_station_name)
-- Update only rows where end_station_name is NULL
where
    end_station_name is null;
```

`(929202 rows affected)`

+ Populating missing values in **start_station_id** using the corresponding **start_station_name**.
```sql
with
    CTE as (
        select
            start_station_name
          , start_station_id
          , lag(start_station_id) over (
                partition by
                    start_station_name
                order by
                    started_at
            ) as lag_start_station_id
          , lead(start_station_id) over (
                partition by
                    start_station_name
                order by
                    started_at
            ) as lead_start_station_id
        from
            [dbo].[2023-divvy-tripdataupdated]
    )
-- Update NULL start_station_id values based on lag and lead values
update CTE
-- Set start_station_id to the first non-NULL value from lag and lead columns
set
    start_station_id = coalesce(lag_start_station_id, lead_start_station_id)
-- Update only rows where start_station_id is NULL
where
    start_station_id is null;
```

`(875848 rows affected)`

+ Populating missing values in **end_station_id** using the corresponding **end_station_name**.
```sql
with
    CTE as (
        select
            end_station_name
          , end_station_id
          , lag(end_station_id) over (
                partition by
                    end_station_name
                order by
                    ended_at
            ) as lag_end_station_id
          , lead(end_station_id) over (
                partition by
                    end_station_name
                order by
                    ended_at
            ) as lead_end_station_id
        from
            [dbo].[2023-divvy-tripdataupdated]
    )
-- Update NULL end_station_id values based on lag and lead values
update CTE
-- Set end_station_id to the first non-NULL value from lag and lead columns
set
    end_station_id = coalesce(lag_end_station_id, lead_end_station_id)
-- Update only rows where end_station_id is NULL
where
    end_station_id is null;
```

`(929343 rows affected)`

+ Re-evaluating the dataset for missing values post-imputation to verify the effectiveness of the filling process.
```sql
select
    count(*) - count(start_station_name) as start_station_name_null
  , count(*) - count(start_station_id) as start_station_id_null
  , count(*) - count(end_station_name) as end_station_name_null
  , count(*) - count(end_station_id) as end_station_id_null
  , count(*) - count(end_lat) as end_lat_null
  , count(*) - count(end_lng) as end_lng_null
  , count(*) - count(user_type) as user_type_null
  , count(*) - count(month) as month_null
  , count(*) - count(day_of_week) as day_of_week_null
  , count(*) - count(hour) as hour_null
  , count(*) - count(quarter) as quarter_null
  , count(*) - count(ride_length_minute) as ride_length_minute_null
  , count(*) - count(ride_distance) as ride_distance_null
from
    [dbo].[2023-divvy-tripdataupdated];
```

| start_station_name_null 	| start_station_id_null 	| end_station_name_null 	| end_station_id_null 	| end_lat_null 	| end_lng_null 	| user_type_null 	| month_null 	| day_of_week_null | hour_null 	| quarter_null 	| ride_length_minute_null 	| ride_distance_null |
|-------------------------	|-----------------------	|-----------------------	|---------------------	|--------------	|--------------	|----------------	|------------	|------------------|-----------	|--------------	|-------------------------	|--------------------|
| 120,359                 	| 120,631               	| 142,005               	| 142,183             	| 6,990        	| 6,990        	| 0              	| 0          	| 0                | 0         	| 0            	| 0                       	| 6,990              |

+ Calculating the total number of remaining missing values after attempting to fill in as many as possible.
```sql
select
    count(*) as totalnullcount
from
    (
        select
            *
        from
            [dbo].[2023-divvy-tripdataupdated]
        where
            start_station_name is null
            or start_station_id is null
            or end_station_name is null
            or end_station_id is null
            or end_lat is null
            or end_lng is null
            or user_type is null
			or month is null
			or day_of_week is null
			or hour is null
			or quarter is null
			or ride_length_minute is null
			or ride_distance is null
    ) as nullvalues;
```

| totalnullcount |
|----------------|
| 242,169        |

#### Outlier Detection
+ Counting the total number of rows in the table where the ride length is less than (**<**) 1 minute (60 seconds).
```sql
select
    count(*) as total_count
from
    [dbo].[2023-divvy-tripdataupdated]
where
    ride_length_minute < 1;
```

| total_count |
|-------------|
| 149,615     |

+ Counting the total number of rows in the table where the ride length exceeds (**>**) 1440 minutes (24 hours).
```sql
select
    count(*) as total_count
from
    [dbo].[2023-divvy-tripdataupdated]
where
    ride_length_minute > 1440;
```

| total_count |
|-------------|
| 6,418       |

+ Counting the total number of rows in the table where the ride length is less than or equal (**<=**) to 0 minutes.
```sql
select
    count(*) as total_count
from
    [dbo].[2023-divvy-tripdataupdated]
where
    ride_length_minute <= 0;
```

| total_count |
|-------------|
| 1,269       |

+ Counting the total number of rows in the table where the **started_at** timestamp is greater than (**>**) the **ended_at** timestamp.
```sql
select
    count(*) as total_count
from
    [dbo].[2023-divvy-tripdataupdated]
where
    started_at > ended_at;
```

| total_count |
|-------------|
| 272         |

+ Counting the total number of rows in the table where the ride distances equal (**=**) to 0.00 miles.
```sql
select
    count(*) as total_count
from
    [dbo].[2023-divvy-tripdataupdated]
where
    ride_distance = 0.00;
``` 

| total_count |
|-------------|
| 822,454     |

+ Counting the total number of rows where the **end_lat** column is NULL, and separately counting the total number of rows where the **end_lng** column is NULL.
```sql
select
    count(
        case
            when end_lat is null then 1
        end
    ) as endlat_nullcount -- Count the NULL values in the 'end_lat' column and alias the count as 'endlat_nullcount'
  , count(
        case
            when end_lng is null then 1
        end
    ) as endlng_nullcount -- Count the NULL values in the 'end_lng' column and alias the count as 'endlng_nullcount'
from
    [dbo].[2023-divvy-tripdataupdated];
```

| endlat_nullcount 	| endlng_nullcount |
|------------------	|------------------|
| 6,990            	| 6,990            |

+ Counting the total number of rows where the **ride_distance** column is NULL.
```sql
select
    count(
        case
            when ride_distance is null then 1
        end
    ) as rd_nullcount
from
    [dbo].[2023-divvy-tripdataupdated];
```

| rd_nullcount |
|--------------|
| 6,990        |

+ Counting the total number of trips originating from each specified **start_station_name**, including a summary row for the total count.
```sql
select
    coalesce(start_station_name, 'total') as start_station_name,
    count(*) as start_station_name_count -- Count the number of trips for each start station name
from
    [dbo].[2023-divvy-tripdataupdated] -- Select data from the updated table
where
    start_station_name in (
        'OH - BONFIRE - TESTING',
        'Hubbard Bike-checking (LBS-WH-TEST)',
        'chargingstx4',
        'chargingstx2',
        'chargingstx07',
        'chargingstx0',
        'chargingstx5',
        'chargingstx3',
        'chargingstx1',
        'chargingstx06',
        'OH Charging Stx - Test',
        '2059 Hastings Warehouse Station',
        'DIVVY CASSETTE REPAIR MOBILE STATION'
    ) -- Filter the data for specified start station names
group by
    rollup(start_station_name); -- Perform a rollup operation to include a summary row for the total count
```

| start_station_name     | start_station_name_count |
|------------------------|--------------------------|
| OH - BONFIRE - TESTING | 1                        |
| OH Charging Stx - Test | 27                       |
| total                  | 28                       |

+ Counting the total number of trips originating from each specified **start_station_id**, including a summary row for the total count.
```sql
select
    coalesce(start_station_id, 'total') as start_station_id,
    count(*) as start_station_id_count -- Count the number of trips for each start station ID
from
    [dbo].[2023-divvy-tripdataupdated] -- Select data from the updated table
where
    start_station_id in (
        'OH - BONFIRE - TESTING',
        'Hubbard Bike-checking (LBS-WH-TEST)',
        'chargingstx4',
        'chargingstx2',
        'chargingstx07',
        'chargingstx0',
        'chargingstx5',
        'chargingstx3',
        'chargingstx1',
        'chargingstx06',
        'OH Charging Stx - Test',
        '2059 Hastings Warehouse Station',
        'DIVVY CASSETTE REPAIR MOBILE STATION'
    ) -- Filter the data for specified start station IDs
group by
    rollup(start_station_id); -- Perform a rollup operation to include a summary row for the total count
```

| start_station_id                    | start_station_id_count |
|-------------------------------------|------------------------|
| chargingstx0                        | 1,063                  |
| chargingstx06                       | 3,833                  |
| chargingstx07                       | 4,360                  |
| chargingstx1                        | 11,245                 |
| chargingstx2                        | 1,793                  |
| chargingstx3                        | 7,022                  |
| chargingstx4                        | 10,300                 |
| chargingstx5                        | 8,902                  |
| Hubbard Bike-checking (LBS-WH-TEST) | 8                      |
| OH Charging Stx - Test              | 27                     |
| total                               | 48,553                 |

+ Counting the total number of trips originating from each specified **end_station_name**, including a summary row for the total count.
```sql
select
    coalesce(end_station_name, 'total') as end_station_name,
    count(*) as end_station_name_count -- Count the number of trips for each end station name
from
    [dbo].[2023-divvy-tripdataupdated] -- Select data from the updated table
where
    end_station_name in (
        'OH - BONFIRE - TESTING',
        'Hubbard Bike-checking (LBS-WH-TEST)',
        'chargingstx4',
        'chargingstx2',
        'chargingstx07',
        'chargingstx0',
        'chargingstx5',
        'chargingstx3',
        'chargingstx1',
        'chargingstx06',
        'OH Charging Stx - Test',
        '2059 Hastings Warehouse Station',
        'DIVVY CASSETTE REPAIR MOBILE STATION'
    ) -- Filter the data for specified end station names
group by
    rollup(end_station_name); -- Perform a rollup operation to include a summary row for the total count
```

| end_station_name       | end_station_name_count |
|------------------------|------------------------|
| OH - BONFIRE - TESTING | 4                      |
| OH Charging Stx - Test | 19                     |
| total                  | 23                     |

+ Counting the total number of trips originating from each specified **end_station_id**, including a summary row for the total count.
```sql
select
    coalesce(end_station_id, 'total') as end_station_id,
    count(*) as end_station_id_count -- Count the number of trips for each end station ID
from
    [dbo].[2023-divvy-tripdataupdated] -- Select data from the updated table
where
    end_station_id in (
        'OH - BONFIRE - TESTING',
        'Hubbard Bike-checking (LBS-WH-TEST)',
        'chargingstx4',
        'chargingstx2',
        'chargingstx07',
        'chargingstx0',
        'chargingstx5',
        'chargingstx3',
        'chargingstx1',
        'chargingstx06',
        'OH Charging Stx - Test',
        '2059 Hastings Warehouse Station',
        'DIVVY CASSETTE REPAIR MOBILE STATION'
    ) -- Filter the data for specified end station IDs
group by
    rollup(end_station_id); -- Perform a rollup operation to include a summary row for the total count
```

| end_station_id                       | end_station_id_count |
|--------------------------------------|----------------------|
| 2059 Hastings Warehouse Station      | 7                    |
| chargingstx0                         | 987                  |
| chargingstx06                        | 4,068                |
| chargingstx07                        | 5,550                |
| chargingstx1                         | 12,494               |
| chargingstx2                         | 1,857                |
| chargingstx3                         | 10,310               |
| chargingstx4                         | 11,375               |
| chargingstx5                         | 10,668               |
| DIVVY CASSETTE REPAIR MOBILE STATION | 2                    |
| Hubbard Bike-checking (LBS-WH-TEST)  | 97                   |
| OH Charging Stx - Test               | 19                   |
| total                                | 57,434               |

#### Data Reduction
+ Removing leading and trailing spaces from specified columns in the table, to ensure data cleanliness.
```sql
update [dbo].[2023-divvy-tripdataupdated]
set
    ride_id = ltrim(rtrim(ride_id))
  , rideable_type = ltrim(rtrim(rideable_type))
  , start_station_name = ltrim(rtrim(start_station_name))
  , start_station_id = ltrim(rtrim(start_station_id))
  , end_station_name = ltrim(rtrim(end_station_name))
  , end_station_id = ltrim(rtrim(end_station_id))
  , user_type = ltrim(rtrim(user_type))
  , quarter = ltrim(rtrim(quarter))
  , month = ltrim(rtrim(month))
  , day_of_week = ltrim(rtrim(day_of_week));
```

`(5719877 rows affected)`

+ Removing rows where the ride length is less than or equal (**<=**) to 1 minute (60 seconds) or greater than or equal (**>=**) to 1440 minutes (24 hours).
```sql
delete from [dbo].[2023-divvy-tripdataupdated]
where
    ride_length_minute <= 1
    or ride_length_minute >= 1440;
```

`(157487 rows affected)`

+ Removing rows where the end latitude and end longitude are both NULL.
```sql
delete from [dbo].[2023-divvy-tripdataupdated]
where
    end_lat is null
    and end_lng is null;
```

`(790 rows affected)`

+ Removing rows where the ride distance is equal to 0 miles.
```sql
delete from [dbo].[2023-divvy-tripdataupdated]
where
    ride_distance = 0;
```

`(673401 rows affected)`

+ Removing rows where the **start_station_name** matches specified values.
```sql
delete from [dbo].[2023-divvy-tripdataupdated]
where
    start_station_name in (
        'OH - BONFIRE - TESTING', -- Specify the start station name values to match
        'Hubbard Bike-checking (LBS-WH-TEST)',
        'chargingstx4',
        'chargingstx2',
        'chargingstx07',
        'chargingstx0',
        'chargingstx5',
        'chargingstx3',
        'chargingstx1',
        'chargingstx06',
        'OH Charging Stx - Test',
        '2059 Hastings Warehouse Station',
        'DIVVY CASSETTE REPAIR MOBILE STATION'
    );
```

`(9 rows affected)`

+ Removing rows where the **start_station_id** matches specified values.
```sql
delete from [dbo].[2023-divvy-tripdataupdated]
where
    start_station_id in (
        'OH - BONFIRE - TESTING' -- Specify the start_station_id values to match
      , 'Hubbard Bike-checking (LBS-WH-TEST)'
      , 'chargingstx4'
      , 'chargingstx2'
      , 'chargingstx07'
      , 'chargingstx0'
      , 'chargingstx5'
      , 'chargingstx3'
      , 'chargingstx1'
      , 'chargingstx06'
      , 'OH Charging Stx - Test'
      , '2059 Hastings Warehouse Station'
      , 'DIVVY CASSETTE REPAIR MOBILE STATION'
    );
```

`(41772 rows affected)`

+ Removing rows where the **end_station_name** matches specified values.
```sql
delete from [dbo].[2023-divvy-tripdataupdated] -- Table to delete rows from
where
    end_station_name in (
        'OH - BONFIRE - TESTING' -- Specify the end_station_name values to match
      , 'Hubbard Bike-checking (LBS-WH-TEST)'
      , 'chargingstx4'
      , 'chargingstx2'
      , 'chargingstx07'
      , 'chargingstx0'
      , 'chargingstx5'
      , 'chargingstx3'
      , 'chargingstx1'
      , 'chargingstx06'
      , 'OH Charging Stx - Test'
      , '2059 Hastings Warehouse Station'
      , 'DIVVY CASSETTE REPAIR MOBILE STATION'
    );
```

`(6 rows affected)`

+ Removing rows where the **end_station_id** matches specified values.
```sql
delete from [dbo].[2023-divvy-tripdataupdated] -- Table to delete rows from
where
    end_station_id in (
        'OH - BONFIRE - TESTING' -- Specify the end_station_id values to match
      , 'Hubbard Bike-checking (LBS-WH-TEST)'
      , 'chargingstx4'
      , 'chargingstx2'
      , 'chargingstx07'
      , 'chargingstx0'
      , 'chargingstx5'
      , 'chargingstx3'
      , 'chargingstx1'
      , 'chargingstx06'
      , 'OH Charging Stx - Test'
      , '2059 Hastings Warehouse Station'
      , 'DIVVY CASSETTE REPAIR MOBILE STATION'
    );
```

`(49683 rows affected)`

#### Pre-analysis Data Validation
+ Performing a final check by count total of columns in the updated datasets.
```sql
select 
	count(*) as total_column
from
	information_schema.columns
where
	table_name = '2023-divvy-tripdataupdated'
	and table_schema = 'dbo';
```

| total_column |
|--------------|
| 21           |

+ Performing a final check by counting all rows in the updated datasets.
```sql
select
    count(*) as total_count -- Select the count of all rows
from
    [dbo].[2023-divvy-tripdataupdated]; -- Table to count rows from
```

| total_count |
|-------------|
| 4,796,729   |

+ Performing a final check by counting null values in each columns.
```sql
select
    -- Count NULL values for each column
    sum(case when ride_id is null then 1 else 0 end) as ride_id_null
  , sum(case when rideable_type is null then 1 else 0 end) as rideable_type_null
  , sum(case when started_at is null then 1 else 0 end) as started_at_null
  , sum(case when ended_at is null then 1 else 0 end) as ended_at_null
  , sum(case when start_station_name is null then 1 else 0 end) as start_station_name_null
  , sum(case when start_station_id is null then 1 else 0 end) as start_station_id_null
  , sum(case when end_station_name is null then 1 else 0 end) as end_station_name_null
  , sum(case when end_station_id is null then 1 else 0 end) as end_station_id_null
  , sum(case when start_lat is null then 1 else 0 end) as start_lat_null
  , sum(case when start_lng is null then 1 else 0 end) as start_lng_null
  , sum(case when end_lat is null then 1 else 0 end) as end_lat_null
  , sum(case when end_lng is null then 1 else 0 end) as end_lng_null
  , sum(case when user_type is null then 1 else 0 end) as user_type_null
  , sum(case when month is null then 1 else 0 end) as month_null
  , sum(case when day_of_week is null then 1 else 0 end) as day_of_week_null
  , sum(case when hour is null then 1 else 0 end) as hour_null
  , sum(case when quarter is null then 1 else 0 end) as quarter_null
  , sum(case when ride_length_minute is null then 1 else 0 end) as ride_length_minute_null
  , sum(case when ride_distance is null then 1 else 0 end) as ride_distance_null
  -- Count total number of NULL values
  , sum(
        case when ride_id is null then 1 else 0 end +
        case when rideable_type is null then 1 else 0 end +
        case when started_at is null then 1 else 0 end +
        case when ended_at is null then 1 else 0 end +
        case when start_station_name is null then 1 else 0 end +
        case when start_station_id is null then 1 else 0 end +
        case when end_station_name is null then 1 else 0 end +
        case when end_station_id is null then 1 else 0 end +
        case when start_lat is null then 1 else 0 end +
        case when start_lng is null then 1 else 0 end +
        case when end_lat is null then 1 else 0 end +
        case when end_lng is null then 1 else 0 end +
        case when user_type is null then 1 else 0 end +
        case when month is null then 1 else 0 end +
        case when day_of_week is null then 1 else 0 end +
        case when hour is null then 1 else 0 end +
        case when quarter is null then 1 else 0 end +
        case when ride_length_minute is null then 1 else 0 end +
        case when ride_distance is null then 1 else 0 end
      ) as totalnullcount
from
    [dbo].[2023-divvy-tripdataupdated];
```

| ride_id_null | rideable_type_null | started_at_null | ended_at_null | start_station_name_null | start_station_id_null | end_station_name_null | end_station_id_null | start_lat_null | start_lng_null | end_lat_null | end_lng_null | user_type_null | month_null | day_of_week_null | hour_null | quarter_null | ride_length_minute_null | ride_distance_null | totalnullcount |
|--------------|--------------------|-----------------|---------------|-------------------------|-----------------------|-----------------------|---------------------|----------------|----------------|--------------|--------------|----------------|------------|------------------|-----------|--------------|-------------------------|--------------------|----------------|
| 0            | 0                  | 0               | 0             | 97,750                  | 97,993                | 112,190               | 112,346             | 0              | 0              | 0            | 0            | 0              | 0          | 0                | 0         | 0            | 0                       | 0                  | 420,279        |

+ Performing a final check by counting rows where ride length is less than or equal (**<=**) to 1 minute, greater than or equal (**>=**) to 1440 minutes, or less than or equal (**<=**) to 0 minutes.
```sql
select
    count(*) as total_count
from
    [dbo].[2023-divvy-tripdataupdated]
where
    ride_length_minute <= 1
    or ride_length_minute >= 1440
    or ride_length_minute <= 0;
```

| total_count |
|-------------|
| 0           |

+ Performing a final check by counting rows where ride distance is equal (**=**) to 0 miles.
```sql
select
    count(*) as total_count
from
    [dbo].[2023-divvy-tripdataupdated]
where
    ride_distance = 0;
```

| total_count |
|-------------|
| 0           |

+ Performing a final check by counting rows where **start_station_name**, **start_station_id**, **end_station_name**, and **end_station_id** match specified values.
```sql
select
    'start_station_name' as station_type -- Specify the type of station
  , count(*) as total_count -- Select the count of all rows and alias it as 'total_count'
from
    [dbo].[2023-divvy-tripdataupdated] -- Table to count rows from
where
    start_station_name in ( -- Filter rows where the start station name matches any of the specified values
        'OH - BONFIRE - TESTING'
      , 'Hubbard Bike-checking (LBS-WH-TEST)'
      , 'chargingstx4'
      , 'chargingstx2'
      , 'chargingstx07'
      , 'chargingstx0'
      , 'chargingstx5'
      , 'chargingstx3'
      , 'chargingstx1'
      , 'chargingstx06'
      , 'OH Charging Stx - Test'
      , '2059 Hastings Warehouse Station'
      , 'DIVVY CASSETTE REPAIR MOBILE STATION'
    )
union all
select
    'start_station_id' as station_type -- Specify the type of station
  , count(*) as total_count -- Select the count of all rows and alias it as 'total_count'
from
    [dbo].[2023-divvy-tripdataupdated] -- Table to count rows from
where
    start_station_id in ( -- Filter rows where the start station id matches any of the specified values
        'OH - BONFIRE - TESTING'
      , 'Hubbard Bike-checking (LBS-WH-TEST)'
      , 'chargingstx4'
      , 'chargingstx2'
      , 'chargingstx07'
      , 'chargingstx0'
      , 'chargingstx5'
      , 'chargingstx3'
      , 'chargingstx1'
      , 'chargingstx06'
      , 'OH Charging Stx - Test'
      , '2059 Hastings Warehouse Station'
      , 'DIVVY CASSETTE REPAIR MOBILE STATION'
    )
union all
select
    'end_station_name' as station_type -- Specify the type of station
  , count(*) as total_count -- Select the count of all rows and alias it as 'total_count'
from
    [dbo].[2023-divvy-tripdataupdated] -- Table to count rows from
where
    end_station_name in ( -- Filter rows where the end station name matches any of the specified values
        'OH - BONFIRE - TESTING'
      , 'Hubbard Bike-checking (LBS-WH-TEST)'
      , 'chargingstx4'
      , 'chargingstx2'
      , 'chargingstx07'
      , 'chargingstx0'
      , 'chargingstx5'
      , 'chargingstx3'
      , 'chargingstx1'
      , 'chargingstx06'
      , 'OH Charging Stx - Test'
      , '2059 Hastings Warehouse Station'
      , 'DIVVY CASSETTE REPAIR MOBILE STATION'
    )
union all
select
    'end_station_id' as station_type -- Specify the type of station
  , count(*) as total_count -- Select the count of all rows and alias it as 'total_count'
from
    [dbo].[2023-divvy-tripdataupdated] -- Table to count rows from
where
    end_station_id in ( -- Filter rows where the end station id matches any of the specified values
        'OH - BONFIRE - TESTING'
      , 'Hubbard Bike-checking (LBS-WH-TEST)'
      , 'chargingstx4'
      , 'chargingstx2'
      , 'chargingstx07'
      , 'chargingstx0'
      , 'chargingstx5'
      , 'chargingstx3'
      , 'chargingstx1'
      , 'chargingstx06'
      , 'OH Charging Stx - Test'
      , '2059 Hastings Warehouse Station'
      , 'DIVVY CASSETTE REPAIR MOBILE STATION'
    );
```

| station_type       | total_count |
|--------------------|-------------|
| start_station_name | 0           |
| start_station_id   | 0           |
| end_station_name   | 0           |
| end_station_id     | 0           |

### Overview of Updated Data
+ The table has undergone extensive data management, adjustments, preparation, and quality assurance measures, including null value handling, outlier detection, and data reduction.
+ Reflecting the evolution of the table, it now comprises **21 columns** and incorporated a total of **4,796,729 rows**.
+ Despite the cleaning and processing efforts, there remain **420,279 null values** within the table.
  
#### Data Organization
+ Integrated the initial 12 tables into a single table named `2023-divvy-tripdata` and subsequently eliminated individual tables post-concatenation to streamline data management.
+ Adjusted data types and nullability for improved usability.
+ Implemented a primary key to **ride_id** to ensure uniqueness across rows.

#### Data Transformation
+ Renamed **member_casual** to **user_type**.
+ Derived new columns (**month**, **day_of_week**, **hour**, **quarter**, **ride_length_minute**, and **ride_distance**) by extracting and calculating from **started_at** and **ended_at** columns.
+ Created an updated table labeled **2023_divvy_tripdataupdated** to incorporate necessary alterations.

#### Data Cleansing
+ Identified the NULL values in various columns.
+ Added two additional columns (**start_coordinates** and **end_coordinates**) by grouping the start and end latitude and longitude coordinates to aid in filling in missing NULL values.
+ Filled in the NULL values in the **start_station_name**, **start_station_id**, **end_station_name**, and **end_station_id** columns based on the two newly added columns.
+ Analyzed the table for outliers before filtering and removing them.
+ Removed leading and trailing spaces in all columns to ensure cleanliness.
+ Removed outliers in **ride_length_minute** where values are (**<=**) 0 to 1 minute and (**>=)** 24 hours.
    - Ride lengths of 0 to 1 minute suggest users rented a bike but returned it immediately, potentially due to a change of plans. Conversely, ride lengths exceeding 24 hours likely indicate data errors, as it's improbable for users to keep a bike checked out for such an extended period.
+ Removed missing values in the **end latitude and longitude** columns.
    - Missing values in the end latitude and longitude columns may indicate errors or issues with the tracking system. Complete geographical coordinates are essential for accurately tracking bike usage and analyzing ride patterns.
+ Removed outliers in **ride_distance** where values are (**=**) 0 miles.
    - Ride distances of 0 miles might indicate cases where the bike was rented but not used, similar to ride lengths of 0 to 1 minute. Alternatively, it could be due to data entry errors where the distance traveled was not recorded accurately.
+ Removed entries related to **test**, **repaired**, **warehouse**, or **charging station** from the start and end station columns.
    - Entries related to test, repaired, warehouse, or charging station locations in the start and end station columns are likely not genuine ride data. These entries might represent maintenance activities, testing procedures, or other non-standard activities that are not reflective of typical bike share usage.

#### Additional Details
+ During the cleaning and filtering process, it was deemed acceptable to remove rows containing NULL values in **end_lat** and **end_lng** since this had minimal impact on the table's integrity.
+ After completing the cleaning process, it was observed that columns such as **start_station_name**, **start_station_id**, **end_station_name**, and **end_station_id** still contain NULL values.
+ The decision to retain these columns with missing values was based on the significant number of rows that would be affected if the NULL values were filled. Moreover, the data in these columns may not necessarily require imputation.

### Key Tasks
- [x]  Check the data for errors.
- [x]  Choose your tools.
- [x]  Transform the data so you can work with it effectively.
- [x]  Document the cleaning process.

### Deliverable 
- [x]  Documentation of any cleaning or manipulation of data.

## 🔍 The 'Analyze' Phase

### User Trends

#### User Type Overview

<details>
  <summary>Click to expand SQL code:</summary>

```sql
select
    user_type
  , count(*) as ride_count
  , cast(
        round(count(*) * 100.0 / sum(count(*)) over (), 2) as decimal(10, 2)
    ) as ride_count_percentage
  , cast(
        round(avg(ride_length_minute), 2) as decimal(10, 2)
    ) as avg_ride_length
  , cast(round(avg(ride_distance), 2) as decimal(10, 2)) as avg_ride_distance
from
    [dbo].[2023-divvy-tripdataupdated]
group by
    user_type
order by
    user_type;
```
</details>

| user_type | ride_count | ride_count_percentage | avg_ride_length | avg_ride_distance |
|-----------|------------|-----------------------|-----------------|-------------------|
| casual    | 1,695,628  | 35.35                 | 19.87           | 1.56              |
| member    | 3,101,101  | 64.65                 | 12.72           | 1.52              |

+ The table presents insights into the platform's ridership statistics for 2023, totaling **5,459,091 rides**.
+ Casual users accounted for **1,695,628 rides**, constituting approximately **35.35%** of the total. Their average ride duration was **19.87 minutes**, and the average distance covered was **1.56 miles** per ride.
+ On the other hand, member users contributed **3,101,101 rides**, representing about **64.65%** of the total rides. Their average ride duration was **12.72 minutes**, and the average distance covered was **1.52 miles** per ride. 

### Hourly Trends

#### Hourly Overview

<details>
  <summary>Click to expand SQL code:</summary>
  
```sql
select
    user_type
  , hour
  , count(*) as ride_count
  , cast(
        round(avg(ride_length_minute), 2) as decimal(10, 2)
    ) as avg_ride_length
  , cast(round(avg(ride_distance), 2) as decimal(10, 2)) as avg_ride_distance
from
    [dbo].[2023-divvy-tripdataupdated]
where
    user_type = 'casual'
group by
    user_type
  , hour
order by
    ride_count desc
  , case
        when right(hour, 2) = 'AM' then cast(
            substring(hour, 1, charindex(' ', hour) - 1) as int
        )
        when right(hour, 2) = 'PM' then cast(
            substring(hour, 1, charindex(' ', hour) - 1) as int
        ) + 12
    end;
```

</details>

<table> <tr><td>

| user_type | hour  | ride_count | avg_ride_length | avg_ride_distance |
|-----------|-------|------------|-----------------|-------------------|
| casual    | 0 AM  | 29,521     | 17.21           | 1.42              |
| casual    | 1 AM  | 19,087     | 17.55           | 1.45              |
| casual    | 2 AM  | 11,591     | 17.08           | 1.48              |
| casual    | 3 AM  | 6,436      | 17.36           | 1.51              |
| casual    | 4 AM  | 4,981      | 15.92           | 1.57              |
| casual    | 5 AM  | 9,730      | 13.06           | 1.40              |
| casual    | 6 AM  | 25,777     | 13.55           | 1.44              |
| casual    | 7 AM  | 45,266     | 13.21           | 1.46              |
| casual    | 8 AM  | 59,788     | 14.58           | 1.44              |
| casual    | 9 AM  | 57,262     | 19.08           | 1.54              |
| casual    | 10 AM | 70,867     | 22.89           | 1.62              |
| casual    | 11 AM | 90,525     | 24.16           | 1.66              |
| casual    | 12 PM | 106,925    | 23.73           | 1.63              |
| casual    | 1 PM  | 111,412    | 23.24           | 1.62              |
| casual    | 2 PM  | 116,291    | 23.27           | 1.62              |
| casual    | 3 PM  | 130,342    | 21.80           | 1.62              |
| casual    | 4 PM  | 151,421    | 19.99           | 1.60              |
| casual    | 5 PM  | 167,076    | 19.09           | 1.61              |
| casual    | 6 PM  | 143,077    | 18.67           | 1.59              |
| casual    | 7 PM  | 103,934    | 18.26           | 1.47              |
| casual    | 8 PM  | 74,766     | 17.75           | 1.44              |
| casual    | 9 PM  | 63,387     | 17.53           | 1.47              |
| casual    | 10 PM | 56,300     | 17.92           | 1.53              |
| casual    | 11 PM | 39,866     | 17.56           | 1.51              |

</td><td>

| user_type | hour  | ride_count | avg_ride_length | avg_ride_distance |
|-----------|-------|------------|-----------------|-------------------|
| member    | 0 AM  | 29,781     | 12.00           | 1.52              |
| member    | 1 AM  | 17,512     | 12.43           | 1.50              |
| member    | 2 AM  | 10,155     | 12.73           | 1.52              |
| member    | 3 AM  | 6,576      | 13.14           | 1.59              |
| member    | 4 AM  | 7,361      | 12.61           | 1.70              |
| member    | 5 AM  | 29,054     | 10.60           | 1.53              |
| member    | 6 AM  | 91,555     | 10.91           | 1.55              |
| member    | 7 AM  | 170,835    | 11.51           | 1.57              |
| member    | 8 AM  | 211,851    | 11.70           | 1.51              |
| member    | 9 AM  | 139,454    | 11.90           | 1.48              |
| member    | 10 AM | 124,481    | 12.72           | 1.47              |
| member    | 11 AM | 146,581    | 12.96           | 1.45              |
| member    | 12 PM | 164,354    | 12.80           | 1.44              |
| member    | 1 PM  | 164,924    | 12.72           | 1.45              |
| member    | 2 PM  | 168,675    | 13.17           | 1.50              |
| member    | 3 PM  | 208,384    | 13.10           | 1.52              |
| member    | 4 PM  | 284,354    | 13.31           | 1.57              |
| member    | 5 PM  | 333,667    | 13.52           | 1.58              |
| member    | 6 PM  | 260,941    | 13.27           | 1.53              |
| member    | 7 PM  | 183,037    | 12.95           | 1.48              |
| member    | 8 PM  | 126,929    | 12.67           | 1.46              |
| member    | 9 PM  | 98,934     | 12.55           | 1.51              |
| member    | 10 PM | 74,243     | 12.67           | 1.57              |
| member    | 11 PM | 47,463     | 12.51           | 1.56              |


</td></tr> </table>

+ The table reveals insights into the platform's ridership statistics across different times of the day.
+ Casual users display a varied distribution of ride counts throughout the day, peaking at **5 PM (167,076 rides)** and reaching their lowest point at **4 AM (4,981 rides)**. The average ride duration for casual users remains consistently high at **11 AM (24.16 minutes)** and consistently low at **5 AM (13.06 minutes)**. Similarly, the average ride distance for casual users fluctuates between its highest point at **4 AM (1.7 miles)** and its lowest at **12 PM (1.44 miles)**.
+ Member users also exhibit a diverse distribution of ride counts, with the highest count occurring at **5 PM (333,667 rides)** and the lowest at **3 AM (6,576 rides)**. Average ride lengths for member users follow relatively consistent patterns throughout the day, peaking at **5 PM (13.52 minutes)** and hitting their lowest point at **5 AM (10.6 minutes)**. Like casual users, member users' average ride distance peaks at **4 AM (1.7 miles)** and dips at **12 PM (1.44 miles)**.

### Weekly Trends

#### Weekly Overview

<details>
  <summary>Click to expand SQL code:</summary>

```sql
select
    user_type
  , day_of_week
  , count(*) as ride_count
  , cast(
        round(avg(ride_length_minute), 2) as decimal(10, 2)
    ) as avg_ride_length
  , cast(round(avg(ride_distance), 2) as decimal(10, 2)) as avg_ride_distance
from
    [dbo].[2023-divvy-tripdataupdated]
group by
    user_type
  , day_of_week
order by
    user_type
  , case
        when day_of_week = 'Mon' then 1
        when day_of_week = 'Tue' then 2
        when day_of_week = 'Wed' then 3
        when day_of_week = 'Thu' then 4
        when day_of_week = 'Fri' then 5
        when day_of_week = 'Sat' then 6
        when day_of_week = 'Sun' then 7
    end;
```

</details>

<table> <tr><td>

| user_type | day_of_week | ride_count | avg_ride_length | avg_ride_distance |
|-----------|-------------|------------|-----------------|-------------------|
| casual    | Mon         | 270,832    | 23.01           | 1.64              |
| casual    | Tue         | 191,455    | 19.25           | 1.55              |
| casual    | Wed         | 204,129    | 17.74           | 1.51              |
| casual    | Thu         | 208,031    | 17.10           | 1.49              |
| casual    | Fri         | 225,663    | 17.36           | 1.50              |
| casual    | Sat         | 258,491    | 19.45           | 1.55              |
| casual    | Sun         | 337,027    | 22.69           | 1.65              |

</td><td>

| user_type | day_of_week | ride_count | avg_ride_length | avg_ride_distance |
|-----------|-------------|------------|-----------------|-------------------|
| member    | Mon         | 342,859    | 14.13           | 1.57              |
| member    | Tue         | 418,368    | 12.05           | 1.47              |
| member    | Wed         | 490,783    | 12.23           | 1.51              |
| member    | Thu         | 499,821    | 12.17           | 1.50              |
| member    | Fri         | 500,606    | 12.28           | 1.51              |
| member    | Sat         | 449,212    | 12.64           | 1.49              |
| member    | Sun         | 399,452    | 14.13           | 1.58              |

</td></tr> </table>

+ The table provides insights into the platform's ridership statistics across the days of the week.
+ Casual users exhibit varying ride counts throughout the week, peaking on **Sundays (337,027 rides)** and hitting their lowest point on **Tuesdays (191,455 rides)**. The average ride length for casual users remains relatively consistent throughout the week, reaching its peak on **Mondays (23.01 minutes)** and its lowest on **Thursdays (17.1 minutes)**. Similarly, casual users' average distances fluctuate across different days, with **Sundays (1.65 miles)** being the highest and **Thursdays (1.49 miles)** being the lowest.
+ Member users also demonstrate fluctuations in ride counts throughout the week, with the highest count on **Fridays (500,606 rides)** and the lowest on **Mondays (342,859 rides)**. The average ride length for member users peaks on **Mondays and Sundays (14.13 minutes)** and is shortest on **Tuesdays (12.05 minutes)**. Member users' average distance is highest on **Sundays (1.58 miles)** and shortest on **Tuesdays (1.47 miles)**, with only slight variations observed across different days.

### Monthly Trends

#### Monthly Overview

<details>
  <summary>Click to expand SQL code:</summary>
  
```sql
select
    user_type
  , month
  , count(*) as ride_count
  , cast(
        round(avg(ride_length_minute), 2) as decimal(10, 2)
    ) as avg_ride_length
  , cast(round(avg(ride_distance), 2) as decimal(10, 2)) as avg_ride_distance
from
    [dbo].[2023-divvy-tripdataupdated]
group by
    user_type
  , month
order by
    user_type
  , case
        when month = 'Jan' then 1
        when month = 'Feb' then 2
        when month = 'Mar' then 3
        when month = 'Apr' then 4
        when month = 'May' then 5
        when month = 'Jun' then 6
        when month = 'Jul' then 7
        when month = 'Aug' then 8
        when month = 'Sep' then 9
        when month = 'Oct' then 10
        when month = 'Nov' then 11
        when month = 'Dec' then 12
    end;
```

</details>

<table> <tr><td>

| user_type | month | ride_count | avg_ride_length | avg_ride_distance |
|-----------|-------|------------|-----------------|-------------------|
| casual    | Jan   | 32,544     | 13.66           | 1.24              |
| casual    | Feb   | 34,978     | 15.44           | 1.33              |
| casual    | Mar   | 51,007     | 14.98           | 1.33              |
| casual    | Apr   | 118,805    | 19.56           | 1.55              |
| casual    | May   | 192,245    | 21.05           | 1.63              |
| casual    | Jun   | 249,558    | 20.85           | 1.64              |
| casual    | Jul   | 272,556    | 21.72           | 1.63              |
| casual    | Aug   | 256,733    | 20.88           | 1.63              |
| casual    | Sep   | 216,425    | 20.48           | 1.59              |
| casual    | Oct   | 146,717    | 18.80           | 1.48              |
| casual    | Nov   | 81,575     | 15.71           | 1.37              |
| casual    | Dec   | 42,485     | 14.37           | 1.28              |

</td><td>

| user_type | month | ride_count | avg_ride_length | avg_ride_distance |
|-----------|-------|------------|-----------------|-------------------|
| member    | Jan   | 122,176    | 10.86           | 1.32              |
| member    | Feb   | 120,570    | 11.21           | 1.35              |
| member    | Mar   | 162,576    | 10.85           | 1.37              |
| member    | Apr   | 232,918    | 12.26           | 1.49              |
| member    | May   | 316,768    | 13.25           | 1.57              |
| member    | Jun   | 360,531    | 13.49           | 1.60              |
| member    | Jul   | 375,211    | 13.81           | 1.61              |
| member    | Aug   | 393,777    | 13.73           | 1.59              |
| member    | Sep   | 345,708    | 13.22           | 1.56              |
| member    | Oct   | 304,349    | 12.22           | 1.47              |
| member    | Nov   | 222,031    | 11.54           | 1.41              |
| member    | Dec   | 144,486    | 11.36           | 1.37              |

</td></tr> </table>

+ The table presents insights into the platform's ridership statistics across various months.
+ Casual users show varying ride counts throughout the year, with the highest count in **July (272,556 rides)** and the lowest in **January (32,544 rides)**. The average ride length peaks in **July (21.76 minutes)** and drops to its lowest point in **January (13.66 minutes)**, indicating fluctuations throughout the year. Casual users' average distances range from **June (1.64 miles)**, the highest, to **January (1.24 miles)**, the lowest, showcasing variability across different months.
+ Similarly, member users also experience fluctuations in ride counts throughout the year, reaching the highest count in **August (393,777 rides)** and the lowest in **February (120,570 rides)**. The average ride length for member users peaks in **July (13.81 minutes)** and declines to its lowest point in **March (10.85 minutes)**, demonstrating variations across different months. Member users' average distances range from **July (1.61 miles)**, the highest, to **January (1.32 miles)**, the lowest.

### Quarterly Trends

#### Quarterly Overview

<details>
  <summary>Click to expand SQL code:</summary>
  
```sql
select
    user_type
  , quarter
  , count(*) as ride_count
  , cast(
        round(avg(ride_length_minute), 2) as decimal(10, 2)
    ) as avg_ride_length
  , cast(round(avg(ride_distance), 2) as decimal(10, 2)) as avg_ride_distance
from
    [dbo].[2023-divvy-tripdataupdated]
group by
    user_type
  , quarter
order by
    user_type
  , quarter;
```

</details>

<table> <tr><td>

| user_type | quarter | ride_count | avg_ride_length | avg_ride_distance |
|-----------|---------|------------|-----------------|-------------------|
| casual    | Q1      | 118,529    | 14.75           | 1.31              |
| casual    | Q2      | 560,608    | 20.64           | 1.62              |
| casual    | Q3      | 745,714    | 21.07           | 1.62              |
| casual    | Q4      | 270,777    | 17.18           | 1.42              |

</td><td>

| user_type | quarter | ride_count | avg_ride_length | avg_ride_distance |
|-----------|---------|------------|-----------------|-------------------|
| member    | Q1      | 405,322    | 10.96           | 1.35              |
| member    | Q2      | 910,217    | 13.09           | 1.57              |
| member    | Q3      | 1,114,696  | 13.60           | 1.59              |
| member    | Q4      | 670,866    | 11.81           | 1.43              |

</td></tr> </table>

+ The table presents insights into the platform's ridership statistics across each quarter.
+ Casual users exhibit varying ride counts, with the highest count in **Q3 (745,714 rides)** and the lowest in **Q1 (118,529 rides)**. Their average ride length varies throughout the year, peaking in **Q3 (21.07 minutes)** and reaching its lowest point in **Q1 (14.75 minutes)**. Average distances range from their highest in **Q2 and Q3 (1.62 miles)** to their lowest in **Q1 (1.31 miles)**, showing variability.
+ Member users also show fluctuations in ride counts, with the highest count in **Q3 (1,114,696 rides)** and the lowest in **Q1 (405,322 rides)**. Their average ride length ranges from its highest in **Q3 (13.60 minutes)** to its lowest in **Q1 (10.96 minutes)**. Similarly, average distances vary from their highest in **Q3 (1.59 miles)** to their lowest in **Q1 (1.35 miles)**, displaying differences across quarters.

### Rideable Trends

#### Rideable Type Overview

<details>
  <summary>Click to expand SQL code:</summary>

```sql
select
    user_type
  , rideable_type
  , count(*) as ride_count
    , cast(
        round(avg(ride_length_minute), 2) as decimal(10, 2)
    ) as avg_ride_length
  , cast(round(avg(ride_distance), 2) as decimal(10, 2)) as avg_ride_distance
from
    [dbo].[2023-divvy-tripdataupdated]
group by
    user_type
  , rideable_type
order by
    user_type
  , rideable_type;
```

</details>

<table> <tr><td>

| user_type | rideable_type | ride_count | avg_ride_length | avg_ride_distance |
|-----------|---------------|------------|-----------------|-------------------|
| casual    | classic_bike  | 716,056    | 24.35           | 1.54              |
| casual    | docked_bike   | 57,108     | 45.90           | 1.77              |
| casual    | electric_bike | 922,464    | 14.77           | 1.57              |

</td><td>

| user_type | rideable_type | ride_count | avg_ride_length | avg_ride_distance |
|-----------|---------------|------------|-----------------|-------------------|
| member    | classic_bike  | 1,521,033  | 13.61           | 1.39              |
| member    | electric_bike | 1,580,068  | 11.86           | 1.64              |

</td></tr> </table>

+ The table provides insights into the platform's ridership statistics across different rideable types.
+ Casual users embarked on a combined total of **1,695,628 bike rides** across three categories. **Classic_bikes (716,056 rides)** saw the highest uptake, averaging a duration of **24.35 minutes** and covering a distance of **1.54 miles** per ride. **Docked_bikes (57,108 rides)** exhibited longer rides, averaging **45.90 minutes** and covering **1.77 miles**, despite being fewer in number. **Electric_bikes (922,464 rides)** were the most popular among casual users, featuring shorter but more frequent trips, averaging **14.77 minutes** in duration and covering **1.57 miles** per ride.
+ Member users engaged in a total of **3,101,101 bike rides** across two categories. **Classic_bikes (1,521,033 rides)** had an average ride duration of **13.61 minutes** and covered **1.39 miles** per ride. **Electric_bikes (1,580,068 rides)** emerged as the preferred choice for members, characterized by shorter durations averaging **11.86 minutes** and covering slightly longer distances, averaging **1.64 miles per ride**.

### Station Trends

#### Most Popular Start Stations

<details>
  <summary>Click to expand SQL code:</summary>
  
```sql
select
    user_type
  , start_station_name
  , start_station_trips
from
    (
        select
            'casual' as user_type
          , start_station_name
          , count(*) as start_station_trips
        from
            [dbo].[2023-divvy-tripdataupdated]
        where
            start_station_name is not null
            and user_type = 'casual'
        group by
            start_station_name
        order by
            start_station_trips desc
        offset
            0 rows
        fetch first
            20 rows only
    ) as TopCasualStations;

select
    user_type
  , start_station_name
  , start_station_trips
from
    (
        select
            'member' as user_type
          , start_station_name
          , count(*) as start_station_trips
        from
            [dbo].[2023-divvy-tripdataupdated]
        where
            start_station_name is not null
            and user_type = 'member'
        group by
            start_station_name
        order by
            start_station_trips desc
        offset
            0 rows
        fetch first
            20 rows only
    ) as TopMemberStations;

select
    user_type
  , start_station_name
  , start_station_trips
from
    (
        select
            'casual' as user_type
          , start_station_name
          , count(*) as start_station_trips
        from
            [dbo].[2023-divvy-tripdataupdated]
        where
            start_station_name is not null
            and user_type = 'casual'
        group by
            start_station_name
        order by
            start_station_trips desc
        offset
            0 rows
        fetch first
            10 rows only
    ) as TopCasualStations
union all
select
    user_type
  , start_station_name
  , start_station_trips
from
    (
        select
            'member' as user_type
          , start_station_name
          , count(*) as start_station_trips
        from
            [dbo].[2023-divvy-tripdataupdated]
        where
            start_station_name is not null
            and user_type = 'member'
        group by
            start_station_name
        order by
            start_station_trips desc
        offset
            0 rows
        fetch first
            10 rows onlybn  
    ) as TopMemberStations;
```

</details>

<table> <tr><td>

| user_type | start_station_name                  | start_station_trips |
|-----------|-------------------------------------|---------------------|
| casual    | Streeter Dr & Grand Ave             | 39,395              |
| casual    | DuSable Lake Shore Dr & Monroe St   | 22,840              |
| casual    | Michigan Ave & Oak St               | 19,924              |
| casual    | DuSable Lake Shore Dr & North Blvd  | 19,477              |
| casual    | Theater on the Lake                 | 15,909              |
| casual    | Millennium Park                     | 15,440              |
| casual    | Shedd Aquarium                      | 15,144              |
| casual    | Clark St & Lincoln Ave              | 13,552              |
| casual    | Wells St & Concord Ln               | 12,732              |
| casual    | Dusable Harbor                      | 11,491              |
| casual    | Montrose Harbor                     | 11,128              |
| casual    | Clark St & Armitage Ave             | 10,774              |
| casual    | Adler Planetarium                   | 10,610              |
| casual    | Wilton Ave & Belmont Ave            | 10,388              |
| casual    | Clark St & Elm St                   | 10,368              |
| casual    | Broadway & Barry Ave                | 10,273              |
| casual    | Indiana Ave & Roosevelt Rd          | 9,485               |
| casual    | Clark St & Newport St               | 9,399               |
| casual    | Wells St & Elm St                   | 9,356               |
| casual    | DuSable Lake Shore Dr & Belmont Ave | 8,998               |

</td><td>

| user_type | start_station_name                 | start_station_trips |
|-----------|------------------------------------|---------------------|
| member    | Clinton St & Washington Blvd       | 24,587              |
| member    | Clark St & Elm St                  | 23,908              |
| member    | Kingsbury St & Kinzie St           | 23,224              |
| member    | Wells St & Concord Ln              | 22,228              |
| member    | Broadway & Barry Ave               | 20,220              |
| member    | Clinton St & Madison St            | 18,826              |
| member    | Wells St & Elm St                  | 18,690              |
| member    | Loomis St & Lexington St           | 16,983              |
| member    | Sheffield Ave & Fullerton Ave      | 16,676              |
| member    | Wells St & Huron St                | 16,622              |
| member    | Larrabee St & Kingsbury St         | 16,502              |
| member    | Clark St & Lincoln Ave             | 16,496              |
| member    | Streeter Dr & Grand Ave            | 16,305              |
| member    | Dearborn St & Erie St              | 16,303              |
| member    | Canal St & Adams St                | 16,232              |
| member    | DuSable Lake Shore Dr & North Blvd | 16,183              |
| member    | State St & Chicago Ave             | 15,964              |
| member    | Clark St & Wrightwood Ave          | 15,850              |
| member    | Wilton Ave & Belmont Ave           | 15,846              |
| member    | Lincoln Ave & Fullerton Ave        | 15,807              |

</td></tr> </table>

+ The table provides insights into the platform's most popular start stations for both casual and member users.
+ The top start station for casual users is **"Streeter Dr & Grand Ave" (39,395 trips)**. Other popular start stations include **"DuSable Lake Shore Dr & Monroe St" (22,840 trips)**, **"Michigan Ave & Oak St" (19,924 trips)**, and **"DuSable Lake Shore Dr & North Blvd" (19,477 trips)**. Some of these stations are situated near popular tourist attractions, shopping areas, or recreational spots, making them attractive destinations for casual riders interested in leisurely rides, city exploration, shopping, dining, or outdoor activities. Overall, these start stations reflect the diverse preferences and interests among casual users.
+ For member users, the top start station is **"Clinton St & Washington Blvd" (24,587 trips)**. Other frequently used start stations include **"Clark St & Elm St" (23,908 trips)**, **"Kingsbury St & Kinzie St" (23,224 trips)**, and **"Wells St & Concord Ln" (22,228 trips)**. These stations are located in various neighborhoods, catering to member users residing in or commuting to the respective areas. Some stations may be conveniently located near popular attractions, office buildings, restaurants, or nightlife spots, making them suitable for commuting or social activities. Overall, these start stations fulfill a variety of needs for member users across different neighborhoods.

### Map Trends

#### Most Traveled Routes

<details>
  <summary>Click to expand SQL code:</summary>

```sql
select
    user_type
  , start_station_name
  , start_lat
  , start_lng
  , end_station_name
  , end_lat
  , end_lng
  , rideable_type
  , count(*) as total_rides
from
    [dbo].[2023-divvy-tripdataupdated]
where
    (
        start_lat != end_lat
        or start_lng != end_lng
    )
    and user_type = 'casual'
    and start_station_name is not null
    and end_station_name is not null -- Ensure start and end station names are not null
group by
    user_type
  , start_station_name
  , start_lat
  , start_lng
  , end_station_name
  , end_lat
  , end_lng
  , rideable_type
having
    count(*) > 200
union all
select
    user_type
  , start_station_name
  , start_lat
  , start_lng
  , end_station_name
  , end_lat
  , end_lng
  , rideable_type
  , count(*) as total_rides
from
    [dbo].[2023-divvy-tripdataupdated]
where
    (
        start_lat != end_lat
        or start_lng != end_lng
    )
    and user_type = 'member'
    and start_station_name is not null
    and end_station_name is not null -- Ensure start and end station names are not null
group by
    user_type
  , start_station_name
  , start_lat
  , start_lng
  , end_station_name
  , end_lat
  , end_lng
  , rideable_type
having
    count(*) > 200;
```

</details>

+ These queries retrieve data for map visualization, focusing on rides taken by 'casual' or 'member' users where the start and end coordinates are different. The count threshold of 200 rides helps identify significant biking locations, such as popular routes or commuter hubs, for visualization on the map.

### Key Tasks
- [x]  Aggregate your data so it’s useful and accessible.
- [x]  Organize and format your data.
- [x]  Perform calculations.
- [x]  Identify trends and relationships.

### Deliverable 
- [x]  A summary of your analysis.

## 🎁 The 'Share' Phase

### **User Type Trends**

![1  User Type Overview](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/48f259a7-0401-4b63-9f41-1a6cb5eab885)

![1 1 Average Ride Length](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/53ca7851-509e-4620-b2c4-5376fe4bcd13)

![1 2 Average Ride Distance](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/579c7ffa-c166-4fe1-9779-a53d1889a52f)

#### **Summary of User Trends**
The "**User Trends**" visuals explore user behavior, preferences, and demographics between casual and member users in the year 2023, spotlighting:

+ **Casual User Key Findings**:
  - Casual users, comprising a significant portion of the total rides, exhibit behavior patterns characterized by longer average ride durations and slightly longer distances covered per ride compared to member users. These behavior patterns suggest a habit among casual users for more extended and exploratory rides, perhaps to enjoy leisurely experiences while navigating through the city. The preference for leisurely rides implies a focus on recreational or occasional transportation needs rather than the functional necessity of commuting, indicating a desire for flexibility in transportation choices. The inclination towards leisurely exploration aligns with the idea of using bike rides as a means of experiencing the city's ambiance or enjoying outdoor activities.
+ **Member User Key Findings**:
  - Representing the majority of the total rides, member users demonstrate a distinct usage pattern characterized by higher ride frequency and shorter average ride durations compared to casual users. The higher ride frequency suggests a more utilitarian use of the platform, likely for routine commuting or frequent short-distance travel within urban areas. This prioritization of quick and convenient mobility solutions for daily travel needs underscores the bike-share's role as a reliable and efficient mode of urban transportation for member users, facilitating seamless and hassle-free mobility within their daily routines.

**Key Questions**:
1. **How do annual members and casual riders use Cyclistic bikes differently?**
   - Annual members and casual riders exhibit distinct usage patterns when utilizing Cyclistic bikes. Annual members, representing the majority of the total rides, prioritize frequent but shorter rides, suggesting a utilitarian approach focused on routine commuting or short-distance urban travel. In contrast, casual riders, although comprising a significant portion of total rides, engage in less frequent but longer rides. These behavior patterns indicate a preference among casual riders for extended and exploratory trips, potentially for recreational purposes or occasional transportation needs rather than daily commuting.
2. **Why would casual riders buy Cyclistic annual memberships?**
   - Casual riders may opt to purchase Cyclistic annual memberships to access the convenience and reliability of the platform for their sporadic transportation needs. While casual riders typically prefer longer and less frequent rides, the benefits offered by annual memberships, such as unlimited access to bikes and streamlined rental processes, could incentivize them to transition towards more regular usage. Additionally, if Cyclistic offers incentives tailored to casual riders' preferences, such as discounts for longer rides or promotions for recreational activities, it could further encourage them to invest in annual memberships.
3. **How can Cyclistic use digital media to influence casual riders to become members?**
   - Cyclistic can leverage digital media channels to target casual riders and encourage them to become members through targeted marketing campaigns and personalized incentives. By analyzing casual riders' behavior patterns and preferences, Cyclistic can tailor its digital marketing strategies to highlight the benefits of annual memberships, such as cost savings, convenience, and access to exclusive features. Utilizing social media platforms, email marketing, and targeted online advertisements, Cyclistic can showcase success stories from satisfied members, promote limited-time offers or discounts on annual memberships, and provide easy-to-follow steps for signing up. Additionally, Cyclistic can implement referral programs where existing members can earn rewards for referring casual riders who subsequently become members, thus fostering a sense of community and incentivizing membership conversion.

This analysis serves as a foundational step towards understanding the unique characteristics of both casual and member users, laying the groundwork for the development of a targeted conversion strategy aimed at transitioning casual riders into annual members. By delving deeper into the findings, Cyclistic can uncover valuable insights that will enable the refinement of its marketing strategies, ultimately enhancing overall effectiveness.

--------------------------------------

### **Hourly Trends**

![2  Hourly User Overview](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/f7a88658-5576-4842-9097-50bcd887187d)

![2 1 Hourly Average Ride Length](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/6825cffb-45ac-4584-a777-bf8b430996dd)

![2 2 Hourly Average Ride Distance](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/751a11be-a0ef-435a-8962-2ad42e6e7439)

#### **Summary of Hourly Trends**
The "**Hourly Trends**" visuals explore fluctuations in activity throughout the day, spotlighting:

+ **Casual User Key Findings**:
   - Casual users demonstrate diverse engagement with the platform throughout the day, with ride counts peaking during late morning and early afternoon hours, notably at 11 AM through 1 PM. This suggests a preference for midday leisure activities or recreational outings, aligning with the tendency for longer average ride durations during these hours. The peak in ride counts at 5 PM further indicates the utilization of bike rides for post-work relaxation or social activities. Conversely, ride counts taper off during early morning hours, indicating a lower propensity for engagement in bike rides for commuting or early morning activities. The fluctuations in both ride counts and average ride durations throughout the day underscore the flexible and spontaneous nature of casual user behavior, with rides often being influenced by recreational opportunities and leisurely pursuits.
+ **Member User Key Findings**:
   - Member users exhibit more consistent and predictable patterns in engagement with the platform, with ride counts steadily increasing during morning hours and peaking during the evening rush hour, notably at 5 PM. This consistent trend suggests that member users predominantly utilize the platform for commuting or daily travel needs, aligning bike rides with typical workday schedules. The peak in ride counts during evening hours reflects reliance on bike-sharing services as a convenient and efficient mode of transportation for the commute home or for post-work errands and activities. Furthermore, the relatively stable average ride durations and distances throughout the day indicate a practical approach to bike rides among member users, emphasizing practicality and efficiency in transportation choices. Understanding these consistent behavior patterns is crucial for optimizing service operations and resource allocation to meet the demands of member users during peak commuting hours and ensuring a seamless user experience throughout the day.

**Key Questions**:
1. **How do annual members and casual riders use Cyclistic bikes differently?**
   - Annual members and casual riders demonstrate distinct usage patterns in their engagement with Cyclistic bikes. Casual riders display diverse activity throughout the day, with ride counts peaking during late morning and early afternoon hours. This suggests a preference for midday leisure activities or recreational outings, as indicated by longer average ride durations during these hours. In contrast, annual members exhibit more consistent and predictable patterns, with ride counts steadily increasing during morning hours and peaking during the evening rush hour. This consistency suggests that annual members predominantly utilize the platform for commuting or daily travel needs, aligning bike rides with typical workday schedules.
2. **Why would casual riders buy Cyclistic annual memberships?**
   - Casual riders may opt to purchase Cyclistic annual memberships to access the convenience and reliability of the platform for their sporadic transportation needs. While casual riders typically exhibit diverse engagement throughout the day, the consistent and predictable patterns observed among annual members indicate a practical and efficient use of bike-sharing services for commuting or daily travel. By investing in an annual membership, casual riders can enjoy the benefits of unlimited access to bikes and streamlined rental processes, enhancing their overall experience and incentivizing more frequent usage.
3. **How can Cyclistic use digital media to influence casual riders to become members?**
   - Cyclistic can leverage digital media channels to target casual riders and encourage them to become members through targeted marketing campaigns and personalized incentives. By highlighting the benefits of annual memberships, such as cost savings, convenience, and access to exclusive features, Cyclistic can appeal to casual riders' diverse engagement patterns and emphasize the practicality and efficiency of annual membership usage. Utilizing social media platforms, email marketing, and targeted online advertisements, Cyclistic can showcase success stories from satisfied members, promote limited-time offers or discounts on annual memberships, and provide easy-to-follow steps for signing up. Additionally, Cyclistic can implement referral programs where existing members can earn rewards for referring casual riders who subsequently become members, fostering a sense of community and incentivizing membership conversion.

This analysis reveals significant findings regarding the behaviors of both casual and member users throughout the day, offering essential direction for developing a conversion strategy focused on transitioning casual riders into annual members. Additionally, by continuing to delve deeper into the findings, Cyclistic can uncover valuable insights that will refine its marketing strategies, ultimately enhancing overall effectiveness.

--------------------------------------

### **Weekly Trends**

![3  Weekly User Overview](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/d9091b6f-42ab-423b-a8ca-5a975eb0a320)

![3 1 Weekly Average Ride Length](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/2fd0be1f-6b95-411d-b5eb-4b110390fa1c)

![3 2 Weekly Average Ride Distance](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/c3b13c5c-f844-49da-9f27-827dc9c6f3d8)

#### **Summary of Weekly Trends**
The "**Weekly Trends**" visuals explore recurring patterns on a weekly basis, spotlighting:

+ **Casual User Key Findings**:
   - Casual users exhibit notable fluctuations in ride counts across different days of the week, with the highest count observed on Sundays and the lowest on Tuesdays. This pattern suggests that casual users may prefer weekend rides, possibly for recreational or leisure purposes, while engagement drops during weekdays, possibly due to work or other commitments. Moreover, the average ride length for casual users remains relatively consistent throughout the week, reaching its peak on Mondays and its lowest on Thursdays. This indicates a preference for longer rides at the beginning of the week, possibly for weekend outings or leisure activities, while ride durations shorten towards the end of the week. Similarly, casual users' average ride distances fluctuate across different days, with Sundays recording the highest distances and Thursdays the lowest, reflecting the varying intensity of recreational activities or leisurely exploration across the week.
+ **Member User Key Findings**:
   - Member users also demonstrate fluctuations in ride counts across the days of the week, with the highest count observed on Fridays and the lowest on Mondays. This pattern aligns with typical commuting behaviors, with higher engagement during weekdays for work-related travel and reduced activity on weekends. Interestingly, the average ride length for member users peaks on Mondays and Sundays, indicating longer rides at the beginning and end of the week, possibly for leisure or recreational activities. Conversely, ride durations are shortest on Tuesdays, suggesting a focus on more efficient and shorter commuting rides during midweek. Additionally, member users' average distance is highest on Sundays, possibly indicating longer leisure rides on weekends, and shortest on Tuesdays, reflecting the focus on shorter commute distances during weekdays. Understanding these distinct behavior patterns across different days of the week is essential for optimizing service availability and scheduling to accommodate the diverse needs of both casual and member users throughout the week.

**Key Questions**:
1. **How do annual members and casual riders use Cyclistic bikes differently?**
   - Annual members and casual riders exhibit distinct usage patterns in their engagement with Cyclistic bikes, particularly evident in their weekly trends. Casual riders display notable fluctuations in ride counts across different days of the week, with the highest count observed on Sundays and the lowest on Tuesdays. This suggests a preference for weekend rides, possibly for recreational or leisure purposes, while engagement drops during weekdays, possibly due to work or other commitments. In contrast, member users also demonstrate fluctuations in ride counts across the days of the week, with the highest count observed on Fridays and the lowest on Mondays. This pattern aligns with typical commuting behaviors, with higher engagement during weekdays for work-related travel and reduced activity on weekends.
2. **Why would casual riders buy Cyclistic annual memberships?**
   - Casual riders may consider purchasing Cyclistic annual memberships to access the convenience and reliability of the platform for their sporadic transportation needs, as indicated by their weekly trends. While casual riders exhibit fluctuations in engagement throughout the week, the consistent patterns observed among annual members suggest a practical and efficient use of bike-sharing services for commuting or daily travel. By investing in an annual membership, casual riders can enjoy the benefits of unlimited access to bikes and streamlined rental processes, enhancing their overall experience and incentivizing more frequent usage, especially during peak commuting days.
3. **How can Cyclistic use digital media to influence casual riders to become members?**
   - Cyclistic can leverage digital media channels to target casual riders and encourage them to become members through targeted marketing campaigns and personalized incentives, leveraging insights from their weekly trends. By highlighting the benefits of annual memberships, such as cost savings, convenience, and access to exclusive features, Cyclistic can appeal to casual riders' preferences for weekend rides or recreational outings. Utilizing social media platforms, email marketing, and targeted online advertisements, Cyclistic can showcase success stories from satisfied members, promote limited-time offers or discounts on annual memberships tailored to weekend usage, and provide easy-to-follow steps for signing up. Additionally, Cyclistic can implement referral programs where existing members can earn rewards for referring casual riders who subsequently become members, fostering a sense of community and incentivizing membership conversion.

This analysis reveals key findings regarding the patterns of both user categories over the weekly timeframe, offering essential direction for developing a conversion strategy focused on transitioning casual riders into annual members. Additionally, by continuing to delve deeper into the findings, Cyclistic can uncover valuable insights that will refine its marketing strategies, ultimately enhancing overall effectiveness.

--------------------------------------

### **Monthly Trends**

![4  Monthly User Overview](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/87aea40a-3e1e-4996-a900-35d9c4bd6b94)

![4 1 Monthly Average Ride Length](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/290f2377-7511-4648-b346-addf21c9f0eb)

![4 2 Monthly Average Ride Distance](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/20009d99-155d-49dc-8eb3-f232688f58a4)

#### **Summary of Monthly Trends**
The "**Monthly Trends**" visuals explore trends and changes over each month, spotlighting:

+ **Casual User Key Findings**:
   - Casual users exhibit fluctuations in ride counts throughout the year, with peaks observed during summer months, particularly in July, and lows during winter months, notably in January. This pattern suggests a seasonal trend in casual user engagement, with higher activity levels during warmer months conducive to outdoor activities. The fluctuations in ride counts are likely influenced by factors such as weather conditions and the availability of outdoor recreational opportunities. Moreover, the average ride length for casual users follows a similar pattern, peaking in July and declining in January, indicating variations in ride durations across seasons. These variations may be due to changes in weather conditions and the desire for longer rides during more pleasant outdoor conditions. The average ride distances for casual users also fluctuate throughout the year, with peaks observed in summer months like June and July and lows in winter months like January and December, reflecting seasonal preferences for longer recreational rides during warmer weather.
+ **Member User Key Findings**:
   - Member users also experience fluctuations in ride counts throughout the year, with peaks observed during summer months, especially in August, and lows during colder months, notably in February. This pattern aligns with casual users' behavior, indicating a seasonal trend in member user engagement, likely influenced by weather conditions and outdoor activities. Similarly, the average ride length for member users mirrors this pattern, peaking in July and declining in March, suggesting variations in ride durations across seasons. These fluctuations may be attributed to changes in weather conditions and the availability of outdoor recreational activities. Member users' average distances also show seasonal variability, with peaks observed in summer months like July and lows in winter months like January, reflecting seasonal preferences for longer recreational or commuting rides during warmer weather. Understanding these seasonal behavior patterns is crucial for optimizing service offerings and resource allocation to meet the changing needs of both casual and member users throughout the year.

**Key Questions**:
1. **How do annual members and casual riders use Cyclistic bikes differently?**
   - Annual members and casual riders exhibit distinct usage patterns in their engagement with Cyclistic bikes, particularly evident in their monthly trends. Casual users display fluctuations in ride counts throughout the year, with peaks observed during summer months, particularly in July, and lows during winter months, notably in January. This seasonal trend suggests that casual riders may prefer to use Cyclistic bikes for recreational or leisure purposes during warmer months conducive to outdoor activities. In contrast, member users also experience fluctuations in ride counts throughout the year, with peaks observed during summer months, especially in August, and lows during colder months, notably in February. This aligns with casual users' behavior, indicating a seasonal trend in member user engagement likely influenced by weather conditions and outdoor activities.
2. **Why would casual riders buy Cyclistic annual memberships?**
   - Casual riders may consider purchasing Cyclistic annual memberships to access the convenience and reliability of the platform for their seasonal transportation needs, as indicated by their monthly trends. While casual riders exhibit fluctuations in engagement throughout the year, the consistent patterns observed among annual members suggest a practical and efficient use of bike-sharing services, even during peak seasonal periods. By investing in an annual membership, casual riders can enjoy the benefits of unlimited access to bikes and streamlined rental processes, enhancing their overall experience and incentivizing more frequent usage, especially during high-demand seasons.
3. **How can Cyclistic use digital media to influence casual riders to become members?**
   - Cyclistic can leverage digital media channels to target casual riders and encourage them to become members through targeted marketing campaigns and personalized incentives, leveraging insights from their monthly trends. By highlighting the benefits of annual memberships, such as cost savings, convenience, and access to exclusive features, Cyclistic can appeal to casual riders' preferences for seasonal rides or recreational outings. Utilizing social media platforms, email marketing, and targeted online advertisements, Cyclistic can showcase success stories from satisfied members, promote limited-time offers or discounts on annual memberships tailored to seasonal usage, and provide easy-to-follow steps for signing up. Additionally, Cyclistic can implement referral programs where existing members can earn rewards for referring casual riders who subsequently become members, fostering a sense of community and incentivizing membership conversion, even during peak seasonal periods.

This analysis reveals key findings regarding the fluctuations in bike usage patterns between casual and member users throughout the year, offering essential direction for developing a conversion strategy focused on transitioning casual riders into annual members. Additionally, by continuing to delve deeper into the findings, Cyclistic can uncover valuable insights that will refine its marketing strategies, ultimately enhancing overall effectiveness.

--------------------------------------

### **Quarterly Trends**

![5  Quarterly Overview](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/e46a9129-f0a8-40a7-a420-f8ad91c18a83)

![5 1 Quarterly Average Ride Length](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/28d437ae-d905-4735-848f-1098e1c33671)

![5 2 Quarterly Average Ride Distance](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/67720bde-f717-4ec2-92b6-ae21f576fc0a)

#### **Summary of Quarterly Trends**
The "**Quarterly Trends**" visuals explore broader trends across quarters, spotlighting:

+ **Casual User Key Findings**:
   - Casual users demonstrate fluctuations in ride counts across quarters, with the highest activity observed in Q3 and the lowest in Q1. This pattern suggests a seasonal trend in casual user engagement, with peak usage during warmer months conducive to outdoor activities. For example, during Q3, which typically encompasses the summer months, casual users are more likely to engage in recreational biking due to favorable weather conditions and vacation periods. Moreover, the average ride length for casual users follows a similar pattern, peaking in Q3 and declining in Q1, indicating variations in ride durations across quarters. The average ride distances for casual users also fluctuate throughout the year, with peaks observed in Q2 and Q3 and lows in Q1, reflecting seasonal preferences for longer recreational rides during warmer weather.
+ **Member User Key Findings**:
   - Member users also experience fluctuations in ride counts across quarters, with the highest activity observed in Q3 and the lowest in Q1. This pattern aligns with casual users' behavior, suggesting seasonal trends in member user engagement, possibly driven by similar factors such as weather conditions or vacation periods. For instance, during Q3, member users may take advantage of the warmer weather and longer daylight hours for outdoor activities, leading to increased bike usage. Similarly, the average ride length for member users mirrors this pattern, peaking in Q3 and declining in Q1, suggesting variations in ride durations across quarters. Member users' average distances also show seasonal variability, with peaks observed in Q3 and lows in Q1, reflecting seasonal preferences for longer recreational or commuting rides during warmer weather. Understanding these seasonal behavior patterns is essential for optimizing service offerings and resource allocation to meet the changing needs of both casual and member users throughout the year.

**Key Questions**:
1. **How do annual members and casual riders use Cyclistic bikes differently?**
   - Annual members and casual riders demonstrate different usage patterns despite seasonal similarities. For example, while casual riders show fluctuations in ride counts, peaking in Q3 and lowest in Q1, annual members also exhibit similar fluctuations, with peak activity in Q3 and low in Q1. This suggests a preference for seasonal or recreational biking among both user groups, likely due to favorable weather conditions. However, the motivation behind their bike usage might differ. While casual riders may primarily use bikes for leisure or occasional transportation, annual members might use them more consistently for commuting or daily travel needs. Cyclistic's annual memberships offer benefits such as unlimited access to bikes and streamlined rental processes, catering to the diverse needs of both user groups.
2. **Why would casual riders buy Cyclistic annual memberships?**
   - Casual riders may consider purchasing Cyclistic annual memberships to access the convenience and reliability of the platform for their seasonal transportation needs, as indicated by their quarterly trends. During peak seasons, casual riders may find it more cost-effective and convenient to have unlimited access to bikes rather than relying on individual rentals. Cyclistic's annual memberships offer significant cost savings compared to pay-as-you-go options, making them an attractive choice for casual riders looking to enjoy frequent rides during high-demand quarters. Additionally, annual memberships provide access to exclusive features such as priority parking and bike availability, further enhancing the overall experience for casual riders.
3. **How can Cyclistic use digital media to influence casual riders to become members?**
   - Cyclistic can leverage digital media channels to target casual riders and encourage them to become members through targeted marketing campaigns and personalized incentives, leveraging insights from their quarterly trends. By highlighting the benefits of annual memberships, such as cost savings, convenience, and access to exclusive features, Cyclistic can appeal to casual riders' preferences for seasonal rides or recreational outings. Utilizing social media platforms, email marketing, and targeted online advertisements, Cyclistic can showcase success stories from satisfied members, promote limited-time offers or discounts on annual memberships tailored to seasonal usage, and provide easy-to-follow steps for signing up. Additionally, Cyclistic can implement referral programs where existing members can earn rewards for referring casual riders who subsequently become members, fostering a sense of community and incentivizing membership conversion, even during peak seasonal periods.

This analysis reveals key findings regarding the identification of specific behaviors and preferences among users across the different quarters of the year, offering essential direction for developing a conversion strategy focused on transitioning casual riders into annual members. Additionally, by continuing to delve deeper into the findings, Cyclistic can uncover valuable insights that will refine its marketing strategies, ultimately enhancing overall effectiveness.

--------------------------------------

### **Rideable Trends**

![6  Rideable Type Overview](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/71a536c4-04bc-4094-a3e8-1b703818a810)

#### **Summary of Rideable Trends**
The "**Rideable Trends**" visuals explore usage patterns of different types of rideable bikes, spotlighting:

+ **Casual User Key Findings**:
   - Casual users demonstrate diverse preferences for rideable types, with **electric_bikes** being the most popular choice, accounting for the majority of their rides. Despite shorter average ride durations, electric_bikes are favored for their convenience and ease of use, enabling users to cover moderate distances efficiently. **Classic_bikes** also attract a significant number of casual users, offering longer rides with leisurely pacing, ideal for exploring urban areas or enjoying recreational outings. In contrast, **docked_bikes** exhibit the longest average ride durations and cover the longest distances per ride, suggesting their usage for more extensive excursions or leisurely rides.
+ **Member User Key Findings**:
   - Member users exhibit a preference for **electric_bikes**, accounting for the majority of their rides. This choice reflects the efficiency and convenience of electric bikes for short-distance commuting or urban travel among members. Despite shorter average ride durations compared to classic bikes, electric bikes enable members to cover longer distances per ride, indicating their suitability for quick and efficient mobility solutions. **Classic_bikes** remain a popular choice among members as well, offering moderate ride durations and distances, suitable for routine commuting or leisurely rides within urban areas.

**Key Questions**:
1. **How do annual members and casual riders use Cyclistic bikes differently?**
   - Annual members and casual riders exhibit differing preferences in their choice of rideable bikes, suggesting varied usage patterns. Casual riders show a fondness for electric bikes, which constitute the majority of their rides, offering convenience and efficiency for covering moderate distances. In contrast, classic bikes are also popular among casual riders, offering longer rides suited for urban exploration or recreational outings, while docked bikes cater to those seeking longer excursions or leisurely rides. Member users predominantly opt for electric bikes, reflecting their preference for efficient and convenient mobility solutions, particularly for short-distance commuting or urban travel. Similar to casual riders, electric bikes enable members to cover longer distances efficiently, aligning with their practical usage patterns. Classic bikes remain a popular choice among members as well, offering moderate ride durations suitable for routine commuting or leisurely urban rides. While both user types share a preference for electric bikes, casual riders tend to utilize classic and docked bikes for leisurely exploration, while members prioritize electric bikes for efficient urban travel.
2. **Why would casual riders buy Cyclistic annual memberships?**
   - Casual riders may opt to purchase Cyclistic annual memberships for various reasons, particularly to access their preferred rideable bikes, such as electric bikes, known for their convenience and efficiency in covering moderate distances. With an annual membership, casual riders can enjoy unlimited access to classic bikes for a certain duration per ride, while electric bikes are available at a discounted rate for annual members, facilitating leisurely exploration or occasional transportation needs without the hassle of individual rentals. Moreover, annual memberships present cost-saving opportunities for frequent Cyclistic bike users, making them an appealing choice for consistent access to preferred rideable bikes throughout the year, especially beneficial during peak seasons when electric bikes are in high demand for recreational outings or urban exploration. Additionally, annual memberships offer exclusive features that further enhance the overall experience for casual riders, adding value to their membership investment.
3. **How can Cyclistic use digital media to influence casual riders to become members?**
   - Cyclistic can implement targeted messaging emphasizing the unique benefits of annual memberships tailored to their preferred rideable types. Highlighting the convenience, cost savings, and access to electric bikes provided by annual memberships can resonate with casual riders, particularly those who enjoy efficient urban travel. Through social media, email campaigns, and online ads, Cyclistic can offer limited-time promotions or discounted rates on annual memberships, specifically catering to casual riders' preferences for electric bikes. Additionally, interactive content, member testimonials, and easy-to-follow guides can be utilized to engage casual riders and facilitate the membership sign-up process.

This analysis reveals key findings regarding the clear differences in bike preferences between the two user groups, offering essential direction for developing a conversion strategy focused on transitioning casual riders into annual members. Additionally, by continuing to delve deeper into the findings, Cyclistic can uncover valuable insights that will refine its marketing strategies, ultimately enhancing overall effectiveness.

--------------------------------------

### **Station Trends**

![7  Start Station Overview](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/18d4cf76-0c20-49bd-b51c-133c4dd2fa5b)

#### **Summary of Station Trends**
The "**Station Trends**" visuals explore usage and popularity of different start stations, spotlighting:

+ **Casual User Key Findings**:
   - 
+ **Member User Key Findings**:
   - 

**Key Questions**:
1. **How do annual members and casual riders use Cyclistic bikes differently?**
   - 
2. **Why would casual riders buy Cyclistic annual memberships?**
   - 
3. **How can Cyclistic use digital media to influence casual riders to become members?**
   - 

This analysis reveals key findings regarding the top choice of start stations between casual and member users, offering essential direction for developing a conversion strategy focused on transitioning casual riders into annual members. Additionally, by continuing to delve deeper into the findings, Cyclistic can uncover valuable insights that will refine its marketing strategies, ultimately enhancing overall effectiveness.

--------------------------------------

### **Map Trends**

![8  Map Overview](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/e663af14-3892-41d4-b0b3-d520b2959157)

#### **Summary of Map Trends**
The "**Map Trends**" visuals explore geographic patterns and trends in the city, spotlighting:

+ **Casual User Key Findings**:
   - 
+ **Member User Key Findings**:
   - 

**Key Questions**:
1. **How do annual members and casual riders use Cyclistic bikes differently?**
   - 
2. **Why would casual riders buy Cyclistic annual memberships?**
   - 
3. **How can Cyclistic use digital media to influence casual riders to become members?**
   - 
This map reveals key findings regarding Chicago's user pathways, examining the differentiated usage patterns, ride characteristics, and frequency of engagement between casual and member users. These insights lay the final groundwork for the development of a targeted conversion strategy aimed at transitioning casual riders into annual members. Ultimately, by delving deeper into the findings, Cyclistic can uncover valuable insights that will enable the refinement of its marketing strategies, enhancing overall effectiveness.

--------------------------------------

### **Cyclistic Bike-Share Interactive Dashboard**

![Cyclistic Dashboard](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/0f0e2353-580a-4806-a237-098e3cd19f3d)

#### **Summary of Cyclistic Bike-Share Program Analysis**

### Key Tasks
- [x]  Determine the best way to share your findings.
- [x]  Create effective data visualizations.
- [x]  Present your findings.
- [x]  Ensure your work is accessible.

### Deliverable 
- [x]  Supporting visualizations and key findings.

## 🎭 The 'Act' Phase

### **Summary of Key Questions:**
### **Top 3 Recommendation**
### **Optional Recommendation**
### **Conclusion**

#### **Key Takeaways**
#### **Recommendations for Improved User Engagement**

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
