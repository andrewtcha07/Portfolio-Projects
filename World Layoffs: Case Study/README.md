# World Layoffs: Case Study 💼
The global pandemic has profoundly impacted economies worldwide, triggering a significant economic downturn. Factors such as decreased consumer spending and heightened central bank interest rates have fueled concerns about an impending recession. Consequently, this turmoil has resulted in significant layoffs within the technology industry. Amidst these challenges, there arises the need for a thorough examination.

## 📑 Objectives
This analysis will delve into the challenges faced by the tech sector, offering insights from the onset of COVID-19 to the present day, exploring:
+ Identify trends and patterns in layoffs within the technology sector.
+ Assess the impact of COVID-19 on employment within the tech industry.
+ Explore factors contributing to layoffs in specific technology subfields.

## 🗃 Data Information
This dataset is available on [Kaggle](https://www.kaggle.com/datasets/swaptr/layoffs-2022/data), credited to [Roger Lee](https://www.rogerlee.com/).
Tech layoffs were reported by:
+ Bloomberg
+ San Francisco Business Times
+ TechCrunch
+ The New York Times
The dataset covers the period from **March 2020**, when COVID-19 was declared a pandemic, through **May 2024** present time.

> [!NOTE]
> + Please be aware that this dataset may not include all available information, such as the sources, list of laid-off employees, and date of addition. 
> + For the full dataset with additional details, please visit [Layoffs.fyi](https://layoffs.fyi/), as referenced by the Kaggle dataset description ([Kaggle](https://www.kaggle.com/datasets/swaptr/layoffs-2022/data)).

## 🗄 Data Organization
+ **File Format**: The provided dataset is labeled as “layoffs”, in a CSV format.
+ **File Size**: The CSV file size is 5.96 MB.
+ **Columns**: The dataset contains 9 columns.
+ **Rows**: The dataset comprises 3,225 rows.

## 📋 Data Dictionary
| No. | Column Name         | Description                                                                                                                                                         |
|-----|---------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 1   | company             | The column contains the names of companies or organizations involved in the layoffs.                                                                                |
| 2   | location            | This column indicates the geographical location where the layoffs occurred such as cities and region.                                                               |
| 3   | industry            | This column specifics the industry or sector to which the affected companies belong, such as technology, finance, healthcare, etc.                                  |
| 4   | total_laid_off      | This column represents the total number of employees laid off by each company.                                                                                      |
| 5   | percentage_laid_off | This column show the percentage of employees laid off relative to the total workforce of each company.                                                              |
| 6   | date                | This column indicates the date, including the year, month, and day, when the layoffs occurred or when the data was reported.                                        |
| 7   | stage               | This column indicates the stage of business or development at which the layoffs occurred, such as startup funding rounds (Seed, Series A, etc.) or post-IPO.        |
| 8   | country             | This column specifies the country where each affected company is headquartered or where the layoffs primarily occurred.                                             |
| 9   | funds_raised        | This column contains information about the amount of funding (in Millions $) raised by each company, which could be relevant context for understanding the layoffs. |

> [!IMPORTANT]
> **Stages of Funding**
> + **`Seed`**: This is typically the earliest stage of funding for a startup. It's the initial capital raised to prove a concept or build a prototype.
> + **`Series A`**: This stage comes after seed funding. Series A funding is used to help companies with proven concepts and initial traction to scale their operations.
> + **`Series B`**: Companies at this stage have already developed a product or service and have demonstrated market fit. Series B funding is often used to accelerate growth and expand operations.
> + **`Series C, D, E, etc.`**: These stages represent subsequent rounds of funding as the company continues to grow. Each subsequent round usually indicates increasing valuation and expansion into new markets or products.
> + **`Private Equity`**: This stage typically involves larger investments made by private equity firms in more established companies. Private equity investments are often used for acquisitions, restructuring, or expansion.
> + **`Acquired`**: This stage indicates that the company has been acquired by another company.
> + **`Post-IPO`**: Companies at this stage have gone public through an initial public offering (IPO). Post-IPO funding may involve additional rounds of financing or strategic investments after the company has become publicly traded.
> + **`Unknown`**: This category may include cases where the stage of funding or development is not specified or is vague.

## ☝ Analysis Method - Introduction

### Creation of Database / Schema
```sql
create schema world_layoffs;
```

### Import Data Table
```sql
-- Creating a table by importing data from the 'layoffs.csv' file using "Table Data Import Wizard"
-- Table world_layoffs.layoffs_raw was created
-- 3225 records imported
```

### Initial Data Exploration
```sql
describe layoffs_raw;
```
<details>
    <summary><b>Field Details</b></summary>

| Field               | Type   | Null | Key | Default | Extra |
|---------------------|--------|------|-----|---------|-------|
| company             | text   | YES  |     | NULL    |       |
| location            | text   | YES  |     | NULL    |       |
| industry            | text   | YES  |     | NULL    |       |
| total_laid_off      | text   | YES  |     | NULL    |       |
| percentage_laid_off | text   | YES  |     | NULL    |       |
| date                | text   | YES  |     | NULL    |       |
| stage               | text   | YES  |     | NULL    |       |
| country             | text   | YES  |     | NULL    |       |
| funds_raised        | double | YES  |     | NULL    |       |

</details>

### Count of Records
```sql
select
    count(*) as total_records
from
    layoffs_raw;
```

<details>
    <summary><b>Field Details</b></summary>

| total_records |
|---------------|
| 3225          |

</details>

### Table View (Limited to 10 records)
```sql
select
    *
from
    layoffs_raw;
```

<details>
    <summary><b>Field Details</b></summary>

| company       | location     | industry       | total_laid_off | percentage_laid_off | date       | stage    | country       | funds_raised |
|---------------|--------------|----------------|----------------|---------------------|------------|----------|---------------|--------------|
| Replit        | SF Bay Area  | Product        | 30             | 0.2                 | 2024-05-16 | Unknown  | United States | 222          |
| Gopuff        | Philadelphia | Food           |                | 0.06                | 2024-05-16 | Series H | United States | 3400         |
| Atmosphere    | Austin       | Other          | 100            |                     | 2024-05-15 | Series D | United States | 214          |
| Singularity 6 | Los Angeles  | Other          | 36             |                     | 2024-05-15 | Series B | United States | 49           |
| Mainvest      | Boston       | Finance        |                | 1.0                 | 2024-05-14 | Unknown  | United States | 3            |
| Indeed        | Austin       | HR             | 1000           | 0.08                | 2024-05-13 | Acquired | United States | 5            |
| Rivian        | Los Angeles  | Transportation | 120            |                     | 2024-05-10 | Post-IPO | United States | 10700        |
| Google        | SF Bay Area  | Consumer       | 57             |                     | 2024-05-10 | Post-IPO | United States | 26           |
| Vacasa        | Portland     | Travel         | 800            | 0.13                | 2024-05-09 | Post-IPO | United States | 834          |
| Simpl         | Bengaluru    | Finance        | 100            | 0.15                | 2024-05-08 | Series B | India         | 72           |

`10-3225 row(s) returned`

</details>

### Create Staging Table "layoffs_staging"
```sql
create table
    layoffs_staging like layoffs_raw;
```

### Populate Staging Table
```sql
insert into
    layoffs_staging
select
    *
from
    layoffs_raw;
```

`3225 row(s) affected Records: 3225  Duplicates: 0  Warnings: 0`

## 🧹 Analysis Method - Remove Duplicates

### Assign Row Numbers
```sql
select
    *
  , row_number() over (
        partition by
            company
          , location
          , industry
          , total_laid_off
          , percentage_laid_off
          , `date`
          , stage
          , country
          , funds_raised
    ) as row_num
from
    layoffs_staging;
```

<details>
    <summary><b>Field Details</b></summary>

| company         | location      | industry   | total_laid_off | percentage_laid_off | date       | stage    | country       | funds_raised | row_num |
|-----------------|---------------|------------|----------------|---------------------|------------|----------|---------------|--------------|---------|
| Included Health | SF Bay Area   | Healthcare |                | 0.06                | 2022-07-25 | Series E | United States | 272          | 1       |
| &Open           | Dublin        | Marketing  | 9              | 0.09                | 2022-11-17 | Series A | Ireland       | 35           | 1       |
| #Paid           | Toronto       | Marketing  | 19             | 0.17                | 2023-01-27 | Series B | Canada        | 21           | 1       |
| 100 Thieves     | Los Angeles   | Consumer   | 12             |                     | 2022-07-13 | Series C | United States | 120          | 1       |
| 100 Thieves     | Los Angeles   | Retail     |                |                     | 2023-01-10 | Series C | United States | 120          | 1       |
| 10X Genomics    | SF Bay Area   | Healthcare | 100            | 0.08                | 2022-08-04 | Post-IPO | United States | 242          | 1       |
| 1stdibs         | New York City | Retail     | 70             | 0.17                | 2020-04-02 | Series D | United States | 253          | 1       |
| 23andMe         | SF Bay Area   | Healthcare | 71             | 0.11                | 2023-08-08 | Post-IPO | United States | 1100         | 1       |
| 23andMe         | SF Bay Area   | Healthcare | 75             | 0.09                | 2023-06-09 | Post-IPO | United States | 1100         | 1       |
| 2TM             | Sao Paulo     | Crypto     | 100            | 0.15                | 2022-09-01 | Unknown  | Brazil        | 250          | 1       |

`10-3225 row(s) returned`

</details>

### Filter Duplicate Records
```sql
with
    duplicate_cte as (
        select
            *
          , row_number() over (
                partition by
                    company
                  , location
                  , industry
                  , total_laid_off
                  , percentage_laid_off
                  , `date`
                  , stage
                  , country
                  , funds_raised
            ) as row_num
        from
            layoffs_staging
    )
select
    *
from
    duplicate_cte
where
    row_num > 1;
```

<details>
    <summary><b>Field Details</b></summary>

| company     | location    | industry       | total_laid_off | percentage_laid_off | date       | stage    | country        | funds_raised | row_num |
|-------------|-------------|----------------|----------------|---------------------|------------|----------|----------------|--------------|---------|
| Beyond Meat | Los Angeles | Food           | 200            | 0.19                | 2022-10-14 | Post-IPO | United States  | 122          | 2       |
| Cazoo       | London      | Transportation | 750            | 0.15                | 2022-06-07 | Post-IPO | United Kingdom | 2000         | 2       |

</details>

### Duplicate Table with Row Numbers
```sql
create table
    `layoffs_staging2` (
        `company` text
      , `location` text
      , `industry` text
      , `total_laid_off` text
      , `percentage_laid_off` text
      , `date` text
      , `stage` text
      , `country` text
      , `funds_raised` double default null
      , `row_num` int
    ) engine = InnoDB default charset = utf8mb4 collate = utf8mb4_0900_ai_ci;
```

### Insert Row Numbers into Staging Table "layoffs_staging2"
```sql
insert into
    layoffs_staging2
select
    *
  , row_number() over (
        partition by
            company
          , location
          , industry
          , total_laid_off
          , percentage_laid_off
          , `date`
          , stage
          , country
          , funds_raised
    ) as row_num
from
    layoffs_staging;
```

`3225 row(s) affected Records: 3225  Duplicates: 0  Warnings: 0`

### Review New Table "layoffs_staging2"
```sql
select
    *
from
    layoffs_staging2
limit
    10;
```

<details>
    <summary><b>Field Details</b></summary>

| company         | location      | industry   | total_laid_off | percentage_laid_off | date       | stage    | country       | funds_raised | row_num |
|-----------------|---------------|------------|----------------|---------------------|------------|----------|---------------|--------------|---------|
| Included Health | SF Bay Area   | Healthcare |                | 0.06                | 2022-07-25 | Series E | United States | 272          | 1       |
| &Open           | Dublin        | Marketing  | 9              | 0.09                | 2022-11-17 | Series A | Ireland       | 35           | 1       |
| #Paid           | Toronto       | Marketing  | 19             | 0.17                | 2023-01-27 | Series B | Canada        | 21           | 1       |
| 100 Thieves     | Los Angeles   | Consumer   | 12             |                     | 2022-07-13 | Series C | United States | 120          | 1       |
| 100 Thieves     | Los Angeles   | Retail     |                |                     | 2023-01-10 | Series C | United States | 120          | 1       |
| 10X Genomics    | SF Bay Area   | Healthcare | 100            | 0.08                | 2022-08-04 | Post-IPO | United States | 242          | 1       |
| 1stdibs         | New York City | Retail     | 70             | 0.17                | 2020-04-02 | Series D | United States | 253          | 1       |
| 23andMe         | SF Bay Area   | Healthcare | 71             | 0.11                | 2023-08-08 | Post-IPO | United States | 1100         | 1       |
| 23andMe         | SF Bay Area   | Healthcare | 75             | 0.09                | 2023-06-09 | Post-IPO | United States | 1100         | 1       |
| 2TM             | Sao Paulo     | Crypto     | 100            | 0.15                | 2022-09-01 | Unknown  | Brazil        | 250          | 1       |

</details>

### Review Filter
```sql
select
    *
from
    layoffs_staging2
where
    row_num > 1;
```

<details>
    <summary><b>Field Details</b></summary>

| company     | location    | industry       | total_laid_off | percentage_laid_off | date       | stage    | country        | funds_raised | row_num |
|-------------|-------------|----------------|----------------|---------------------|------------|----------|----------------|--------------|---------|
| Beyond Meat | Los Angeles | Food           | 200            | 0.19                | 10/14/2022 | Post-IPO | United States  | 122          | 2       |
| Cazoo       | London      | Transportation | 750            | 0.15                | 6/7/2022   | Post-IPO | United Kingdom | 2000         | 2       |

</details>

### Remove Duplicate Rows
```sql
delete from layoffs_staging2
where
    row_num > 1;
```

`2 row(s) affected`

### Re-Checking For Duplicates
```sql
select
    *
from
    layoffs_staging2
where
    row_num > 1;
```

`0 row(s) returned`

## 🚫 Analysis Method - NULL and Blank Values

### Identify NULL or Empty "industry"
```sql
select
    *
from
    layoffs_staging2
where
    industry is null
    or industry = '';
```

<details>
    <summary><b>Field Details</b></summary>

| company  | location    | industry | total_laid_off | percentage_laid_off | date       | stage    | country       | funds_raised | row_num |
|----------|-------------|----------|----------------|---------------------|------------|----------|---------------|--------------|---------|
| Appsmith | SF Bay Area |          | 35             | 0.25                | 2023-09-22 | Series B | United States | 51           | 1       |

</details>

### Review "Appsmith" Company
```sql
select
    *
from
    layoffs_staging2
where
    company = 'appsmith';
```

<details>
    <summary><b>Field Details</b></summary>

| company  | location    | industry | total_laid_off | percentage_laid_off | date       | stage    | country       | funds_raised | row_num |
|----------|-------------|----------|----------------|---------------------|------------|----------|---------------|--------------|---------|
| Appsmith | SF Bay Area |          | 35             | 0.25                | 2023-09-22 | Series B | United States | 51           | 1       |

</details>

### Replace Empty "industry" with NULL
```sql
update layoffs_staging2
set
    industry = null
where
    industry = '';
```

`1 row(s) affected Rows matched: 1  Changed: 1  Warnings: 0`

### Identify NULL or Empty "stage"
```sql
select
    *
from
    layoffs_staging2
where
    stage is null
    or stage = '';
```

<details>
    <summary><b>Field Details</b></summary>

| company | location    | industry   | total_laid_off | percentage_laid_off | date       | stage | country        | funds_raised |
|---------|-------------|------------|----------------|---------------------|------------|-------|----------------|--------------|
| Verily  | SF Bay Area | Healthcare | 250            | 0.15                | 2023-01-11 |       | United States  | 3500         |
| Zapp    | London      | Food       |                | 0.1                 | 2022-05-25 |       | United Kingdom | 300          |

</details>

### Replace Empty "stage" with NULL
```sql
update layoffs_staging2
set
    stage = null
where
    stage = '';
```

`2 row(s) affected Rows matched: 2  Changed: 2  Warnings: 0`

### Identify NULL or Empty "total_laid_off" and "percentage_laid_off"
```sql
select
    *
from
    layoffs_staging2
where
    (
        total_laid_off is null
        or total_laid_off = ''
    )
    and (
        percentage_laid_off is null
        or percentage_laid_off = ''
    );
```

<details>
    <summary><b>Field Details</b></summary>

| company          | location        | industry   | total_laid_off | percentage_laid_off | date       | stage          | country       | funds_raised | row_num |
|------------------|-----------------|------------|----------------|---------------------|------------|----------------|---------------|--------------|---------|
| 100 Thieves      | Los Angeles     | Retail     |                |                     | 2023-01-10 | Series C       | United States | 120          | 1       |
| 2U               | Washington D.C. | Education  |                |                     | 2023-09-28 | Post-IPO       | United States | 426          | 1       |
| 2U               | Washington D.C. | Education  |                |                     | 2024-01-22 | Post-IPO       | United States | 426          | 1       |
| 98point6         | Seattle         | Healthcare |                |                     | 2024-04-23 | Acquired       | United States | 299          | 1       |
| Accolade         | Seattle         | Healthcare |                |                     | 2023-03-03 | Post-IPO       | United States | 458          | 1       |
| Acronis          | Zurich          | Security   |                |                     | 2023-10-11 | Private Equity | Switzerland   | 658          | 1       |
| Ada              | Toronto         | Support    |                |                     | 2023-02-01 | Series C       | Canada        | 190          | 1       |
| Adara            | SF Bay Area     | Travel     |                |                     | 2020-03-31 | Series C       | United States | 67           | 1       |
| Addi             | Bogota          | Finance    |                |                     | 2022-06-14 | Series C       | Colombia      | 376          | 1       |
| Agility Robotics | Portland        | Other      |                |                     | 2024-04-04 | Series B       | United States | 179          | 1       |

`10-517 row(s) returned`

</details>

### Update Empty "total_laid_off" with NULL
```sql
update layoffs_staging2
set
    total_laid_off = null
where
    total_laid_off = '';
```

`1086 row(s) affected Rows matched: 1086  Changed: 1086  Warnings: 0`

### Update Empty "percentage_laid_off" with NULL
```sql
update layoffs_staging2
set
    percentage_laid_off = null
where
    percentage_laid_off = '';
```

`1142 row(s) affected Rows matched: 1142  Changed: 1142  Warnings: 0`

### Identify NULLs in Both "total_laid_off" and "percentage_laid_off"
```sql
select
    *
from
    layoffs_staging2
where
    total_laid_off is null
    and percentage_laid_off is null;
```

<details>
    <summary><b>Field Details</b></summary>

| company          | location        | industry   | total_laid_off | percentage_laid_off | date       | stage          | country       | funds_raised | row_num |
|------------------|-----------------|------------|----------------|---------------------|------------|----------------|---------------|--------------|---------|
| 100 Thieves      | Los Angeles     | Retail     |                |                     | 2023-01-10 | Series C       | United States | 120          | 1       |
| 2U               | Washington D.C. | Education  |                |                     | 2023-09-28 | Post-IPO       | United States | 426          | 1       |
| 2U               | Washington D.C. | Education  |                |                     | 2024-01-22 | Post-IPO       | United States | 426          | 1       |
| 98point6         | Seattle         | Healthcare |                |                     | 2024-04-23 | Acquired       | United States | 299          | 1       |
| Accolade         | Seattle         | Healthcare |                |                     | 2023-03-03 | Post-IPO       | United States | 458          | 1       |
| Acronis          | Zurich          | Security   |                |                     | 2023-10-11 | Private Equity | Switzerland   | 658          | 1       |
| Ada              | Toronto         | Support    |                |                     | 2023-02-01 | Series C       | Canada        | 190          | 1       |
| Adara            | SF Bay Area     | Travel     |                |                     | 2020-03-31 | Series C       | United States | 67           | 1       |
| Addi             | Bogota          | Finance    |                |                     | 2022-06-14 | Series C       | Colombia      | 376          | 1       |
| Agility Robotics | Portland        | Other      |                |                     | 2024-04-04 | Series B       | United States | 179          | 1       |

`10-517 row(s) returned`

</details>

### Remove NULLs in Both "total_laid_off" and "percentage_laid_off"
```sql
delete from layoffs_staging2
where
    total_laid_off is null
    and percentage_laid_off is null;
```

`517 row(s) affected`

### Re-Check for NULLs in Both "total_laid_off" and "percentage_laid_off"
```sql
select
    *
from
    layoffs_staging2
where
    total_laid_off is null
    and percentage_laid_off is null;
```

`0 row(s) returned`

## ✏️ Analysis Method - Standardized Data

### Review Updated Table
```sql
select
    *
from
    layoffs_staging2
order by
    1
limit
    10;
```

<details>
    <summary><b>Field Details</b></summary>

| company         | location      | industry   | total_laid_off | percentage_laid_off | date       | stage    | country       | funds_raised | row_num |
|-----------------|---------------|------------|----------------|---------------------|------------|----------|---------------|--------------|---------|
| Included Health | SF Bay Area   | Healthcare |                | 0.06                | 2022-07-25 | Series E | United States | 272          | 1       |
| &Open           | Dublin        | Marketing  | 9              | 0.09                | 2022-11-17 | Series A | Ireland       | 35           | 1       |
| #Paid           | Toronto       | Marketing  | 19             | 0.17                | 2023-01-27 | Series B | Canada        | 21           | 1       |
| 100 Thieves     | Los Angeles   | Consumer   | 12             |                     | 2022-07-13 | Series C | United States | 120          | 1       |
| 10X Genomics    | SF Bay Area   | Healthcare | 100            | 0.08                | 2022-08-04 | Post-IPO | United States | 242          | 1       |
| 1stdibs         | New York City | Retail     | 70             | 0.17                | 2020-04-02 | Series D | United States | 253          | 1       |
| 23andMe         | SF Bay Area   | Healthcare | 71             | 0.11                | 2023-08-08 | Post-IPO | United States | 1100         | 1       |
| 23andMe         | SF Bay Area   | Healthcare | 75             | 0.09                | 2023-06-09 | Post-IPO | United States | 1100         | 1       |
| 2TM             | Sao Paulo     | Crypto     | 100            | 0.15                | 2022-09-01 | Unknown  | Brazil        | 250          | 1       |
| 2TM             | Sao Paulo     | Crypto     | 90             | 0.12                | 2022-06-01 | Unknown  | Brazil        | 250          | 1       |

</details>

### Identify Whitespaces in "company" Column
```sql
select
    company
  , (trim(company)) as trim_company
from
    layoffs_staging2;
```

<details>
    <summary><b>Field Details</b></summary>

| company          | (trim(company)) |
|------------------|-----------------|
|  Included Health | Included Health |
| &Open            | &Open           |
| #Paid            | #Paid           |
| 100 Thieves      | 100 Thieves     |
| 10X Genomics     | 10X Genomics    |
| 1stdibs          | 1stdibs         |
| 23andMe          | 23andMe         |
| 23andMe          | 23andMe         |
| 2TM              | 2TM             |
| 2TM              | 2TM             |

`10-2706 row(s) returned`

</details>

### Update Trimmed "company" Column
```sql
update layoffs_staging2
set
    company = trim(company);
```

`10 row(s) affected Rows matched: 2706  Changed: 10  Warnings: 0`

### Re-Check For Whitespaces in Trimmed "company" Column
```sql
select
    company
  , (trim(company))
from
    layoffs_staging2
```

<details>
    <summary><b>Field Details</b></summary>

| company         | (trim(company)) |
|-----------------|-----------------|
| Included Health | Included Health |
| &Open           | &Open           |
| #Paid           | #Paid           |
| 100 Thieves     | 100 Thieves     |
| 10X Genomics    | 10X Genomics    |
| 1stdibs         | 1stdibs         |
| 23andMe         | 23andMe         |
| 23andMe         | 23andMe         |
| 2TM             | 2TM             |
| 2TM             | 2TM             |

`10-2706 row(s) returned`

</details>

### Review "industry" Column
```sql
select distinct
    industry
from
    layoffs_staging2
order by
    1;
```

<details>
    <summary><b>Field Details</b></summary>

| industry       |
|----------------|
| NULL           |
| Aerospace      |
| AI             |
| Construction   |
| Consumer       |
| Crypto         |
| Data           |
| Education      |
| Energy         |
| Finance        |
| Fitness        |
| Food           |
| Hardware       |
| Healthcare     |
| HR             |
| Infrastructure |
| Legal          |
| Logistics      |
| Manufacturing  |
| Marketing      |
| Media          |
| Other          |
| Product        |
| Real Estate    |
| Recruiting     |
| Retail         |
| Sales          |
| Security       |
| Support        |
| Transportation |
| Travel         |

</details>

### Review "location" Column
```sql
select distinct
	location
from
	layoffs_staging2
order by
	1;
```

<details>
    <summary><b>Field Details</b></summary>

| location         |
|------------------|
| Abuja            |
| Accra            |
| Ahmedabad        |
| Amsterdam        |
| Ann Arbor        |
| Atlanta          |
| Auckland         |
| Austin           |
| Baltimore        |
| Bangkok          |
| Barcelona        |
| Baton Rouge      |
| Beau Vallon      |
| Beijing          |
| Belo Horizonte   |
| Bend             |
| Bengaluru        |
| Berlin           |
| Birmingham       |
| Blumenau         |
| Bogota           |
| Boise            |
| Boston           |
| Boulder          |
| Brisbane         |
| Bristol          |
| Brno             |
| Bucharest        |
| Budapest         |
| Buenos Aires     |
| Burlington       |
| Cairo            |
| Calgary          |
| Cayman Islands   |
| Charlotte        |
| Chemnitz         |
| Chennai          |
| Chester          |
| Chicago          |
| Cincinnati       |
| Cluj-Napoca      |
| Columbus         |
| Copenhagen       |
| Corvallis        |
| Curitiba         |
| DÃ¼sseldorf      |
| Dakar            |
| Dallas           |
| Davenport        |
| Denver           |
| Detroit          |
| Dover            |
| Dubai            |
| Dublin           |
| Durham           |
| Edinburgh        |
| Eindhoven        |
| Espoo            |
| Evansville       |
| FÃ¸rde           |
| Fayetteville     |
| Ferdericton      |
| FlorianÃ³polis   |
| Fort Collins     |
| Frankfurt        |
| Ghent            |
| Gothenburg       |
| Grand Rapids     |
| Guadalajara      |
| Gurugram         |
| Haifa            |
| Hamburg          |
| Hanoi            |
| Hartford         |
| Helsinki         |
| Ho Chi Minh City |
| Hong Kong        |
| Ibadan           |
| Indianapolis     |
| Indore           |
| Istanbul         |
| Jakarta          |
| Jersey City      |
| Jerusalem        |
| Joinville        |
| Kansas City      |
| Karachi          |
| Karlsruhe        |
| Kfar Saba        |
| Kiel             |
| Kitchener        |
| Krakow           |
| Kuala Lumpur     |
| Kyiv             |
| Lagos            |
| Lahore           |
| Las Vegas        |
| Lehi             |
| Lexington        |
| Lisbon           |
| Logan            |
| London           |
| Los Angeles      |
| Luxembourg       |
| Madison          |
| Madrid           |
| Malmo            |
| Manchester       |
| Melbourne        |
| Mexico City      |
| Miami            |
| Milan            |
| Milwaukee        |
| Minneapolis      |
| Missoula         |
| Montreal         |
| Moscow           |
| Mumbai           |
| Munich           |
| Nairobi          |
| Nashik           |
| Nashua           |
| Nashville        |
| Nebraska City    |
| New Delhi        |
| New Haven        |
| New York City    |
| Noida            |
| Non-U.S.         |
| Norwalk          |
| Orlando          |
| Oslo             |
| Ottawa           |
| Oxford           |
| Paris            |
| Patna            |
| Philadelphia     |
| Phoenix          |
| Pittsburgh       |
| Portland         |
| Porto Alegre     |
| Providence       |
| Pune             |
| Ra'anana         |
| Raleigh          |
| Reno             |
| Sacramento       |
| Salisbury        |
| Salt Lake City   |
| San Antonio      |
| San Diego        |
| San Luis Obispo  |
| Santa Barbara    |
| Santa Fe         |
| Santiago         |
| Sao Paulo        |
| Saskatoon        |
| Seattle          |
| Selangor         |
| Seoul            |
| SF Bay Area      |
| Shanghai         |
| Shenzen          |
| Singapore        |
| Spokane          |
| St. Gallen       |
| St. Louis        |
| Stamford         |
| Stockholm        |
| Sydney           |
| Tallinn          |
| Tampa Bay        |
| Tel Aviv         |
| The Hague        |
| Tokyo            |
| Toronto          |
| Toulouse         |
| Vancouver        |
| Vienna           |
| Vilnius          |
| Walldorf         |
| Warsaw           |
| Washington D.C.  |
| Waterloo         |
| Wellington       |
| Wilmington       |
| Winnipeg         |
| Zurich           |

</details>

### Review "country" Column
```sql
select distinct
	country
from
	layoffs_staging2
order by
	1;
```

<details>
    <summary><b>Field Details</b></summary>

| country              |
|----------------------|
| Argentina            |
| Australia            |
| Austria              |
| Belgium              |
| Brazil               |
| Canada               |
| Cayman Islands       |
| Chile                |
| China                |
| Colombia             |
| Czech Republic       |
| Denmark              |
| Egypt                |
| Estonia              |
| Finland              |
| France               |
| Germany              |
| Ghana                |
| Hong Kong            |
| Hungary              |
| India                |
| Indonesia            |
| Ireland              |
| Israel               |
| Italy                |
| Japan                |
| Kenya                |
| Lithuania            |
| Luxembourg           |
| Malaysia             |
| Mexico               |
| Netherlands          |
| New Zealand          |
| Nigeria              |
| Norway               |
| Pakistan             |
| Poland               |
| Portugal             |
| Romania              |
| Russia               |
| Senegal              |
| Seychelles           |
| Singapore            |
| South Korea          |
| Spain                |
| Sweden               |
| Switzerland          |
| Thailand             |
| Turkey               |
| Ukraine              |
| United Arab Emirates |
| United Kingdom       |
| United States        |
| Vietnam              |

</details>

### Identify Columns Data Type
```sql
show columns
from
    layoffs_staging2;
```

<details>
    <summary><b>Field Details</b></summary>

| Field               | Type   | Null | Key | Default | Extra |
|---------------------|--------|------|-----|---------|-------|
| company             | text   | YES  |     | NULL    |       |
| location            | text   | YES  |     | NULL    |       |
| industry            | text   | YES  |     | NULL    |       |
| total_laid_off      | text   | YES  |     | NULL    |       |
| percentage_laid_off | text   | YES  |     | NULL    |       |
| date                | text   | YES  |     | NULL    |       |
| stage               | text   | YES  |     | NULL    |       |
| country             | text   | YES  |     | NULL    |       |
| funds_raised        | double | YES  |     | NULL    |       |
| row_num             | int    | YES  |     | NULL    |       |

</details>

### Change "total_laid_off" Column Data Type
```sql
alter table layoffs_staging2
modify column total_laid_off int;
```

`2706 row(s) affected Records: 2706  Duplicates: 0  Warnings: 0`

### Change "percentage_laid_off" Column Data Type
```sql
alter table layoffs_staging2
modify column percentage_laid_off float;
```

`2706 row(s) affected Records: 2706  Duplicates: 0  Warnings: 0`

### Change "date" Column Data Type
```sql
alter table layoffs_staging2
modify column `date` date;
```

`2706 row(s) affected Records: 2706  Duplicates: 0  Warnings: 0`

## 🗑️ Analysis Method - Removal of Columns

### Drop "row_num" Column
```sql
alter table layoffs_staging2
drop column row_num;
```

### Final Review of "layoffs_staging2" Table
```sql
select
    *
from
    layoffs_staging2
limit
    10;
```

<details>
    <summary><b>Field Details</b></summary>

| company         | location      | industry   | total_laid_off | percentage_laid_off | date       | stage    | country       | funds_raised |
|-----------------|---------------|------------|----------------|---------------------|------------|----------|---------------|--------------|
| Included Health | SF Bay Area   | Healthcare |                | 0.06                | 2022-07-25 | Series E | United States | 272          |
| &Open           | Dublin        | Marketing  | 9              | 0.09                | 2022-11-17 | Series A | Ireland       | 35           |
| #Paid           | Toronto       | Marketing  | 19             | 0.17                | 2023-01-27 | Series B | Canada        | 21           |
| 100 Thieves     | Los Angeles   | Consumer   | 12             |                     | 2022-07-13 | Series C | United States | 120          |
| 10X Genomics    | SF Bay Area   | Healthcare | 100            | 0.08                | 2022-08-04 | Post-IPO | United States | 242          |
| 1stdibs         | New York City | Retail     | 70             | 0.17                | 2020-04-02 | Series D | United States | 253          |
| 23andMe         | SF Bay Area   | Healthcare | 71             | 0.11                | 2023-08-08 | Post-IPO | United States | 1100         |
| 23andMe         | SF Bay Area   | Healthcare | 75             | 0.09                | 2023-06-09 | Post-IPO | United States | 1100         |
| 2TM             | Sao Paulo     | Crypto     | 100            | 0.15                | 2022-09-01 | Unknown  | Brazil        | 250          |
| 2TM             | Sao Paulo     | Crypto     | 90             | 0.12                | 2022-06-01 | Unknown  | Brazil        | 250          |

</details>

## 🔍 Exploratory Data Analysis

### Layoff Metrics
```sql
select
    max(total_laid_off) as max_total
  , max(percentage_laid_off) as max_percentage
from
    layoffs_staging2;
```

<details>
    <summary><b>Field Details</b></summary>

| max_total | max_percentage |
|-----------|----------------|
| 14000     | 1.0            |

</details>

+ The maximum number of layoffs in the dataset is **14,000 employees**.
+ The maximum percentage of layoffs in the dataset is **100% of the company's workforce**.

### Total Company Layoffs
```sql
select
    *
from
    layoffs_staging2
where
    percentage_laid_off = '1.0'
order by
    total_laid_off desc;
```

<details>
    <summary><b>Field Details</b></summary>

| company             | location      | industry       | total_laid_off | percentage_laid_off | date       | stage    | country        | funds_raised |
|---------------------|---------------|----------------|----------------|---------------------|------------|----------|----------------|--------------|
| Katerra             | SF Bay Area   | Construction   | 2434           | 1.0                 | 2021-06-01 | Unknown  | United States  | 1600         |
| Butler Hospitality  | New York City | Food           | 1000           | 1.0                 | 2022-07-08 | Series B | United States  | 50           |
| Bitwise             | SF Bay Area   | Crypto         | 900            | 1.0                 | 2023-06-14 | Series B | United States  | 84           |
| Zulily              | Seattle       | Retail         | 839            | 1.0                 | 2023-12-08 | Acquired | United States  | 194          |
| Deliv               | SF Bay Area   | Retail         | 669            | 1.0                 | 2020-05-13 | Series C | United States  | 80           |
| Jump                | New York City | Transportation | 500            | 1.0                 | 2020-05-07 | Acquired | United States  | 11           |
| Convoy              | Seattle       | Logistics      | 500            | 1.0                 | 2023-10-19 | Series E | United States  | 1100         |
| Milkrun             | Sydney        | Food           | 400            | 1.0                 | 2023-04-11 | Series A | Australia      | 86           |
| SEND                | Sydney        | Food           | 300            | 1.0                 | 2022-05-04 | Seed     | Australia      | 3            |
| HOOQ                | Singapore     | Consumer       | 250            | 1.0                 | 2020-03-27 | Unknown  | Singapore      | 95           |
| Stay Alfred         | Spokane       | Travel         | 221            | 1.0                 | 2020-05-20 | Series B | United States  | 62           |
| Britishvolt         | London        | Transportation | 206            | 1.0                 | 2023-01-17 | Unknown  | United Kingdom | 2400         |
| Frontdesk           | Milwaukee     | Travel         | 200            | 1.0                 | 2024-01-02 | Unknown  | United States  | 26           |
| Planetly            | Berlin        | Other          | 200            | 1.0                 | 2022-11-04 | Acquired | Germany        | 5            |
| Crejo.Fun           | Bengaluru     | Education      | 170            | 1.0                 | 2022-06-30 | Seed     | India          | 3            |
| Drizly              | Boston        | Retail         | 168            | 1.0                 | 2024-02-05 | Acquired | United States  | 119          |
| Bridge Connector    | Nashville     | Healthcare     | 154            | 1.0                 | 2020-11-17 | Series B | United States  | 45           |
| Simple Feast        | Copenhagen    | Food           | 150            | 1.0                 | 2022-09-07 | Unknown  | Denmark        | 173          |
| ZestMoney           | Bengaluru     | Finance        | 150            | 1.0                 | 2023-12-05 | Series C | India          | 120          |
| Reali               | SF Bay Area   | Real Estate    | 140            | 1.0                 | 2022-08-24 | Series B | United States  | 117          |
| Bluprint            | Denver        | Education      | 137            | 1.0                 | 2020-05-26 | Acquired | United States  | 108          |
| Soluto              | Tel Aviv      | Support        | 120            | 1.0                 | 2022-07-24 | Acquired | Israel         | 18           |
| Deliveroo Australia | Melbourne     | Food           | 120            | 1.0                 | 2022-11-15 | Post-IPO | Australia      | 1700         |
| SummerBio           | SF Bay Area   | Healthcare     | 101            | 1.0                 | 2022-06-20 | Unknown  | United States  | 7            |
| Udayy               | Gurugram      | Education      | 100            | 1.0                 | 2022-06-01 | Seed     | India          | 2            |
| Fifth Season        | Pittsburgh    | Food           | 100            | 1.0                 | 2022-10-28 | Series B | United States  | 35           |
| Phantom Auto        | SF Bay Area   | Transportation | 100            | 1.0                 | 2024-03-12 | Unknown  | United States  | 86           |
| Ghost Autonomy      | SF Bay Area   | Transportation | 100            | 1.0                 | 2024-04-03 | Series E | United States  | 247          |
| Kitty Hawk          | SF Bay Area   | Aerospace      | 100            | 1.0                 | 2022-09-21 | Unknown  | United States  | 1            |
| Buy.com / Rakuten   | SF Bay Area   | Retail         | 87             | 1.0                 | 2020-07-30 | Acquired | United States  | 42.4         |
| WanderJaunt         | SF Bay Area   | Travel         | 85             | 1.0                 | 2022-07-01 | Series B | United States  | 26           |
| Openpay             | Melbourne     | Finance        | 83             | 1.0                 | 2023-02-07 | Post-IPO | Australia      | 299          |
| Metigy              | Sydney        | Marketing      | 75             | 1.0                 | 2022-07-31 | Series B | Australia      | 18           |
| Dealtale            | Tel Aviv      | Sales          | 70             | 1.0                 | 2023-08-09 | Acquired | United States  | 2            |
| BeyondMinds         | Tel Aviv      | Data           | 65             | 1.0                 | 2022-05-23 | Series A | Israel         | 16           |
| Playdots            | New York City | Consumer       | 65             | 1.0                 | 2022-10-13 | Acquired | United States  | 10           |
| Dropp               | Berlin        | Retail         | 60             | 1.0                 | 2023-02-14 | Unknown  | Germany        | 2            |
| DeepVerge           | Dublin        | Healthcare     | 50             | 1.0                 | 2023-07-12 | Post-IPO | Ireland        | 20           |
| Hubba               | Toronto       | Retail         | 45             | 1.0                 | 2021-02-01 | Series B | Canada         | 61           |
| Ahead               | SF Bay Area   | Healthcare     | 44             | 1.0                 | 2022-04-14 | Unknown  | United States  | 9            |
| The Grommet         | Boston        | Retail         | 40             | 1.0                 | 2022-06-09 | Acquired | United States  | 5            |
| Glisser             | London        | Travel         | 25             | 1.0                 | 2023-01-26 | Unknown  | United Kingdom | 1            |
| Pocketmath          | Singapore     | Marketing      | 21             | 1.0                 | 2021-01-20 | Unknown  | Singapore      | 20           |
| Eatsy               | Singapore     | Food           | 20             | 1.0                 | 2020-08-08 | Seed     | Singapore      | 0.9755       |
| Amplero             | Seattle       | Marketing      | 17             | 1.0                 | 2020-03-29 | Series B | United States  | 25           |
| Help.com            | Austin        | Support        | 16             | 1.0                 | 2020-03-16 | Seed     | United States  | 6            |
| Consider.co         | SF Bay Area   | Other          | 13             | 1.0                 | 2020-03-26 | Seed     | United States  | 5            |
| Dark                | SF Bay Area   | Product        | 6              | 1.0                 | 2020-06-23 | Seed     | United States  | 3            |
| Atsu                | Seattle       | Infrastructure | 6              | 1.0                 | 2020-04-10 | Unknown  | United States  | 1            |
| TutorMundi          | Sao Paulo     | Education      | 4              | 1.0                 | 2020-04-24 | Series A | Brazil         | 2            |

`50-190 row(s) returned`

</details>

![1  Total Company Layoffs](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/0b67fc7f-dd36-4868-9993-715c4f9e7e19)

+ "**Katerra**" had the highest number of layoffs among all companies, with a total of **2,432 employees** laid off, representing **100% of its workforce**, on **June 1st, 2021**.
+ "**TutorMundi**", despite having the fewest employees, laid off all **4** of them, resulting in a **100% turnover**, on **April 24rd, 2020**, during the **Series A stage**.

### Complete Company Layoffs by Funding Stage
```sql
select
    *
from
    layoffs_staging2
where
    percentage_laid_off = '1.0'
order by
    funds_raised desc;
```

<details>
    <summary><b>Field Details</b></summary>

| # company           | location        | industry       | total_laid_off | percentage_laid_off | date       | stage          | country        | funds_raised |
|---------------------|-----------------|----------------|----------------|---------------------|------------|----------------|----------------|--------------|
| Britishvolt         | London          | Transportation | 206            | 1.0                 | 2023-01-17 | Unknown        | United Kingdom | 2400         |
| Quibi               | Los Angeles     | Media          | NULL           | 1.0                 | 2020-10-21 | Private Equity | United States  | 1800         |
| Deliveroo Australia | Melbourne       | Food           | 120            | 1.0                 | 2022-11-15 | Post-IPO       | Australia      | 1700         |
| Katerra             | SF Bay Area     | Construction   | 2434           | 1.0                 | 2021-06-01 | Unknown        | United States  | 1600         |
| Convoy              | Seattle         | Logistics      | 500            | 1.0                 | 2023-10-19 | Series E       | United States  | 1100         |
| Lordstown Motors    | Detroit         | Transportation | NULL           | 1.0                 | 2023-06-27 | Post-IPO       | United States  | 1100         |
| BlockFi             | New York City   | Crypto         | NULL           | 1.0                 | 2022-11-28 | Series E       | United States  | 1000         |
| Olive               | Columbus        | Healthcare     | NULL           | 1.0                 | 2023-10-31 | Series H       | United States  | 856          |
| SmileDirectClub     | Nashville       | Healthcare     | NULL           | 1.0                 | 2023-12-09 | Post-IPO       | United States  | 694          |
| AppHarvest          | Lexington       | Food           | NULL           | 1.0                 | 2023-07-24 | Post-IPO       | United States  | 692          |
| MediaMath           | New York City   | Marketing      | NULL           | 1.0                 | 2023-06-30 | Private Equity | United States  | 607          |
| Veev                | SF Bay Area     | Construction   | NULL           | 1.0                 | 2023-11-26 | Series D       | United States  | 597          |
| Aura Financial      | SF Bay Area     | Finance        | NULL           | 1.0                 | 2021-01-11 | Unknown        | United States  | 584          |
| Shift               | SF Bay Area     | Transportation | NULL           | 1.0                 | 2023-10-06 | Post-IPO       | United States  | 504          |
| IronNet             | Washington D.C. | Security       | NULL           | 1.0                 | 2023-10-02 | Post-IPO       | United States  | 428          |
| Zume                | SF Bay Area     | Food           | NULL           | 1.0                 | 2023-06-02 | Unknown        | United States  | 423          |
| Volta Trucks        | Stockholm       | Transportation | NULL           | 1.0                 | 2023-10-18 | Series C       | Sweden         | 391          |
| Hyperloop One       | Los Angeles     | Transportation | NULL           | 1.0                 | 2023-12-21 | Unknown        | United States  | 368          |
| InVision            | New York City   | Product        | NULL           | 1.0                 | 2024-01-04 | Series F       | United States  | 356          |
| Openpay             | Melbourne       | Finance        | 83             | 1.0                 | 2023-02-07 | Post-IPO       | Australia      | 299          |
| Ghost Autonomy      | SF Bay Area     | Transportation | 100            | 1.0                 | 2024-04-03 | Series E       | United States  | 247          |
| D2iQ                | SF Bay Area     | Infrastructure | NULL           | 1.0                 | 2023-12-08 | Series D       | United States  | 247          |
| Pollen              | London          | Marketing      | NULL           | 1.0                 | 2022-08-10 | Series C       | United Kingdom | 238          |
| Rezi                | New York City   | Real Estate    | NULL           | 1.0                 | 2024-04-01 | Series B       | United States  | 230          |
| IRL                 | SF Bay Area     | Consumer       | NULL           | 1.0                 | 2023-06-23 | Series C       | United States  | 197          |
| Zulily              | Seattle         | Retail         | 839            | 1.0                 | 2023-12-08 | Acquired       | United States  | 194          |
| Simple Feast        | Copenhagen      | Food           | 150            | 1.0                 | 2022-09-07 | Unknown        | Denmark        | 173          |
| RenoRun             | Montreal        | Construction   | NULL           | 1.0                 | 2023-04-26 | Series B       | Canada         | 163          |
| Arch Oncology       | Brisbane        | Healthcare     | NULL           | 1.0                 | 2023-01-13 | Series C       | United States  | 155          |
| Zeus Living         | SF Bay Area     | Real Estate    | NULL           | 1.0                 | 2023-11-07 | Series C       | United States  | 151          |
| Motif Investing     | SF Bay Area     | Finance        | NULL           | 1.0                 | 2020-04-18 | Series E       | United States  | 126          |
| CommonBond          | New York City   | Finance        | NULL           | 1.0                 | 2022-09-09 | Series D       | United States  | 125          |
| Fast                | SF Bay Area     | Finance        | NULL           | 1.0                 | 2022-04-05 | Series B       | United States  | 124          |
| ZestMoney           | Bengaluru       | Finance        | 150            | 1.0                 | 2023-12-05 | Series C       | India          | 120          |
| Drizly              | Boston          | Retail         | 168            | 1.0                 | 2024-02-05 | Acquired       | United States  | 119          |
| The Wing            | New York City   | Real Estate    | NULL           | 1.0                 | 2022-08-31 | Series C       | United States  | 117          |
| Reali               | SF Bay Area     | Real Estate    | 140            | 1.0                 | 2022-08-24 | Series B       | United States  | 117          |
| Airlift             | Lahore          | Logistics      | NULL           | 1.0                 | 2022-07-12 | Series B       | Pakistan       | 109          |
| Bluprint            | Denver          | Education      | 137            | 1.0                 | 2020-05-26 | Acquired       | United States  | 108          |
| Medly               | New York City   | Healthcare     | NULL           | 1.0                 | 2023-02-08 | Series C       | United States  | 100          |
| HOOQ                | Singapore       | Consumer       | 250            | 1.0                 | 2020-03-27 | Unknown        | Singapore      | 95           |
| Volt Bank           | Sydney          | Finance        | NULL           | 1.0                 | 2022-06-29 | Series E       | Australia      | 90           |
| Phantom Auto        | SF Bay Area     | Transportation | 100            | 1.0                 | 2024-03-12 | Unknown        | United States  | 86           |
| Milkrun             | Sydney          | Food           | 400            | 1.0                 | 2023-04-11 | Series A       | Australia      | 86           |
| Dash                | New York City   | Finance        | NULL           | 1.0                 | 2023-10-06 | Unknown        | United States  | 86           |
| Bitwise             | SF Bay Area     | Crypto         | 900            | 1.0                 | 2023-06-14 | Series B       | United States  | 84           |
| Faze Medicines      | Boston          | Healthcare     | NULL           | 1.0                 | 2022-11-09 | Series B       | United States  | 81           |
| Deliv               | SF Bay Area     | Retail         | 669            | 1.0                 | 2020-05-13 | Series C       | United States  | 80           |
| Fuzzy               | SF Bay Area     | Healthcare     | NULL           | 1.0                 | 2023-06-18 | Series C       | United States  | 80           |
| Edmodo              | SF Bay Area     | Education      | NULL           | 1.0                 | 2022-08-16 | Acquired       | United States  | 77           |

`50-190 row(s) returned`

</details>

![2  Complete Company Layoffs by Funding Stage](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/b6c1b873-e8d7-4c72-b4cb-65bbd4d81d5c)

+ "**Britishvolt**" had the most funds when the company fully turned over, with a total of **206 employees** laid off, representing **100% of its workforce**, on **January 17th, 2023**. The stage of the company at the time of layoffs is **unknown**, and it had **$2,400 million in funds**.
+ "**SuperLearn**" had the lowest funds, and although there is no information available about the total number of layoffs, a **100% layoff** percentage is presented. The layoffs occurred on **June 21st, 2022**, during the **Seed stage**, and the company had **$0 in funds**.

### Company Layoffs
```sql
select
    company
  , sum(total_laid_off) as sum_total
from
    layoffs_staging2
group by
    company
order by
    2 desc;
```

<details>
    <summary><b>Field Details</b></summary>

| company    | sum_total |
|------------|-----------|
| Amazon     | 27840     |
| Meta       | 21000     |
| Tesla      | 14500     |
| Google     | 13372     |
| Microsoft  | 13058     |
| SAP        | 11000     |
| Salesforce | 10840     |
| Cisco      | 8700      |
| Ericsson   | 8500      |
| Flink      | 8100      |

`10-1960 row(s) returned`

</details>

![3  Company Layoffs](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/8fa29b2b-ec1a-4c43-b991-f80890ba84cc)

+ "**Amazon**" has the highest sum of total laid off, with a total of **27,840 employees** affected.
+ "**Flytedesk**" has the lowest sum of total laid off, with only **4 employees** affected.

### Start and End Date of Layoffs Metrics
```sql
select
    min(`date`) as min_date
  , max(`date`) as max_date
from
    layoffs_staging2;
```

<details>
    <summary><b>Field Details</b></summary>

| min_date   | max_date   |
|------------|------------|
| 2020-03-11 | 2024-05-16 |

</details>

+ The earliest date of layoffs is "**2020-03-11**", and the latest date of layoffs is "**2024-05-16**".
+ The earliest data represents the beginning of the COVID-19 pandemic by the World Health Organization, and the latest date represents the present day.

### Industry Layoffs
```sql
select
    industry
  , sum(total_laid_off) as sum_total
from
    layoffs_staging2
group by
    industry
order by
    2 desc;
```

<details>
    <summary><b>Field Details</b></summary>

| industry       | sum_total |
|----------------|-----------|
| Retail         | 67368     |
| Consumer       | 63714     |
| Transportation | 56763     |
| Other          | 54864     |
| Food           | 41985     |
| Finance        | 37162     |
| Healthcare     | 22746     |
| Real Estate    | 18138     |
| Education      | 17430     |
| Travel         | 16124     |
| Sales          | 14933     |
| Infrastructure | 14729     |
| Hardware       | 13153     |
| Crypto         | 11205     |
| Fitness        | 9529      |
| Marketing      | 9015      |
| Security       | 8422      |
| Media          | 7941      |
| HR             | 7252      |
| Data           | 6343      |
| Logistics      | 5326      |
| Recruiting     | 4520      |
| Construction   | 3863      |
| Support        | 3491      |
| Energy         | 2867      |
| Product        | 1873      |
| Aerospace      | 1188      |
| Manufacturing  | 1066      |
| Legal          | 921       |
| AI             | 262       |
| NULL           | 35        |

</details>

![4  Industry Layoffs](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/ebaec3e7-e29d-4065-b145-b7e884b1abef)

+ The "**Retail**" industry has the highest number of total layoffs, totaling **67,368 employees**.
+ On the other hand, the "**AI**" industry has the lowest number of total layoffs, with only **262 employees**.

### Country Layoffs
```sql
select
    country
  , sum(total_laid_off) as sum_total
from
    layoffs_staging2
group by
    country
order by
    2 desc;
```

<details>
    <summary><b>Field Details</b></summary>

| country              | sum_total |
|----------------------|-----------|
| United States        | 365527    |
| India                | 47127     |
| Germany              | 25285     |
| United Kingdom       | 16733     |
| Sweden               | 12969     |
| Canada               | 9677      |
| Brazil               | 8926      |
| China                | 6205      |
| Singapore            | 5229      |
| Israel               | 4306      |
| Indonesia            | 4211      |
| Australia            | 3169      |
| France               | 1825      |
| Nigeria              | 1607      |
| New Zealand          | 1070      |
| United Arab Emirates | 995       |
| Kenya                | 988       |
| Netherlands          | 820       |
| Hong Kong            | 730       |
| Austria              | 670       |
| Estonia              | 582       |
| Spain                | 553       |
| Chile                | 525       |
| Ireland              | 466       |
| Russia               | 400       |
| South Korea          | 350       |
| Senegal              | 300       |
| Poland               | 275       |
| Mexico               | 270       |
| Norway               | 255       |
| Romania              | 252       |
| Finland              | 250       |
| Denmark              | 240       |
| Argentina            | 233       |
| Czech Republic       | 216       |
| Ghana                | 150       |
| Colombia             | 130       |
| Portugal             | 115       |
| Malaysia             | 100       |
| Japan                | 85        |
| Seychelles           | 75        |
| Switzerland          | 62        |
| Lithuania            | 60        |
| Cayman Islands       | 60        |
| Thailand             | 55        |
| Belgium              | 50        |
| Ukraine              | 50        |
| Pakistan             | NULL      |
| Italy                | NULL      |
| Hungary              | NULL      |
| Turkey               | NULL      |
| Luxembourg           | NULL      |
| Vietnam              | NULL      |
| Egypt                | NULL      |

</details>

![5  Country Layoffs](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/822400ed-cfb6-4dbc-8a3d-241de4a12d4c)

+ The country "**United States**" had the highest total number of layoffs, amounting to **365,527 employees**.
+ Conversely, "**Ukraine**" had the lowest total number of layoffs, with only **50 employees**.

### Yearly Layoffs
```sql
select
    year(`date`) as years
  , sum(total_laid_off) as year_total
from
    layoffs_staging2
group by
    year(`date`)
order by
    1 desc;
```

<details>
    <summary><b>Field Details</b></summary>

| years | year_total |
|-------|------------|
| 2024  | 74371      |
| 2023  | 212585     |
| 2022  | 150707     |
| 2021  | 15810      |
| 2020  | 70755      |

</details>

![6  Yearly Layoffs](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/57f91081-24e7-44e0-b657-b22775ab5659)

+ The year **2023** had the highest total number of layoffs, totaling **212,585 employees**.
+ Conversely, the year **2020** had the lowest total number of layoffs, with only **70,755 employees**.

### Layoffs by Stages
```sql
select
    stage
  , sum(total_laid_off) as sum_total
from
    layoffs_staging2
group by
    stage
order by
    2 desc;
```
<details>
    <summary><b>Field Details</b></summary>

| stage          | sum_total |
|----------------|-----------|
| Post-IPO       | 287864    |
| Unknown        | 43720     |
| Acquired       | 40848     |
| Series B       | 28267     |
| Series D       | 24295     |
| Series C       | 24155     |
| Series E       | 22041     |
| Series F       | 13196     |
| Private Equity | 10719     |
| Series H       | 7931      |
| Series A       | 7173      |
| Series G       | 4347      |
| Series J       | 3750      |
| Series I       | 2855      |
| Seed           | 1723      |
| Subsidiary     | 1094      |
| NULL           | 250       |

</details>

![7  Layoffs by Stages](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/720c8942-2474-456b-962d-32ca8c26b8b4)

+ "**Post-IPO**" stage had the highest total number of layoffs, totaling **287,864 employees**.
+ Conversely, the "**Subsidiary**" stage had the lowest total number of layoffs, with only **1,094 employees**.

### Monthly Layoffs with Rolling Total
```sql
with
    rolling_total as (
        select
            substring(`date`, 1, 7) as `month`
          , sum(total_laid_off) as total_off
        from
            layoffs_staging2
        where
            substring(`date`, 1, 7) is not null
        group by
            `month`
        order by
            1 asc
    )
select
    `month`
  , total_off
  , sum(total_off) over (
        order by
            `month`
    ) as rolling_total
from
    rolling_total;
```
<details>
    <summary><b>Field Details</b></summary>

<table> <tr><td>

| month   | total_off | rolling_total |
|---------|-----------|---------------|
| 2020-03 | 8981      | 8981          |
| 2020-04 | 25271     | 34252         |
| 2020-05 | 22699     | 56951         |
| 2020-06 | 7046      | 63997         |
| 2020-07 | 2737      | 66734         |
| 2020-08 | 1969      | 68703         |
| 2020-09 | 609       | 69312         |
| 2020-10 | 450       | 69762         |
| 2020-11 | 219       | 69981         |
| 2020-12 | 774       | 70755         |

</td><td>

| month   | total_off | rolling_total |
|---------|-----------|---------------|
| 2021-01 | 6813      | 77568         |
| 2021-02 | 855       | 78423         |
| 2021-03 | 47        | 78470         |
| 2021-04 | 261       | 78731         |
| 2021-06 | 2434      | 81165         |
| 2021-07 | 80        | 81245         |
| 2021-08 | 1867      | 83112         |
| 2021-09 | 161       | 83273         |
| 2021-10 | 22        | 83295         |
| 2021-11 | 2070      | 85365         |
| 2021-12 | 1200      | 86565         |

</td><td>

| month   | total_off | rolling_total |
|---------|-----------|---------------|
| 2022-01 | 510       | 87075         |
| 2022-02 | 3685      | 90760         |
| 2022-03 | 5714      | 96474         |
| 2022-04 | 4078      | 100552        |
| 2022-05 | 12685     | 113237        |
| 2022-06 | 15934     | 129171        |
| 2022-07 | 15888     | 145059        |
| 2022-08 | 12539     | 157598        |
| 2022-09 | 5881      | 163479        |
| 2022-10 | 12706     | 176185        |
| 2022-11 | 52390     | 228575        |
| 2022-12 | 8697      | 237272        |

</td><td>

| month   | total_off | rolling_total |
|---------|-----------|---------------|
| 2023-01 | 70935     | 308207        |
| 2023-02 | 31010     | 339217        |
| 2023-03 | 34089     | 373306        |
| 2023-04 | 16124     | 389430        |
| 2023-05 | 10435     | 399865        |
| 2023-06 | 9551      | 409416        |
| 2023-07 | 6919      | 416335        |
| 2023-08 | 9432      | 425767        |
| 2023-09 | 4425      | 430192        |
| 2023-10 | 6199      | 436391        |
| 2023-11 | 7574      | 443965        |
| 2023-12 | 5892      | 449857        |

</td><td>

| month   | total_off | rolling_total |
|---------|-----------|---------------|
| 2024-01 | 32926     | 482783        |
| 2024-02 | 14689     | 497472        |
| 2024-03 | 1127      | 498599        |
| 2024-04 | 21923     | 520522        |
| 2024-05 | 3706      | 524228        |

</td></tr> </table>
</details>

![8  Monthly Layoffs with Rolling Total](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/17a1b927-db54-4ba3-820f-3af6cccbeca4)

+ In **2020**, "**April**" had the highest total layoffs, reaching **25,271 employees**, while "**November**" had the lowest, with only **219 employees**.
+ For **2021**, "**January**" saw the highest total layoffs at **6,813 employees**, whereas "**October**" had the lowest, with only **22 employees**.
+ In **2022**, "**November**" recorded the highest total layoffs, totaling **52,390 employees**, while "**January**" had the lowest, with **510 employees**.
+ Moving to **2023**, "**January**" marked the highest total layoffs at **70,935 employees**, while "**September**" had the lowest, at **4,425 employees**.
+ Lastly, in **2024**, "**April**" experienced the highest total layoffs, reaching **21,923 employees**, while "**March**" had the lowest, with **1,127 employees**.


### Top 5 Companies with Highest Total Layoffs by Yearly
```sql
with
    company_year (company, years, total_laid_off) as (
        select
            company
          , year(`date`)
          , sum(total_laid_off)
        from
            layoffs_staging2
        group by
            company
          , year(`date`)
    )
  , company_year_rank as (
        select
            *
          , dense_rank() over (
                partition by
                    years
                order by
                    total_laid_off desc
            ) as ranking
        from
            company_year
        where
            years is not null
    )
select
    *
from
    company_year_rank
where
    ranking <= 5;
```

<details>
    <summary><b>Field Details</b></summary>

<table> <tr><td>

| company     | years | total_laid_off | ranking |
|-------------|-------|----------------|---------|
| Uber        | 2020  | 7525           | 1       |
| Groupon     | 2020  | 2800           | 2       |
| Swiggy      | 2020  | 2250           | 3       |
| Airbnb      | 2020  | 1900           | 4       |
| PaisaBazaar | 2020  | 1500           | 5       |

</td><td>

| company     | years | total_laid_off | ranking |
|-------------|-------|----------------|---------|
| Bytedance   | 2021  | 3600           | 1       |
| Katerra     | 2021  | 2434           | 2       |
| Zillow      | 2021  | 2000           | 3       |
| Instacart   | 2021  | 1877           | 4       |
| WhiteHat Jr | 2021  | 1800           | 5       |

</td><td>

| company     | years | total_laid_off | ranking |
|-------------|-------|----------------|---------|
| Meta        | 2022  | 11000          | 1       |
| Amazon      | 2022  | 10150          | 2       |
| Cisco       | 2022  | 4100           | 3       |
| Peloton     | 2022  | 4084           | 4       |
| Carvana     | 2022  | 4000           | 5       |

</td><td>

| company     | years | total_laid_off | ranking |
|-------------|-------|----------------|---------|
| Amazon      | 2023  | 17260          | 1       |
| Google      | 2023  | 12115          | 2       |
| Microsoft   | 2023  | 11158          | 3       |
| Meta        | 2023  | 10000          | 4       |
| Ericsson    | 2023  | 8500           | 5       |

</td><td>

| company     | years | total_laid_off | ranking |
|-------------|-------|----------------|---------|
| Tesla       | 2024  | 14500          | 1       |
| SAP         | 2024  | 8000           | 2       |
| Cisco       | 2024  | 4250           | 3       |
| Getir       | 2024  | 3300           | 4       |
| Xerox       | 2024  | 3000           | 5       |

</td></tr> </table>
</details>

![9  Top 5 Companies with Highest Total Layoffs by Yearly](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/fe77d783-4df2-4387-8be8-0f57f5b38f39)

+ In **2020**, "**Uber**" ranked 1st with the highest total of **7,525** layoffs, while "**PaisaBazaar**" ranked 5th with the lowest total of **1,500 layoffs**.
+ For **2021**, "**Bytedance**" ranked 1st with the highest total of **3,600** layoffs, while "**WhiteHat Jr**" ranked 5th with the lowest total of **1,800 layoffs**.
+ In **2022**, "**Meta**" ranked 1st with the highest total of **11,000** layoffs, while "**Carvana**" ranked 5th with the lowest total of **4,000 layoffs**.
+ Moving to **2023**, "**Amazon**" ranked 1st with the highest total of **17,260** layoffs, while "**Ericsson**" ranked 5th with the lowest total of **8,500 layoffs**.
+ Lastly, in **2024**, "**Tesla**" ranked 1st with the highest total of **14,500** layoffs, while "**Xerox**" ranked 5th with the lowest total of **3,000 layoffs**.

### Top 5 Industries with Highest Total Layoffs by Yearly
```sql
with
    industry_year (industry, years, total_laid_off) as (
        select
            industry
          , year(`date`)
          , sum(total_laid_off)
        from
            layoffs_staging2
        group by
            industry
          , year(`date`)
    )
  , industry_year_rank as (
        select
            *
          , dense_rank() over (
                partition by
                    years
                order by
                    total_laid_off desc
            ) as ranking
        from
            industry_year
        where
            years is not null
    )
select
    *
from
    industry_year_rank
where
    ranking <= 5;
```

<details>
    <summary><b>Field Details</b></summary>

<table> <tr><td>

| industry       | years | total_laid_off | ranking |
|----------------|-------|----------------|---------|
| Transportation | 2020  | 14628          | 1       |
| Retail         | 2020  | 8002           | 2       |
| Travel         | 2020  | 7431           | 3       |
| Finance        | 2020  | 6779           | 4       |
| Food           | 2020  | 5968           | 5       |

</td><td>

| industry       | years | total_laid_off | ranking |
|----------------|-------|----------------|---------|
| Consumer       | 2021  | 3600           | 1       |
| Real Estate    | 2021  | 2900           | 2       |
| Food           | 2021  | 2644           | 3       |
| Construction   | 2021  | 2434           | 4       |
| Education      | 2021  | 1943           | 5       |

</td><td>

| industry       | years | total_laid_off | ranking |
|----------------|-------|----------------|---------|
| Retail         | 2022  | 20447          | 1       |
| Consumer       | 2022  | 18841          | 2       |
| Transportation | 2022  | 14667          | 3       |
| Finance        | 2022  | 12555          | 4       |
| Food           | 2022  | 11288          | 5       |

</td><td>

| industry       | years | total_laid_off | ranking |
|----------------|-------|----------------|---------|
| Other          | 2023  | 35809          | 1       |
| Retail         | 2023  | 30290          | 2       |
| Consumer       | 2023  | 29923          | 3       |
| Food           | 2023  | 16872          | 4       |
| Finance        | 2023  | 13276          | 5       |

</td><td>

| industry       | years | total_laid_off | ranking |
|----------------|-------|----------------|---------|
| Transportation | 2024  | 16637          | 1       |
| Other          | 2024  | 12297          | 2       |
| Retail         | 2024  | 7541           | 3       |
| Consumer       | 2024  | 5417           | 4       |
| Infrastructure | 2024  | 5330           | 5       |

</td></tr> </table>
</details>

![10  Top 5 Industries with Highest Total Layoffs by Yearly](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/834e0121-ef86-43be-8a9d-d495b774c454)

+ In **2020**, the "**Transportation**" industry ranked 1st with the highest total of **14,628 layoffs**, while the "**Food**" industry ranked 5th with the lowest total of **5,968 layoffs**.
+ For **2021**, the "**Consumer**" industry ranked 1st with the highest total of **3,600 layoffs**, while the "**Education**" industry ranked 5th with the lowest total of **1,943 layoffs**.
+ In **2022**, the "**Retail**" industry ranked 1st with the highest total of **20,447 layoffs**, while the "**Food**" industry ranked 5th with the lowest total of **11,288 layoffs**.
+ Moving to **2023**, the "**Other**" industry ranked 1st with the highest total of **35,809 layoffs**, while the "**Finance**" industry ranked 5th with the lowest total of **13,276 layoffs**.
+ Lastly, in **2024**, the "**Transportation**" industry ranked 1st once again with the highest total of **16,637 layoffs**, while the "**Infrastructure**" industry ranked 5th with the lowest total of **5,330 layoffs**.

### Top 5 Countries with Highest Total Layoffs by Yearly
```sql
with
    country_year (country, years, total_laid_off) as (
        select
            country,
            year(`date`),
            sum(total_laid_off)
        from
            layoffs_staging2
        group by
            country,
            year(`date`)
    ),
    country_year_rank as (
        select
            *,
            dense_rank() over (
                partition by
                    years
                order by
                    total_laid_off desc
            ) as ranking
        from
            country_year
        where
            years is not null
    )
select
    *
from
    country_year_rank
where
    ranking <= 5;
```

<details>
    <summary><b>Field Details</b></summary>

<table> <tr><td>

| country        | years | total_laid_off | ranking |
|----------------|-------|----------------|---------|
| United States  | 2020  | 48964          | 1       |
| India          | 2020  | 12732          | 2       |
| United Kingdom | 2020  | 1848           | 3       |
| Brazil         | 2020  | 1814           | 4       |
| Canada         | 2020  | 1083           | 5       |

</td><td>

| country        | years | total_laid_off | ranking |
|----------------|-------|----------------|---------|
| United States  | 2021  | 9457           | 1       |
| India          | 2021  | 4080           | 2       |
| China          | 2021  | 1800           | 3       |
| Germany        | 2021  | 387            | 4       |
| Canada         | 2021  | 45             | 5       |

</td><td>

| country        | years | total_laid_off | ranking |
|----------------|-------|----------------|---------|
| United States  | 2022  | 104245         | 1       |
| India          | 2022  | 13964          | 2       |
| Brazil         | 2022  | 4829           | 3       |
| Canada         | 2022  | 3720           | 4       |
| Germany        | 2022  | 3431           | 5       |

</td><td>

| country        | years | total_laid_off | ranking |
|----------------|-------|----------------|---------|
| United States  | 2023  | 149090         | 1       |
| India          | 2023  | 12896          | 2       |
| Germany        | 2023  | 12756          | 3       |
| Sweden         | 2023  | 10845          | 4       |
| United Kingdom | 2023  | 7220           | 5       |

</td><td>

| country        | years | total_laid_off | ranking |
|----------------|-------|----------------|---------|
| United States  | 2024  | 53771          | 1       |
| Germany        | 2024  | 8180           | 2       |
| United Kingdom | 2024  | 5390           | 3       |
| India          | 2024  | 3455           | 4       |
| Israel         | 2024  | 1070           | 5       |

</td></tr> </table>
</details>

![11  Top 5 Countries with Highest Total Layoffs by Yearly](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/158bd3be-2991-4dd7-97ea-0e7f16df893c)

+ In **2020**, "**United States**" ranked 1st with the highest total of **48,964 layoffs**, while "**Canada**" ranked 5th with the lowest total of **1,083 layoffs**.
+ For **2021**, "**United States**" ranked 1st with the highest total of **9,457 layoffs**, while "**Canada**" ranked 5th with the lowest total of **45 layoffs**.
+ In **2022**, "**United States**" ranked 1st with the highest total of **104,245 layoffs**, while "**Germany**" ranked 5th with the lowest total of **3,431 layoffs**.
+ Moving to **2023**, "**United States**" ranked 1st with the highest total of **149,090 layoffs**, while "**United Kingdom**" ranked 5th with the lowest total of **7,220 layoffs**.
+ Lastly, in **2024**, "**United States**" ranked 1st with the highest total of **53,771 layoffs**, while "**Israel**" ranked 5th with the lowest total of **1,070 layoffs**.

## Limitations
+ **Incomplete Data**: The dataset for both the years 2020 and 2024 may be incomplete. In 2020, data collection began in March when the COVID-19 pandemic was declared, potentially missing layoffs that occurred earlier in the year. Similarly, for 2024, as the year is not yet over, the dataset may lack complete information, leading to gaps or inaccuracies in the analysis of layoffs for that year.
+ **Limited Context**: The dataset provides information about the company, location, industry, and date of layoffs, but lacks additional context regarding the reasons behind the layoffs, such as economic factors, company performance, or specific events.
+ **Incomplete Company Information**: Detailed information about each company beyond its names, such as size, revenue, or market position, is not available in the dataset. This lack of detail hinders a comprehensive understanding of the layoffs.
+ **Funds Raised**: While funds raised may serve as an indicator of the company's financial health, it may not provide a complete picture. Factors such as profitability, cash flow, and debt levels are also crucial considerations for understanding a company's financial situation.
+ **Limited Historical Data**: The dataset covers a specific timeframe, but does not include historical data on layoffs before that period. This limitation restricts the ability to analyze trends and patterns over time.

## Licensing
+ The dataset provided is licensed under the [Open Data Commons Open Database License (ODbL)](https://opendatacommons.org/licenses/odbl/1-0/).

## Acknowledgement
I would like to extend my gratitude to **[Alex Freberg](https://www.alextheanalyst.com/)** ([Alex The Analyst](https://www.youtube.com/@AlexTheAnalyst)) for his invaluable help. His step-by-step guidance on YouTube and the presentation of this dataset through his video greatly assisted me in this project.
