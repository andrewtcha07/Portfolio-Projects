# Cyclistic Bike-Share: Case Study 🚲
Welcome to my journey through the **Cyclistic Bike-Share Case Study**, a capstone project for my **Google Data Analytics Professional Certificate**! As I delve into this project, I assume the role of a team member at Cyclistic, a fictional company. My mission is to embark on a data-driven adventure, addressing business inquiries through the **Ask**, **Prepare**, **Process**, **Analyze**, **Share**, and **Act** phases of the data analysis process. Join me as we uncover insights and drive actionable outcomes!

## 📽️ Scenario
+ I am a Junior Data Analyst in the Marketing Analyst Team at Cyclistic, a bike-share company in Chicago.
+ The Director of Marketing believes the company's future success relies on maximizing the number of annual memberships.
+ The Analyst team aims to understand the different usage patterns of casual riders and annual members of Cyclistic bikes.
+ Based on these insights, a new marketing strategy will be designed to convert casual riders into annual members.

## 🏬 Company Overview
+ Cyclistic launched its bike-share program successfully in 2016, growing to a fleet of 5,824 bicycles across 692 stations in Chicago.
+ Bikes are geo-tracked and locked into the network, allowing users to unlock from one station and return to any other station anytime.
+ Previous marketing strategies focused on general awareness and broad consumer segments, leveraging flexible pricing plans such as single-ride passes, full-day passes, and annual memberships.
+ Financial Analysis indicates that annual members are significantly more profitable than casual riders.
+ The Director of Marketing aims to maximize annual memberships for future growth by converting casual riders into members, leveraging their existing awareness of the Cyclistic program.
+ To achieve this goal, the team plans to analyze historical bike trip data to understand the differences between annual members and casual riders, motivations for purchasing memberships, and the impact of digital media on marketing tactics.

## ❓ The 'Ask' Phase

### Business Task
Utilize Cyclistic's historical bike trip data for a comprehensive analysis of the distinct usage behaviors between casual riders and annual members. Employ these insights to craft an effective marketing strategy geared towards converting casual riders into annual members for Cyclistic, thereby driving future growth and profitability.

### Key Stakeholders
+ **Lily Moreno**: Director of Marketing and your manager, responsible for developing campaigns and initiatives to promote the bike-share program across various channels.
+ **Cyclistic Marketing Analytics Team**: The Data Analysts Team is responsible for collecting, analyzing, and reporting data to guide Cyclistic's marketing strategy.
+ **Cyclistic Executive Team**: A detail-oriented executive team responsible for approving the recommended marketing program.

### Key Questions
The analysis will address these key questions:
1. How do annual members and casual riders use Cyclistic bikes differently?
2. Why would casual riders buy Cyclistic annual memberships?
3. How can Cyclisitc use digital media to influence casual riders to become members?

### Key Tasks
- [x] Identify the business task.
- [x] Consider key stakeholders.

### Deliverable 
- [x] A clear statement of the business task.

## 📋 The 'Prepare' Phase

### Data Information
+ Cyclistic’s Historical Trip Data is sourced from [Divvy Trip Data](https://divvy-tripdata.s3.amazonaws.com/index.html), a public dataset provided by Motivate International Inc., a bike-sharing company operating in Chicago under the name of Divvy (owned by Lyft).
+ Cyclistic and Divvy Trip Data have distinct names because Cyclistic is a fictitious entity created for this case study.

### Limitations
+ Due to data privacy concerns, the use of personally identifiable information of riders is prohibited.
+ This encompasses data such as pass purchases and credit card numbers, utilized to ascertain whether casual riders reside within Cyclistic's service area or if users have made multiple single-pass purchases.

### Data Organization
+ The Divvy Trip dataset is organized by year and month, with each month's data formatted as a separate zip file.
+ In each zip file, the data is formatted as CSV files.
+ The downloaded dataset comprises 12 CSV files, each corresponding to one of the 12 months (January to December) in 2023, with a total file size of 1.15 GB.
+ Each CSV file consists of 13 columns.

### Metadata
| File Name                 | Data Size |
|---------------------------|-----------|
| 202301-divvy-tripdata.csv | 38.5 MB   |
| 202303-divvy-tripdata.csv | 52.3 MB   |
| 202304-divvy-tripdata.csv | 85.8 MB   |
| 202305-divvy-tripdata.csv | 121.8 MB  |
| 202306-divvy-tripdata.csv | 144.4 MB  |
| 202307-divvy-tripdata.csv | 153.9 MB  |
| 202308-divvy-tripdata.csv | 155.1 MB  |
| 202309-divvy-tripdata.csv | 134.2 MB  |
| 202310-divvy-tripdata.csv | 107.9 MB  |
| 202311-divvy-tripdata.csv | 73 MB     |
| 202312-divvy-tripdata.csv | 45 MB     |

### Data Dictionary
| No. | Column Name        | Data Type      | Description                                               |
|:----|:-------------------|:---------------|:----------------------------------------------------------|
| 1   | ride_id            | Text           | Unique identifier for each trip.                          |
| 2   | rideable_type      | Text           | Type of rideable bike (e.g., classic, docked, electric).  |
| 3   | started_at         | Date/Time      | Timestamp indicating when the trip started.               |
| 4   | ended_at           | Date/Time      | Timestamp indicating when the trip ended.                 |
| 5   | start_station_name | Text           | Name of the station where the trip started.               |
| 6   | start_station_id   | Text           | Unique identifier for the station where the trip started. |
| 7   | end_station_name   | Text           | Name of the station where the trip ended.                 |
| 8   | end_station_id     | Text           | Unique identifier for the station where the trip ended.   |
| 9   | start_lat          | Decimal Number | Latitude of the starting location.                        |
| 10  | start_lng          | Decimal Number | Longitude of the starting location.                       |
| 11  | end_lat            | Decimal Number | Latitude of the ending location.                          |
| 12  | end_lng            | Decimal Number | Longitude of the ending location.                         |
| 13  | member_casual      | Text           | Type of user (e.g., casual, member).                      |

> [!NOTE]
> **Further Information**
> + `rideable_type`: There are three possible bike choices:
>    * `classic bikes`: Standard, traditional bicycles ideal for short and medium distances, suited for casual riders.
>    * `docked bikes`: Typically stationed throughout the city for convenient access and return.
>    * `electric bikes`: Motor-powered bicycles provide pedal assistance, facilitating easier navigation and longer-distance travel with reduced effort.
> + `member_casual`: Users are categorized into two main types:
>    * `casual`: Also known as "customers," they purchase either a "Single Ride" (includes the initial 30 minutes of one ride) or a "Day Pass" (offers unlimited 3-hour rides for a 24-hour period).
>    * `member`: Also known as "subscribers," they purchase an "Annual Membership" (includes the first ride for free and 45 minutes of unlimited rides).

### Sort and Filter
+ Typically, the method for sorting and filtering will depend on the tool being used.
+ Sorting the data involves arranging it according to key factors crucial for the analysis, such as variables and data type.
+ Filtering the data entails removing any unnecessary data to concentrate solely on the information essential for addressing your business questions.

### Credibility (R.O.C.C.C)
+ The data was taken directly from the Divvy public dataset, which concludes it is Reliable, Original, Comprehensive, Current, and Cited.

### Licensing, Privacy, Security, and Accessibility
+ **Licensing**: The public dataset was made available by Motivate International Inc. under this [license](https://divvybikes-marketing-staging.lyft.net/system-data). This ensures that the usage of the data follows the specified terms and conditions.
+ **Privacy**: The Divvy public dataset adheres to [data privacy regulations](https://www.lyft.com/privacy#privacy-how-we-use-your-information), by anonymizing all data to protect personally identifiable information. This safeguards the privacy of individuals' information while analyzing the dataset.
+ **Security**: The security of the analysis will ensure that the downloaded data is securely stored in a protected location.
+ **Accessibility**: The analysis will ensure that the findings and presentation formats are accessible to all stakeholders with varying abilities, adhering to established accessibility standards and guidelines.

### Data Integrity
+ Data integrity will be maintained through validation and assessment of data quality during the Exploratory Data Analysis (EDA) process, which entails identifying inconsistencies, missing values, outliers, and duplicate entries.

### Key Tasks
- [x]  Download data and store it appropriately.
- [x]  Identify how it’s organized.
- [x]  Sort and filter the data.
- [x]  Determine the credibility of the data.

### Deliverable 
- [x] A description of all data sources used.

## 🔄 The 'Process' Phase

### Tools
To see the remaining steps of the process, please visit the following pages:
+ [**Microsoft Excel**](https://github.com/chaanalyst/Portfolio-Projects/tree/97717c293a14916da87070b58202d25b05f55316/Cyclistic%20Bike-Share%3A%20Case%20Study/Microsoft%20Excel%20)
+ [**R**](https://github.com/chaanalyst/Portfolio-Projects/tree/97717c293a14916da87070b58202d25b05f55316/Cyclistic%20Bike-Share%3A%20Case%20Study/R%20)
+ [**SQL**](https://github.com/chaanalyst/Portfolio-Projects/tree/97717c293a14916da87070b58202d25b05f55316/Cyclistic%20Bike-Share%3A%20Case%20Study/SQL%20)
