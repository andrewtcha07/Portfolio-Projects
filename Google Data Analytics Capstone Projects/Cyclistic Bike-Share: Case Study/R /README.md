## 🔄 The 'Process' Phase

### Tool Used
![R](https://img.shields.io/badge/r-%23276DC3.svg?style=for-the-badge&logo=r&logoColor=white)
![RStudio](https://img.shields.io/badge/RStudio-4285F4?style=for-the-badge&logo=rstudio&logoColor=white)

+ **R** and **RStudio** were chosen for this analysis due to their extensive statistical analysis capabilities, enabling sophisticated data exploration, hypothesis testing, and modeling across a diverse range of analytical tasks.
+ The efficient handling of large datasets in R is supported by optimized functions and data structures like data.table and dplyr, allowing for fast data manipulation and aggregation even with datasets containing millions or billions of records.
+ The flexibility and extensibility of R enable users to customize analyses to their specific needs, leveraging a wide array of packages for data manipulation, visualization, and modeling.
+ R excels in data visualization with powerful plotting libraries such as ggplot2 and plotly, which provide customizable and publication-ready visualizations. These libraries offer extensive control over design elements, facilitating the creation of interactive and dynamic visualizations that effectively communicate insights from complex datasets.

### Setting Up the Environment
+ Installing R packages from the CRAN (Comprehensive R Archive Network) or other repositories using the `install.packages()` function.
+ Loading packages using the `library()` function to make their functions and features available for analysis.
+ Importing the 12 CSV data files using the `read.csv()` function.

#### Installing R Packages
```r
install.packages("tidyverse")
install.packages("janitor")
install.packages("readr")
install.packages("dplyr")
install.packages("lubridate")
install.packages("tidyr")
install.packages("ggmap")
install.packages("ggplot2")
install.packages("geosphere")
install.packages("skimr")
```
> [!NOTE]
>**Further Information on R Packages**
> + `tidyverse`: Comprehensive suite of R packages for efficient data science workflows.
> + `janitor`: Simplifies data cleaning and tidying tasks.
> + `readr`: Fast and user-friendly package for reading data into R.
> + `dplyr`: Essential package for intuitive data manipulation.
> + `lubridate`: Facilitates easy handling of date-time data.
> + `tidyr`: Simplifies data tidying and reshaping tasks.
> + `ggmap`: Enables visualization of spatial data and creation of maps.
> + `ggplot2`: Powerful package for creating high-quality visualizations.
> + `geosphere`: Provides functions for computing distances and areas on Earth's surface.
> + `skimr`: Generates informative summaries and visualizations for data frames.

#### Loading Packages
```r
library(tidyverse)
library(janitor)
library(readr)
library(dplyr)
library(lubridate)
library(tidyr)
library(ggmap)
library(ggplot2)
library(geosphere)
library(skimr)
```

#### Importing Data Files and Creating Data Frame
+ January 2023
```r
jan2023 <- read_csv("202301-divvy-tripdata.csv")
```
```r
Rows: 190301 Columns: 13── Column specification ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
Delimiter: ","
chr  (7): ride_id, rideable_type, start_station_name, start_station_id, end_station_name, end_station_id, member_casual
dbl  (4): start_lat, start_lng, end_lat, end_lng
dttm (2): started_at, ended_at
ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

+ February 2023
```r
feb2023 <- read_csv("202302-divvy-tripdata.csv")
```
```r
Rows: 190445 Columns: 13── Column specification ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
Delimiter: ","
chr  (7): ride_id, rideable_type, start_station_name, start_station_id, end_station_name, end_station_id, member_casual
dbl  (4): start_lat, start_lng, end_lat, end_lng
dttm (2): started_at, ended_at
ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

+ March 2023
```r
mar2023 <- read_csv("202303-divvy-tripdata.csv")
```
```r
Rows: 258678 Columns: 13── Column specification ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
Delimiter: ","
chr  (7): ride_id, rideable_type, start_station_name, start_station_id, end_station_name, end_station_id, member_casual
dbl  (4): start_lat, start_lng, end_lat, end_lng
dttm (2): started_at, ended_at
ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

+ April 2023
```r
apr2023 <- read_csv("202304-divvy-tripdata.csv")
```
```r
Rows: 426590 Columns: 13── Column specification ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
Delimiter: ","
chr  (7): ride_id, rideable_type, start_station_name, start_station_id, end_station_name, end_station_id, member_casual
dbl  (4): start_lat, start_lng, end_lat, end_lng
dttm (2): started_at, ended_at
ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

+ May 2023
```r
may2023 <- read_csv("202305-divvy-tripdata.csv")
```
```r
Rows: 604827 Columns: 13── Column specification ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
Delimiter: ","
chr  (7): ride_id, rideable_type, start_station_name, start_station_id, end_station_name, end_station_id, member_casual
dbl  (4): start_lat, start_lng, end_lat, end_lng
dttm (2): started_at, ended_at
ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

+ June 2023
```r
jun2023 <- read_csv("202306-divvy-tripdata.csv")
```
```r
Rows: 719618 Columns: 13── Column specification ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
Delimiter: ","
chr  (7): ride_id, rideable_type, start_station_name, start_station_id, end_station_name, end_station_id, member_casual
dbl  (4): start_lat, start_lng, end_lat, end_lng
dttm (2): started_at, ended_at
ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

+ July 2023
```r
jul2023 <- read_csv("202307-divvy-tripdata.csv")
```
```r
Rows: 767650 Columns: 13── Column specification ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
Delimiter: ","
chr  (7): ride_id, rideable_type, start_station_name, start_station_id, end_station_name, end_station_id, member_casual
dbl  (4): start_lat, start_lng, end_lat, end_lng
dttm (2): started_at, ended_at
ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

+ August 2023
```r
aug2023 <- read_csv("202308-divvy-tripdata.csv")
```
```r
Rows: 771693 Columns: 13── Column specification ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
Delimiter: ","
chr  (7): ride_id, rideable_type, start_station_name, start_station_id, end_station_name, end_station_id, member_casual
dbl  (4): start_lat, start_lng, end_lat, end_lng
dttm (2): started_at, ended_at
ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

+ September 2023
```r
sep2023 <- read_csv("202309-divvy-tripdata.csv")
```
```r
Rows: 666371 Columns: 13── Column specification ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
Delimiter: ","
chr  (7): ride_id, rideable_type, start_station_name, start_station_id, end_station_name, end_station_id, member_casual
dbl  (4): start_lat, start_lng, end_lat, end_lng
dttm (2): started_at, ended_at
ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

+ October 2023
```r
oct2023 <- read_csv("202310-divvy-tripdata.csv")
```
```r
Rows: 537113 Columns: 13── Column specification ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
Delimiter: ","
chr  (7): ride_id, rideable_type, start_station_name, start_station_id, end_station_name, end_station_id, member_casual
dbl  (4): start_lat, start_lng, end_lat, end_lng
dttm (2): started_at, ended_at
ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

+ November 2023
```r
nov2023 <- read_csv("202311-divvy-tripdata.csv")
```
```r
Rows: 362518 Columns: 13── Column specification ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
Delimiter: ","
chr  (7): ride_id, rideable_type, start_station_name, start_station_id, end_station_name, end_station_id, member_casual
dbl  (4): start_lat, start_lng, end_lat, end_lng
dttm (2): started_at, ended_at
ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

+ December 2023
```r
dec2023 <- read_csv("202312-divvy-tripdata.csv")
```
```r
Rows: 224073 Columns: 13── Column specification ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
Delimiter: ","
chr  (7): ride_id, rideable_type, start_station_name, start_station_id, end_station_name, end_station_id, member_casual
dbl  (4): start_lat, start_lng, end_lat, end_lng
dttm (2): started_at, ended_at
ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

### Data Exploration
+ Conducted initial data inspection of each data frame.
+ Inspected the structure, attributes, and summary statistics.
+ Providing insights into the composition and characteristics of the data.

#### Displaying _Column Names_ for Each Month’s Dataset
```r
colnames(jan2023)
colnames(feb2023)
colnames(mar2023)
colnames(apr2023)
colnames(may2023)
colnames(jun2023)
colnames(jul2023)
colnames(aug2023)
colnames(sep2023)
colnames(oct2023)
colnames(nov2023)
colnames(dec2023)
```
```r
 [1] "ride_id"            "rideable_type"      "started_at"         "ended_at"           "start_station_name" "start_station_id"  
 [7] "end_station_name"   "end_station_id"     "start_lat"          "start_lng"          "end_lat"            "end_lng"           
[13] "member_casual"     
```

#### Displaying _Structure_ of Each Month’s Dataset
+ January 2023
```r
str(jan2023)
```
```r
spc_tbl_ [190,301 × 13] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
 $ ride_id           : chr [1:190301] "F96D5A74A3E41399" "13CB7EB698CEDB88" "BD88A2E670661CE5" "C90792D034FED968" ...
 $ rideable_type     : chr [1:190301] "electric_bike" "classic_bike" "electric_bike" "classic_bike" ...
 $ started_at        : POSIXct[1:190301], format: "2023-01-21 20:05:42" "2023-01-10 15:37:36" "2023-01-02 07:51:57" "2023-01-22 10:52:58" ...
 $ ended_at          : POSIXct[1:190301], format: "2023-01-21 20:16:33" "2023-01-10 15:46:05" "2023-01-02 08:05:11" "2023-01-22 11:01:44" ...
 $ start_station_name: chr [1:190301] "Lincoln Ave & Fullerton Ave" "Kimbark Ave & 53rd St" "Western Ave & Lunt Ave" "Kimbark Ave & 53rd St" ...
 $ start_station_id  : chr [1:190301] "TA1309000058" "TA1309000037" "RP-005" "TA1309000037" ...
 $ end_station_name  : chr [1:190301] "Hampden Ct & Diversey Ave" "Greenwood Ave & 47th St" "Valli Produce - Evanston Plaza" "Greenwood Ave & 47th St" ...
 $ end_station_id    : chr [1:190301] "202480.0" "TA1308000002" "599" "TA1308000002" ...
 $ start_lat         : num [1:190301] 41.9 41.8 42 41.8 41.8 ...
 $ start_lng         : num [1:190301] -87.6 -87.6 -87.7 -87.6 -87.6 ...
 $ end_lat           : num [1:190301] 41.9 41.8 42 41.8 41.8 ...
 $ end_lng           : num [1:190301] -87.6 -87.6 -87.7 -87.6 -87.6 ...
 $ member_casual     : chr [1:190301] "member" "member" "casual" "member" ...
 - attr(*, "spec")=
  .. cols(
  ..   ride_id = col_character(),
  ..   rideable_type = col_character(),
  ..   started_at = col_datetime(format = ""),
  ..   ended_at = col_datetime(format = ""),
  ..   start_station_name = col_character(),
  ..   start_station_id = col_character(),
  ..   end_station_name = col_character(),
  ..   end_station_id = col_character(),
  ..   start_lat = col_double(),
  ..   start_lng = col_double(),
  ..   end_lat = col_double(),
  ..   end_lng = col_double(),
  ..   member_casual = col_character()
  .. )
 - attr(*, "problems")=<externalptr> 
```

+ Feburary 2023
```r
str(feb2023)
```
```r
spc_tbl_ [190,445 × 13] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
 $ ride_id           : chr [1:190445] "CBCD0D7777F0E45F" "F3EC5FCE5FF39DE9" "E54C1F27FA9354FF" "3D561E04F739CC45" ...
 $ rideable_type     : chr [1:190445] "classic_bike" "electric_bike" "classic_bike" "electric_bike" ...
 $ started_at        : POSIXct[1:190445], format: "2023-02-14 11:59:42" "2023-02-15 13:53:48" "2023-02-19 11:10:57" "2023-02-26 16:12:05" ...
 $ ended_at          : POSIXct[1:190445], format: "2023-02-14 12:13:38" "2023-02-15 13:59:08" "2023-02-19 11:35:01" "2023-02-26 16:39:55" ...
 $ start_station_name: chr [1:190445] "Southport Ave & Clybourn Ave" "Clarendon Ave & Gordon Ter" "Southport Ave & Clybourn Ave" "Southport Ave & Clybourn Ave" ...
 $ start_station_id  : chr [1:190445] "TA1309000030" "13379" "TA1309000030" "TA1309000030" ...
 $ end_station_name  : chr [1:190445] "Clark St & Schiller St" "Sheridan Rd & Lawrence Ave" "Aberdeen St & Monroe St" "Franklin St & Adams St (Temp)" ...
 $ end_station_id    : chr [1:190445] "TA1309000024" "TA1309000041" "13156" "TA1309000008" ...
 $ start_lat         : num [1:190445] 41.9 42 41.9 41.9 41.8 ...
 $ start_lng         : num [1:190445] -87.7 -87.6 -87.7 -87.7 -87.6 ...
 $ end_lat           : num [1:190445] 41.9 42 41.9 41.9 41.8 ...
 $ end_lng           : num [1:190445] -87.6 -87.7 -87.7 -87.6 -87.6 ...
 $ member_casual     : chr [1:190445] "casual" "casual" "member" "member" ...
 - attr(*, "spec")=
  .. cols(
  ..   ride_id = col_character(),
  ..   rideable_type = col_character(),
  ..   started_at = col_datetime(format = ""),
  ..   ended_at = col_datetime(format = ""),
  ..   start_station_name = col_character(),
  ..   start_station_id = col_character(),
  ..   end_station_name = col_character(),
  ..   end_station_id = col_character(),
  ..   start_lat = col_double(),
  ..   start_lng = col_double(),
  ..   end_lat = col_double(),
  ..   end_lng = col_double(),
  ..   member_casual = col_character()
  .. )
 - attr(*, "problems")=<externalptr> 
```

+ March 2023
```r
str(mar2023)
```
```r
spc_tbl_ [258,678 × 13] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
 $ ride_id           : chr [1:258678] "6842AA605EE9FBB3" "F984267A75B99A8C" "FF7CF57CFE026D02" "6B61B916032CB6D6" ...
 $ rideable_type     : chr [1:258678] "electric_bike" "electric_bike" "classic_bike" "classic_bike" ...
 $ started_at        : POSIXct[1:258678], format: "2023-03-16 08:20:34" "2023-03-04 14:07:06" "2023-03-31 12:28:09" "2023-03-22 14:09:08" ...
 $ ended_at          : POSIXct[1:258678], format: "2023-03-16 08:22:52" "2023-03-04 14:15:31" "2023-03-31 12:38:47" "2023-03-22 14:24:51" ...
 $ start_station_name: chr [1:258678] "Clark St & Armitage Ave" "Public Rack - Kedzie Ave & Argyle St" "Orleans St & Chestnut St (NEXT Apts)" "Desplaines St & Kinzie St" ...
 $ start_station_id  : chr [1:258678] "13146" "491" "620" "TA1306000003" ...
 $ end_station_name  : chr [1:258678] "Larrabee St & Webster Ave" NA "Clark St & Randolph St" "Sheffield Ave & Kingsbury St" ...
 $ end_station_id    : chr [1:258678] "13193" NA "TA1305000030" "13154" ...
 $ start_lat         : num [1:258678] 41.9 42 41.9 41.9 41.9 ...
 $ start_lng         : num [1:258678] -87.6 -87.7 -87.6 -87.6 -87.7 ...
 $ end_lat           : num [1:258678] 41.9 42 41.9 41.9 41.9 ...
 $ end_lng           : num [1:258678] -87.6 -87.7 -87.6 -87.7 -87.7 ...
 $ member_casual     : chr [1:258678] "member" "member" "member" "member" ...
 - attr(*, "spec")=
  .. cols(
  ..   ride_id = col_character(),
  ..   rideable_type = col_character(),
  ..   started_at = col_datetime(format = ""),
  ..   ended_at = col_datetime(format = ""),
  ..   start_station_name = col_character(),
  ..   start_station_id = col_character(),
  ..   end_station_name = col_character(),
  ..   end_station_id = col_character(),
  ..   start_lat = col_double(),
  ..   start_lng = col_double(),
  ..   end_lat = col_double(),
  ..   end_lng = col_double(),
  ..   member_casual = col_character()
  .. )
 - attr(*, "problems")=<externalptr> 
```

+ April 2023
```r
str(apr2023)
```
```r
spc_tbl_ [426,590 × 13] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
 $ ride_id           : chr [1:426590] "8FE8F7D9C10E88C7" "34E4ED3ADF1D821B" "5296BF07A2F77CB5" "40759916B76D5D52" ...
 $ rideable_type     : chr [1:426590] "electric_bike" "electric_bike" "electric_bike" "electric_bike" ...
 $ started_at        : POSIXct[1:426590], format: "2023-04-02 08:37:28" "2023-04-19 11:29:02" "2023-04-19 08:41:22" "2023-04-19 13:31:30" ...
 $ ended_at          : POSIXct[1:426590], format: "2023-04-02 08:41:37" "2023-04-19 11:52:12" "2023-04-19 08:43:22" "2023-04-19 13:35:09" ...
 $ start_station_name: chr [1:426590] NA NA NA NA ...
 $ start_station_id  : chr [1:426590] NA NA NA NA ...
 $ end_station_name  : chr [1:426590] NA NA NA NA ...
 $ end_station_id    : chr [1:426590] NA NA NA NA ...
 $ start_lat         : num [1:426590] 41.8 41.9 41.9 41.9 41.9 ...
 $ start_lng         : num [1:426590] -87.6 -87.7 -87.7 -87.7 -87.7 ...
 $ end_lat           : num [1:426590] 41.8 41.9 41.9 41.9 41.9 ...
 $ end_lng           : num [1:426590] -87.6 -87.7 -87.7 -87.7 -87.6 ...
 $ member_casual     : chr [1:426590] "member" "member" "member" "member" ...
 - attr(*, "spec")=
  .. cols(
  ..   ride_id = col_character(),
  ..   rideable_type = col_character(),
  ..   started_at = col_datetime(format = ""),
  ..   ended_at = col_datetime(format = ""),
  ..   start_station_name = col_character(),
  ..   start_station_id = col_character(),
  ..   end_station_name = col_character(),
  ..   end_station_id = col_character(),
  ..   start_lat = col_double(),
  ..   start_lng = col_double(),
  ..   end_lat = col_double(),
  ..   end_lng = col_double(),
  ..   member_casual = col_character()
  .. )
 - attr(*, "problems")=<externalptr> 
```

+ May 2023
```r
str(may2023)
```
```r
spc_tbl_ [604,827 × 13] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
 $ ride_id           : chr [1:604827] "0D9FA920C3062031" "92485E5FB5888ACD" "FB144B3FC8300187" "DDEB93BC2CE9AA77" ...
 $ rideable_type     : chr [1:604827] "electric_bike" "electric_bike" "electric_bike" "classic_bike" ...
 $ started_at        : POSIXct[1:604827], format: "2023-05-07 19:53:48" "2023-05-06 18:54:08" "2023-05-21 00:40:21" "2023-05-10 16:47:01" ...
 $ ended_at          : POSIXct[1:604827], format: "2023-05-07 19:58:32" "2023-05-06 19:03:35" "2023-05-21 00:44:36" "2023-05-10 16:59:52" ...
 $ start_station_name: chr [1:604827] "Southport Ave & Belmont Ave" "Southport Ave & Belmont Ave" "Halsted St & 21st St" "Carpenter St & Huron St" ...
 $ start_station_id  : chr [1:604827] "13229" "13229" "13162" "13196" ...
 $ end_station_name  : chr [1:604827] NA NA NA "Damen Ave & Cortland St" ...
 $ end_station_id    : chr [1:604827] NA NA NA "13133" ...
 $ start_lat         : num [1:604827] 41.9 41.9 41.9 41.9 42 ...
 $ start_lng         : num [1:604827] -87.7 -87.7 -87.6 -87.7 -87.7 ...
 $ end_lat           : num [1:604827] 41.9 41.9 41.9 41.9 41.9 ...
 $ end_lng           : num [1:604827] -87.7 -87.7 -87.7 -87.7 -87.7 ...
 $ member_casual     : chr [1:604827] "member" "member" "member" "member" ...
 - attr(*, "spec")=
  .. cols(
  ..   ride_id = col_character(),
  ..   rideable_type = col_character(),
  ..   started_at = col_datetime(format = ""),
  ..   ended_at = col_datetime(format = ""),
  ..   start_station_name = col_character(),
  ..   start_station_id = col_character(),
  ..   end_station_name = col_character(),
  ..   end_station_id = col_character(),
  ..   start_lat = col_double(),
  ..   start_lng = col_double(),
  ..   end_lat = col_double(),
  ..   end_lng = col_double(),
  ..   member_casual = col_character()
  .. )
 - attr(*, "problems")=<externalptr> 
```

+ June 2023
```r
str(jun2023)
```
```r
spc_tbl_ [719,618 × 13] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
 $ ride_id           : chr [1:719618] "6F1682AC40EB6F71" "622A1686D64948EB" "3C88859D926253B4" "EAD8A5E0259DEC88" ...
 $ rideable_type     : chr [1:719618] "electric_bike" "electric_bike" "electric_bike" "electric_bike" ...
 $ started_at        : POSIXct[1:719618], format: "2023-06-05 13:34:12" "2023-06-05 01:30:22" "2023-06-20 18:15:49" "2023-06-19 14:56:00" ...
 $ ended_at          : POSIXct[1:719618], format: "2023-06-05 14:31:56" "2023-06-05 01:33:06" "2023-06-20 18:32:05" "2023-06-19 15:00:35" ...
 $ start_station_name: chr [1:719618] NA NA NA NA ...
 $ start_station_id  : chr [1:719618] NA NA NA NA ...
 $ end_station_name  : chr [1:719618] NA NA NA NA ...
 $ end_station_id    : chr [1:719618] NA NA NA NA ...
 $ start_lat         : num [1:719618] 41.9 41.9 42 42 42 ...
 $ start_lng         : num [1:719618] -87.7 -87.7 -87.7 -87.7 -87.7 ...
 $ end_lat           : num [1:719618] 41.9 41.9 41.9 42 42 ...
 $ end_lng           : num [1:719618] -87.7 -87.7 -87.6 -87.7 -87.7 ...
 $ member_casual     : chr [1:719618] "member" "member" "member" "member" ...
 - attr(*, "spec")=
  .. cols(
  ..   ride_id = col_character(),
  ..   rideable_type = col_character(),
  ..   started_at = col_datetime(format = ""),
  ..   ended_at = col_datetime(format = ""),
  ..   start_station_name = col_character(),
  ..   start_station_id = col_character(),
  ..   end_station_name = col_character(),
  ..   end_station_id = col_character(),
  ..   start_lat = col_double(),
  ..   start_lng = col_double(),
  ..   end_lat = col_double(),
  ..   end_lng = col_double(),
  ..   member_casual = col_character()
  .. )
 - attr(*, "problems")=<externalptr> 
```

+ July 2023
```r
str(jul2023)
```
```r
spc_tbl_ [767,650 × 13] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
 $ ride_id           : chr [1:767650] "9340B064F0AEE130" "D1460EE3CE0D8AF8" "DF41BE31B895A25E" "9624A293749EF703" ...
 $ rideable_type     : chr [1:767650] "electric_bike" "classic_bike" "classic_bike" "electric_bike" ...
 $ started_at        : POSIXct[1:767650], format: "2023-07-23 20:06:14" "2023-07-23 17:05:07" "2023-07-23 10:14:53" "2023-07-21 08:27:44" ...
 $ ended_at          : POSIXct[1:767650], format: "2023-07-23 20:22:44" "2023-07-23 17:18:37" "2023-07-23 10:24:29" "2023-07-21 08:32:40" ...
 $ start_station_name: chr [1:767650] "Kedzie Ave & 110th St" "Western Ave & Walton St" "Western Ave & Walton St" "Racine Ave & Randolph St" ...
 $ start_station_id  : chr [1:767650] "20204" "KA1504000103" "KA1504000103" "13155" ...
 $ end_station_name  : chr [1:767650] "Public Rack - Racine Ave & 109th Pl" "Milwaukee Ave & Grand Ave" "Damen Ave & Pierce Ave" "Clinton St & Madison St" ...
 $ end_station_id    : chr [1:767650] "877" "13033" "TA1305000041" "TA1305000032" ...
 $ start_lat         : num [1:767650] 41.7 41.9 41.9 41.9 42 ...
 $ start_lng         : num [1:767650] -87.7 -87.7 -87.7 -87.7 -87.7 ...
 $ end_lat           : num [1:767650] 41.7 41.9 41.9 41.9 42 ...
 $ end_lng           : num [1:767650] -87.7 -87.6 -87.7 -87.6 -87.6 ...
 $ member_casual     : chr [1:767650] "member" "member" "member" "member" ...
 - attr(*, "spec")=
  .. cols(
  ..   ride_id = col_character(),
  ..   rideable_type = col_character(),
  ..   started_at = col_datetime(format = ""),
  ..   ended_at = col_datetime(format = ""),
  ..   start_station_name = col_character(),
  ..   start_station_id = col_character(),
  ..   end_station_name = col_character(),
  ..   end_station_id = col_character(),
  ..   start_lat = col_double(),
  ..   start_lng = col_double(),
  ..   end_lat = col_double(),
  ..   end_lng = col_double(),
  ..   member_casual = col_character()
  .. )
 - attr(*, "problems")=<externalptr> 
```

+ August 2023
```r
str(aug2023)
```
```r
spc_tbl_ [771,693 × 13] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
 $ ride_id           : chr [1:771693] "903C30C2D810A53B" "F2FB18A98E110A2B" "D0DEC7C94E4663DA" "E0DDDC5F84747ED9" ...
 $ rideable_type     : chr [1:771693] "electric_bike" "electric_bike" "electric_bike" "electric_bike" ...
 $ started_at        : POSIXct[1:771693], format: "2023-08-19 15:41:53" "2023-08-18 15:30:18" "2023-08-30 16:15:08" "2023-08-30 16:24:07" ...
 $ ended_at          : POSIXct[1:771693], format: "2023-08-19 15:53:36" "2023-08-18 15:45:25" "2023-08-30 16:27:37" "2023-08-30 16:33:34" ...
 $ start_station_name: chr [1:771693] "LaSalle St & Illinois St" "Clark St & Randolph St" "Clark St & Randolph St" "Wells St & Elm St" ...
 $ start_station_id  : chr [1:771693] "13430" "TA1305000030" "TA1305000030" "KA1504000135" ...
 $ end_station_name  : chr [1:771693] "Clark St & Elm St" NA NA NA ...
 $ end_station_id    : chr [1:771693] "TA1307000039" NA NA NA ...
 $ start_lat         : num [1:771693] 41.9 41.9 41.9 41.9 41.9 ...
 $ start_lng         : num [1:771693] -87.6 -87.6 -87.6 -87.6 -87.6 ...
 $ end_lat           : num [1:771693] 41.9 41.9 41.9 41.9 41.9 ...
 $ end_lng           : num [1:771693] -87.6 -87.6 -87.6 -87.6 -87.7 ...
 $ member_casual     : chr [1:771693] "member" "member" "member" "member" ...
 - attr(*, "spec")=
  .. cols(
  ..   ride_id = col_character(),
  ..   rideable_type = col_character(),
  ..   started_at = col_datetime(format = ""),
  ..   ended_at = col_datetime(format = ""),
  ..   start_station_name = col_character(),
  ..   start_station_id = col_character(),
  ..   end_station_name = col_character(),
  ..   end_station_id = col_character(),
  ..   start_lat = col_double(),
  ..   start_lng = col_double(),
  ..   end_lat = col_double(),
  ..   end_lng = col_double(),
  ..   member_casual = col_character()
  .. )
 - attr(*, "problems")=<externalptr> 
```

+ September 2023
```r
str(sep2023)
```
```r
spc_tbl_ [666,371 × 13] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
 $ ride_id           : chr [1:666371] "011C1903BF4E2E28" "87DB80E048A1BF9F" "7C2EB7AF669066E3" "57D197B010269CE3" ...
 $ rideable_type     : chr [1:666371] "classic_bike" "classic_bike" "electric_bike" "classic_bike" ...
 $ started_at        : POSIXct[1:666371], format: "2023-09-23 00:27:50" "2023-09-02 09:26:43" "2023-09-25 18:30:11" "2023-09-13 15:30:49" ...
 $ ended_at          : POSIXct[1:666371], format: "2023-09-23 00:33:27" "2023-09-02 09:38:19" "2023-09-25 18:41:39" "2023-09-13 15:39:18" ...
 $ start_station_name: chr [1:666371] "Halsted St & Wrightwood Ave" "Clark St & Drummond Pl" "Financial Pl & Ida B Wells Dr" "Clark St & Drummond Pl" ...
 $ start_station_id  : chr [1:666371] "TA1309000061" "TA1307000142" "SL-010" "TA1307000142" ...
 $ end_station_name  : chr [1:666371] "Sheffield Ave & Wellington Ave" "Racine Ave & Fullerton Ave" "Racine Ave & 15th St" "Racine Ave & Belmont Ave" ...
 $ end_station_id    : chr [1:666371] "TA1307000052" "TA1306000026" "13304" "TA1308000019" ...
 $ start_lat         : num [1:666371] 41.9 41.9 41.9 41.9 41.9 ...
 $ start_lng         : num [1:666371] -87.6 -87.6 -87.6 -87.6 -87.6 ...
 $ end_lat           : num [1:666371] 41.9 41.9 41.9 41.9 41.9 ...
 $ end_lng           : num [1:666371] -87.7 -87.7 -87.7 -87.7 -87.7 ...
 $ member_casual     : chr [1:666371] "member" "member" "member" "member" ...
 - attr(*, "spec")=
  .. cols(
  ..   ride_id = col_character(),
  ..   rideable_type = col_character(),
  ..   started_at = col_datetime(format = ""),
  ..   ended_at = col_datetime(format = ""),
  ..   start_station_name = col_character(),
  ..   start_station_id = col_character(),
  ..   end_station_name = col_character(),
  ..   end_station_id = col_character(),
  ..   start_lat = col_double(),
  ..   start_lng = col_double(),
  ..   end_lat = col_double(),
  ..   end_lng = col_double(),
  ..   member_casual = col_character()
  .. )
 - attr(*, "problems")=<externalptr> 
```

+ October 2023
```r
str(oct2023)
```
```r
spc_tbl_ [537,113 × 13] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
 $ ride_id           : chr [1:537113] "4449097279F8BBE7" "9CF060543CA7B439" "667F21F4D6BDE69C" "F92714CC6B019B96" ...
 $ rideable_type     : chr [1:537113] "classic_bike" "electric_bike" "electric_bike" "classic_bike" ...
 $ started_at        : POSIXct[1:537113], format: "2023-10-08 10:36:26" "2023-10-11 17:23:59" "2023-10-12 07:02:33" "2023-10-24 19:13:03" ...
 $ ended_at          : POSIXct[1:537113], format: "2023-10-08 10:49:19" "2023-10-11 17:36:08" "2023-10-12 07:06:53" "2023-10-24 19:18:29" ...
 $ start_station_name: chr [1:537113] "Orleans St & Chestnut St (NEXT Apts)" "Desplaines St & Kinzie St" "Orleans St & Chestnut St (NEXT Apts)" "Desplaines St & Kinzie St" ...
 $ start_station_id  : chr [1:537113] "620" "TA1306000003" "620" "TA1306000003" ...
 $ end_station_name  : chr [1:537113] "Sheffield Ave & Webster Ave" "Sheffield Ave & Webster Ave" "Franklin St & Lake St" "Franklin St & Lake St" ...
 $ end_station_id    : chr [1:537113] "TA1309000033" "TA1309000033" "TA1307000111" "TA1307000111" ...
 $ start_lat         : num [1:537113] 41.9 41.9 41.9 41.9 41.9 ...
 $ start_lng         : num [1:537113] -87.6 -87.6 -87.6 -87.6 -87.6 ...
 $ end_lat           : num [1:537113] 41.9 41.9 41.9 41.9 41.9 ...
 $ end_lng           : num [1:537113] -87.7 -87.7 -87.6 -87.6 -87.6 ...
 $ member_casual     : chr [1:537113] "member" "member" "member" "member" ...
 - attr(*, "spec")=
  .. cols(
  ..   ride_id = col_character(),
  ..   rideable_type = col_character(),
  ..   started_at = col_datetime(format = ""),
  ..   ended_at = col_datetime(format = ""),
  ..   start_station_name = col_character(),
  ..   start_station_id = col_character(),
  ..   end_station_name = col_character(),
  ..   end_station_id = col_character(),
  ..   start_lat = col_double(),
  ..   start_lng = col_double(),
  ..   end_lat = col_double(),
  ..   end_lng = col_double(),
  ..   member_casual = col_character()
  .. )
 - attr(*, "problems")=<externalptr> 
```

+ November 2023
```r
str(nov2023)
```
```r
spc_tbl_ [362,518 × 13] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
 $ ride_id           : chr [1:362518] "4EAD8F1AD547356B" "6322270563BF5470" "B37BDE091ECA38E0" "CF0CA5DD26E4F90E" ...
 $ rideable_type     : chr [1:362518] "electric_bike" "electric_bike" "electric_bike" "classic_bike" ...
 $ started_at        : POSIXct[1:362518], format: "2023-11-30 21:50:05" "2023-11-03 09:44:02" "2023-11-30 11:39:44" "2023-11-08 10:01:45" ...
 $ ended_at          : POSIXct[1:362518], format: "2023-11-30 22:13:27" "2023-11-03 10:17:15" "2023-11-30 11:40:08" "2023-11-08 10:27:05" ...
 $ start_station_name: chr [1:362518] "Millennium Park" "Broadway & Sheridan Rd" "State St & Pearson St" "Theater on the Lake" ...
 $ start_station_id  : chr [1:362518] "13008" "13323" "TA1307000061" "TA1308000001" ...
 $ end_station_name  : chr [1:362518] "Pine Grove Ave & Waveland Ave" "Broadway & Sheridan Rd" "State St & Pearson St" "Theater on the Lake" ...
 $ end_station_id    : chr [1:362518] "TA1307000150" "13323" "TA1307000061" "TA1308000001" ...
 $ start_lat         : num [1:362518] 41.9 42 41.9 41.9 41.9 ...
 $ start_lng         : num [1:362518] -87.6 -87.7 -87.6 -87.6 -87.6 ...
 $ end_lat           : num [1:362518] 41.9 42 41.9 41.9 41.9 ...
 $ end_lng           : num [1:362518] -87.6 -87.6 -87.6 -87.6 -87.6 ...
 $ member_casual     : chr [1:362518] "member" "member" "member" "member" ...
 - attr(*, "spec")=
  .. cols(
  ..   ride_id = col_character(),
  ..   rideable_type = col_character(),
  ..   started_at = col_datetime(format = ""),
  ..   ended_at = col_datetime(format = ""),
  ..   start_station_name = col_character(),
  ..   start_station_id = col_character(),
  ..   end_station_name = col_character(),
  ..   end_station_id = col_character(),
  ..   start_lat = col_double(),
  ..   start_lng = col_double(),
  ..   end_lat = col_double(),
  ..   end_lng = col_double(),
  ..   member_casual = col_character()
  .. )
 - attr(*, "problems")=<externalptr> 
```

+ December 2023
```r
str(dec2023)
```
```r
spc_tbl_ [224,073 × 13] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
 $ ride_id           : chr [1:224073] "C9BD54F578F57246" "CDBD92F067FA620E" "ABC0858E52CBFC84" "F44B6F0E8F76DC90" ...
 $ rideable_type     : chr [1:224073] "electric_bike" "electric_bike" "electric_bike" "electric_bike" ...
 $ started_at        : POSIXct[1:224073], format: "2023-12-02 18:44:01" "2023-12-02 18:48:19" "2023-12-24 01:56:32" "2023-12-24 10:58:12" ...
 $ ended_at          : POSIXct[1:224073], format: "2023-12-02 18:47:51" "2023-12-02 18:54:48" "2023-12-24 02:04:09" "2023-12-24 11:03:04" ...
 $ start_station_name: chr [1:224073] NA NA NA NA ...
 $ start_station_id  : chr [1:224073] NA NA NA NA ...
 $ end_station_name  : chr [1:224073] NA NA NA NA ...
 $ end_station_id    : chr [1:224073] NA NA NA NA ...
 $ start_lat         : num [1:224073] 41.9 41.9 41.9 42 41.9 ...
 $ start_lng         : num [1:224073] -87.7 -87.7 -87.6 -87.7 -87.6 ...
 $ end_lat           : num [1:224073] 41.9 41.9 41.9 41.9 41.9 ...
 $ end_lng           : num [1:224073] -87.7 -87.6 -87.6 -87.7 -87.6 ...
 $ member_casual     : chr [1:224073] "member" "member" "member" "member" ...
 - attr(*, "spec")=
  .. cols(
  ..   ride_id = col_character(),
  ..   rideable_type = col_character(),
  ..   started_at = col_datetime(format = ""),
  ..   ended_at = col_datetime(format = ""),
  ..   start_station_name = col_character(),
  ..   start_station_id = col_character(),
  ..   end_station_name = col_character(),
  ..   end_station_id = col_character(),
  ..   start_lat = col_double(),
  ..   start_lng = col_double(),
  ..   end_lat = col_double(),
  ..   end_lng = col_double(),
  ..   member_casual = col_character()
  .. )
 - attr(*, "problems")=<externalptr> 
```

#### Displaying _Summary_ Statistics for Each Month’s Dataset
+ January 2023
```r
summary(jan2023)
```
```r
   ride_id          rideable_type        started_at                        ended_at                     start_station_name start_station_id  
 Length:190301      Length:190301      Min.   :2023-01-01 00:01:58.00   Min.   :2023-01-01 00:02:41.0   Length:190301      Length:190301     
 Class :character   Class :character   1st Qu.:2023-01-09 07:34:39.00   1st Qu.:2023-01-09 07:45:42.0   Class :character   Class :character  
 Mode  :character   Mode  :character   Median :2023-01-14 16:26:15.00   Median :2023-01-14 16:44:41.0   Mode  :character   Mode  :character  
                                       Mean   :2023-01-15 09:12:02.25   Mean   :2023-01-15 09:25:02.2                                        
                                       3rd Qu.:2023-01-21 14:24:46.00   3rd Qu.:2023-01-21 14:37:42.0                                        
                                       Max.   :2023-01-31 23:56:09.00   Max.   :2023-02-04 04:27:03.0                                        
                                                                                                                                             
 end_station_name   end_station_id       start_lat       start_lng         end_lat         end_lng       member_casual     
 Length:190301      Length:190301      Min.   :41.65   Min.   :-87.83   Min.   :41.65   Min.   :-87.84   Length:190301     
 Class :character   Class :character   1st Qu.:41.88   1st Qu.:-87.66   1st Qu.:41.88   1st Qu.:-87.66   Class :character  
 Mode  :character   Mode  :character   Median :41.89   Median :-87.64   Median :41.89   Median :-87.64   Mode  :character  
                                       Mean   :41.90   Mean   :-87.65   Mean   :41.90   Mean   :-87.65                     
                                       3rd Qu.:41.93   3rd Qu.:-87.63   3rd Qu.:41.93   3rd Qu.:-87.63                     
                                       Max.   :42.07   Max.   :-87.53   Max.   :42.08   Max.   :-87.53                     
                                                                        NA's   :127     NA's   :127                        
```

+ February 2023
```r
summary(feb2023)
```
```r
   ride_id          rideable_type        started_at                        ended_at                      start_station_name start_station_id  
 Length:190445      Length:190445      Min.   :2023-02-01 00:01:34.00   Min.   :2023-02-01 00:08:42.00   Length:190445      Length:190445     
 Class :character   Class :character   1st Qu.:2023-02-08 18:25:33.00   1st Qu.:2023-02-08 18:36:24.00   Class :character   Class :character  
 Mode  :character   Mode  :character   Median :2023-02-14 21:36:30.00   Median :2023-02-14 21:51:19.00   Mode  :character   Mode  :character  
                                       Mean   :2023-02-15 14:49:57.50   Mean   :2023-02-15 15:03:29.47                                        
                                       3rd Qu.:2023-02-21 21:19:11.00   3rd Qu.:2023-02-21 21:34:27.00                                        
                                       Max.   :2023-02-28 23:59:31.00   Max.   :2023-03-06 15:09:53.00                                        
                                                                                                                                              
 end_station_name   end_station_id       start_lat       start_lng         end_lat         end_lng       member_casual     
 Length:190445      Length:190445      Min.   :41.65   Min.   :-87.84   Min.   :41.65   Min.   :-87.90   Length:190445     
 Class :character   Class :character   1st Qu.:41.88   1st Qu.:-87.66   1st Qu.:41.88   1st Qu.:-87.66   Class :character  
 Mode  :character   Mode  :character   Median :41.89   Median :-87.64   Median :41.89   Median :-87.64   Mode  :character  
                                       Mean   :41.90   Mean   :-87.65   Mean   :41.90   Mean   :-87.65                     
                                       3rd Qu.:41.93   3rd Qu.:-87.63   3rd Qu.:41.93   3rd Qu.:-87.63                     
                                       Max.   :42.07   Max.   :-87.53   Max.   :42.07   Max.   :-87.53                     
                                                                        NA's   :116     NA's   :116                        
```

+ March 2023
```r
summary(mar2023)
```
```r
   ride_id          rideable_type        started_at                        ended_at                      start_station_name start_station_id  
 Length:258678      Length:258678      Min.   :2023-03-01 00:00:50.00   Min.   :2023-03-01 00:04:17.00   Length:258678      Length:258678     
 Class :character   Class :character   1st Qu.:2023-03-08 11:42:43.25   1st Qu.:2023-03-08 11:55:00.00   Class :character   Class :character  
 Mode  :character   Mode  :character   Median :2023-03-16 19:54:29.50   Median :2023-03-16 20:07:52.00   Mode  :character   Mode  :character  
                                       Mean   :2023-03-16 22:25:38.67   Mean   :2023-03-16 22:38:43.47                                        
                                       3rd Qu.:2023-03-24 19:22:40.25   3rd Qu.:2023-03-24 19:35:15.25                                        
                                       Max.   :2023-03-31 23:59:28.00   Max.   :2023-04-03 11:41:11.00                                        
                                                                                                                                              
 end_station_name   end_station_id       start_lat       start_lng         end_lat         end_lng       member_casual     
 Length:258678      Length:258678      Min.   :41.65   Min.   :-87.83   Min.   :41.63   Min.   :-87.85   Length:258678     
 Class :character   Class :character   1st Qu.:41.88   1st Qu.:-87.66   1st Qu.:41.88   1st Qu.:-87.66   Class :character  
 Mode  :character   Mode  :character   Median :41.89   Median :-87.64   Median :41.89   Median :-87.64   Mode  :character  
                                       Mean   :41.90   Mean   :-87.65   Mean   :41.90   Mean   :-87.65                     
                                       3rd Qu.:41.93   3rd Qu.:-87.63   3rd Qu.:41.93   3rd Qu.:-87.63                     
                                       Max.   :42.07   Max.   :-87.53   Max.   :42.08   Max.   :-87.52                     
                                                                        NA's   :183     NA's   :183                        
```

+ April 2023
```r
summary(apr2023)
```
```r
   ride_id          rideable_type        started_at                        ended_at                      start_station_name start_station_id  
 Length:426590      Length:426590      Min.   :2023-04-01 00:00:02.00   Min.   :2023-04-01 00:03:10.00   Length:426590      Length:426590     
 Class :character   Class :character   1st Qu.:2023-04-10 13:22:13.00   1st Qu.:2023-04-10 13:39:34.50   Class :character   Class :character  
 Mode  :character   Mode  :character   Median :2023-04-15 09:52:13.00   Median :2023-04-15 10:11:11.00   Mode  :character   Mode  :character  
                                       Mean   :2023-04-16 05:15:35.58   Mean   :2023-04-16 05:32:48.23                                        
                                       3rd Qu.:2023-04-22 10:20:15.50   3rd Qu.:2023-04-22 10:35:57.50                                        
                                       Max.   :2023-04-30 23:59:05.00   Max.   :2023-05-03 10:37:12.00                                        
                                                                                                                                              
 end_station_name   end_station_id       start_lat       start_lng         end_lat         end_lng       member_casual     
 Length:426590      Length:426590      Min.   :41.65   Min.   :-87.83   Min.   :41.65   Min.   :-88.11   Length:426590     
 Class :character   Class :character   1st Qu.:41.88   1st Qu.:-87.66   1st Qu.:41.88   1st Qu.:-87.66   Class :character  
 Mode  :character   Mode  :character   Median :41.90   Median :-87.64   Median :41.90   Median :-87.64   Mode  :character  
                                       Mean   :41.90   Mean   :-87.65   Mean   :41.90   Mean   :-87.65                     
                                       3rd Qu.:41.93   3rd Qu.:-87.63   3rd Qu.:41.93   3rd Qu.:-87.63                     
                                       Max.   :42.07   Max.   :-87.52   Max.   :42.08   Max.   :-87.53                     
                                                                        NA's   :435     NA's   :435                       
```

+ May 2023
```r
summary(may2023)
```
```r
   ride_id          rideable_type        started_at                        ended_at                      start_station_name start_station_id  
 Length:604827      Length:604827      Min.   :2023-05-01 00:00:33.00   Min.   :2023-05-01 00:04:28.00   Length:604827      Length:604827     
 Class :character   Class :character   1st Qu.:2023-05-09 21:45:28.50   1st Qu.:2023-05-09 21:59:55.00   Class :character   Class :character  
 Mode  :character   Mode  :character   Median :2023-05-18 15:55:07.00   Median :2023-05-18 16:12:23.00   Mode  :character   Mode  :character  
                                       Mean   :2023-05-17 18:36:34.06   Mean   :2023-05-17 18:55:36.07                                        
                                       3rd Qu.:2023-05-25 12:39:23.00   3rd Qu.:2023-05-25 12:53:21.00                                        
                                       Max.   :2023-05-31 23:59:58.00   Max.   :2023-06-07 23:04:26.00                                        
                                                                                                                                              
 end_station_name   end_station_id       start_lat       start_lng         end_lat         end_lng       member_casual     
 Length:604827      Length:604827      Min.   :41.65   Min.   :-87.87   Min.   :41.62   Min.   :-87.91   Length:604827     
 Class :character   Class :character   1st Qu.:41.88   1st Qu.:-87.66   1st Qu.:41.88   1st Qu.:-87.66   Class :character  
 Mode  :character   Mode  :character   Median :41.90   Median :-87.64   Median :41.90   Median :-87.64   Mode  :character  
                                       Mean   :41.90   Mean   :-87.65   Mean   :41.90   Mean   :-87.65                     
                                       3rd Qu.:41.93   3rd Qu.:-87.63   3rd Qu.:41.93   3rd Qu.:-87.63                     
                                       Max.   :42.07   Max.   :-87.53   Max.   :42.11   Max.   :-87.53                     
                                                                        NA's   :710     NA's   :710                        
```

+ June 2023
```r
summary(jun2023)
```
```r
   ride_id          rideable_type        started_at                        ended_at                      start_station_name start_station_id  
 Length:719618      Length:719618      Min.   :2023-06-01 00:00:44.00   Min.   :2023-06-01 00:02:56.00   Length:719618      Length:719618     
 Class :character   Class :character   1st Qu.:2023-06-07 23:00:11.00   1st Qu.:2023-06-07 23:26:36.25   Class :character   Class :character  
 Mode  :character   Mode  :character   Median :2023-06-16 13:17:35.00   Median :2023-06-16 13:35:12.00   Mode  :character   Mode  :character  
                                       Mean   :2023-06-15 20:34:24.73   Mean   :2023-06-15 20:54:23.76                                        
                                       3rd Qu.:2023-06-23 13:31:18.25   3rd Qu.:2023-06-23 13:52:07.50                                        
                                       Max.   :2023-06-30 23:59:56.00   Max.   :2023-07-10 20:26:44.00                                        
                                                                                                                                              
 end_station_name   end_station_id       start_lat       start_lng         end_lat         end_lng       member_casual     
 Length:719618      Length:719618      Min.   :41.64   Min.   :-87.87   Min.   : 0.00   Min.   :-88.16   Length:719618     
 Class :character   Class :character   1st Qu.:41.88   1st Qu.:-87.66   1st Qu.:41.88   1st Qu.:-87.66   Class :character  
 Mode  :character   Mode  :character   Median :41.90   Median :-87.64   Median :41.90   Median :-87.64   Mode  :character  
                                       Mean   :41.91   Mean   :-87.65   Mean   :41.91   Mean   :-87.65                     
                                       3rd Qu.:41.93   3rd Qu.:-87.63   3rd Qu.:41.93   3rd Qu.:-87.63                     
                                       Max.   :42.07   Max.   :-87.53   Max.   :42.11   Max.   :  0.00                     
                                                                        NA's   :889     NA's   :889                     
```

+ July 2023
```r
summary(jul2023)
```
```r
   ride_id          rideable_type        started_at                        ended_at                      start_station_name start_station_id  
 Length:767650      Length:767650      Min.   :2023-07-01 00:00:00.00   Min.   :2023-07-01 00:01:26.00   Length:767650      Length:767650     
 Class :character   Class :character   1st Qu.:2023-07-09 14:55:06.75   1st Qu.:2023-07-09 15:19:39.00   Class :character   Class :character  
 Mode  :character   Mode  :character   Median :2023-07-17 15:06:52.00   Median :2023-07-17 15:27:50.00   Mode  :character   Mode  :character  
                                       Mean   :2023-07-17 05:56:09.47   Mean   :2023-07-17 06:17:53.75                                        
                                       3rd Qu.:2023-07-24 16:15:23.50   3rd Qu.:2023-07-24 16:32:51.75                                        
                                       Max.   :2023-07-31 23:59:56.00   Max.   :2023-08-12 04:53:41.00                                        
                                                                                                                                              
 end_station_name   end_station_id       start_lat       start_lng         end_lat         end_lng       member_casual     
 Length:767650      Length:767650      Min.   :41.65   Min.   :-87.92   Min.   :41.61   Min.   :-87.92   Length:767650     
 Class :character   Class :character   1st Qu.:41.88   1st Qu.:-87.66   1st Qu.:41.88   1st Qu.:-87.66   Class :character  
 Mode  :character   Mode  :character   Median :41.90   Median :-87.64   Median :41.90   Median :-87.64   Mode  :character  
                                       Mean   :41.91   Mean   :-87.65   Mean   :41.91   Mean   :-87.65                     
                                       3rd Qu.:41.93   3rd Qu.:-87.63   3rd Qu.:41.93   3rd Qu.:-87.63                     
                                       Max.   :42.07   Max.   :-87.53   Max.   :42.18   Max.   :-87.51                     
                                                                        NA's   :1254    NA's   :1254                       
```

+ August 2023
```r
summary(aug2023)
```
```r
   ride_id          rideable_type        started_at                        ended_at                      start_station_name start_station_id  
 Length:771693      Length:771693      Min.   :2023-08-01 00:00:06.00   Min.   :2023-08-01 00:01:03.00   Length:771693      Length:771693     
 Class :character   Class :character   1st Qu.:2023-08-08 17:16:56.00   1st Qu.:2023-08-08 17:33:35.00   Class :character   Class :character  
 Mode  :character   Mode  :character   Median :2023-08-16 17:08:21.00   Median :2023-08-16 17:24:27.00   Mode  :character   Mode  :character  
                                       Mean   :2023-08-16 10:27:03.76   Mean   :2023-08-16 10:49:29.48                                        
                                       3rd Qu.:2023-08-24 07:55:40.00   3rd Qu.:2023-08-24 08:10:24.00                                        
                                       Max.   :2023-08-31 23:59:44.00   Max.   :2023-10-10 04:56:16.00                                        
                                                                                                                                              
 end_station_name   end_station_id       start_lat       start_lng         end_lat         end_lng       member_casual     
 Length:771693      Length:771693      Min.   :41.63   Min.   :-87.86   Min.   : 0.00   Min.   :-87.98   Length:771693     
 Class :character   Class :character   1st Qu.:41.88   1st Qu.:-87.66   1st Qu.:41.88   1st Qu.:-87.66   Class :character  
 Mode  :character   Mode  :character   Median :41.90   Median :-87.64   Median :41.90   Median :-87.64   Mode  :character  
                                       Mean   :41.91   Mean   :-87.65   Mean   :41.91   Mean   :-87.65                     
                                       3rd Qu.:41.93   3rd Qu.:-87.63   3rd Qu.:41.93   3rd Qu.:-87.63                     
                                       Max.   :42.07   Max.   :-87.46   Max.   :42.10   Max.   :  0.00                     
                                                                        NA's   :1257    NA's   :1257                       
```

+ September 2023
```r
summary(sep2023)
```
```r
   ride_id          rideable_type        started_at                        ended_at                      start_station_name start_station_id  
 Length:666371      Length:666371      Min.   :2023-09-01 00:00:44.00   Min.   :2023-09-01 00:03:06.00   Length:666371      Length:666371     
 Class :character   Class :character   1st Qu.:2023-09-08 07:26:38.00   1st Qu.:2023-09-08 07:39:33.50   Class :character   Class :character  
 Mode  :character   Mode  :character   Median :2023-09-15 19:28:05.00   Median :2023-09-15 19:45:44.00   Mode  :character   Mode  :character  
                                       Mean   :2023-09-16 00:11:48.34   Mean   :2023-09-16 00:29:40.64                                        
                                       3rd Qu.:2023-09-23 15:03:51.00   3rd Qu.:2023-09-23 15:26:19.00                                        
                                       Max.   :2023-09-30 23:59:57.00   Max.   :2023-10-02 00:59:24.00                                        
                                                                                                                                              
 end_station_name   end_station_id       start_lat       start_lng         end_lat         end_lng       member_casual     
 Length:666371      Length:666371      Min.   :41.65   Min.   :-87.94   Min.   :41.62   Min.   :-87.94   Length:666371     
 Class :character   Class :character   1st Qu.:41.88   1st Qu.:-87.66   1st Qu.:41.88   1st Qu.:-87.66   Class :character  
 Mode  :character   Mode  :character   Median :41.90   Median :-87.64   Median :41.90   Median :-87.65   Mode  :character  
                                       Mean   :41.90   Mean   :-87.65   Mean   :41.90   Mean   :-87.65                     
                                       3rd Qu.:41.93   3rd Qu.:-87.63   3rd Qu.:41.93   3rd Qu.:-87.63                     
                                       Max.   :42.07   Max.   :-87.53   Max.   :42.12   Max.   :-87.49                     
                                                                        NA's   :838     NA's   :838                        
```

+ October 2023
```r
summary(oct2023)
```
```r
   ride_id          rideable_type        started_at                        ended_at                      start_station_name start_station_id  
 Length:537113      Length:537113      Min.   :2023-10-01 00:00:05.00   Min.   :2023-10-01 00:02:02.00   Length:537113      Length:537113     
 Class :character   Class :character   1st Qu.:2023-10-06 19:18:31.00   1st Qu.:2023-10-06 19:31:45.00   Class :character   Class :character  
 Mode  :character   Mode  :character   Median :2023-10-14 19:56:05.00   Median :2023-10-14 20:09:10.00   Mode  :character   Mode  :character  
                                       Mean   :2023-10-15 01:22:49.41   Mean   :2023-10-15 01:38:30.47                                        
                                       3rd Qu.:2023-10-22 17:37:28.00   3rd Qu.:2023-10-22 17:55:49.00                                        
                                       Max.   :2023-10-31 23:59:57.00   Max.   :2023-11-01 21:23:59.00                                        
                                                                                                                                              
 end_station_name   end_station_id       start_lat       start_lng         end_lat         end_lng       member_casual     
 Length:537113      Length:537113      Min.   :41.64   Min.   :-87.86   Min.   :41.64   Min.   :-87.99   Length:537113     
 Class :character   Class :character   1st Qu.:41.88   1st Qu.:-87.66   1st Qu.:41.88   1st Qu.:-87.66   Class :character  
 Mode  :character   Mode  :character   Median :41.90   Median :-87.64   Median :41.90   Median :-87.64   Mode  :character  
                                       Mean   :41.90   Mean   :-87.65   Mean   :41.90   Mean   :-87.65                     
                                       3rd Qu.:41.93   3rd Qu.:-87.63   3rd Qu.:41.93   3rd Qu.:-87.63                     
                                       Max.   :42.07   Max.   :-87.52   Max.   :42.07   Max.   :-87.52                     
                                                                        NA's   :592     NA's   :592                        
```

+ November 2023
```r
summary(nov2023)
```
```r
   ride_id          rideable_type        started_at                        ended_at                      start_station_name start_station_id  
 Length:362518      Length:362518      Min.   :2023-11-01 00:01:46.00   Min.   :2023-10-25 07:31:46.00   Length:362518      Length:362518     
 Class :character   Class :character   1st Qu.:2023-11-07 08:30:44.50   1st Qu.:2023-11-07 08:41:43.25   Class :character   Class :character  
 Mode  :character   Mode  :character   Median :2023-11-13 14:10:11.00   Median :2023-11-13 14:27:09.50   Mode  :character   Mode  :character  
                                       Mean   :2023-11-14 01:44:47.81   Mean   :2023-11-14 01:58:22.95                                        
                                       3rd Qu.:2023-11-19 10:35:17.25   3rd Qu.:2023-11-19 10:52:09.75                                        
                                       Max.   :2023-11-30 23:59:14.00   Max.   :2023-12-01 20:42:31.00                                        
                                                                                                                                              
 end_station_name   end_station_id       start_lat       start_lng         end_lat         end_lng       member_casual     
 Length:362518      Length:362518      Min.   :41.65   Min.   :-87.94   Min.   :41.65   Min.   :-87.94   Length:362518     
 Class :character   Class :character   1st Qu.:41.88   1st Qu.:-87.66   1st Qu.:41.88   1st Qu.:-87.66   Class :character  
 Mode  :character   Mode  :character   Median :41.89   Median :-87.64   Median :41.89   Median :-87.64   Mode  :character  
                                       Mean   :41.90   Mean   :-87.65   Mean   :41.90   Mean   :-87.65                     
                                       3rd Qu.:41.93   3rd Qu.:-87.63   3rd Qu.:41.93   3rd Qu.:-87.63                     
                                       Max.   :42.07   Max.   :-87.53   Max.   :42.07   Max.   :-87.53                     
                                                                        NA's   :350     NA's   :350                        
```

+ December 2023
```r
summary(dec2023)
```
```r
   ride_id          rideable_type        started_at                        ended_at                      start_station_name start_station_id  
 Length:224073      Length:224073      Min.   :2023-12-01 00:00:03.00   Min.   :2023-12-01 00:04:12.00   Length:224073      Length:224073     
 Class :character   Class :character   1st Qu.:2023-12-07 16:18:35.00   1st Qu.:2023-12-07 16:30:49.00   Class :character   Class :character  
 Mode  :character   Mode  :character   Median :2023-12-13 12:05:44.00   Median :2023-12-13 12:16:31.00   Mode  :character   Mode  :character  
                                       Mean   :2023-12-14 08:30:56.74   Mean   :2023-12-14 08:44:20.97                                        
                                       3rd Qu.:2023-12-20 14:14:23.00   3rd Qu.:2023-12-20 14:28:48.00                                        
                                       Max.   :2023-12-31 23:59:38.00   Max.   :2024-01-01 23:50:51.00                                        
                                                                                                                                              
 end_station_name   end_station_id       start_lat       start_lng         end_lat         end_lng       member_casual     
 Length:224073      Length:224073      Min.   :41.65   Min.   :-87.85   Min.   :41.65   Min.   :-87.96   Length:224073     
 Class :character   Class :character   1st Qu.:41.88   1st Qu.:-87.66   1st Qu.:41.88   1st Qu.:-87.66   Class :character  
 Mode  :character   Mode  :character   Median :41.90   Median :-87.64   Median :41.90   Median :-87.64   Mode  :character  
                                       Mean   :41.90   Mean   :-87.65   Mean   :41.90   Mean   :-87.65                     
                                       3rd Qu.:41.93   3rd Qu.:-87.63   3rd Qu.:41.93   3rd Qu.:-87.63                     
                                       Max.   :42.07   Max.   :-87.53   Max.   :42.07   Max.   :-87.53                     
                                                                        NA's   :239     NA's   :239                        
```

### Summary of Initial Review
+ Each file consists of 13 columns.
+ Total number of rows across all files is 5,719,877.
+ Missing data primarily occurs in columns:
    - `start_station_name`
    - `start_station_id`
    - `end_station_name`
    - `end_station_id`
    - `end_lat`
    - `end_lng`
+ After consolidation and further exploration, a decision will be made regarding whether to keep or drop missing data, possibly considering options to fill in missing values.

### Data Consolidation
+ Combining data from 12 individual data frames into a single unified data frame, following the initial review.
+ Removing the 12 individual data frames after consolidation to streamline data management.

#### Combining All Monthly Data Frames
```r
trip_data <- bind_rows(
  list(
    jan2023, 
    feb2023, 
    mar2023, 
    apr2023, 
    may2023, 
    jun2023, 
    jul2023, 
    aug2023, 
    sep2023, 
    oct2023, 
    nov2023, 
    dec2023
  )
)
```

#### Removing All Individual Monthly Data Frames from the Environment
```r
rm(
  list = c(
    "jan2023", 
    "feb2023", 
    "mar2023", 
    "apr2023", 
    "may2023", 
    "jun2023", 
    "jul2023", 
    "aug2023", 
    "sep2023", 
    "oct2023", 
    "nov2023", 
    "dec2023"
  )
)
```

### Consolidation Data Exploration
+ Reviewed newly combined data framed, `trip_data`.
+ Examined variable types and dimensions to understand the data structure thoroughly.
+ Reviewed column names and variable distributions for clarity and insight into the dataset.
+ Checked for missing values to assess data completeness and potential issues.
+ Evaluated data frame length and width to understand the scale and complexity of the data frame.
+ Inspected data structure to gain deeper insights into how the data is organized.
+ Reviewed the first and last rows to ensure data integrity and consistency.
+ Summarized variable statistics to identify trends, outliers, and patterns within the data.

#### Checking Data Type
+ Identifying data type using `class()`.
```r
class(trip_data)
```
```r
[1] "spec_tbl_df" "tbl_df"      "tbl"         "data.frame" 
```

#### Checking Data Dimensions
+ Counting the number of rows and columns using `dim()`.
```r
dim(trip_data)
```
```r
[1] 5719877      13
```

#### Displaying Variable Names
+ Obtaining the column names using `colnames()` and `names()`.
```r
colnames(trip_data)
```
```r
 [1] "ride_id"            "rideable_type"      "started_at"         "ended_at"           "start_station_name" "start_station_id"  
 [7] "end_station_name"   "end_station_id"     "start_lat"          "start_lng"          "end_lat"            "end_lng"           
[13] "member_casual"     
```
```r
names(trip_data)
```
```r
 [1] "ride_id"            "rideable_type"      "started_at"         "ended_at"           "start_station_name" "start_station_id"  
 [7] "end_station_name"   "end_station_id"     "start_lat"          "start_lng"          "end_lat"            "end_lng"           
[13] "member_casual"     
```

#### Identifying Total Missing Values
+ Calculating the total sum of missing values (**na**) in each column using `colSums(is.na())`.
```{r}
colSums(is.na(trip_data))
```
```{r}
           ride_id      rideable_type         started_at           ended_at start_station_name   start_station_id   end_station_name 
                 0                  0                  0                  0             875716             875848             929202 
    end_station_id          start_lat          start_lng            end_lat            end_lng      member_casual 
            929343                  0                  0               6990               6990                  0 
```

#### Displaying Row Count
+ Counting the total count of rows of the entire data frame using `nrow()`.
```{r}
nrow(trip_data)
```
```{r}
[1] 5719877
```

#### Displaying Column Count
+ Counting the total count of columns of the entire data frame using `ncol()`.
```{r}
ncol(trip_data)
```
```{r}
[1] 13
```

#### Displaying Top Rows
+ Showing a preview of the first few rows (6 rows) offering a glimpse into its contents using `head()`.
```{r}
head(trip_data)
```
| ride_id <chr> | rideable_type <chr> | started_at <S3: POSIXct> | ended_at <S3: POSIXct> | start_station_name <chr> | start_station_id <chr> | end_station_name <chr> | end_station_id <chr> | start_lat <dbl> | start_lng <dbl> | end_lat <dbl> | end_lng <dbl> | member_casual <chr> |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| F96D5A74A3E41399 | electric_bike | 2023-01-21 20:05:42 | 2023-01-21 20:16:33 | Lincoln Ave & Fullerton Ave | TA1309000058 | Hampden Ct & Diversey Ave | 202480.0 | 41.92407 | -87.64628 | 41.93000 | -87.64000 | member |
| 13CB7EB698CEDB88 | classic_bike | 2023-01-10 15:37:36 | 2023-01-10 15:46:05 | Kimbark Ave & 53rd St | TA1309000037 | Greenwood Ave & 47th St | TA1308000002 | 41.79957 | -87.59475 | 41.80983 | -87.59938 | member |
| BD88A2E670661CE5 | electric_bike | 2023-01-02 07:51:57 | 2023-01-02 08:05:11 | Western Ave & Lunt Ave | RP-005 | Valli Produce - Evanston Plaza | 599 | 42.00857 | -87.69048 | 42.03974 | -87.69941 | casual |
| C90792D034FED968 | classic_bike | 2023-01-22 10:52:58 | 2023-01-22 11:01:44 | Kimbark Ave & 53rd St | TA1309000037 | Greenwood Ave & 47th St | TA1308000002 | 41.79957 | -87.59475 | 41.80983 | -87.59938 | member |
| 3397017529188E8A | classic_bike | 2023-01-12 13:58:01 | 2023-01-12 14:13:20 | Kimbark Ave & 53rd St | TA1309000037 | Greenwood Ave & 47th St | TA1308000002 | 41.79957 | -87.59475 | 41.80983 | -87.59938 | member |
| 58E68156DAE3E311 | electric_bike | 2023-01-31 07:18:03 | 2023-01-31 07:21:16 | Lakeview Ave & Fullerton Pkwy | TA1309000019 | Hampden Ct & Diversey Ave | 202480.0 | 41.92607 | -87.63886 | 41.93000 | -87.64000 | member |

#### Displaying Bottom Rows
+ Showing a preview of the last few rows (6 rows) offering a glimpse into its contents using `tail()`.
```{r}
tail(trip_data)
```
| ride_id <chr> | rideable_type <chr> | started_at <S3: POSIXct> | ended_at <S3: POSIXct> | start_station_name <chr> | start_station_id <chr> | end_station_name <chr> | end_station_id <chr> | start_lat <dbl> | start_lng <dbl> | end_lat <dbl> | end_lng <dbl> | member_casual <chr> |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| AB675DD0012CBD57 | electric_bike | 2023-12-04 23:34:11 | 2023-12-04 23:39:16 | Racine Ave & 18th St | 13164 | Racine Ave & Congress Pkwy | TA1306000025 | 41.85824 | -87.65638 | 41.87464 | -87.65703 | member |
| F74DF9549B504A6B | electric_bike | 2023-12-07 13:15:24 | 2023-12-07 13:17:37 | 900 W Harrison St | 13028 | Racine Ave & Congress Pkwy | TA1306000025 | 41.87470 | -87.64980 | 41.87464 | -87.65703 | casual |
| BCDA66E761CC1029 | classic_bike | 2023-12-08 18:42:21 | 2023-12-08 18:45:56 | 900 W Harrison St | 13028 | Racine Ave & Congress Pkwy | TA1306000025 | 41.87475 | -87.64981 | 41.87464 | -87.65703 | casual |
| D2CF330F9C266683 | classic_bike | 2023-12-05 14:09:11 | 2023-12-05 14:13:01 | 900 W Harrison St | 13028 | Racine Ave & Congress Pkwy | TA1306000025 | 41.87475 | -87.64981 | 41.87464 | -87.65703 | member |
| 3829A0D1E00EE970 | electric_bike | 2023-12-02 21:36:07 | 2023-12-02 21:53:45 | Damen Ave & Madison St | 13134 | Morgan St & Lake St* | chargingstx4 | 41.88140 | -87.67498 | 41.88549 | -87.65229 | casual |
| A373F5B447AEA508 | classic_bike | 2023-12-11 13:07:46 | 2023-12-11 13:11:24 | 900 W Harrison St | 13028 | Racine Ave & Congress Pkwy | TA1306000025 | 41.87475 | -87.64981 | 41.87464 | -87.65703 | member |

#### Displaying the Structure Overview
+ Reviewing the new structure using `str()`.
```{r}
str(trip_data)
```
```{r}
spc_tbl_ [5,719,877 × 13] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
 $ ride_id           : chr [1:5719877] "F96D5A74A3E41399" "13CB7EB698CEDB88" "BD88A2E670661CE5" "C90792D034FED968" ...
 $ rideable_type     : chr [1:5719877] "electric_bike" "classic_bike" "electric_bike" "classic_bike" ...
 $ started_at        : POSIXct[1:5719877], format: "2023-01-21 20:05:42" "2023-01-10 15:37:36" "2023-01-02 07:51:57" "2023-01-22 10:52:58" ...
 $ ended_at          : POSIXct[1:5719877], format: "2023-01-21 20:16:33" "2023-01-10 15:46:05" "2023-01-02 08:05:11" "2023-01-22 11:01:44" ...
 $ start_station_name: chr [1:5719877] "Lincoln Ave & Fullerton Ave" "Kimbark Ave & 53rd St" "Western Ave & Lunt Ave" "Kimbark Ave & 53rd St" ...
 $ start_station_id  : chr [1:5719877] "TA1309000058" "TA1309000037" "RP-005" "TA1309000037" ...
 $ end_station_name  : chr [1:5719877] "Hampden Ct & Diversey Ave" "Greenwood Ave & 47th St" "Valli Produce - Evanston Plaza" "Greenwood Ave & 47th St" ...
 $ end_station_id    : chr [1:5719877] "202480.0" "TA1308000002" "599" "TA1308000002" ...
 $ start_lat         : num [1:5719877] 41.9 41.8 42 41.8 41.8 ...
 $ start_lng         : num [1:5719877] -87.6 -87.6 -87.7 -87.6 -87.6 ...
 $ end_lat           : num [1:5719877] 41.9 41.8 42 41.8 41.8 ...
 $ end_lng           : num [1:5719877] -87.6 -87.6 -87.7 -87.6 -87.6 ...
 $ member_casual     : chr [1:5719877] "member" "member" "casual" "member" ...
 - attr(*, "spec")=
  .. cols(
  ..   ride_id = col_character(),
  ..   rideable_type = col_character(),
  ..   started_at = col_datetime(format = ""),
  ..   ended_at = col_datetime(format = ""),
  ..   start_station_name = col_character(),
  ..   start_station_id = col_character(),
  ..   end_station_name = col_character(),
  ..   end_station_id = col_character(),
  ..   start_lat = col_double(),
  ..   start_lng = col_double(),
  ..   end_lat = col_double(),
  ..   end_lng = col_double(),
  ..   member_casual = col_character()
  .. )
 - attr(*, "problems")=<externalptr> 
```

#### Displaying Conise Structure
+ Summarizing the structure and attributes using `glimpse()`.
```{r}
glimpse(trip_data)
```
```{r}
Rows: 5,719,877
Columns: 13
$ ride_id            <chr> "F96D5A74A3E41399", "13CB7EB698CEDB88", "BD88A2E670661CE5", "C90792D034FED968", "3397017529188E8A", "58…
$ rideable_type      <chr> "electric_bike", "classic_bike", "electric_bike", "classic_bike", "classic_bike", "electric_bike", "ele…
$ started_at         <dttm> 2023-01-21 20:05:42, 2023-01-10 15:37:36, 2023-01-02 07:51:57, 2023-01-22 10:52:58, 2023-01-12 13:58:0…
$ ended_at           <dttm> 2023-01-21 20:16:33, 2023-01-10 15:46:05, 2023-01-02 08:05:11, 2023-01-22 11:01:44, 2023-01-12 14:13:2…
$ start_station_name <chr> "Lincoln Ave & Fullerton Ave", "Kimbark Ave & 53rd St", "Western Ave & Lunt Ave", "Kimbark Ave & 53rd S…
$ start_station_id   <chr> "TA1309000058", "TA1309000037", "RP-005", "TA1309000037", "TA1309000037", "TA1309000019", "TA1309000037…
$ end_station_name   <chr> "Hampden Ct & Diversey Ave", "Greenwood Ave & 47th St", "Valli Produce - Evanston Plaza", "Greenwood Av…
$ end_station_id     <chr> "202480.0", "TA1308000002", "599", "TA1308000002", "TA1308000002", "202480.0", "TA1308000002", "TA13080…
$ start_lat          <dbl> 41.92407, 41.79957, 42.00857, 41.79957, 41.79957, 41.92607, 41.79955, 41.79957, 41.79959, 41.79957, 41.…
$ start_lng          <dbl> -87.64628, -87.59475, -87.69048, -87.59475, -87.59475, -87.63886, -87.59462, -87.59475, -87.59467, -87.…
$ end_lat            <dbl> 41.93000, 41.80983, 42.03974, 41.80983, 41.80983, 41.93000, 41.80983, 41.80983, 41.80983, 41.80983, 41.…
$ end_lng            <dbl> -87.64000, -87.59938, -87.69941, -87.59938, -87.59938, -87.64000, -87.59938, -87.59938, -87.59938, -87.…
$ member_casual      <chr> "member", "member", "casual", "member", "member", "member", "member", "member", "member", "member", "me…
Modify Chunk OptionsRun All Chunks AboveRun Current Chunk
```

#### Displaying Variable Statistics
+ Generating a summary report without using a chart using `skim_without_charts()`.
```{r}
skim_without_charts(trip_data)
```
```{r}── Data Summary ────────────────────────
                           Values   
Name                       trip_data
Number of rows             5719877  
Number of columns          13       
_______________________             
Column type frequency:              
  character                7        
  numeric                  4        
  POSIXct                  2        
________________________            
Group variables            None     
```
|     | skim_variable <chr> | n_missing <int> | complete_rate <dbl> | min <int> | max <int> | empty <int> | n_unique <int> | whitespace <int> |
|---|---|---|---|---|---|---|---|---|
| 1 | ride_id | 0 | 1.0000000 | 16 | 16 | 0 | 5719877 | 0 |
| 2 | rideable_type | 0 | 1.0000000 | 11 | 13 | 0 | 3 | 0 |
| 3 | start_station_name | 875716 | 0.8468995 | 3 | 64 | 0 | 1592 | 0 |
| 4 | start_station_id | 875848 | 0.8468764 | 3 | 35 | 0 | 1516 | 0 |
| 5 | end_station_name | 929202 | 0.8375486 | 3 | 64 | 0 | 1597 | 0 |
| 6 | end_station_id | 929343 | 0.8375240 | 3 | 36 | 0 | 1520 | 0 |
| 7 | member_casual | 0 | 1.0000000 | 6 | 6 | 0 | 2 | 0 |

|     | skim_variable <chr> | n_missing <int> | complete_rate <dbl> | mean <dbl> | sd <dbl> | p0 <dbl> | p25 <dbl> | p50 <dbl> | p75 <dbl> | p100 <dbl> |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | start_lat | 0 | 1.0000000 | 41.90288 | 0.04505556 | 41.63 | 41.88096 | 41.89902 | 41.93000 | 42.07 |
| 2 | start_lng | 0 | 1.0000000 | -87.64704 | 0.02733412 | -87.94 | -87.66000 | -87.64403 | -87.62991 | -87.46 |
| 3 | end_lat | 6990 | 0.9987779 | 41.90322 | 0.05444371 | 0.00 | 41.88103 | 41.90000 | 41.93000 | 42.18 |
| 4 | end_lng | 6990 | 0.9987779 | -87.64720 | 0.06919621 | -88.16 | -87.66027 | -87.64410 | -87.63000 | 0.00 |

|     | skim_variable <chr> | n_missing <int> | complete_rate <dbl> | min <S3: POSIXct> | max <S3: POSIXct> | median <S3: POSIXct> | n_unique <int> |
|---|---|---|---|---|---|---|---|
| 1 | started_at | 0 | 1 | 2023-01-01 00:01:58 | 2023-12-31 23:59:38 | 2023-07-20 18:02:50 | 4823909 |
| 2 | ended_at | 0 | 1 | 2023-01-01 00:02:41 | 2024-01-01 23:50:51 | 2023-07-20 18:19:47 | 4835702 |


#### Displaying Summary Overview
+ Providing an overall summary of the new data frame using `summary()`.
```{r}
summary(trip_data)
```
```{r}
   ride_id          rideable_type        started_at                    
 Length:5719877     Length:5719877     Min.   :2023-01-01 00:01:58.00  
 Class :character   Class :character   1st Qu.:2023-05-21 12:50:44.00  
 Mode  :character   Mode  :character   Median :2023-07-20 18:02:50.00  
                                       Mean   :2023-07-16 10:27:50.01  
                                       3rd Qu.:2023-09-16 20:08:49.00  
                                       Max.   :2023-12-31 23:59:38.00  
                                                                       
    ended_at                      start_station_name start_station_id   end_station_name  
 Min.   :2023-01-01 00:02:41.00   Length:5719877     Length:5719877     Length:5719877    
 1st Qu.:2023-05-21 13:14:09.00   Class :character   Class :character   Class :character  
 Median :2023-07-20 18:19:47.00   Mode  :character   Mode  :character   Mode  :character  
 Mean   :2023-07-16 10:46:00.18                                                           
 3rd Qu.:2023-09-16 20:28:10.00                                                           
 Max.   :2024-01-01 23:50:51.00                                                           
                                                                                          
 end_station_id       start_lat       start_lng         end_lat         end_lng      
 Length:5719877     Min.   :41.63   Min.   :-87.94   Min.   : 0.00   Min.   :-88.16  
 Class :character   1st Qu.:41.88   1st Qu.:-87.66   1st Qu.:41.88   1st Qu.:-87.66  
 Mode  :character   Median :41.90   Median :-87.64   Median :41.90   Median :-87.64  
                    Mean   :41.90   Mean   :-87.65   Mean   :41.90   Mean   :-87.65  
                    3rd Qu.:41.93   3rd Qu.:-87.63   3rd Qu.:41.93   3rd Qu.:-87.63  
                    Max.   :42.07   Max.   :-87.46   Max.   :42.18   Max.   :  0.00  
                                                     NA's   :6990    NA's   :6990    
 member_casual     
 Length:5719877    
 Class :character  
 Mode  :character  
                   
                   
                   
                   
```
---

> [!NOTE]
> Understanding that similar functions were utilized in the current analysis, it's essential to acknowledge that each function often offers unique insights or formatting options tailored to specific analytical needs or preferences. Thus, selecting the appropriate function relies on factors such as the desired output format, required level of detail, or ease of interpretation.

### Missing Values Exploration
+ Conducted a review of missing values (**na**) in the new combined data frame through attachment and detachment.
+ Temporarily integrated the data frame into the current R environment.
+ Identified missing values within each of the 13 rows.
+ Removed the temporary data frame from the current R environment.

#### Identifying Missing Values
+ Adding the combined `trip_data` data frame to the search path.
```{r}
attach(trip_data)
```
+ Displaying rows where `ride_id` is (**na**).
```{r}
trip_data[is.na(ride_id),]
```
```{r}
0 rows
```
+ Displaying rows where `rideable_type` is (**na**).
```{r}
trip_data[is.na(rideable_type),]
```
```{r}
0 rows
```
+ Displaying rows where `started_at` is (**na**).
```{r}
trip_data[is.na(started_at),]
```
```{r}
0 rows
```
+ Displaying rows where `ended_at` is (**na**).
```{r}
trip_data[is.na(ended_at),]
```
```{r}
0 rows
```
+ Displaying rows where `start_station_name` is (**na**).
```{r}
trip_data[is.na(start_station_name),]
```
| ride_id <chr> | rideable_type <chr> | started_at <S3: POSIXct> | ended_at <S3: POSIXct> | start_station_name <chr> | start_station_id <chr> | end_station_name <chr> | end_station_id <chr> | start_lat <dbl> | start_lng <dbl> | end_lat <dbl> | end_lng <dbl> | member_casual <chr> |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 3F624CAD11ADC36B | electric_bike | 2023-01-24 19:15:35 | 2023-01-24 19:21:59 | NA | NA | Greenwood Ave & 47th St | TA1308000002 | 41.80 | -87.62 | 41.80983 | -87.59938 | member |
| 7F4991C08F87A20F | electric_bike | 2023-01-27 12:36:53 | 2023-01-27 13:02:30 | NA | NA | Greenwood Ave & 47th St | TA1308000002 | 41.80 | -87.62 | 41.80983 | -87.59938 | member |
| F3AD17CF04B88EE9 | electric_bike | 2023-01-20 00:37:00 | 2023-01-20 00:46:09 | NA | NA | Greenwood Ave & 47th St | TA1308000002 | 41.78 | -87.59 | 41.80983 | -87.59938 | member |
| CA3677FEF8FD11B6 | electric_bike | 2023-01-27 02:13:40 | 2023-01-27 02:18:22 | NA | NA | Greenwood Ave & 47th St | TA1308000002 | 41.80 | -87.60 | 41.80983 | -87.59938 | member |
| 6FFD201EBB80C87C | electric_bike | 2023-01-16 01:43:52 | 2023-01-16 01:52:02 | NA | NA | Clark St & Elmdale Ave | KA1504000148 | 42.00 | -87.68 | 41.99086 | -87.66972 | member |
| 1CBF19453B2A188A | electric_bike | 2023-01-03 18:00:00 | 2023-01-03 18:21:49 | NA | NA | Hampden Ct & Diversey Ave | 202480.0 | 41.90 | -87.63 | 41.93000 | -87.64000 | member |

```{r}
1-6 of 875,716 rows
```
+ Displaying rows where `start_station_id` is (**na**).
```{r}
trip_data[is.na(start_station_id),]
```
| ride_id <chr> | rideable_type <chr> | started_at <S3: POSIXct> | ended_at <S3: POSIXct> | start_station_name <chr> | start_station_id <chr> | end_station_name <chr> | end_station_id <chr> | start_lat <dbl> | start_lng <dbl> | end_lat <dbl> | end_lng <dbl> | member_casual <chr> |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 3F624CAD11ADC36B | electric_bike | 2023-01-24 19:15:35 | 2023-01-24 19:21:59 | NA | NA | Greenwood Ave & 47th St | TA1308000002 | 41.80 | -87.62 | 41.80983 | -87.59938 | member |
| 7F4991C08F87A20F | electric_bike | 2023-01-27 12:36:53 | 2023-01-27 13:02:30 | NA | NA | Greenwood Ave & 47th St | TA1308000002 | 41.80 | -87.62 | 41.80983 | -87.59938 | member |
| F3AD17CF04B88EE9 | electric_bike | 2023-01-20 00:37:00 | 2023-01-20 00:46:09 | NA | NA | Greenwood Ave & 47th St | TA1308000002 | 41.78 | -87.59 | 41.80983 | -87.59938 | member |
| CA3677FEF8FD11B6 | electric_bike | 2023-01-27 02:13:40 | 2023-01-27 02:18:22 | NA | NA | Greenwood Ave & 47th St | TA1308000002 | 41.80 | -87.60 | 41.80983 | -87.59938 | member |
| 6FFD201EBB80C87C | electric_bike | 2023-01-16 01:43:52 | 2023-01-16 01:52:02 | NA | NA | Clark St & Elmdale Ave | KA1504000148 | 42.00 | -87.68 | 41.99086 | -87.66972 | member |
| 1CBF19453B2A188A | electric_bike | 2023-01-03 18:00:00 | 2023-01-03 18:21:49 | NA | NA | Hampden Ct & Diversey Ave | 202480.0 | 41.90 | -87.63 | 41.93000 | -87.64000 | member |

```{r}
1-6 of 875,848 rows
```
+ Displaying rows where `end_station_name` is (**na**).
```{r}
trip_data[is.na(end_station_name),]
```
| ride_id <chr> | rideable_type <chr> | started_at <S3: POSIXct> | ended_at <S3: POSIXct> | start_station_name <chr> | start_station_id <chr> | end_station_name <chr> | end_station_id <chr> | start_lat <dbl> | start_lng <dbl> | end_lat <dbl> | end_lng <dbl> | member_casual <chr> |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 98563E8CECC44A5B | electric_bike | 2023-01-06 13:12:53 | 2023-01-06 13:18:54 | Broadway & Waveland Ave | 13325 | NA | NA | 41.94909 | -87.64857 | 41.96 | -87.65 | member |
| 3F625414353F2C07 | electric_bike | 2023-01-24 07:01:34 | 2023-01-24 07:06:32 | Broadway & Waveland Ave | 13325 | NA | NA | 41.94909 | -87.64857 | 41.96 | -87.65 | member |
| 0A1832AB46BA959E | electric_bike | 2023-01-22 13:09:13 | 2023-01-22 13:14:17 | Broadway & Waveland Ave | 13325 | NA | NA | 41.94906 | -87.64858 | 41.96 | -87.65 | member |
| 4B4C428B94A39EEC | electric_bike | 2023-01-16 10:26:17 | 2023-01-16 10:28:08 | Broadway & Waveland Ave | 13325 | NA | NA | 41.94908 | -87.64852 | 41.95 | -87.65 | member |
| E001B905A293D938 | electric_bike | 2023-01-31 05:27:52 | 2023-01-31 05:33:27 | Indiana Ave & Roosevelt Rd | SL-005 | NA | NA | 41.86797 | -87.62312 | 41.87 | -87.64 | casual |
| E9764CD7AB7E133B | electric_bike | 2023-01-25 19:08:59 | 2023-01-25 19:14:26 | Broadway & Waveland Ave | 13325 | NA | NA | 41.94909 | -87.64855 | 41.95 | -87.66 | member |

```{r}
1-6 of 929,202 rows
```
+ Displaying rows where `end_station_id` is (**na**).
```{r}
trip_data[is.na(end_station_id),]
```
| ride_id <chr> | rideable_type <chr> | started_at <S3: POSIXct> | ended_at <S3: POSIXct> | start_station_name <chr> | start_station_id <chr> | end_station_name <chr> | end_station_id <chr> | start_lat <dbl> | start_lng <dbl> | end_lat <dbl> | end_lng <dbl> | member_casual <chr> |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 98563E8CECC44A5B | electric_bike | 2023-01-06 13:12:53 | 2023-01-06 13:18:54 | Broadway & Waveland Ave | 13325 | NA | NA | 41.94909 | -87.64857 | 41.96 | -87.65 | member |
| 3F625414353F2C07 | electric_bike | 2023-01-24 07:01:34 | 2023-01-24 07:06:32 | Broadway & Waveland Ave | 13325 | NA | NA | 41.94909 | -87.64857 | 41.96 | -87.65 | member |
| 0A1832AB46BA959E | electric_bike | 2023-01-22 13:09:13 | 2023-01-22 13:14:17 | Broadway & Waveland Ave | 13325 | NA | NA | 41.94906 | -87.64858 | 41.96 | -87.65 | member |
| 4B4C428B94A39EEC | electric_bike | 2023-01-16 10:26:17 | 2023-01-16 10:28:08 | Broadway & Waveland Ave | 13325 | NA | NA | 41.94908 | -87.64852 | 41.95 | -87.65 | member |
| E001B905A293D938 | electric_bike | 2023-01-31 05:27:52 | 2023-01-31 05:33:27 | Indiana Ave & Roosevelt Rd | SL-005 | NA | NA | 41.86797 | -87.62312 | 41.87 | -87.64 | casual |
| E9764CD7AB7E133B | electric_bike | 2023-01-25 19:08:59 | 2023-01-25 19:14:26 | Broadway & Waveland Ave | 13325 | NA | NA | 41.94909 | -87.64855 | 41.95 | -87.66 | member |

```{r}
1-6 of 929,343 rows
```
+ Displaying rows where `start_lat` is (**na**).
```{r}
trip_data[is.na(start_lat),]
```
```{r}
0 rows
```
+ Displaying rows where `start_lng` is (**na**).
```{r}
trip_data[is.na(start_lng),]
```
```{r}
0 rows
```
+ Displaying rows where `end_lat` is (**na**).
```{r}
trip_data[is.na(end_lat),]
```
| ride_id <chr> | rideable_type <chr> | started_at <S3: POSIXct> | ended_at <S3: POSIXct> | start_station_name <chr> | start_station_id <chr> | end_station_name <chr> | end_station_id <chr> | start_lat <dbl> | start_lng <dbl> | end_lat <dbl> | end_lng <dbl> | member_casual <chr> |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1FB8FE3600279846 | classic_bike | 2023-01-01 04:45:39 | 2023-01-02 05:45:28 | State St & Van Buren St | TA1305000035 | NA | NA | 41.87718 | -87.62784 | NA | NA | casual |
| 08D63AE5147A8A12 | docked_bike | 2023-01-09 14:20:41 | 2023-01-15 04:19:09 | Indiana Ave & Roosevelt Rd | SL-005 | NA | NA | 41.86789 | -87.62304 | NA | NA | casual |
| BEEB2B851275BBEE | classic_bike | 2023-01-30 13:24:22 | 2023-01-31 14:24:09 | State St & 19th St | SL-013 | NA | NA | 41.85659 | -87.62754 | NA | NA | member |
| 758F82A4444D0DF3 | classic_bike | 2023-01-31 09:21:10 | 2023-02-01 10:21:02 | Halsted St & Maxwell St | TA1309000001 | NA | NA | 41.86488 | -87.64707 | NA | NA | casual |
| 45125F6E88AD0535 | docked_bike | 2023-01-07 12:52:32 | 2023-01-08 06:47:21 | New St & Illinois St | TA1306000013 | NA | NA | 41.89085 | -87.61862 | NA | NA | casual |
| CFD822F52941BDFF | classic_bike | 2023-01-19 08:30:10 | 2023-01-20 09:30:04 | Ogden Ave & Race Ave | 13194 | NA | NA | 41.89180 | -87.65875 | NA | NA | casual |

```{r}
1-6 of 6,990 rows
```
+ Displaying rows where `end_lng` is (**na**).
```{r}
trip_data[is.na(end_lng),]
```
| ride_id <chr> | rideable_type <chr> | started_at <S3: POSIXct> | ended_at <S3: POSIXct> | start_station_name <chr> | start_station_id <chr> | end_station_name <chr> | end_station_id <chr> | start_lat <dbl> | start_lng <dbl> | end_lat <dbl> | end_lng <dbl> | member_casual <chr> |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1FB8FE3600279846 | classic_bike | 2023-01-01 04:45:39 | 2023-01-02 05:45:28 | State St & Van Buren St | TA1305000035 | NA | NA | 41.87718 | -87.62784 | NA | NA | casual |
| 08D63AE5147A8A12 | docked_bike | 2023-01-09 14:20:41 | 2023-01-15 04:19:09 | Indiana Ave & Roosevelt Rd | SL-005 | NA | NA | 41.86789 | -87.62304 | NA | NA | casual |
| BEEB2B851275BBEE | classic_bike | 2023-01-30 13:24:22 | 2023-01-31 14:24:09 | State St & 19th St | SL-013 | NA | NA | 41.85659 | -87.62754 | NA | NA | member |
| 758F82A4444D0DF3 | classic_bike | 2023-01-31 09:21:10 | 2023-02-01 10:21:02 | Halsted St & Maxwell St | TA1309000001 | NA | NA | 41.86488 | -87.64707 | NA | NA | casual |
| 45125F6E88AD0535 | docked_bike | 2023-01-07 12:52:32 | 2023-01-08 06:47:21 | New St & Illinois St | TA1306000013 | NA | NA | 41.89085 | -87.61862 | NA | NA | casual |
| CFD822F52941BDFF | classic_bike | 2023-01-19 08:30:10 | 2023-01-20 09:30:04 | Ogden Ave & Race Ave | 13194 | NA | NA | 41.89180 | -87.65875 | NA | NA | casual |

```{r}
1-6 of 6,990 rows
```
+ Displaying rows where `member_casual` is (**na**).
```{r}
trip_data[is.na(member_casual),]
```
```{r}
0 rows
```
+ Removing the combined `trip_data` data frame from the search path.
```{r}
detach(trip_data)
```
+ Displaying total count of (**na**).
```{r}
sum(is.na(trip_data))
```
```{r}
[1] 3624089
```

> [!CAUTION]
> Understanding the potential risks associated with `attach()` and `detach()` during the current analysis, it's essential to recognize that these functions may introduce unexpected behavior and namespace conflicts. Exercise caution when utilizing them to avoid potential issues, and consider alternative methods for variable access, such as explicit referencing or other scoping mechanisms.

### Data Transformation, Cleaning, and Imputation
+ Renamed a column to improve clarity and consistency.
+ Rounded latitude and longitude values to enhance precision.
+ Converted date-time to ensure consistency and compatibility.
+ Extracted various components from different columns for further analysis.
+ Addressed missing values using forward and backward filling methods, maintaining data completeness.
+ Implemented imputation to replace missing values, preserving data integrity.
+ Computed the geographical distance traveled, providing valuable information for route analysis.
+ Converted units of measurements to standardize data representation.
+ Applied filtering to select specific rows based on defined criteria.
+ Revisited specific columns for reassessment, ensuring data accuracy and completeness.

#### Renaming a Column
+ `member_casual` to `user_type`.
```{r}
trip_data <- rename(trip_data, "user_type" = "member_casual")
```

#### Converting Data Type
+ `started_at` and `ended_at` columns to POSIXct format. ( e.g. 2023-01-21 08:16:33)
```{r}
trip_data$started_at <- ymd_hms(trip_data$started_at)
trip_data$ended_at <- ymd_hms(trip_data$ended_at)
```
```{r}
Warning:  23 failed to parse.Warning:  26 failed to parse.
```
> [!IMPORTANT]
> + The warnings ("23 failed to parse" and "26 failed to parse") indicate issues with missing values (NAs) in the started_at and ended_at columns of trip_data. Missing values cannot be parsed into valid date-time objects, causing the warnings.

#### Rechecking Missing Values
+ Verifying the integrity and consistency of the `started_at` and `ended_at` columns following data manipulation.
```{r}
sum(is.na(trip_data$started_at))
sum(is.na(trip_data$ended_at))
```
```{r}
[1] 23
[1] 26
```

#### Precision Adjustment for Coordinates
+ Rounding `start and end latitude/longitude` coordinates to two decimal places.
```{r}
trip_data <- trip_data %>%
  mutate(
    start_lat = round(start_lat, digits = 2),
    start_lng = round(start_lng, digits = 2),
    end_lat = round(end_lat, digits = 2),
    end_lng = round(end_lng, digits = 2)
  )
```

#### Extracting and Adding New Columns
+ Extracting date from `started_at` and creating a new column `date`.
```{r}
trip_data <- trip_data %>%
  mutate(date = as.Date(started_at))
```
+ Extracting month from `date` and creating a new column `month`.
+ ```{r}
trip_data <- trip_data %>%
  mutate(month = format(date, "%B"))
```
+ Extracting day from `date` and creating a new column `day`.
```{r}
trip_data <- trip_data %>%
  mutate(day = format(date, "%d"))
```
+ Extracting year from `date` and creating a new column `year`.
```{r}
trip_data <- trip_data %>%
  mutate(year = format(date, "%Y"))
```
+ Extracting day of the week from `date` and creating a new column `day_of_week`.
```{r}
trip_data <- trip_data %>%
  mutate(day_of_week = format(date, "%A"))
```
+ Extracting hour from `started_at` and creating a new column `hour`.
```{r}
trip_data <- trip_data %>%
  mutate(hour = hour(started_at))
```
+ Extracting quarterly from `started_at` and creating a new column `quarter`.
```{r}
trip_data <- trip_data %>%
  mutate(quarter = quarter(started_at))
```

#### Extracting and Adding Custom Column Part 1
+ Calculating the difference in minutes between the timestamps in the `ended_at` and `started_at` columns, rounding the result to two decimal places, and storing the rounded durations in a new custom column `ride_length_minute`.
```{r}
trip_data <- trip_data %>% 
  mutate(ride_length_minute = round(as.numeric(difftime(ended_at, started_at, units = "mins")), 2))
```

#### Quality Assessment and Outlier Detection
+ Displaying the data type of `ride_length_minute` using `class()`.
```{r}
class(trip_data$ride_length_minute)
```
```{r}
[1] "numeric"
```
+ Detecting outliers by counting duration less than 1 minute (60 seconds) in column `ride_length_minute`.
```{r}
sum(trip_data$ride_length_minute < 1, na.rm = TRUE)
```
```{r}
[1] 149615
```
+ Detecting outliers by counting duration longer than 24 hours (1440 minutes) in column `ride_length_minute`. 
```{r}
sum(trip_data$ride_length_minute > 1440, na.rm = TRUE)
```
```{r}
[1] 6418
```
+ Detecting outliers by counting non-positive duration (less than or equal to 0) in column `ride_length_minute`. 
```{r}
sum(trip_data$ride_length_minute <= 0, na.rm = TRUE)
```
```{r}
[1] 1269
```
+ Detecting outliers by counting instances where the `started_at` occurs after `ended_at` using 2 methods.
```{r}
sum(trip_data$started_at > trip_data$ended_at, na.rm = TRUE)
```
```{r}
[1] 272
```
```{r}
length(which(trip_data$started_at > trip_data$ended_at))
```
```{r}
[1] 272
```

#### Handling Missing Values
+ Re-counting missing values in specific columns using `colSums(is.na())`.
```{r}
colSums(is.na(trip_data[c(
  "start_station_name", 
  "start_station_id", 
  "end_station_name", 
  "end_station_id", 
  "end_lat", 
  "end_lng")]))
```
```{r}
start_station_name   start_station_id   end_station_name     end_station_id            end_lat            end_lng 
            875716             875848             929202             929343               6990               6990 
```


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
