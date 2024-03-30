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

+ Display `column names` for each month's dataset.
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

+ Display `structure` of each month's dataset.
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

+ Display `summary` statistics for each month's dataset.
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
