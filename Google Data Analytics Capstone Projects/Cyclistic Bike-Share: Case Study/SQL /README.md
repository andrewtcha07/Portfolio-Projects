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
+ Creating a new database titled **`cyclisticproject`**.
+ Importing the 12 CSV files into the database.
+ Generating separate tables for each of the 12 CSV files.

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
+ Retrieving details about the columns in each table.
+ Assessing the number of rows and the scale of each dataset.
+ Detecting missing values, including null and blank entries, within specified columns.

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

#### Null Value Identification
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
-- Select the table name and count of blank values for the first table
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

### Overview of Initial Examination
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
+ Concatenating the initial 12 tables into a single unified table following the initial review.
+ Eliminating all individual tables post-concatenation.
+ Adjusting the data types in the unified table.
+ Implementing a primary key to maintain uniqueness across rows.

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

### Summary of Integrated Data Management
+ After the merger of all individual tables, a new table labeled **`2023-divvy-tripdata`** was created.
+ Removal of 12 tables was essential to maintain database cleanliness and streamline operations.
+ Adjustments to the data types of each column were made to enhance data reliability and usability.
+ The **ride_id** column was designated as the primary key to ensure the uniqueness of entries within the table.
+ Reviewed the table schema to validate and confirm the implemented changes.


### Key Tasks
- [x]  Check the data for errors.
- [x]  Choose your tools.
- [x]  Transform the data so you can work with it effectively.
- [x]  Document the cleaning process.

### Deliverable 
- [x]  Documentation of any cleaning or manipulation of data.

## 🔍 The 'Analyze' Phase
### Key Tasks
- [x]  Aggregate your data so it’s useful and accessible.
- [x]  Organize and format your data.
- [x]  Perform calculations.
- [x]  Identify trends and relationships.

### Deliverable 
- [x]  A summary of your analysis.

## 🎁 The 'Share' Phase

### Key Tasks
- [x]  Determine the best way to share your findings.
- [x]  Create effective data visualizations.
- [x]  Present your findings.
- [x]  Ensure your work is accessible.

### Deliverable 
- [x]  Supporting visualizations and key findings.

## 🎭 The 'Act' Phase

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
