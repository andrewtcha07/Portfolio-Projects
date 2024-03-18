## 🔄 The 'Process' Phase

### Tool
>*Microsoft Excel and Power Query*
+ The decision to use **Microsoft Excel** and **Power Query** for this analysis stems from their widespread accessibility, robust data manipulation capabilities, and seamless integration with external data sources.
+ Excel's user-friendly interface and familiarity make it an ideal choice for stakeholders.
+ Power Query extends Excel's capabilities, offering advanced data shaping and transformation functionalities, and simplifying tasks such as data cleaning and integration.
+ Additionally, Excel's visualization tools enable effective summarization and presentation of analysis results.

### Data Preparation
+ Imported the 12 CSV files into Excel, converting them to XLSX for enhanced formatting and analysis.
+ Conducted an initial data review.
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
+ Missing data primarily occurs in columns
    * start_station_name, start_station_id, end_station_name, end_station_id, end_lat, and end_lng.
+ Following further exploration, a decision will be made regarding whether to keep or drop missing data.

### Data Combination
+ Using Power Query to combine all 12 XLSX files into one file, following the initial review.

### Data Exploration



### Key Tasks
- [ ]  Check the data for errors.
- [ ]  Choose your tools.
- [ ]  Transform the data so you can work with it effectively.
- [ ]  Document the cleaning process.

### Deliverable 
- [ ]  A summary of your analysis.
