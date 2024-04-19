## 🔄 The 'Process' Phase

### Tool Used
![R](https://img.shields.io/badge/r-%23276DC3.svg?style=for-the-badge&logo=r&logoColor=white)
![RStudio](https://img.shields.io/badge/RStudio-4285F4?style=for-the-badge&logo=rstudio&logoColor=white)

+ **R** and **RStudio** were chosen for this analysis due to their extensive statistical analysis capabilities, enabling sophisticated data exploration, hypothesis testing, and modeling across a diverse range of analytical tasks.
+ The efficient handling of large datasets in R is supported by optimized functions and data structures like data.table and dplyr, allowing for fast data manipulation and aggregation even with datasets containing millions or billions of records.
+ The flexibility and extensibility of R enable users to customize analyses to their specific needs, leveraging a wide array of packages for data manipulation, visualization, and modeling.
+ R excels in data visualization with powerful plotting libraries such as ggplot2 and plotly, which provide customizable and publication-ready visualizations. These libraries offer extensive control over design elements, facilitating the creation of interactive and dynamic visualizations that effectively communicate insights from complex datasets.

### Setting Up the Environment
+ Installing R packages from the CRAN (Comprehensive R Archive Network) or other repositories.
+ Loading packages in R to make their functions and features available for analysis.
+ Importing the 12 CSV data files.

#### Installing R Packages
```{r}
install.packages("tidyverse")
install.packages("janitor")
install.packages("readr")
install.packages("dplyr")
install.packages("lubridate")
install.packages("tidyr")
install.packages("ggplot2")
install.packages("geosphere")
install.packages("skimr")
install.packages("leaflet")
install.packages("htmltools")
install.packages("leaflet.extras")
```
> [!NOTE]
>**Further Information on R Packages**
> + `tidyverse`: Comprehensive suite of R packages for efficient data science workflows.
> + `janitor`: Simplifies data cleaning and tidying tasks.
> + `readr`: Fast and user-friendly package for reading data.
> + `dplyr`: Essential package for intuitive data manipulation.
> + `lubridate`: Facilitates easy handling of date-time data.
> + `tidyr`: Simplifies data tidying and reshaping tasks.
> + `ggplot2`: Powerful package for creating high-quality visualizations.
> + `geosphere`: Provides functions for computing distances and areas on Earth's surface.
> + `skimr`: Generates informative summaries and visualizations for data frames.
> + `leaflet`: Allows creation of interactive maps.
> + `htmltools`: Offers utilities for working with HTML content in R.
> + `leaflet.extras`: Extends leaflet with additional features for interactive map creation.

#### Loading Packages
```{r}
library(tidyverse)
library(janitor)
library(readr)
library(dplyr)
library(lubridate)
library(tidyr)
library(ggplot2)
library(geosphere)
library(skimr)
library(leaflet)
library(htmltools)
library(leaflet.extras)
```

#### Importing Data Files and Creating Data Frame
+ Importing the 12 CSV data files.
  
**January 2023**
```{r}
jan2023 <- read_csv("202301-divvy-tripdata.csv")
```
```{r}
Rows: 190301 Columns: 13── Column specification ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
Delimiter: ","
chr  (7): ride_id, rideable_type, start_station_name, start_station_id, end_station_name, end_station_id, member_casual
dbl  (4): start_lat, start_lng, end_lat, end_lng
dttm (2): started_at, ended_at
ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

**February 2023**
```{r}
feb2023 <- read_csv("202302-divvy-tripdata.csv")
```
```{r}
Rows: 190445 Columns: 13── Column specification ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
Delimiter: ","
chr  (7): ride_id, rideable_type, start_station_name, start_station_id, end_station_name, end_station_id, member_casual
dbl  (4): start_lat, start_lng, end_lat, end_lng
dttm (2): started_at, ended_at
ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

**March 2023**
```{r}
mar2023 <- read_csv("202303-divvy-tripdata.csv")
```
```{r}
Rows: 258678 Columns: 13── Column specification ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
Delimiter: ","
chr  (7): ride_id, rideable_type, start_station_name, start_station_id, end_station_name, end_station_id, member_casual
dbl  (4): start_lat, start_lng, end_lat, end_lng
dttm (2): started_at, ended_at
ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

**April 2023**
```{r}
apr2023 <- read_csv("202304-divvy-tripdata.csv")
```
```{r}
Rows: 426590 Columns: 13── Column specification ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
Delimiter: ","
chr  (7): ride_id, rideable_type, start_station_name, start_station_id, end_station_name, end_station_id, member_casual
dbl  (4): start_lat, start_lng, end_lat, end_lng
dttm (2): started_at, ended_at
ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

**May 2023**
```{r}
may2023 <- read_csv("202305-divvy-tripdata.csv")
```
```{r}
Rows: 604827 Columns: 13── Column specification ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
Delimiter: ","
chr  (7): ride_id, rideable_type, start_station_name, start_station_id, end_station_name, end_station_id, member_casual
dbl  (4): start_lat, start_lng, end_lat, end_lng
dttm (2): started_at, ended_at
ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

**June 2023**
```{r}
jun2023 <- read_csv("202306-divvy-tripdata.csv")
```
```{r}
Rows: 719618 Columns: 13── Column specification ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
Delimiter: ","
chr  (7): ride_id, rideable_type, start_station_name, start_station_id, end_station_name, end_station_id, member_casual
dbl  (4): start_lat, start_lng, end_lat, end_lng
dttm (2): started_at, ended_at
ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

**July 2023**
```{r}
jul2023 <- read_csv("202307-divvy-tripdata.csv")
```
```{r}
Rows: 767650 Columns: 13── Column specification ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
Delimiter: ","
chr  (7): ride_id, rideable_type, start_station_name, start_station_id, end_station_name, end_station_id, member_casual
dbl  (4): start_lat, start_lng, end_lat, end_lng
dttm (2): started_at, ended_at
ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

**August 2023**
```{r}
aug2023 <- read_csv("202308-divvy-tripdata.csv")
```
```{r}
Rows: 771693 Columns: 13── Column specification ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
Delimiter: ","
chr  (7): ride_id, rideable_type, start_station_name, start_station_id, end_station_name, end_station_id, member_casual
dbl  (4): start_lat, start_lng, end_lat, end_lng
dttm (2): started_at, ended_at
ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

**September 2023**
```{r}
sep2023 <- read_csv("202309-divvy-tripdata.csv")
```
```{r}
Rows: 666371 Columns: 13── Column specification ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
Delimiter: ","
chr  (7): ride_id, rideable_type, start_station_name, start_station_id, end_station_name, end_station_id, member_casual
dbl  (4): start_lat, start_lng, end_lat, end_lng
dttm (2): started_at, ended_at
ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

**October 2023**
```{r}
oct2023 <- read_csv("202310-divvy-tripdata.csv")
```
```{r}
Rows: 537113 Columns: 13── Column specification ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
Delimiter: ","
chr  (7): ride_id, rideable_type, start_station_name, start_station_id, end_station_name, end_station_id, member_casual
dbl  (4): start_lat, start_lng, end_lat, end_lng
dttm (2): started_at, ended_at
ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

**November 2023**
```{r}
nov2023 <- read_csv("202311-divvy-tripdata.csv")
```
```{r}
Rows: 362518 Columns: 13── Column specification ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
Delimiter: ","
chr  (7): ride_id, rideable_type, start_station_name, start_station_id, end_station_name, end_station_id, member_casual
dbl  (4): start_lat, start_lng, end_lat, end_lng
dttm (2): started_at, ended_at
ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

**December 2023**
```{r}
dec2023 <- read_csv("202312-divvy-tripdata.csv")
```
```{r}
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

#### Column Names for Each Month’s Data Frame
+ Displaying the column names for each data frame using **`colnames()`** functions.
```{r}
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
```{r}
 [1] "ride_id"            "rideable_type"      "started_at"         "ended_at"           "start_station_name" "start_station_id"  
 [7] "end_station_name"   "end_station_id"     "start_lat"          "start_lng"          "end_lat"            "end_lng"           
[13] "member_casual"     
```

#### Structure of Each Month’s Data Frame
+ Displaying the structure of each data frame.
  
**January 2023**
```{r}
str(jan2023)
```
```{r}
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

**Feburary 2023**
```{r}
str(feb2023)
```
```{r}
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

**March 2023**
```{r}
str(mar2023)
```
```{r}
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

**April 2023**
```{r}
str(apr2023)
```
```{r}
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

**May 2023**
```{r}
str(may2023)
```
```{r}
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

**June 2023**
```{r}
str(jun2023)
```
```{r}
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

**July 2023**
```{r}
str(jul2023)
```
```{r}
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

**August 2023**
```{r}
str(aug2023)
```
```{r}
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

**September 2023**
```{r}
str(sep2023)
```
```{r}
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

**October 2023**
```{r}
str(oct2023)
```
```{r}
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

**November 2023**
```{r}
str(nov2023)
```
```{r}
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

**December 2023**
```{r}
str(dec2023)
```
```{r}
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

#### Statistics for Each Month’s Data Frame
+ Displaying the summary for each data frame.

**January 2023**
```{r}
summary(jan2023)
```
```{r}
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

**February 2023**
```{r}
summary(feb2023)
```
```{r}
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

**March 2023**
```{r}
summary(mar2023)
```
```{r}
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

**April 2023**
```{r}
summary(apr2023)
```
```{r}
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

**May 2023**
```{r}
summary(may2023)
```
```{r}
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

**June 2023**
```{r}
summary(jun2023)
```
```{r}
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

**July 2023**
```{r}
summary(jul2023)
```
```{r}
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

**August 2023**
```{r}
summary(aug2023)
```
```{r}
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

**September 2023**
```{r}
summary(sep2023)
```
```{r}
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

**October 2023**
```{r}
summary(oct2023)
```
```{r}
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

**November 2023**
```{r}
summary(nov2023)
```
```{r}
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

**December 2023**
```{r}
summary(dec2023)
```
```{r}
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
+ Each file consists of **13 columns**.
+ Total number of rows across all files is **5,719,877**.
+ Missing data primarily occurs in columns:
    - **start_station_name**
    - **start_station_id**
    - **end_station_name**
    - **end_station_id**
    - **end_lat**
    - **end_lng**
+ After consolidation and further exploration, a decision will be made regarding whether to keep or drop missing data, possibly considering options to fill in missing values.

### Data Consolidation
+ Combining data from 12 individual data frames into a single unified data frame, following the initial review.
+ Removing the 12 individual data frames after consolidation to streamline data management.

#### Combining All Monthly Data Frames
+ Combining all data frames into a single unified data frame.
```{r}
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
+ Removing all individual data frames from the environment to streamline data management.
```{r}
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
+ Reviewed newly combined data framed, **`trip_data`**.
+ Examined variable types and dimensions to understand the data structure thoroughly.
+ Reviewed column names and variable distributions for clarity and insight into the dataset.
+ Checked for missing values to assess data completeness and potential issues.
+ Evaluated data frame length and width to understand the scale and complexity of the data frame.
+ Inspected data structure to gain deeper insights into how the data is organized.
+ Reviewed the first and last rows to ensure data integrity and consistency.
+ Summarized variable statistics to identify trends, outliers, and patterns within the data.

#### Checking Data Type
+ Identifying data type.
```{r}
class(trip_data)
```
```{r}
[1] "spec_tbl_df" "tbl_df"      "tbl"         "data.frame" 
```

#### Checking Data Dimensions
+ Counting the number of rows and columns.
```{r}
dim(trip_data)
```
```{r}
[1] 5719877      13
```

#### Displaying Variable Names
+ Obtaining the column names.
```{r}
colnames(trip_data)
```
```{r}
 [1] "ride_id"            "rideable_type"      "started_at"         "ended_at"           "start_station_name" "start_station_id"  
 [7] "end_station_name"   "end_station_id"     "start_lat"          "start_lng"          "end_lat"            "end_lng"           
[13] "member_casual"     
```
```{r}
names(trip_data)
```
```{r}
 [1] "ride_id"            "rideable_type"      "started_at"         "ended_at"           "start_station_name" "start_station_id"  
 [7] "end_station_name"   "end_station_id"     "start_lat"          "start_lng"          "end_lat"            "end_lng"           
[13] "member_casual"     
```

#### Identifying Total Missing Values
+ Calculating the total sum of missing values (**na**) in each column.
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
+ Counting the total count of rows of the entire data frame.
```{r}
nrow(trip_data)
```
```{r}
[1] 5719877
```

#### Displaying Column Count
+ Counting the total count of columns of the entire data frame.
```{r}
ncol(trip_data)
```
```{r}
[1] 13
```

#### Displaying Top Rows
+ Showing a preview of the first few rows (6 rows) offering a glimpse into its contents.
```{r}
head(trip_data)
```
| ride_id <chr>    | rideable_type <chr> | started_at <S3: POSIXct> | ended_at <S3: POSIXct> | start_station_name <chr>      | start_station_id <chr> | end_station_name <chr>         | end_station_id <chr> | start_lat <dbl> | start_lng <dbl> | end_lat <dbl> | end_lng <dbl> | member_casual <chr> |
|------------------|---------------------|--------------------------|------------------------|-------------------------------|------------------------|--------------------------------|----------------------|-----------------|-----------------|---------------|---------------|---------------------|
| F96D5A74A3E41399 | electric_bike       | 2023-01-21 20:05:42      | 2023-01-21 20:16:33    | Lincoln Ave & Fullerton Ave   | TA1309000058           | Hampden Ct & Diversey Ave      | 202480.0             | 41.92407        | -87.64628       | 41.93000      | -87.64000     | member              |
| 13CB7EB698CEDB88 | classic_bike        | 2023-01-10 15:37:36      | 2023-01-10 15:46:05    | Kimbark Ave & 53rd St         | TA1309000037           | Greenwood Ave & 47th St        | TA1308000002         | 41.79957        | -87.59475       | 41.80983      | -87.59938     | member              |
| BD88A2E670661CE5 | electric_bike       | 2023-01-02 07:51:57      | 2023-01-02 08:05:11    | Western Ave & Lunt Ave        | RP-005                 | Valli Produce - Evanston Plaza | 599                  | 42.00857        | -87.69048       | 42.03974      | -87.69941     | casual              |
| C90792D034FED968 | classic_bike        | 2023-01-22 10:52:58      | 2023-01-22 11:01:44    | Kimbark Ave & 53rd St         | TA1309000037           | Greenwood Ave & 47th St        | TA1308000002         | 41.79957        | -87.59475       | 41.80983      | -87.59938     | member              |
| 3397017529188E8A | classic_bike        | 2023-01-12 13:58:01      | 2023-01-12 14:13:20    | Kimbark Ave & 53rd St         | TA1309000037           | Greenwood Ave & 47th St        | TA1308000002         | 41.79957        | -87.59475       | 41.80983      | -87.59938     | member              |
| 58E68156DAE3E311 | electric_bike       | 2023-01-31 07:18:03      | 2023-01-31 07:21:16    | Lakeview Ave & Fullerton Pkwy | TA1309000019           | Hampden Ct & Diversey Ave      | 202480.0             | 41.92607        | -87.63886       | 41.93000      | -87.64000     | member              |

#### Displaying Bottom Rows
+ Showing a preview of the last few rows (6 rows) offering a glimpse into its contents.
```{r}
tail(trip_data)
```
| ride_id <chr>    | rideable_type <chr> | started_at <S3: POSIXct> | ended_at <S3: POSIXct> | start_station_name <chr> | start_station_id <chr> | end_station_name <chr>     | end_station_id <chr> | start_lat <dbl> | start_lng <dbl> | end_lat <dbl> | end_lng <dbl> | member_casual <chr> |
|------------------|---------------------|--------------------------|------------------------|--------------------------|------------------------|----------------------------|----------------------|-----------------|-----------------|---------------|---------------|---------------------|
| AB675DD0012CBD57 | electric_bike       | 2023-12-04 23:34:11      | 2023-12-04 23:39:16    | Racine Ave & 18th St     | 13164                  | Racine Ave & Congress Pkwy | TA1306000025         | 41.85824        | -87.65638       | 41.87464      | -87.65703     | member              |
| F74DF9549B504A6B | electric_bike       | 2023-12-07 13:15:24      | 2023-12-07 13:17:37    | 900 W Harrison St        | 13028                  | Racine Ave & Congress Pkwy | TA1306000025         | 41.87470        | -87.64980       | 41.87464      | -87.65703     | casual              |
| BCDA66E761CC1029 | classic_bike        | 2023-12-08 18:42:21      | 2023-12-08 18:45:56    | 900 W Harrison St        | 13028                  | Racine Ave & Congress Pkwy | TA1306000025         | 41.87475        | -87.64981       | 41.87464      | -87.65703     | casual              |
| D2CF330F9C266683 | classic_bike        | 2023-12-05 14:09:11      | 2023-12-05 14:13:01    | 900 W Harrison St        | 13028                  | Racine Ave & Congress Pkwy | TA1306000025         | 41.87475        | -87.64981       | 41.87464      | -87.65703     | member              |
| 3829A0D1E00EE970 | electric_bike       | 2023-12-02 21:36:07      | 2023-12-02 21:53:45    | Damen Ave & Madison St   | 13134                  | Morgan St & Lake St*       | chargingstx4         | 41.88140        | -87.67498       | 41.88549      | -87.65229     | casual              |
| A373F5B447AEA508 | classic_bike        | 2023-12-11 13:07:46      | 2023-12-11 13:11:24    | 900 W Harrison St        | 13028                  | Racine Ave & Congress Pkwy | TA1306000025         | 41.87475        | -87.64981       | 41.87464      | -87.65703     | member              |

#### Displaying the Structure Overview
+ Reviewing the new structure.
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
+ Summarizing the structure and attributes.
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
+ Generating a summary report without using a chart.
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
|   | skim_variable <chr> | n_missing <int> | complete_rate <dbl> | min <int> | max <int> | empty <int> | n_unique <int> | whitespace <int> |
|---|---------------------|-----------------|---------------------|-----------|-----------|-------------|----------------|------------------|
| 1 | ride_id             | 0               | 1.0000000           | 16        | 16        | 0           | 5719877        | 0                |
| 2 | rideable_type       | 0               | 1.0000000           | 11        | 13        | 0           | 3              | 0                |
| 3 | start_station_name  | 875716          | 0.8468995           | 3         | 64        | 0           | 1592           | 0                |
| 4 | start_station_id    | 875848          | 0.8468764           | 3         | 35        | 0           | 1516           | 0                |
| 5 | end_station_name    | 929202          | 0.8375486           | 3         | 64        | 0           | 1597           | 0                |
| 6 | end_station_id      | 929343          | 0.8375240           | 3         | 36        | 0           | 1520           | 0                |
| 7 | member_casual       | 0               | 1.0000000           | 6         | 6         | 0           | 2              | 0                |

|   | skim_variable <chr> | n_missing <int> | complete_rate <dbl> | mean <dbl> | sd <dbl>   | p0 <dbl> | p25 <dbl> | p50 <dbl> | p75 <dbl> | p100 <dbl> |
|---|---------------------|-----------------|---------------------|------------|------------|----------|-----------|-----------|-----------|------------|
| 1 | start_lat           | 0               | 1.0000000           | 41.90288   | 0.04505556 | 41.63    | 41.88096  | 41.89902  | 41.93000  | 42.07      |
| 2 | start_lng           | 0               | 1.0000000           | -87.64704  | 0.02733412 | -87.94   | -87.66000 | -87.64403 | -87.62991 | -87.46     |
| 3 | end_lat             | 6990            | 0.9987779           | 41.90322   | 0.05444371 | 0.00     | 41.88103  | 41.90000  | 41.93000  | 42.18      |
| 4 | end_lng             | 6990            | 0.9987779           | -87.64720  | 0.06919621 | -88.16   | -87.66027 | -87.64410 | -87.63000 | 0.00       |

|   | skim_variable <chr> | n_missing <int> | complete_rate <dbl> | min <S3: POSIXct>   | max <S3: POSIXct>   | median <S3: POSIXct> | n_unique <int> |
|---|---------------------|-----------------|---------------------|---------------------|---------------------|----------------------|----------------|
| 1 | started_at          | 0               | 1                   | 2023-01-01 00:01:58 | 2023-12-31 23:59:38 | 2023-07-20 18:02:50  | 4823909        |
| 2 | ended_at            | 0               | 1                   | 2023-01-01 00:02:41 | 2024-01-01 23:50:51 | 2023-07-20 18:19:47  | 4835702        |


#### Displaying Summary Overview
+ Providing an overall summary of the new data frame.
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
+ Attaching the combined **`trip_data`** data frame to the search path.
```{r}
attach(trip_data)
```
+ **ride_id** 
```{r}
trip_data[is.na(ride_id),]
```
```{r}
0 rows
```
+ **rideable_type**
```{r}
trip_data[is.na(rideable_type),]
```
```{r}
0 rows
```
+ **started_at**
```{r}
trip_data[is.na(started_at),]
```
```{r}
0 rows
```
+ **ended_at**
```{r}
trip_data[is.na(ended_at),]
```
```{r}
0 rows
```
+ **start_station_name**
```{r}
trip_data[is.na(start_station_name),]
```
| ride_id <chr>    | rideable_type <chr> | started_at <S3: POSIXct> | ended_at <S3: POSIXct> | start_station_name <chr> | start_station_id <chr> | end_station_name <chr>    | end_station_id <chr> | start_lat <dbl> | start_lng <dbl> | end_lat <dbl> | end_lng <dbl> | member_casual <chr> |
|------------------|---------------------|--------------------------|------------------------|--------------------------|------------------------|---------------------------|----------------------|-----------------|-----------------|---------------|---------------|---------------------|
| 3F624CAD11ADC36B | electric_bike       | 2023-01-24 19:15:35      | 2023-01-24 19:21:59    | NA                       | NA                     | Greenwood Ave & 47th St   | TA1308000002         | 41.80           | -87.62          | 41.80983      | -87.59938     | member              |
| 7F4991C08F87A20F | electric_bike       | 2023-01-27 12:36:53      | 2023-01-27 13:02:30    | NA                       | NA                     | Greenwood Ave & 47th St   | TA1308000002         | 41.80           | -87.62          | 41.80983      | -87.59938     | member              |
| F3AD17CF04B88EE9 | electric_bike       | 2023-01-20 00:37:00      | 2023-01-20 00:46:09    | NA                       | NA                     | Greenwood Ave & 47th St   | TA1308000002         | 41.78           | -87.59          | 41.80983      | -87.59938     | member              |
| CA3677FEF8FD11B6 | electric_bike       | 2023-01-27 02:13:40      | 2023-01-27 02:18:22    | NA                       | NA                     | Greenwood Ave & 47th St   | TA1308000002         | 41.80           | -87.60          | 41.80983      | -87.59938     | member              |
| 6FFD201EBB80C87C | electric_bike       | 2023-01-16 01:43:52      | 2023-01-16 01:52:02    | NA                       | NA                     | Clark St & Elmdale Ave    | KA1504000148         | 42.00           | -87.68          | 41.99086      | -87.66972     | member              |
| 1CBF19453B2A188A | electric_bike       | 2023-01-03 18:00:00      | 2023-01-03 18:21:49    | NA                       | NA                     | Hampden Ct & Diversey Ave | 202480.0             | 41.90           | -87.63          | 41.93000      | -87.64000     | member              |

`1-6 of 875,716 rows`

+ **start_station_id**
```{r}
trip_data[is.na(start_station_id),]
```
| ride_id <chr>    | rideable_type <chr> | started_at <S3: POSIXct> | ended_at <S3: POSIXct> | start_station_name <chr> | start_station_id <chr> | end_station_name <chr>    | end_station_id <chr> | start_lat <dbl> | start_lng <dbl> | end_lat <dbl> | end_lng <dbl> | member_casual <chr> |
|------------------|---------------------|--------------------------|------------------------|--------------------------|------------------------|---------------------------|----------------------|-----------------|-----------------|---------------|---------------|---------------------|
| 3F624CAD11ADC36B | electric_bike       | 2023-01-24 19:15:35      | 2023-01-24 19:21:59    | NA                       | NA                     | Greenwood Ave & 47th St   | TA1308000002         | 41.80           | -87.62          | 41.80983      | -87.59938     | member              |
| 7F4991C08F87A20F | electric_bike       | 2023-01-27 12:36:53      | 2023-01-27 13:02:30    | NA                       | NA                     | Greenwood Ave & 47th St   | TA1308000002         | 41.80           | -87.62          | 41.80983      | -87.59938     | member              |
| F3AD17CF04B88EE9 | electric_bike       | 2023-01-20 00:37:00      | 2023-01-20 00:46:09    | NA                       | NA                     | Greenwood Ave & 47th St   | TA1308000002         | 41.78           | -87.59          | 41.80983      | -87.59938     | member              |
| CA3677FEF8FD11B6 | electric_bike       | 2023-01-27 02:13:40      | 2023-01-27 02:18:22    | NA                       | NA                     | Greenwood Ave & 47th St   | TA1308000002         | 41.80           | -87.60          | 41.80983      | -87.59938     | member              |
| 6FFD201EBB80C87C | electric_bike       | 2023-01-16 01:43:52      | 2023-01-16 01:52:02    | NA                       | NA                     | Clark St & Elmdale Ave    | KA1504000148         | 42.00           | -87.68          | 41.99086      | -87.66972     | member              |
| 1CBF19453B2A188A | electric_bike       | 2023-01-03 18:00:00      | 2023-01-03 18:21:49    | NA                       | NA                     | Hampden Ct & Diversey Ave | 202480.0             | 41.90           | -87.63          | 41.93000      | -87.64000     | member              |

`1-6 of 875,848 rows`

+ **end_station_name**
```{r}
trip_data[is.na(end_station_name),]
```
| ride_id <chr>    | rideable_type <chr> | started_at <S3: POSIXct> | ended_at <S3: POSIXct> | start_station_name <chr>   | start_station_id <chr> | end_station_name <chr> | end_station_id <chr> | start_lat <dbl> | start_lng <dbl> | end_lat <dbl> | end_lng <dbl> | member_casual <chr> |
|------------------|---------------------|--------------------------|------------------------|----------------------------|------------------------|------------------------|----------------------|-----------------|-----------------|---------------|---------------|---------------------|
| 98563E8CECC44A5B | electric_bike       | 2023-01-06 13:12:53      | 2023-01-06 13:18:54    | Broadway & Waveland Ave    | 13325                  | NA                     | NA                   | 41.94909        | -87.64857       | 41.96         | -87.65        | member              |
| 3F625414353F2C07 | electric_bike       | 2023-01-24 07:01:34      | 2023-01-24 07:06:32    | Broadway & Waveland Ave    | 13325                  | NA                     | NA                   | 41.94909        | -87.64857       | 41.96         | -87.65        | member              |
| 0A1832AB46BA959E | electric_bike       | 2023-01-22 13:09:13      | 2023-01-22 13:14:17    | Broadway & Waveland Ave    | 13325                  | NA                     | NA                   | 41.94906        | -87.64858       | 41.96         | -87.65        | member              |
| 4B4C428B94A39EEC | electric_bike       | 2023-01-16 10:26:17      | 2023-01-16 10:28:08    | Broadway & Waveland Ave    | 13325                  | NA                     | NA                   | 41.94908        | -87.64852       | 41.95         | -87.65        | member              |
| E001B905A293D938 | electric_bike       | 2023-01-31 05:27:52      | 2023-01-31 05:33:27    | Indiana Ave & Roosevelt Rd | SL-005                 | NA                     | NA                   | 41.86797        | -87.62312       | 41.87         | -87.64        | casual              |
| E9764CD7AB7E133B | electric_bike       | 2023-01-25 19:08:59      | 2023-01-25 19:14:26    | Broadway & Waveland Ave    | 13325                  | NA                     | NA                   | 41.94909        | -87.64855       | 41.95         | -87.66        | member              |

`1-6 of 929,202 rows`

+ **end_station_id**
```{r}
trip_data[is.na(end_station_id),]
```
| ride_id <chr>    | rideable_type <chr> | started_at <S3: POSIXct> | ended_at <S3: POSIXct> | start_station_name <chr>   | start_station_id <chr> | end_station_name <chr> | end_station_id <chr> | start_lat <dbl> | start_lng <dbl> | end_lat <dbl> | end_lng <dbl> | member_casual <chr> |
|------------------|---------------------|--------------------------|------------------------|----------------------------|------------------------|------------------------|----------------------|-----------------|-----------------|---------------|---------------|---------------------|
| 98563E8CECC44A5B | electric_bike       | 2023-01-06 13:12:53      | 2023-01-06 13:18:54    | Broadway & Waveland Ave    | 13325                  | NA                     | NA                   | 41.94909        | -87.64857       | 41.96         | -87.65        | member              |
| 3F625414353F2C07 | electric_bike       | 2023-01-24 07:01:34      | 2023-01-24 07:06:32    | Broadway & Waveland Ave    | 13325                  | NA                     | NA                   | 41.94909        | -87.64857       | 41.96         | -87.65        | member              |
| 0A1832AB46BA959E | electric_bike       | 2023-01-22 13:09:13      | 2023-01-22 13:14:17    | Broadway & Waveland Ave    | 13325                  | NA                     | NA                   | 41.94906        | -87.64858       | 41.96         | -87.65        | member              |
| 4B4C428B94A39EEC | electric_bike       | 2023-01-16 10:26:17      | 2023-01-16 10:28:08    | Broadway & Waveland Ave    | 13325                  | NA                     | NA                   | 41.94908        | -87.64852       | 41.95         | -87.65        | member              |
| E001B905A293D938 | electric_bike       | 2023-01-31 05:27:52      | 2023-01-31 05:33:27    | Indiana Ave & Roosevelt Rd | SL-005                 | NA                     | NA                   | 41.86797        | -87.62312       | 41.87         | -87.64        | casual              |
| E9764CD7AB7E133B | electric_bike       | 2023-01-25 19:08:59      | 2023-01-25 19:14:26    | Broadway & Waveland Ave    | 13325                  | NA                     | NA                   | 41.94909        | -87.64855       | 41.95         | -87.66        | member              |

`1-6 of 929,343 rows`

+ **start_lat**
```{r}
trip_data[is.na(start_lat),]
```
```{r}
0 rows
```
+ **start_lng**
```{r}
trip_data[is.na(start_lng),]
```
```{r}
0 rows
```
+ **end_lat**
```{r}
trip_data[is.na(end_lat),]
```
| ride_id <chr>    | rideable_type <chr> | started_at <S3: POSIXct> | ended_at <S3: POSIXct> | start_station_name <chr>   | start_station_id <chr> | end_station_name <chr> | end_station_id <chr> | start_lat <dbl> | start_lng <dbl> | end_lat <dbl> | end_lng <dbl> | member_casual <chr> |
|------------------|---------------------|--------------------------|------------------------|----------------------------|------------------------|------------------------|----------------------|-----------------|-----------------|---------------|---------------|---------------------|
| 1FB8FE3600279846 | classic_bike        | 2023-01-01 04:45:39      | 2023-01-02 05:45:28    | State St & Van Buren St    | TA1305000035           | NA                     | NA                   | 41.87718        | -87.62784       | NA            | NA            | casual              |
| 08D63AE5147A8A12 | docked_bike         | 2023-01-09 14:20:41      | 2023-01-15 04:19:09    | Indiana Ave & Roosevelt Rd | SL-005                 | NA                     | NA                   | 41.86789        | -87.62304       | NA            | NA            | casual              |
| BEEB2B851275BBEE | classic_bike        | 2023-01-30 13:24:22      | 2023-01-31 14:24:09    | State St & 19th St         | SL-013                 | NA                     | NA                   | 41.85659        | -87.62754       | NA            | NA            | member              |
| 758F82A4444D0DF3 | classic_bike        | 2023-01-31 09:21:10      | 2023-02-01 10:21:02    | Halsted St & Maxwell St    | TA1309000001           | NA                     | NA                   | 41.86488        | -87.64707       | NA            | NA            | casual              |
| 45125F6E88AD0535 | docked_bike         | 2023-01-07 12:52:32      | 2023-01-08 06:47:21    | New St & Illinois St       | TA1306000013           | NA                     | NA                   | 41.89085        | -87.61862       | NA            | NA            | casual              |
| CFD822F52941BDFF | classic_bike        | 2023-01-19 08:30:10      | 2023-01-20 09:30:04    | Ogden Ave & Race Ave       | 13194                  | NA                     | NA                   | 41.89180        | -87.65875       | NA            | NA            | casual              |

`1-6 of 6,990 rows`

+ **end_lng**
```{r}
trip_data[is.na(end_lng),]
```
| ride_id <chr>    | rideable_type <chr> | started_at <S3: POSIXct> | ended_at <S3: POSIXct> | start_station_name <chr>   | start_station_id <chr> | end_station_name <chr> | end_station_id <chr> | start_lat <dbl> | start_lng <dbl> | end_lat <dbl> | end_lng <dbl> | member_casual <chr> |
|------------------|---------------------|--------------------------|------------------------|----------------------------|------------------------|------------------------|----------------------|-----------------|-----------------|---------------|---------------|---------------------|
| 1FB8FE3600279846 | classic_bike        | 2023-01-01 04:45:39      | 2023-01-02 05:45:28    | State St & Van Buren St    | TA1305000035           | NA                     | NA                   | 41.87718        | -87.62784       | NA            | NA            | casual              |
| 08D63AE5147A8A12 | docked_bike         | 2023-01-09 14:20:41      | 2023-01-15 04:19:09    | Indiana Ave & Roosevelt Rd | SL-005                 | NA                     | NA                   | 41.86789        | -87.62304       | NA            | NA            | casual              |
| BEEB2B851275BBEE | classic_bike        | 2023-01-30 13:24:22      | 2023-01-31 14:24:09    | State St & 19th St         | SL-013                 | NA                     | NA                   | 41.85659        | -87.62754       | NA            | NA            | member              |
| 758F82A4444D0DF3 | classic_bike        | 2023-01-31 09:21:10      | 2023-02-01 10:21:02    | Halsted St & Maxwell St    | TA1309000001           | NA                     | NA                   | 41.86488        | -87.64707       | NA            | NA            | casual              |
| 45125F6E88AD0535 | docked_bike         | 2023-01-07 12:52:32      | 2023-01-08 06:47:21    | New St & Illinois St       | TA1306000013           | NA                     | NA                   | 41.89085        | -87.61862       | NA            | NA            | casual              |
| CFD822F52941BDFF | classic_bike        | 2023-01-19 08:30:10      | 2023-01-20 09:30:04    | Ogden Ave & Race Ave       | 13194                  | NA                     | NA                   | 41.89180        | -87.65875       | NA            | NA            | casual              |

`1-6 of 6,990 rows`

+ **member_casual**
```{r}
trip_data[is.na(member_casual),]
```
```{r}
0 rows
```
+ Detaching the combined **`trip_data`** data frame from the search path.
```{r}
detach(trip_data)
```
+ Displaying total count of missing values (**na**).
```{r}
sum(is.na(trip_data))
```
```{r}
[1] 3624089
```

> [!CAUTION]
> Understanding the potential risks associated with **`attach()`** and **`detach()`** during the current analysis, it's essential to recognize that these functions may introduce unexpected behavior and namespace conflicts. Exercise caution when utilizing them to avoid potential issues, and consider alternative methods for variable access, such as explicit referencing or other scoping mechanisms.

### Data Transformation, Imputation, and Cleaning
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
+ **member_casual** to **user_type**.
```{r}
trip_data <- rename(trip_data, "user_type" = "member_casual")
```

#### Converting Data Type
+ **started_at** and **ended_at** columns to POSIXct format. ( e.g. 2023-01-21 08:16:33)
```{r}
trip_data$started_at <- ymd_hms(trip_data$started_at)
trip_data$ended_at <- ymd_hms(trip_data$ended_at)
```
`Warning:  23 failed to parse.Warning:  26 failed to parse.`

> [!IMPORTANT]
> + The warnings ("23 failed to parse" and "26 failed to parse") indicate issues with missing values (NAs) in the started_at and ended_at columns of trip_data. Missing values cannot be parsed into valid date-time objects, causing the warnings.

#### Verifying Reason for Failed Parse
+ Verifying the integrity and consistency of the **started_at** and **ended_at** columns.
```{r}
sum(is.na(trip_data$started_at))
sum(is.na(trip_data$ended_at))
```
```{r}
[1] 23
[1] 26
```

#### Precision Adjustment for Coordinates
+ Rounding **start and end coordinates** to 2 decimal places.
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
+ Extracting date from **started_at** and creating a new column **date**.
```{r}
trip_data <- trip_data %>%
  mutate(date = as.Date(started_at))
```
+ Extracting month from **date** and creating a new column **month**.
```{r}
trip_data <- trip_data %>%
  mutate(month = format(date, "%B"))
```
+ Extracting day from **date** and creating a new column **day**.
```{r}
trip_data <- trip_data %>%
  mutate(day = format(date, "%d"))
```
+ Extracting year from **`date`** and creating a new column **`year`**.
```{r}
trip_data <- trip_data %>%
  mutate(year = format(date, "%Y"))
```
+ Extracting day of the week from **date** and creating a new column **day_of_week**.
```{r}
trip_data <- trip_data %>%
  mutate(day_of_week = format(date, "%A"))
```
+ Extracting hour from **started_at** and creating a new column **hour**.
```{r}
trip_data <- trip_data %>%
  mutate(hour = hour(started_at))
```
+ Extracting quarterly from **started_at** and creating a new column **quarter**.
```{r}
trip_data <- trip_data %>%
  mutate(quarter = quarter(started_at))
```

#### Extracting and Adding Custom Column Part 1
+ Calculating the difference in minutes between the timestamps in the **ended_at** and **started_at** columns, rounding the result to 2 decimal places, and storing the rounded durations in a new custom column **ride_length_minute**.
```{r}
trip_data <- trip_data %>% 
  mutate(ride_length_minute = round(as.numeric(difftime(ended_at, started_at, units = "mins")), 2))
```

#### Quality Assessment and Outlier Detection
+ Displaying the data type of **ride_length_minute**.
```{r}
class(trip_data$ride_length_minute)
```
```{r}
[1] "numeric"
```
+ Detecting outliers by counting duration less than (**<**) 1 minute (60 seconds) in column **ride_length_minute**.
```{r}
sum(trip_data$ride_length_minute < 1, na.rm = TRUE)
```
```{r}
[1] 149615
```
+ Detecting outliers by counting duration longer than (**`>`**) 24 hours (1440 minutes) in column **ride_length_minute**. 
```{r}
sum(trip_data$ride_length_minute > 1440, na.rm = TRUE)
```
```{r}
[1] 6418
```
+ Detecting outliers by counting non-positive duration less than or equal (**`<=`**) to 0 in column **ride_length_minute**. 
```{r}
sum(trip_data$ride_length_minute <= 0, na.rm = TRUE)
```
```{r}
[1] 1269
```
+ Detecting outliers by counting instances where the **started_at** occurs after **ended_at**.
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
+ Re-counting missing values in specific columns.
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
+ Filling missing values for **start_station_name** by grouping start latitude and longitude.
```{r}
trip_data <- trip_data %>%
  group_by(start_lat, start_lng) %>%
  fill(start_station_name, .direction = "downup") %>%
  ungroup()
```
+ Filling missing values for **end_station_name** by grouping end latitude and longitude.
```{r}
trip_data <- trip_data %>%
  group_by(end_lat, end_lng) %>%
  fill(end_station_name, .direction = "downup") %>%
  ungroup()
```
+ Filling missing values for **start_station_id** by grouping start station name.
```{r}
trip_data <- trip_data %>%
  group_by(start_station_name) %>%
  fill(start_station_id, .direction = "downup") %>%
  ungroup()
```
+ Filling missing values for **end_station_id** by grouping end station name.
```{r}
trip_data <- trip_data %>%
  group_by(end_station_name) %>%
  fill(end_station_id, .direction = "downup") %>%
  ungroup()
```
+ Re-checking missing values in specific columns after filling in values.
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
start_station_name   start_station_id   end_station_name     end_station_id            end_lat 
             10646              10646              33105              33105               6990 
           end_lng 
              6990 
```

#### Extracting and Adding Custom Column Part 2
+ Calculating the great-circle distance in meters between the **start and end coordinates** of each trip recorded in the data frame, and storing the distances in a new custom column **ride_distance**.
```{r}
trip_data$ride_distance <- distGeo(
  matrix(c(trip_data$start_lng, trip_data$start_lat), ncol = 2),
  matrix(c(trip_data$end_lng, trip_data$end_lat), ncol = 2))
```
+ Converting Meters to Kilometers
```{r}
trip_data$ride_distance <- trip_data$ride_distance / 1000
```
+ Converting and Updating Kilometers to Miles
```{r}
trip_data$ride_distance <- trip_data$ride_distance * 0.621371
```

#### Station Exploration
+ Counting the number of rides per **start_station_name** and arranging them in descending order.
```{r}
trip_data %>% 
  select(start_station_name) %>% 
  count(start_station_name) %>% 
  arrange(desc(n))
```
| start_station_name <chr>           | n <int> |
|------------------------------------|---------|
| Streeter Dr & Grand Ave            | 68074   |
| DuSable Lake Shore Dr & North Blvd | 44024   |
| DuSable Lake Shore Dr & Monroe St  | 42072   |
| Michigan Ave & Oak St              | 39095   |
| Clark St & Elm St                  | 37813   |
| Wells St & Concord Ln              | 36950   |
| Kingsbury St & Kinzie St           | 36251   |
| Clark St & Lincoln Ave             | 36176   |

`1-8 of 1,593 rows`

+ Counting the number of rides per **start_station_id** and arranging them in descending order.
```{r}
trip_data %>% 
  select(start_station_id) %>% 
  count(start_station_id) %>% 
  arrange(desc(n))
```
| start_station_id <chr> | n <int> |
|------------------------|---------|
| 13022                  | 68074   |
| LF-005                 | 44024   |
| 13300                  | 42072   |
| 13042                  | 39095   |
| TA1307000039           | 37813   |
| TA1308000050           | 36950   |
| KA1503000043           | 36251   |
| 13179                  | 36176   |
| WL-012                 | 36017   |
| TA1308000001           | 34643   |

`1-8 of 1,517 rows`

+ Counting the number of rides per **end_station_name** and arranging them in descending order.
```{r}
trip_data %>% 
  select(end_station_name) %>% 
  count(end_station_name) %>% 
  arrange(desc(n))
```
| end_station_name <chr>             | n <int> |
|------------------------------------|---------|
| Streeter Dr & Grand Ave            | 71260   |
| DuSable Lake Shore Dr & North Blvd | 41138   |
| Michigan Ave & Oak St              | 38720   |
| DuSable Lake Shore Dr & Monroe St  | 38198   |
| Millennium Park                    | 36861   |
| Clark St & Lincoln Ave             | 36350   |
| Clark St & Elm St                  | 35835   |
| Kingsbury St & Kinzie St           | 35803   |

`1-8 of 1,598 rows`

+ Counting the number of rides per **end_station_id** and arranging them in descending order.
```{r}
trip_data %>% 
  select(end_station_id) %>% 
  count(end_station_id) %>% 
  arrange(desc(n))
```
| end_station_id <chr> | n <int> |
|----------------------|---------|
| 13022                | 71260   |
| LF-005               | 41138   |
| 13042                | 38720   |
| 13300                | 38198   |
| 13008                | 36861   |
| 13179                | 36350   |
| TA1307000039         | 35835   |
| KA1503000043         | 35803   |

`1-8 of 1,521 rows`

+ Counting the number of rides for **start_station_name** containing **test**, **warehouse** , and **charging station**.
```{r}
trip_data %>% filter(
  start_station_name %in% c (
    "OH - BONFIRE - TESTING",
    "Hubbard Bike-checking (LBS-WH-TEST)",
    "chargingstx4",
    "chargingstx2",
    "chargingstx07",
    "chargingstx0",
    "chargingstx5",
    "chargingstx3",
    "chargingstx1",
    "chargingstx06",
    "OH Charging Stx - Test",
    "2059 Hastings Warehouse Station",
    "DIVVY CASSETTE REPAIR MOBILE STATION"
  )
) %>% 
  count(start_station_name)
```
| start_station_name <chr> | n <int> |
|--------------------------|---------|
| OH - BONFIRE - TESTING   | 1       |
| OH Charging Stx - Test   | 21      |

`2 rows`

+ Counting the number of rides for **start_station_id** containing **test**, **warehouse** , and **charging station**.
```{r}
trip_data %>% filter(
  start_station_id %in% c (
    "OH - BONFIRE - TESTING",
    "Hubbard Bike-checking (LBS-WH-TEST)",
    "chargingstx4",
    "chargingstx2",
    "chargingstx07",
    "chargingstx0",
    "chargingstx5",
    "chargingstx3",
    "chargingstx1",
    "chargingstx06",
    "OH Charging Stx - Test",
    "2059 Hastings Warehouse Station",
    "DIVVY CASSETTE REPAIR MOBILE STATION"
  )
) %>% 
  count(start_station_id)
```
| start_station_id <chr>              | n <int> |
|-------------------------------------|---------|
| Hubbard Bike-checking (LBS-WH-TEST) | 7       |
| OH Charging Stx - Test              | 21      |
| chargingstx0                        | 1090    |
| chargingstx06                       | 3857    |
| chargingstx07                       | 4260    |
| chargingstx1                        | 13870   |
| chargingstx2                        | 2507    |
| chargingstx3                        | 6718    |
| chargingstx4                        | 9644    |
| chargingstx5                        | 8583    |

`10 rows`

+ Counting the number of rides for **end_station_name** containing **test**, **warehouse** , and **charging station**.
```{r}
trip_data %>% filter(
  end_station_name %in% c (
    "OH - BONFIRE - TESTING",
    "Hubbard Bike-checking (LBS-WH-TEST)",
    "chargingstx4",
    "chargingstx2",
    "chargingstx07",
    "chargingstx0",
    "chargingstx5",
    "chargingstx3",
    "chargingstx1",
    "chargingstx06",
    "OH Charging Stx - Test",
    "2059 Hastings Warehouse Station",
    "DIVVY CASSETTE REPAIR MOBILE STATION"
  )
) %>% 
  count(end_station_name)
```
| end_station_name <chr> | n <int> |
|------------------------|---------|
| OH - BONFIRE - TESTING | 3       |
| OH Charging Stx - Test | 477     |

`2 rows`

+ Counting the number of rides for **end_station_id** containing **test**, **warehouse** , and **charging station**.
```{r}
trip_data %>% filter(
  end_station_id %in% c (
    "OH - BONFIRE - TESTING",
    "Hubbard Bike-checking (LBS-WH-TEST)",
    "chargingstx4",
    "chargingstx2",
    "chargingstx07",
    "chargingstx0",
    "chargingstx5",
    "chargingstx3",
    "chargingstx1",
    "chargingstx06",
    "OH Charging Stx - Test",
    "2059 Hastings Warehouse Station",
    "DIVVY CASSETTE REPAIR MOBILE STATION"
  )
) %>% 
  count(end_station_id)
```
| end_station_id <chr>                 | n <int> |
|--------------------------------------|---------|
| 2059 Hastings Warehouse Station      | 256     |
| DIVVY CASSETTE REPAIR MOBILE STATION | 2       |
| Hubbard Bike-checking (LBS-WH-TEST)  | 309     |
| OH Charging Stx - Test               | 477     |
| chargingstx0                         | 2813    |
| chargingstx06                        | 4017    |
| chargingstx07                        | 5533    |
| chargingstx1                         | 13447   |
| chargingstx2                         | 1978    |
| chargingstx3                         | 12864   |
| chargingstx4                         | 9991    |
| chargingstx5                         | 8741    |

`12 rows`

#### Cleansing and Filtering Operations
+ Filtering out rides with durations outside the range (**>=**) and (**<=** ) of 1 minute (60 seconds) to 1440 minutes (24 hours) and storing the filtered data in a newly updated data frame called **`trip_data_updated`**.
```{r}
trip_data_updated <- trip_data %>% 
  filter(ride_length_minute >= 1 & ride_length_minute <= 1440)
```
+ Removing rows with missing end latitude and longitude.
```{r}
trip_data_updated <- trip_data_updated[!is.na(trip_data_updated$end_lat) & !is.na(trip_data_updated$end_lng), ]
```
+ Filtering out stations containing **test**, **warehouse** , and **charging station** from **start_station_name**.
```{r}
trip_data_updated <- trip_data_updated %>% 
  filter(!
  start_station_name %in% c (
    "OH - BONFIRE - TESTING",
    "Hubbard Bike-checking (LBS-WH-TEST)",
    "chargingstx4",
    "chargingstx2",
    "chargingstx07",
    "chargingstx0",
    "chargingstx5",
    "chargingstx3",
    "chargingstx1",
    "chargingstx06",
    "OH Charging Stx - Test",
    "2059 Hastings Warehouse Station",
    "DIVVY CASSETTE REPAIR MOBILE STATION"
  ))
```
+ Filtering out stations containing **test**, **warehouse** , and **charging station** from **start_station_id**.
```{r}
trip_data_updated <- trip_data_updated %>% 
  filter(!
  start_station_id %in% c (
    "OH - BONFIRE - TESTING",
    "Hubbard Bike-checking (LBS-WH-TEST)",
    "chargingstx4",
    "chargingstx2",
    "chargingstx07",
    "chargingstx0",
    "chargingstx5",
    "chargingstx3",
    "chargingstx1",
    "chargingstx06",
    "OH Charging Stx - Test",
    "2059 Hastings Warehouse Station",
    "DIVVY CASSETTE REPAIR MOBILE STATION"
  ))
```
+ Filtering out stations containing **test**, **warehouse** , and **charging station** from **end_station_name**.
```{r}
trip_data_updated <- trip_data_updated %>% 
  filter(!
  end_station_name %in% c (
    "OH - BONFIRE - TESTING",
    "Hubbard Bike-checking (LBS-WH-TEST)",
    "chargingstx4",
    "chargingstx2",
    "chargingstx07",
    "chargingstx0",
    "chargingstx5",
    "chargingstx3",
    "chargingstx1",
    "chargingstx06",
    "OH Charging Stx - Test",
    "2059 Hastings Warehouse Station",
    "DIVVY CASSETTE REPAIR MOBILE STATION"
  ))
```
+ Filtering out stations containing **test**, **warehouse** , and **charging station** from **end_station_id**.
```{r}
trip_data_updated <- trip_data_updated %>% 
  filter(!
  end_station_id %in% c (
    "OH - BONFIRE - TESTING",
    "Hubbard Bike-checking (LBS-WH-TEST)",
    "chargingstx4",
    "chargingstx2",
    "chargingstx07",
    "chargingstx0",
    "chargingstx5",
    "chargingstx3",
    "chargingstx1",
    "chargingstx06",
    "OH Charging Stx - Test",
    "2059 Hastings Warehouse Station",
    "DIVVY CASSETTE REPAIR MOBILE STATION"
  ))
```

#### Re-vising Filtered Data
+ Re-counting rides less than (**<**) 1 minute (60 seconds).
```{r}
sum(trip_data_updated$ride_length_minute < 1)
```
```{r}
[1] 0
```
+ Re-counting rides more than (**`>`**) 24 hours (1440 minutes).
```{r}
sum(trip_data_updated$ride_length_minute > 1440)
```
```{r}
[1] 0
```
+ Re-counting number of instances where **started_at** is after **ended_at**.
```{r}
length(which(trip_data_updated$started_at > trip_data_updated$ended_at)) 
```
```{r}
[1] 0
```
+ Re-counting the number of rides for **start_station_name** containing **test**, **warehouse** , and **charging station**.
```{r}
trip_data_updated %>% filter(
  start_station_name %in% c (
    "OH - BONFIRE - TESTING",
    "Hubbard Bike-checking (LBS-WH-TEST)",
    "chargingstx4",
    "chargingstx2",
    "chargingstx07",
    "chargingstx0",
    "chargingstx5",
    "chargingstx3",
    "chargingstx1",
    "chargingstx06",
    "OH Charging Stx - Test",
    "2059 Hastings Warehouse Station",
    "DIVVY CASSETTE REPAIR MOBILE STATION"
  )
) %>% 
  count(start_station_name)
```
```{r}
0 rows
```
+ Re-counting the number of rides for **start_station_id** containing **test**, **warehouse** , and **charging station**.
```{r}
trip_data_updated %>% filter(
  start_station_id %in% c (
    "OH - BONFIRE - TESTING",
    "Hubbard Bike-checking (LBS-WH-TEST)",
    "chargingstx4",
    "chargingstx2",
    "chargingstx07",
    "chargingstx0",
    "chargingstx5",
    "chargingstx3",
    "chargingstx1",
    "chargingstx06",
    "OH Charging Stx - Test",
    "2059 Hastings Warehouse Station",
    "DIVVY CASSETTE REPAIR MOBILE STATION"
  )
) %>% 
  count(start_station_id)
```
```{r}
0 rows
```
+ Re-counting the number of rides for **end_station_name** containing **test**, **warehouse** , and **charging station**.
```{r}
trip_data_updated %>% filter(
  end_station_name %in% c (
    "OH - BONFIRE - TESTING",
    "Hubbard Bike-checking (LBS-WH-TEST)",
    "chargingstx4",
    "chargingstx2",
    "chargingstx07",
    "chargingstx0",
    "chargingstx5",
    "chargingstx3",
    "chargingstx1",
    "chargingstx06",
    "OH Charging Stx - Test",
    "2059 Hastings Warehouse Station",
    "DIVVY CASSETTE REPAIR MOBILE STATION"
  )
) %>% 
  count(end_station_name)
```
```{r}
0 rows
```
+ Re-counting the number of rides for **end_station_id** containing **test**, **warehouse** , and **charging station**.
```{r}
trip_data_updated %>% filter(
  end_station_id %in% c (
    "OH - BONFIRE - TESTING",
    "Hubbard Bike-checking (LBS-WH-TEST)",
    "chargingstx4",
    "chargingstx2",
    "chargingstx07",
    "chargingstx0",
    "chargingstx5",
    "chargingstx3",
    "chargingstx1",
    "chargingstx06",
    "OH Charging Stx - Test",
    "2059 Hastings Warehouse Station",
    "DIVVY CASSETTE REPAIR MOBILE STATION"
  )
) %>% 
  count(end_station_id)
```
```{r}
0 rows
```

#### Final Updated Data Frame Review
+ Inspecting the new total number of columns.
```{r}
ncol(trip_data_updated)
```
```{r}
[1] 22
```
+ Inspecting the new total number of rows
```{r}
nrow(trip_data_updated)
```
```{r}
[1] 5459091
```
+ Summarizing the structure and attributes of the newly updated data frame.
```{r}
glimpse(trip_data_updated)
```
```{r}
Rows: 5,459,091
Columns: 22
$ ride_id            <chr> "F96D5A74A3E41399", "13CB7EB698CEDB88", "BD88A2E670661CE5", "C90792D034FED968", "3397017529188E8A", "58E68156DAE3E311", "2F7194B6012A98D4", "DB1CF84154D6A049", "34EAB943F88C4C5D", "BC8AB1AA51DA9115", "CBE4D3954EB19…
$ rideable_type      <chr> "electric_bike", "classic_bike", "electric_bike", "classic_bike", "classic_bike", "electric_bike", "electric_bike", "classic_bike", "electric_bike", "classic_bike", "classic_bike", "classic_bike", "electric_bike", …
$ started_at         <dttm> 2023-01-21 20:05:42, 2023-01-10 15:37:36, 2023-01-02 07:51:57, 2023-01-22 10:52:58, 2023-01-12 13:58:01, 2023-01-31 07:18:03, 2023-01-15 21:18:36, 2023-01-25 10:49:01, 2023-01-25 20:49:47, 2023-01-06 16:37:19, 202…
$ ended_at           <dttm> 2023-01-21 20:16:33, 2023-01-10 15:46:05, 2023-01-02 08:05:11, 2023-01-22 11:01:44, 2023-01-12 14:13:20, 2023-01-31 07:21:16, 2023-01-15 21:32:36, 2023-01-25 10:58:22, 2023-01-25 21:02:14, 2023-01-06 16:49:52, 202…
$ start_station_name <chr> "Lincoln Ave & Fullerton Ave", "Kimbark Ave & 53rd St", "Western Ave & Lunt Ave", "Kimbark Ave & 53rd St", "Kimbark Ave & 53rd St", "Lakeview Ave & Fullerton Pkwy", "Kimbark Ave & 53rd St", "Kimbark Ave & 53rd St",…
$ start_station_id   <chr> "TA1309000058", "TA1309000037", "RP-005", "TA1309000037", "TA1309000037", "TA1309000019", "TA1309000037", "TA1309000037", "TA1309000037", "TA1309000037", "TA1309000037", "TA1309000037", "13325", "13325", "LP-", "RP…
$ end_station_name   <chr> "Hampden Ct & Diversey Ave", "Greenwood Ave & 47th St", "Valli Produce - Evanston Plaza", "Greenwood Ave & 47th St", "Greenwood Ave & 47th St", "Hampden Ct & Diversey Ave", "Greenwood Ave & 47th St", "Greenwood Ave…
$ end_station_id     <chr> "202480.0", "TA1308000002", "599", "TA1308000002", "TA1308000002", "202480.0", "TA1308000002", "TA1308000002", "TA1308000002", "TA1308000002", "TA1308000002", "TA1308000002", "202480.0", "202480.0", "202480.0", "RP…
$ start_lat          <dbl> 41.92, 41.80, 42.01, 41.80, 41.80, 41.93, 41.80, 41.80, 41.80, 41.80, 41.80, 41.80, 41.95, 41.95, 41.92, 42.00, 41.93, 42.01, 41.89, 41.89, 41.96, 41.98, 41.98, 41.94, 41.95, 41.93, 41.79, 41.94, 42.00, 41.92, 41.9…
$ start_lng          <dbl> -87.65, -87.59, -87.69, -87.59, -87.59, -87.64, -87.59, -87.59, -87.59, -87.59, -87.59, -87.59, -87.65, -87.65, -87.64, -87.67, -87.64, -87.69, -87.62, -87.62, -87.65, -87.67, -87.67, -87.65, -87.73, -87.65, -87.72…
$ end_lat            <dbl> 41.93, 41.81, 42.04, 41.81, 41.81, 41.93, 41.81, 41.81, 41.81, 41.81, 41.81, 41.81, 41.93, 41.93, 41.93, 42.00, 41.93, 42.04, 41.93, 41.99, 41.99, 41.99, 41.99, 42.00, 41.95, 41.93, 41.80, 41.93, 41.99, 41.93, 41.9…
$ end_lng            <dbl> -87.64, -87.60, -87.70, -87.60, -87.60, -87.64, -87.60, -87.60, -87.60, -87.60, -87.60, -87.60, -87.64, -87.64, -87.64, -87.69, -87.64, -87.70, -87.64, -87.67, -87.67, -87.67, -87.67, -87.69, -87.69, -87.64, -87.72…
$ user_type          <chr> "member", "member", "casual", "member", "member", "member", "member", "member", "member", "member", "member", "member", "member", "casual", "member", "member", "member", "casual", "member", "member", "member", "mem…
$ date               <date> 2023-01-21, 2023-01-10, 2023-01-02, 2023-01-22, 2023-01-12, 2023-01-31, 2023-01-15, 2023-01-25, 2023-01-25, 2023-01-06, 2023-01-05, 2023-01-03, 2023-01-09, 2023-01-03, 2023-01-12, 2023-01-09, 2023-01-21, 2023-01-0…
$ month              <chr> "January", "January", "January", "January", "January", "January", "January", "January", "January", "January", "January", "January", "January", "January", "January", "January", "January", "January", "January", "Janu…
$ day                <chr> "21", "10", "02", "22", "12", "31", "15", "25", "25", "06", "05", "03", "09", "03", "12", "09", "21", "05", "17", "03", "02", "01", "02", "17", "11", "16", "12", "17", "24", "13", "21", "11", "18", "19", "06", "07"…
$ year               <chr> "2023", "2023", "2023", "2023", "2023", "2023", "2023", "2023", "2023", "2023", "2023", "2023", "2023", "2023", "2023", "2023", "2023", "2023", "2023", "2023", "2023", "2023", "2023", "2023", "2023", "2023", "2023"…
$ day_of_week        <chr> "Saturday", "Tuesday", "Monday", "Sunday", "Thursday", "Tuesday", "Sunday", "Wednesday", "Wednesday", "Friday", "Thursday", "Tuesday", "Monday", "Tuesday", "Thursday", "Monday", "Saturday", "Thursday", "Tuesday", "…
$ hour               <int> 20, 15, 7, 10, 13, 7, 21, 10, 20, 16, 17, 17, 19, 20, 22, 21, 9, 17, 17, 18, 17, 18, 12, 17, 17, 18, 7, 12, 17, 15, 18, 17, 7, 7, 12, 13, 4, 16, 10, 12, 7, 7, 17, 6, 6, 14, 20, 9, 15, 17, 13, 19, 10, 11, 15, 12, 22…
$ quarter            <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1…
$ ride_length_minute <dbl> 10.85, 8.48, 13.23, 8.77, 15.32, 3.22, 14.00, 9.35, 12.45, 12.55, 9.82, 9.37, 7.67, 9.95, 4.58, 6.63, 2.50, 15.27, 16.03, 48.82, 15.03, 4.03, 7.30, 29.38, 10.15, 8.03, 7.88, 8.67, 5.32, 5.18, 8.02, 17.28, 3.00, 3.6…
$ ride_distance      <dbl> 0.8613851, 0.8619511, 2.1335324, 0.8619511, 0.8619511, 0.0000000, 0.8619511, 0.8619511, 0.8619511, 0.8619511, 0.8619511, 0.8619511, 1.4733859, 1.4733859, 0.6901681, 1.0296212, 0.0000000, 2.1335324, 2.9469271, 7.366…
```
+ Displaying an overall summary of the newly updated data frame.
```{r}
summary(trip_data_updated)
```
```{r}
   ride_id          rideable_type        started_at                        ended_at                      start_station_name start_station_id   end_station_name   end_station_id       start_lat       start_lng         end_lat     
 Length:5459091     Length:5459091     Min.   :2023-01-01 00:02:06.00   Min.   :2023-01-01 00:07:23.00   Length:5459091     Length:5459091     Length:5459091     Length:5459091     Min.   :41.63   Min.   :-87.94   Min.   : 0.00  
 Class :character   Class :character   1st Qu.:2023-05-21 14:35:20.50   1st Qu.:2023-05-21 14:59:33.50   Class :character   Class :character   Class :character   Class :character   1st Qu.:41.88   1st Qu.:-87.66   1st Qu.:41.88  
 Mode  :character   Mode  :character   Median :2023-07-20 18:55:28.00   Median :2023-07-20 19:11:35.00   Mode  :character   Mode  :character   Mode  :character   Mode  :character   Median :41.90   Median :-87.64   Median :41.90  
                                       Mean   :2023-07-16 12:57:16.18   Mean   :2023-07-16 13:12:45.84                                                                               Mean   :41.90   Mean   :-87.65   Mean   :41.90  
                                       3rd Qu.:2023-09-16 21:10:35.00   3rd Qu.:2023-09-16 21:29:20.00                                                                               3rd Qu.:41.93   3rd Qu.:-87.63   3rd Qu.:41.93  
                                       Max.   :2023-12-31 23:58:55.00   Max.   :2024-01-01 14:20:23.00                                                                               Max.   :42.07   Max.   :-87.46   Max.   :42.18  
    end_lng        user_type              date               month               day                year           day_of_week             hour          quarter      ride_length_minute ride_distance     
 Min.   :-88.16   Length:5459091     Min.   :2023-01-01   Length:5459091     Length:5459091     Length:5459091     Length:5459091     Min.   : 0.00   Min.   :1.000   Min.   :   1.00    Min.   :   0.000  
 1st Qu.:-87.66   Class :character   1st Qu.:2023-05-21   Class :character   Class :character   Class :character   Class :character   1st Qu.:11.00   1st Qu.:2.000   1st Qu.:   5.70    1st Qu.:   0.690  
 Median :-87.64   Mode  :character   Median :2023-07-20   Mode  :character   Mode  :character   Mode  :character   Mode  :character   Median :15.00   Median :3.000   Median :   9.77    Median :   0.862  
 Mean   :-87.65                      Mean   :2023-07-15                                                                               Mean   :14.09   Mean   :2.668   Mean   :  15.49    Mean   :   1.347  
 3rd Qu.:-87.63                      3rd Qu.:2023-09-16                                                                               3rd Qu.:18.00   3rd Qu.:3.000   3rd Qu.:  17.20    3rd Qu.:   1.723  
 Max.   :  0.00                      Max.   :2023-12-31                                                                               Max.   :23.00   Max.   :4.000   Max.   :1439.87    Max.   :6098.520  
```
+ Calculating the total sum of missing values after cleaning and filtering.
```{r}
colSums(is.na(trip_data_updated))
```
```{r}
           ride_id      rideable_type         started_at           ended_at start_station_name   start_station_id   end_station_name     end_station_id          start_lat          start_lng            end_lat            end_lng 
                 0                  0                  0                  0              10160              10160              31699              31699                  0                  0                  0                  0 
         user_type               date              month                day               year        day_of_week               hour            quarter ride_length_minute      ride_distance 
                 0                  0                  0                  0                  0                  0                  0                  0                  0                  0 
```

### Summary of Updated Data
+ The data frame has undergone extensive manipulation, transformation, cleaning, and filtering.
+ Now encompasses a total of 22 columns, reflecting additional data manipulations.
+ The data frame contains 5,459,091 records, indicating a decrease in entries due to cleaning and filtering.
+ Following data cleaning and filtering, the data frame retains 83,718 missing values (**na**).

#### Data Transformation, Imputation, and Cleaning
+ Renamed the column member_casual to user_type.
+ Converted started_at and ended_at data type to POSIXct format to ensure consistency.
+ Adjust start and end coordinates for accuracy.
+ Added additional columns: **date**, **month**, **day**, **year**, **day_of_week**, **hour**, **quarter**, **ride_length_minute**, and **ride_distance**.
+ Calculated the difference in minutes between **ended_at** and **started_at**, rounding the result to two decimal places, and creating a new column.
+ Handled missing values in **start_station_name**, **start_station_id**, **end_station_name**, and **end_station_id** by filling in values based on grouping start latitude and longitude and end latitude and longitude.
+ Calculated the great-circle distance in meters between start and end coordinates, converting the units of distances to miles and creating a new column.
+ Filtered out outliers in **ride_length_minute** where values are < 1 minute or > 24 hours, as well as any negative or zero values.
+ Removed any missing values in end latitude and longitude.
+ Filtered out entries related to **test**, **warehouse**, or **charging stations** from the **start and end station columns**.

#### Additional Details
+ In the cleaning and filtering process, removing rows containing missing values (**na**) in **end_lat** and **end_lng** was deemed acceptable due to the minimal impact on the dataset's size.
+ However, following the cleaning and filtering steps, the remaining columns with missing values (**na**) are **start_station_name**, **start_station_id**, **end_station_name**, and **end_station_id**.
+ The decision to retain these columns with missing values (**na**) was made considering the substantial number of rows that would be removed if they were filled, and the data in these columns does not necessarily require filling.

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

```{r}
trip_data_updated %>%
  group_by(user_type) %>% 
  summarise(
    ride_count = n(),
    ride_percentage = round((n() / nrow(trip_data_updated)) * 100, 2))
```
| user_type <chr> | ride_count <int> | ride_percentage <dbl> |
|-----------------|------------------|-----------------------|
| casual          | 1962711          | 35.95%                |
| member          | 3496380          | 64.05%                |

+ The table illustrates the platform's remarkable achievement in facilitating a substantial volume of rides, amounting to **5,459,091 rides** in 2023.
+ Casual users contribute to **35.95%** of the total rides, accounting for **1,962,711 rides**. While this represents a smaller proportion of bike share usage compared to member users, it still signifies a significant portion of the overall activity.
+ In contrast, member users constitute a substantial portion, representing **64.05%** of the total rides with **3,496,380 rides**.

#### Average Ride Length (minutes) by User Type

```{r}
trip_data_updated %>%
  group_by(user_type) %>% 
  summarise(
    average_ride_length = round(mean(ride_length_minute), 2))
```

| user_type <chr> | average_ride_length <dbl> |
|-----------------|---------------------------|
| casual          | 21.09 minutes             |
| member          | 12.35 minutes             |

+ The table illustrates the disparity in average ride durations between user types, offering insights into their behavioral patterns.
+ Casual users, with an average ride length of **21.09 minutes**, demonstrate a longer duration for bike rides.
+ In contrast, member users have an average ride length of **12.35 minutes**.
+ This contrast suggests that casual users may utilize the bike-sharing service for longer or leisurely trips, whereas members are more inclined to use it for shorter, routine commutes.

#### Average Ride Distances (miles) by User Type

```{r}
trip_data_updated %>% 
  group_by(user_type) %>% 
  drop_na() %>%
  summarise(
    average_ride_distance = mean(ride_distance)) %>%
  mutate(average_ride_distance = round(average_ride_distance, 2))
```

| user_type <chr> | average_ride_distance <dbl> |
|-----------------|-----------------------------|
| casual          | 1.35 miles                  |
| member          | 1.34 miles                  |

+ The table reveals a subtle contrast in the average ride distance between user types.
+ Casual users exhibit an average ride distance of **1.35 miles**.
+ Similarly, member users demonstrate an average ride distance of **1.34 miles**.
+ The marginal difference between casual and member users could be influenced by factors such as usage patterns (leisurely or practical rides), member benefits (efficiency optimization), pricing structure (incentives for shorter rides), and geographical factors (location preferences), collectively contributing to the similarity in riding behaviors observed.

--------------------------------------

### Hourly Trends

#### Hourly User Overview

```{r}
trip_data_updated %>% 
  group_by(user_type, hour) %>% 
  summarise(
    ride_count = n(), .groups = "drop") %>%
  arrange(user_type, hour)
```

<table> <tr><td>

| user_type <chr> | hour <int> | ride_count <int> |
|-----------------|------------|------------------|
| casual          | 0          | 34844            |
| casual          | 1          | 22549            |
| casual          | 2          | 13691            |
| casual          | 3          | 7558             |
| casual          | 4          | 5709             |
| casual          | 5          | 11009            |
| casual          | 6          | 29025            |
| casual          | 7          | 50856            |
| casual          | 8          | 67676            |
| casual          | 9          | 66967            |
| casual          | 10         | 82895            |
| casual          | 11         | 105442           |
| casual          | 12         | 124917           |
| casual          | 13         | 130488           |
| casual          | 14         | 136098           |
| casual          | 15         | 151874           |
| casual          | 16         | 174019           |
| casual          | 17         | 189792           |
| casual          | 18         | 163793           |
| casual          | 19         | 121001           |
| casual          | 20         | 87576            |
| casual          | 21         | 73419            |
| casual          | 22         | 64833            |
| casual          | 23         | 46680            |

</td><td>

| user_type <chr> | hour <int> | ride_count <int> |
|-----------------|------------|------------------|
| member          | 0          | 33771            |
| member          | 1          | 20139            |
| member          | 2          | 11708            |
| member          | 3          | 7627             |
| member          | 4          | 8400             |
| member          | 5          | 32840            |
| member          | 6          | 101051           |
| member          | 7          | 187006           |
| member          | 8          | 233898           |
| member          | 9          | 157561           |
| member          | 10         | 142027           |
| member          | 11         | 168405           |
| member          | 12         | 190928           |
| member          | 13         | 189825           |
| member          | 14         | 192505           |
| member          | 15         | 235473           |
| member          | 16         | 316867           |
| member          | 17         | 370438           |
| member          | 18         | 293345           |
| member          | 19         | 207690           |
| member          | 20         | 144825           |
| member          | 21         | 112372           |
| member          | 22         | 83933            |
| member          | 23         | 53746            |

</td></tr> </table>

+ The table illustrates clear trends in bicycle usage among casual and member users at different times of the day.
+ Casual users peak between 3 PM and 6 PM with the highest number of rides occurring at **5 PM (189,792 rides)**.
+ Their usage drops during late night and early morning hours, reaching its lowest point at **4 AM (5,709 rides)**, suggesting a preference for using bikes outside of work or commuting times and for more leisure activities.
+ Member users, peak usage occurs between 4 PM and 6 PM, with the highest number of rides at **5 PM (370,438 rides)**. They utilize the service for both commuting and non-commuting purposes throughout the day.
+ Similar to casual users, member users also experience a drop in usage during late night and early morning hours, with the lowest point at **3 AM (7,627 rides)**. 
+ Casual users tend to enjoy riding bikes for leisure during the afternoon, while member users utilize them for both commuting and leisure. Both groups ride less during the late night and early morning hours.

#### Hourly Average Ride Length (minutes)

```{r}
trip_data_updated %>% 
  group_by(user_type, hour) %>% 
  summarise(
    average_ride_length = round(mean(ride_length_minute), 2), .groups="drop") %>%
  arrange(user_type, hour)
```

<table> <tr><td>
 
| user_type <chr> | hour <int> | average_ride_length <dbl> |
|-----------------|------------|---------------------------|
| casual          | 0          | 18.68 minutes             |
| casual          | 1          | 18.61 minutes             |
| casual          | 2          | 18.40 minutes             |
| casual          | 3          | 18.32 minutes             |
| casual          | 4          | 16.02 minutes             |
| casual          | 5          | 13.85 minutes             |
| casual          | 6          | 14.98 minutes             |
| casual          | 7          | 14.17 minutes             |
| casual          | 8          | 15.75 minutes             |
| casual          | 9          | 20.86 minutes             |
| casual          | 10         | 24.39 minutes             |
| casual          | 11         | 25.37 minutes             |
| casual          | 12         | 24.77 minutes             |
| casual          | 13         | 24.40 minutes             |
| casual          | 14         | 24.56 minutes             |
| casual          | 15         | 22.93 minutes             |
| casual          | 16         | 21.11 minutes             |
| casual          | 17         | 20.16 minutes             |
| casual          | 18         | 19.96 minutes             |
| casual          | 19         | 19.74 minutes             |
| casual          | 20         | 19.05 minutes             |
| casual          | 21         | 18.56 minutes             |
| casual          | 22         | 18.82 minutes             |
| casual          | 23         | 18.43 minutes             |
 
</td><td>
 
| user_type <chr> | hour <int> | average_ride_length <dbl> |
|-----------------|------------|---------------------------|
| member          | 0          | 11.66 minutes             |
| member          | 1          | 12.16 minutes             |
| member          | 2          | 12.28 minutes             |
| member          | 3          | 12.70 minutes             |
| member          | 4          | 12.14 minutes             |
| member          | 5          | 10.21 minutes             |
| member          | 6          | 10.68 minutes             |
| member          | 7          | 11.16 minutes             |
| member          | 8          | 11.30 minutes             |
| member          | 9          | 11.54 minutes             |
| member          | 10         | 12.40 minutes             |
| member          | 11         | 12.70 minutes             |
| member          | 12         | 12.36 minutes             |
| member          | 13         | 12.29 minutes             |
| member          | 14         | 12.74 minutes             |
| member          | 15         | 12.69 minutes             |
| member          | 16         | 12.88 minutes             |
| member          | 17         | 13.15 minutes             |
| member          | 18         | 12.98 minutes             |
| member          | 19         | 12.64 minutes             |
| member          | 20         | 12.31 minutes             |
| member          | 21         | 12.20 minutes             |
| member          | 22         | 12.19 minutes             |
| member          | 23         | 12.18 minutes             |

</td></tr> </table>

+ The table highlights noticeable variances in the duration of rides between casual and member users across various times of the day.
+ Casual users exhibit significant variation in ride duration throughout the day, with the shortest rides averaging in the early morning at **5 AM (13.85 minutes)** and peaking during the midday at **11 AM (25.37 minutes)**. This peak occurs between 10 AM and 2 PM. Despite a gradual decline afterward, ride lengths remain relatively high compared to those in the early morning hours.
+ In contrast, member users maintain consistent average ride lengths throughout the day, the lowest in the early morning at **5 AM (10.21 minutes)** to the highest during evening rush hours at **5 PM (13.15 minutes)**.
+ Unlike casual users, members exhibit minimal fluctuations in ride duration, with generally shorter averages. Casual users tend to have longer durations compared to members, particularly evident during midday.

#### Hourly Average Ride Distance (miles)

```{r}
trip_data_updated %>% 
  group_by(user_type, hour) %>% 
  summarise(
    average_ride_distance = mean(ride_distance),
    .groups = 'drop'
  ) %>%
  mutate(average_ride_distance = round(average_ride_distance, 2))
```

<table> <tr><td>

| user_type <chr> | hour <int> | average_ride_distance <dbl> |
|-----------------|------------|-----------------------------|
| casual          | 0          | 1.21 miles                  |
| casual          | 1          | 1.23 miles                  |
| casual          | 2          | 1.26 miles                  |
| casual          | 3          | 1.29 miles                  |
| casual          | 4          | 1.37 miles                  |
| casual          | 5          | 1.23 miles                  |
| casual          | 6          | 1.28 miles                  |
| casual          | 7          | 1.30 miles                  |
| casual          | 8          | 1.27 miles                  |
| casual          | 9          | 1.31 miles                  |
| casual          | 10         | 1.39 miles                  |
| casual          | 11         | 1.43 miles                  |
| casual          | 12         | 1.39 miles                  |
| casual          | 13         | 1.39 miles                  |
| casual          | 14         | 1.38 miles                  |
| casual          | 15         | 1.39 miles                  |
| casual          | 16         | 1.39 miles                  |
| casual          | 17         | 1.42 miles                  |
| casual          | 18         | 1.39 miles                  |
| casual          | 19         | 1.26 miles                  |
| casual          | 20         | 1.23 miles                  |
| casual          | 21         | 1.27 miles                  |
| casual          | 22         | 1.33 miles                  |
| casual          | 23         | 1.29 miles                  |

</td><td>

| user_type <chr> | hour <int> | average_ride_distance <dbl> |
|-----------------|------------|-----------------------------|
| member          | 0          | 1.34 miles                  |
| member          | 1          | 1.30 miles                  |
| member          | 2          | 1.32 miles                  |
| member          | 3          | 1.37 miles                  |
| member          | 4          | 1.49 miles                  |
| member          | 5          | 1.35 miles                  |
| member          | 6          | 1.40 miles                  |
| member          | 7          | 1.43 miles                  |
| member          | 8          | 1.37 miles                  |
| member          | 9          | 1.31 miles                  |
| member          | 10         | 1.29 miles                  |
| member          | 11         | 1.26 miles                  |
| member          | 12         | 1.24 miles                  |
| member          | 13         | 1.26 miles                  |
| member          | 14         | 1.32 miles                  |
| member          | 15         | 1.35 miles                  |
| member          | 16         | 1.41 miles                  |
| member          | 17         | 1.42 miles                  |
| member          | 18         | 1.36 miles                  |
| member          | 19         | 1.30 miles                  |
| member          | 20         | 1.28 miles                  |
| member          | 21         | 1.33 miles                  |
| member          | 22         | 1.39 miles                  |
| member          | 23         | 1.38 miles                  |

</td></tr> </table>

+ The table provides observations on the average duration of bike rides undertaken by both casual and member users throughout the day.
+ Casual users maintain consistent average ride distances throughout the day, from its lowest at **12 AM (1.21 miles)** to its highest at **11 AM (1.43 miles)**. There's a slight peak in the late morning, with minimal fluctuations otherwise.
+ Similarly, member users also exhibit consistency, ranging from its lowest at **12 PM (1.24 miles)** to its highest at **4 PM (1.49 miles)**, with slight variations throughout the day.
+ Both user types show consistent patterns with slight variations in ride durations throughout the day. Casual users display a slightly wider range of distances compared to members, with similar trends of increased distances during certain hours.

--------------------------------------

### Weekly Trends

#### Weekly User Overview

```{r}
trip_data_updated$day_of_week <- ordered(
  trip_data_updated$day_of_week, 
  levels = c(
    "Monday", 
    "Tuesday", 
    "Wednesday", 
    "Thursday", 
    "Friday", 
    "Saturday",
    "Sunday"))

trip_data_updated %>% 
  group_by(user_type, day_of_week) %>%
  summarise(
    ride_count = n(), .groups="drop") %>% 
    arrange(user_type, day_of_week)
```

<table> <tr><td>

| user_type <chr> | day_of_week <ord> | ride_count <int> |
|-----------------|-------------------|------------------|
| casual          | Monday            | 224302           |
| casual          | Tuesday           | 235148           |
| casual          | Wednesday         | 237797           |
| casual          | Thursday          | 257975           |
| casual          | Friday            | 297169           |
| casual          | Saturday          | 390879           |
| casual          | Sunday            | 319441           |

</td><td>

| user_type <chr> | day_of_week <ord> | ride_count <int> |
|-----------------|-------------------|------------------|
| member          | Monday            | 473704           |
| member          | Tuesday           | 551725           |
| member          | Wednesday         | 560755           |
| member          | Thursday          | 562529           |
| member          | Friday            | 507261           |
| member          | Saturday          | 450327           |
| member          | Sunday            | 390079           |

</td></tr> </table>

+ The table highlights intriguing patterns in user numbers for both casual and member users over the course of the week.
+ Casual users tend to peak in rides on **Saturdays (390,879 rides)**, indicating a preference for leisure or recreational activities during weekends. 
+ Conversely, their lowest ride count is on **Mondays (224,302 rides)**, reflecting decreased usage at the beginning of the week after the weekend rush.
+ Member users, on the other hand, show their highest ride count on **Thursdays (562,529 rides)**, suggesting a focus on commuting during weekdays. 
+ Similarly, their lowest ride count is on **Sundays (390,079 rides)**, following the trend of decreased usage at the end of the weekend.
+ Both casual and member users exhibit lower usage at the beginning of the week, with casual users showing the lowest usage on Mondays and member users showing the lowest usage on Sundays. This decrease in usage could be attributed to the transition from the weekends to weekdays.

#### Weekly Average Ride Length (minutes)

```{r}
trip_data_updated$day_of_week <- ordered(
  trip_data_updated$day_of_week, 
  levels = c(
    "Monday", 
    "Tuesday", 
    "Wednesday", 
    "Thursday", 
    "Friday", 
    "Saturday",
    "Sunday"))

ride length by user type and day of the week
trip_data_updated %>% 
  group_by(user_type, day_of_week) %>% 
  summarise(
    average_ride_length = round(mean(ride_length_minute), 2), 
    .groups = "drop")
```

<table> <tr><td>

| user_type <chr> | day_of_week <ord> | average_ride_length <dbl> |
|-----------------|-------------------|---------------------------|
| casual          | Monday            | 20.73 minutes             |
| casual          | Tuesday           | 18.84 minutes             |
| casual          | Wednesday         | 18.04 minutes             |
| casual          | Thursday          | 18.39 minutes             |
| casual          | Friday            | 20.49 minutes             |
| casual          | Saturday          | 23.89 minutes             |
| casual          | Sunday            | 24.58 minutes             |

</td><td>

| user_type <chr> | day_of_week <ord> | average_ride_length <dbl> |
|-----------------|-------------------|---------------------------|
| member          | Monday            | 11.72 minutes             |
| member          | Tuesday           | 11.86 minutes             |
| member          | Wednesday         | 11.78 minutes             |
| member          | Thursday          | 11.88 minutes             |
| member          | Friday            | 12.29 minutes             |
| member          | Saturday          | 13.76 minutes             |
| member          | Sunday            | 13.79 minutes             |

</td></tr> </table>

+ The table displays the fluctuations in average ride durations according to user type and day of the week.
+ Casual users, trend supports the notion of weekend leisure or recreational activities, with **Sundays (24.58 minutes)** recording the lengthiest rides.
+ Transitioning from the weekends to weekdays, **Wednesdays (18.04 minutes)** mark the lowest typical ride durations for casual users, indicating a shift towards shorter trips during the middle of the week.
+ Conversely, member users also exhibit longer rides on **Sundays (13.79 minutes)**, suggesting a potential overlap in non-commuting usage during weekends.
+ However, member users experience their shortest rides on **Mondays (11.72 minutes)**, possibly indicating a return to routine commuting after the weekend.
+ Overall, both user groups display a pattern of shorter ride durations during weekdays, likely influenced by commuting needs or time constraints.

#### Weekly Average Ride Distance (miles)

```{r}
trip_data_updated$day_of_week <- ordered(
  trip_data_updated$day_of_week, 
  levels = c(
    "Monday", 
    "Tuesday", 
    "Wednesday", 
    "Thursday", 
    "Friday", 
    "Saturday",
    "Sunday"))

trip_data_updated %>% 
  group_by(user_type, day_of_week) %>% 
  summarise(
    average_ride_distance = mean(ride_distance),
    .groups = 'drop'
  ) %>%
  mutate(average_ride_distance = round(average_ride_distance, 2))
```

<table> <tr><td>

| user_type <chr> | day_of_week <ord> | average_ride_distance <dbl> |
|-----------------|-------------------|-----------------------------|
| casual          | Monday            | 1.32 miles                  |
| casual          | Tuesday           | 1.31 miles                  |
| casual          | Wednesday         | 1.30 miles                  |
| casual          | Thursday          | 1.32 miles                  |
| casual          | Friday            | 1.35 miles                  |
| casual          | Saturday          | 1.42 miles                  |
| casual          | Sunday            | 1.39 miles                  |

</td><td>

| user_type <chr> | day_of_week <ord> | average_ride_distance <dbl> |
|-----------------|-------------------|-----------------------------|
| member          | Monday            | 1.30 miles                  |
| member          | Tuesday           | 1.34 miles                  |
| member          | Wednesday         | 1.34 miles                  |
| member          | Thursday          | 1.34 miles                  |
| member          | Friday            | 1.32 miles                  |
| member          | Saturday          | 1.40 miles                  |
| member          | Sunday            | 1.38 miles                  |

</td></tr> </table>

+ The table provides insights into the usage patterns of casual and member users throughout the week, comparing average ride distances.
+ Casual users covering the longest distance per ride on **Saturday (1.42 miles)** wheras there shorest rides occur on **Wednesdays (1.30 miles)**.
+ Similarly, member users longest distance per ride also falls on **Saturday(1.40 miles**) but the shortest rides occur on **Mondays (1.30 miles)**.
+ This suggests a preference for longer rides on weekends, potentially for leisure or recreational purposes and indicating a trend towards shorter rides at the beginning of the week.
+ Casual users typically enjoy slightly longer distances per ride compared to member users throughout the week.
+ Overall, distances covered per ride remain relatively consistent during weekdays for both casual and member users, likely reflecting commuting or transportation needs.

--------------------------------------

### Weekly Bike Demand Patterns and Hourly Usage Trends

#### Monday Hourly Bike Demands

```{r}
trip_data_updated %>%
  filter(day_of_week == "Monday") %>% 
  group_by(day_of_week, hour, user_type) %>%
  summarise(
    ride_count = n(), .groups = "drop") %>% 
  arrange(user_type)
```

<table> <tr><td>

| day_of_week <ord> | hour <int> | user_type <chr> | ride_count <int> |
|-------------------|------------|-----------------|------------------|
| Monday            | 0          | casual          | 3098             |
| Monday            | 1          | casual          | 1812             |
| Monday            | 2          | casual          | 1021             |
| Monday            | 3          | casual          | 749              |
| Monday            | 4          | casual          | 707              |
| Monday            | 5          | casual          | 1604             |
| Monday            | 6          | casual          | 3777             |
| Monday            | 7          | casual          | 6794             |
| Monday            | 8          | casual          | 8697             |
| Monday            | 9          | casual          | 7717             |
| Monday            | 10         | casual          | 9148             |
| Monday            | 11         | casual          | 11494            |
| Monday            | 12         | casual          | 13983            |
| Monday            | 13         | casual          | 14685            |
| Monday            | 14         | casual          | 15156            |
| Monday            | 15         | casual          | 17467            |
| Monday            | 16         | casual          | 20511            |
| Monday            | 17         | casual          | 23473            |
| Monday            | 18         | casual          | 19742            |
| Monday            | 19         | casual          | 14975            |
| Monday            | 20         | casual          | 10764            |
| Monday            | 21         | casual          | 7724             |
| Monday            | 22         | casual          | 5707             |
| Monday            | 23         | casual          | 3497             |

</td><td>

| day_of_week <ord> | hour <int> | user_type <chr> | ride_count <int> |
|-------------------|------------|-----------------|------------------|
| Monday            | 0          | member          | 2955             |
| Monday            | 1          | member          | 1482             |
| Monday            | 2          | member          | 1010             |
| Monday            | 3          | member          | 771              |
| Monday            | 4          | member          | 1092             |
| Monday            | 5          | member          | 5126             |
| Monday            | 6          | member          | 16223            |
| Monday            | 7          | member          | 28712            |
| Monday            | 8          | member          | 35163            |
| Monday            | 9          | member          | 20339            |
| Monday            | 10         | member          | 16570            |
| Monday            | 11         | member          | 20052            |
| Monday            | 12         | member          | 23340            |
| Monday            | 13         | member          | 23073            |
| Monday            | 14         | member          | 23711            |
| Monday            | 15         | member          | 30409            |
| Monday            | 16         | member          | 44819            |
| Monday            | 17         | member          | 56037            |
| Monday            | 18         | member          | 43591            |
| Monday            | 19         | member          | 30283            |
| Monday            | 20         | member          | 20642            |
| Monday            | 21         | member          | 14512            |
| Monday            | 22         | member          | 8887             |
| Monday            | 23         | member          | 4905             |

</td></tr> </table>

+ The table showcases the hourly ride frequencies for casual and member users on Mondays, revealing unique usage patterns and demand disparities between the user categories across the day.
+ Casual users show a peak ride count at **5 PM (23,473 rides)**, indicating a preference for late afternoon rides, likely for recreation. 
+ Conversely, their lowest ride count is at **4 AM (707 rides)**, reflecting reduced bike usage during late night and early morning hours.
+ Member users also exhibit a peak ride count at **5 PM (56,037 rides)**, suggesting a preference for late afternoon rides, possibly for commuting. 
+ Their lowest ride count is at **3 AM (771 rides**), aligning with the pattern of reduced usage during late night and early morning hours.
+ Both casual and member users share a common trend of peak bike usage around late afternoon, indicating a universal preference for this time regardless of user type. 
+ This preference may be influenced by factors such as favorable weather conditions and leisure time post-work.

#### Tuesday Hourly Bike Demands

```{r}
trip_data_updated %>%
  filter(day_of_week == "Tuesday") %>% 
  group_by(day_of_week, hour, user_type) %>%
  summarise(
    ride_count = n(), .groups = "drop") %>% 
  arrange(user_type)
```

<table> <tr><td>

| day_of_week <ord> | hour <int> | user_type <chr> | ride_count <int> |
|-------------------|------------|-----------------|------------------|
| Tuesday           | 0          | casual          | 2327             |
| Tuesday           | 1          | casual          | 1335             |
| Tuesday           | 2          | casual          | 827              |
| Tuesday           | 3          | casual          | 515              |
| Tuesday           | 4          | casual          | 595              |
| Tuesday           | 5          | casual          | 1676             |
| Tuesday           | 6          | casual          | 4816             |
| Tuesday           | 7          | casual          | 9084             |
| Tuesday           | 8          | casual          | 11272            |
| Tuesday           | 9          | casual          | 7902             |
| Tuesday           | 10         | casual          | 7992             |
| Tuesday           | 11         | casual          | 10215            |
| Tuesday           | 12         | casual          | 12182            |
| Tuesday           | 13         | casual          | 12326            |
| Tuesday           | 14         | casual          | 13282            |
| Tuesday           | 15         | casual          | 16091            |
| Tuesday           | 16         | casual          | 22358            |
| Tuesday           | 17         | casual          | 27417            |
| Tuesday           | 18         | casual          | 23035            |
| Tuesday           | 19         | casual          | 16216            |
| Tuesday           | 20         | casual          | 11878            |
| Tuesday           | 21         | casual          | 9929             |
| Tuesday           | 22         | casual          | 7664             |
| Tuesday           | 23         | casual          | 4214             |

</td><td>

| day_of_week <ord> | hour <int> | user_type <chr> | ride_count <int> |
|-------------------|------------|-----------------|------------------|
| Tuesday           | 0          | member          | 2529             |
| Tuesday           | 1          | member          | 1211             |
| Tuesday           | 2          | member          | 772              |
| Tuesday           | 3          | member          | 604              |
| Tuesday           | 4          | member          | 1172             |
| Tuesday           | 5          | member          | 6399             |
| Tuesday           | 6          | member          | 20403            |
| Tuesday           | 7          | member          | 39245            |
| Tuesday           | 8          | member          | 47348            |
| Tuesday           | 9          | member          | 24240            |
| Tuesday           | 10         | member          | 17651            |
| Tuesday           | 11         | member          | 20396            |
| Tuesday           | 12         | member          | 23974            |
| Tuesday           | 13         | member          | 23062            |
| Tuesday           | 14         | member          | 23683            |
| Tuesday           | 15         | member          | 33513            |
| Tuesday           | 16         | member          | 54627            |
| Tuesday           | 17         | member          | 68247            |
| Tuesday           | 18         | member          | 50132            |
| Tuesday           | 19         | member          | 34112            |
| Tuesday           | 20         | member          | 23214            |
| Tuesday           | 21         | member          | 17831            |
| Tuesday           | 22         | member          | 11577            |
| Tuesday           | 23         | member          | 5783             |

</td></tr> </table>

+ The table illustrates the hourly ride frequencies for both casual and member users on Tuesday, highlighting distinct usage patterns and demand variances between the user categories throughout the day.
+ Casual users show the highest ride count at **5 PM (27,417 rides)**, indicating a preference for late afternoon rides, potentially for leisure or recreation. 
+ Conversely, their lowest ride count occurs at **3 AM (515 rides)**, suggesting a notable decline in bike usage during late night and early morning hours, as anticipated.
+ Similarly, member users also exhibit their peak ride count at **5 PM (68,247 rides)**, echoing the trend observed among casual users and indicating a preference for late afternoon rides, likely for commuting purposes. 
+ Their lowest ride count is recorded at **3 AM (604 rides)**, aligning with the observed pattern of reduced bike usage during late night and early morning hours.
+ Both casual and member users demonstrate a surge in bike usage during the late afternoon, indicating a shared preference for this time regardless of user type.
+ Several factors contribute to this trend, including favorable weather conditions, leisure time post-work, and commuting needs. 
+ Reduced bike usage during late night and early morning hours persists across user types, possibly influenced by diminished visibility, maintenance schedules, and security considerations around biking at night.

#### Wednesday Hourly Bike Demands

```{r}
trip_data_updated %>%
  filter(day_of_week == "Wednesday") %>% 
  group_by(day_of_week, hour, user_type) %>%
  summarise(
    ride_count = n(), .groups = "drop") %>% 
  arrange(user_type)
```

<table> <tr><td>

| day_of_week <ord> | hour <int> | user_type <chr> | ride_count <int> |
|-------------------|------------|-----------------|------------------|
| Wednesday         | 0          | casual          | 2519             |
| Wednesday         | 1          | casual          | 1403             |
| Wednesday         | 2          | casual          | 888              |
| Wednesday         | 3          | casual          | 565              |
| Wednesday         | 4          | casual          | 612              |
| Wednesday         | 5          | casual          | 1733             |
| Wednesday         | 6          | casual          | 4692             |
| Wednesday         | 7          | casual          | 9328             |
| Wednesday         | 8          | casual          | 11788            |
| Wednesday         | 9          | casual          | 7981             |
| Wednesday         | 10         | casual          | 7508             |
| Wednesday         | 11         | casual          | 9692             |
| Wednesday         | 12         | casual          | 11614            |
| Wednesday         | 13         | casual          | 11965            |
| Wednesday         | 14         | casual          | 12991            |
| Wednesday         | 15         | casual          | 15945            |
| Wednesday         | 16         | casual          | 22038            |
| Wednesday         | 17         | casual          | 28554            |
| Wednesday         | 18         | casual          | 23257            |
| Wednesday         | 19         | casual          | 16698            |
| Wednesday         | 20         | casual          | 11961            |
| Wednesday         | 21         | casual          | 10747            |
| Wednesday         | 22         | casual          | 8333             |
| Wednesday         | 23         | casual          | 4985             |

</td><td>

| day_of_week <ord> | hour <int> | user_type <chr> | ride_count <int> |
|-------------------|------------|-----------------|------------------|
| Wednesday         | 0          | member          | 2889             |
| Wednesday         | 1          | member          | 1458             |
| Wednesday         | 2          | member          | 737              |
| Wednesday         | 3          | member          | 605              |
| Wednesday         | 4          | member          | 1136             |
| Wednesday         | 5          | member          | 6488             |
| Wednesday         | 6          | member          | 19728            |
| Wednesday         | 7          | member          | 39161            |
| Wednesday         | 8          | member          | 47193            |
| Wednesday         | 9          | member          | 24699            |
| Wednesday         | 10         | member          | 17863            |
| Wednesday         | 11         | member          | 21480            |
| Wednesday         | 12         | member          | 25002            |
| Wednesday         | 13         | member          | 24732            |
| Wednesday         | 14         | member          | 25385            |
| Wednesday         | 15         | member          | 34401            |
| Wednesday         | 16         | member          | 55178            |
| Wednesday         | 17         | member          | 68364            |
| Wednesday         | 18         | member          | 49489            |
| Wednesday         | 19         | member          | 33679            |
| Wednesday         | 20         | member          | 23505            |
| Wednesday         | 21         | member          | 18419            |
| Wednesday         | 22         | member          | 12454            |
| Wednesday         | 23         | member          | 6710             |

</td></tr> </table>

+ The table presents hourly ride frequencies for both casual and member users on Wednesday, highlighting distinct usage patterns and demand variations between the user categories throughout the day.
+ Casual users demonstrate the highest ride count at **5 PM (28,554 rides)**, suggesting a preference for late afternoon rides, possibly for leisure or recreation.
+ Their ride count drops significantly at **3 AM (565 rides)**, indicating reduced bike usage during late night and early morning hours.
+ Member users also peak at **5 PM (68,364 rides)**, mirroring the trend seen among casual users and indicating a preference for late afternoon rides, potentially for commuting. 
+ At **3 AM (605 rides)**, their ride count decreases aligning with the observed pattern of reduced bike usage during late night and early morning hours.
+ Both casual and member users exhibit a peak in bike usage around late afternoon on Wednesday, emphasizing a shared preference for this time regardless of user type.
+ Contributing factors to this peak in bike usage during late afternoon hours may include favorable weather conditions, post-work leisure time, and commuting needs. 
+ Consistent with safety considerations and limited transportation options, reduced bike usage persists during late night and early morning hours across user types.

#### Thursday Hourly Bike Demands

```{r}
trip_data_updated %>%
  filter(day_of_week == "Thursday") %>% 
  group_by(day_of_week, hour, user_type) %>%
  summarise(
    ride_count = n(), .groups = "drop") %>% 
  arrange(user_type)
```

<table> <tr><td>

| day_of_week <ord> | hour <int> | user_type <chr> | ride_count <int> |
|-------------------|------------|-----------------|------------------|
| Thursday          | 0          | casual          | 2753             |
| Thursday          | 1          | casual          | 1534             |
| Thursday          | 2          | casual          | 1019             |
| Thursday          | 3          | casual          | 571              |
| Thursday          | 4          | casual          | 552              |
| Thursday          | 5          | casual          | 1618             |
| Thursday          | 6          | casual          | 4699             |
| Thursday          | 7          | casual          | 8868             |
| Thursday          | 8          | casual          | 11511            |
| Thursday          | 9          | casual          | 8307             |
| Thursday          | 10         | casual          | 8531             |
| Thursday          | 11         | casual          | 10558            |
| Thursday          | 12         | casual          | 12853            |
| Thursday          | 13         | casual          | 13382            |
| Thursday          | 14         | casual          | 14021            |
| Thursday          | 15         | casual          | 17293            |
| Thursday          | 16         | casual          | 23183            |
| Thursday          | 17         | casual          | 29436            |
| Thursday          | 18         | casual          | 26361            |
| Thursday          | 19         | casual          | 18809            |
| Thursday          | 20         | casual          | 13420            |
| Thursday          | 21         | casual          | 11389            |
| Thursday          | 22         | casual          | 10861            |
| Thursday          | 23         | casual          | 6446             |

</td><td>

| day_of_week <ord> | hour <int> | user_type <chr> | ride_count <int> |
|-------------------|------------|-----------------|------------------|
| Thursday          | 0          | member          | 3424             |
| Thursday          | 1          | member          | 1583             |
| Thursday          | 2          | member          | 884              |
| Thursday          | 3          | member          | 677              |
| Thursday          | 4          | member          | 1143             |
| Thursday          | 5          | member          | 5896             |
| Thursday          | 6          | member          | 18732            |
| Thursday          | 7          | member          | 36704            |
| Thursday          | 8          | member          | 44963            |
| Thursday          | 9          | member          | 25645            |
| Thursday          | 10         | member          | 18527            |
| Thursday          | 11         | member          | 21709            |
| Thursday          | 12         | member          | 25627            |
| Thursday          | 13         | member          | 25405            |
| Thursday          | 14         | member          | 25188            |
| Thursday          | 15         | member          | 34498            |
| Thursday          | 16         | member          | 52145            |
| Thursday          | 17         | member          | 66308            |
| Thursday          | 18         | member          | 51531            |
| Thursday          | 19         | member          | 35083            |
| Thursday          | 20         | member          | 23879            |
| Thursday          | 21         | member          | 19197            |
| Thursday          | 22         | member          | 15161            |
| Thursday          | 23         | member          | 8620             |

</td></tr> </table>

+ The provided table details the hourly usage patterns of both casual and member users on Thursday, delineating notable differences in ride frequencies between the two user categories throughout the day.
+ Casual users exhibit the highest ride count, at **5 PM (29,436 rides)**, indicating a preference for late afternoon rides, potentially for recreational purposes. 
+ Conversely, their lowest ride count, is recorded at **4 AM (552 rides)**, implying decreased bike usage during the late night and early morning hours.
+ Member users also peak at **5 PM (66,308 rides)**, mirroring the trend observed among casual users and suggesting a preference for late afternoon rides, likely for commuting reasons. 
+ Their lowest ride count, is observed at **3 AM (677 rides**, aligning with the trend of reduced bike usage during late night and early morning hours.
+ Both casual and member users display a notable increase in bike usage during the late afternoon on Thursday, reflecting a collective preference for this time regardless of user type.
+ Consistently lower bike usage during late night and early morning hours across user types may imply a diminished demand for transportation during those specific times, possibly reflecting fewer individuals commuting or participating in leisure activities.

#### Friday Hourly Bike Demands

```{r}
trip_data_updated %>%
  filter(day_of_week == "Friday") %>% 
  group_by(day_of_week, hour, user_type) %>%
  summarise(
    ride_count = n(), .groups = "drop") %>% 
  arrange(user_type)
```

<table> <tr><td>

| day_of_week <ord> | hour <int> | user_type <chr> | ride_count <int> |
|-------------------|------------|-----------------|------------------|
| Friday            | 0          | casual          | 4137             |
| Friday            | 1          | casual          | 2614             |
| Friday            | 2          | casual          | 1358             |
| Friday            | 3          | casual          | 845              |
| Friday            | 4          | casual          | 702              |
| Friday            | 5          | casual          | 1696             |
| Friday            | 6          | casual          | 6390             |
| Friday            | 7          | casual          | 8697             |
| Friday            | 8          | casual          | 9528             |
| Friday            | 9          | casual          | 8691             |
| Friday            | 10         | casual          | 10425            |
| Friday            | 11         | casual          | 14119            |
| Friday            | 12         | casual          | 18124            |
| Friday            | 13         | casual          | 18754            |
| Friday            | 14         | casual          | 20020            |
| Friday            | 15         | casual          | 23385            |
| Friday            | 16         | casual          | 27108            |
| Friday            | 17         | casual          | 29007            |
| Friday            | 18         | casual          | 25706            |
| Friday            | 19         | casual          | 18832            |
| Friday            | 20         | casual          | 13670            |
| Friday            | 21         | casual          | 11572            |
| Friday            | 22         | casual          | 11400            |
| Friday            | 23         | casual          | 10389            |

</td><td>

| day_of_week <ord> | hour <int> | user_type <chr> | ride_count <int> |
|-------------------|------------|-----------------|------------------|
| Friday            | 0          | member          | 4546             |
| Friday            | 1          | member          | 2417             |
| Friday            | 2          | member          | 1306             |
| Friday            | 3          | member          | 980              |
| Friday            | 4          | member          | 1248             |
| Friday            | 5          | member          | 5042             |
| Friday            | 6          | member          | 16502            |
| Friday            | 7          | member          | 26806            |
| Friday            | 8          | member          | 31301            |
| Friday            | 9          | member          | 20796            |
| Friday            | 10         | member          | 18227            |
| Friday            | 11         | member          | 23567            |
| Friday            | 12         | member          | 28164            |
| Friday            | 13         | member          | 29002            |
| Friday            | 14         | member          | 29907            |
| Friday            | 15         | member          | 37332            |
| Friday            | 16         | member          | 46703            |
| Friday            | 17         | member          | 50857            |
| Friday            | 18         | member          | 42150            |
| Friday            | 19         | member          | 29660            |
| Friday            | 20         | member          | 20550            |
| Friday            | 21         | member          | 15834            |
| Friday            | 22         | member          | 13567            |
| Friday            | 23         | member          | 10797            |

</td></tr> </table>

+ The provided table showcases the hourly utilization patterns of both casual and member users on Friday, revealing notable fluctuations in ride frequencies between the two user groups throughout the day.
+ Casual users reach their peak ride count at **5 PM (29,007 rides)**, indicating a preference for late afternoon biking, possibly for recreational purposes. 
+ Conversely, their lowest ride occurs at **4 AM (702 rides)**, suggesting decreased bike usage during the early morning hours.
+ Similarly, member users also hit their peak at **5 PM (50,857 rides)**, echoing the trend observed among casual users and suggesting a preference for late afternoon rides, potentially for commuting. 
+ Their lowest ride count is at **3 AM (980 rides)**, aligning with the pattern of reduced bike usage during the late night and early morning hours.
+ Friday witnesses a surge in bike usage during the late afternoon for both casual and member users, underscoring a shared preference for this time slot regardless of user type.
+ Factors such as favorable weather conditions, opportunities for post-work leisure, and commuting demands likely contribute to the increase in bike usage during late afternoon hours on Fridays.
+ The consistent trend of reduced bike usage during late night and early morning hours persists across user types on Fridays, possibly due to a higher likelihood of individuals working remotely or having flexible schedules, leading to fewer commuting trips and overall outdoor activity.

#### Saturday Hourly Bike Demands

```{r}
trip_data_updated %>%
  filter(day_of_week == "Saturday") %>% 
  group_by(day_of_week, hour, user_type) %>%
  summarise(
    ride_count = n(), .groups = "drop") %>% 
  arrange(user_type)
```

<table> <tr><td>

| day_of_week <ord> | hour <int> | user_type <chr> | ride_count <int> |
|-------------------|------------|-----------------|------------------|
| Saturday          | 0          | casual          | 9030             |
| Saturday          | 1          | casual          | 6884             |
| Saturday          | 2          | casual          | 3935             |
| Saturday          | 3          | casual          | 2032             |
| Saturday          | 4          | casual          | 1028             |
| Saturday          | 5          | casual          | 1286             |
| Saturday          | 6          | casual          | 2370             |
| Saturday          | 7          | casual          | 4316             |
| Saturday          | 8          | casual          | 8451             |
| Saturday          | 9          | casual          | 14326            |
| Saturday          | 10         | casual          | 20853            |
| Saturday          | 11         | casual          | 26083            |
| Saturday          | 12         | casual          | 29902            |
| Saturday          | 13         | casual          | 31971            |
| Saturday          | 14         | casual          | 32131            |
| Saturday          | 15         | casual          | 32646            |
| Saturday          | 16         | casual          | 31969            |
| Saturday          | 17         | casual          | 29260            |
| Saturday          | 18         | casual          | 26111            |
| Saturday          | 19         | casual          | 20652            |
| Saturday          | 20         | casual          | 15508            |
| Saturday          | 21         | casual          | 13609            |
| Saturday          | 22         | casual          | 14049            |
| Saturday          | 23         | casual          | 12477            |

</td><td>

| day_of_week <ord> | hour <int> | user_type <chr> | ride_count <int> |
|-------------------|------------|-----------------|------------------|
| Saturday          | 0          | member          | 8275             |
| Saturday          | 1          | member          | 5986             |
| Saturday          | 2          | member          | 3275             |
| Saturday          | 3          | member          | 1914             |
| Saturday          | 4          | member          | 1104             |
| Saturday          | 5          | member          | 1981             |
| Saturday          | 6          | member          | 5198             |
| Saturday          | 7          | member          | 9275             |
| Saturday          | 8          | member          | 16504            |
| Saturday          | 9          | member          | 23591            |
| Saturday          | 10         | member          | 28617            |
| Saturday          | 11         | member          | 31871            |
| Saturday          | 12         | member          | 33936            |
| Saturday          | 13         | member          | 33481            |
| Saturday          | 14         | member          | 33648            |
| Saturday          | 15         | member          | 33395            |
| Saturday          | 16         | member          | 32788            |
| Saturday          | 17         | member          | 32158            |
| Saturday          | 18         | member          | 30332            |
| Saturday          | 19         | member          | 24583            |
| Saturday          | 20         | member          | 17727            |
| Saturday          | 21         | member          | 15015            |
| Saturday          | 22         | member          | 13918            |
| Saturday          | 23         | member          | 11755            |

</td></tr> </table>

+ The table illustrates hourly ride frequencies for casual and member users on Saturday, emphasizing significant variations throughout the day.
+ Casual users peak at **3 PM (32,646 rides)**, implying a preference for afternoon biking, possibly for recreational purposes. 
+ Conversely, their lowest ride count is recorded at **4 AM (1,028 rides)**, indicating a decline in bike usage during the early hours of the morning.
+ Member users also experience their highest ride count at **12 PM (33,936 rides)**, reflecting the trend seen among casual users and indicating a preference for midday rides, potentially for leisure or commuting. 
+ Similarly, their lowest ride count coincides with casual users at **4 AM (1,104 rides)**, aligning with the observed pattern of reduced bike usage during late-night and early morning hours.
+ Both casual and member users demonstrate a peak in bike usage during Saturday afternoons, suggesting a mutual preference for this time regardless of user type.
+ Increased bike usage during Saturday afternoons may be influenced by factors such as weekend events and social gatherings.
+ The consistent decline in bike usage during late-night and early-morning hours on Saturdays suggests a widespread trend of increased reliance on alternative transportation options, potentially due to extended social engagements and late-night entertainment activities.

#### Sunday Hourly Bike Demands

```{r}
trip_data_updated %>%
  filter(day_of_week == "Sunday") %>% 
  group_by(day_of_week, hour, user_type) %>%
  summarise(
    ride_count = n(), .groups = "drop") %>% 
  arrange(user_type)
```

<table> <tr><td>

| day_of_week <ord> | hour <int> | user_type <chr> | ride_count <int> |
|-------------------|------------|-----------------|------------------|
| Sunday            | 0          | casual          | 10980            |
| Sunday            | 1          | casual          | 6967             |
| Sunday            | 2          | casual          | 4643             |
| Sunday            | 3          | casual          | 2281             |
| Sunday            | 4          | casual          | 1513             |
| Sunday            | 5          | casual          | 1396             |
| Sunday            | 6          | casual          | 2281             |
| Sunday            | 7          | casual          | 3769             |
| Sunday            | 8          | casual          | 6429             |
| Sunday            | 9          | casual          | 12043            |
| Sunday            | 10         | casual          | 18438            |
| Sunday            | 11         | casual          | 23281            |
| Sunday            | 12         | casual          | 26259            |
| Sunday            | 13         | casual          | 27405            |
| Sunday            | 14         | casual          | 28497            |
| Sunday            | 15         | casual          | 29047            |
| Sunday            | 16         | casual          | 26852            |
| Sunday            | 17         | casual          | 22645            |
| Sunday            | 18         | casual          | 19581            |
| Sunday            | 19         | casual          | 14819            |
| Sunday            | 20         | casual          | 10375            |
| Sunday            | 21         | casual          | 8449             |
| Sunday            | 22         | casual          | 6819             |
| Sunday            | 23         | casual          | 4672             |

</td><td>

| day_of_week <ord> | hour <int> | user_type <chr> | ride_count <int> |
|-------------------|------------|-----------------|------------------|
| Sunday            | 0          | member          | 9153             |
| Sunday            | 1          | member          | 6002             |
| Sunday            | 2          | member          | 3724             |
| Sunday            | 3          | member          | 2076             |
| Sunday            | 4          | member          | 1505             |
| Sunday            | 5          | member          | 1908             |
| Sunday            | 6          | member          | 4265             |
| Sunday            | 7          | member          | 7103             |
| Sunday            | 8          | member          | 11426            |
| Sunday            | 9          | member          | 18251            |
| Sunday            | 10         | member          | 24572            |
| Sunday            | 11         | member          | 29330            |
| Sunday            | 12         | member          | 30885            |
| Sunday            | 13         | member          | 31070            |
| Sunday            | 14         | member          | 30983            |
| Sunday            | 15         | member          | 31925            |
| Sunday            | 16         | member          | 30607            |
| Sunday            | 17         | member          | 28467            |
| Sunday            | 18         | member          | 26120            |
| Sunday            | 19         | member          | 20290            |
| Sunday            | 20         | member          | 15308            |
| Sunday            | 21         | member          | 11564            |
| Sunday            | 22         | member          | 8369             |
| Sunday            | 23         | member          | 5176             |

</td></tr> </table>

+ The table illustrating hourly ride usage for casual and member users on Sunday reveals distinct usage patterns, indicating significant differences in ride frequencies between the two user categories throughout the day.
Casual users reach their highest ride count at **3 PM (29,047 rides)**, suggesting a preference for afternoon biking, potentially for leisure activities or enjoyment.
+ Similarly, member users also reach their peak ride count at **3 PM (31,925 rides)**, echoing the trend observed among casual users and suggesting a preference for midday rides, potentially for leisurely outings or recreational purposes. 
+ Correspondingly, their lowest ride count is at **4 AM (1,505 rides)**, aligning with the decrease in bike usage during late-night and early-morning hours.
+ Both casual and member users demonstrate a peak in bike usage during Sunday afternoons, suggesting a shared preference for this time, possibly as it marks the end of the week, regardless of user type.
+ The heightened demand for bike rides on Sunday afternoons may be fueled by the necessity to run errands or participate in various activities typical of the end of the week.
+ A decline in bike usage during the late-night and early morning hours on Sundays may also stem from individuals' diverse weekend routines, which frequently involve indoor activities or engagements that do not require outdoor transportation. Additionally, people may utilize alternative modes of transportation or choose to remain indoors, contributing to the decreased demand for biking during these hours.

--------------------------------------

### Monthly Trends

#### Monthly User Overview

```{r}
trip_data_updated$month <- ordered(
  trip_data_updated$month, 
  levels=c(
    "January", 
    "February", 
    "March", 
    "April", 
    "May", 
    "June", 
    "July", 
    "August", 
    "September", 
    "October", 
    "November", 
    "December"))

trip_data_updated %>%  
  group_by(user_type, month) %>% 
  summarise(
    ride_count = n(), .groups = "drop") %>% 
  arrange(user_type, month)
```

<table> <tr><td>

| user_type <chr> | month <ord> | ride_count <int> |
|-----------------|-------------|------------------|
| casual          | January     | 38204            |
| casual          | February    | 41150            |
| casual          | March       | 59237            |
| casual          | April       | 140000           |
| casual          | May         | 224016           |
| casual          | June        | 286435           |
| casual          | July        | 316555           |
| casual          | August      | 295870           |
| casual          | September   | 249534           |
| casual          | October     | 168663           |
| casual          | November    | 93751            |
| casual          | December    | 49296            |

</td><td>

| user_type <chr> | month <ord> | ride_count <int> |
|-----------------|-------------|------------------|
| member          | January     | 142874           |
| member          | February    | 140607           |
| member          | March       | 186441           |
| member          | April       | 264665           |
| member          | May         | 354884           |
| member          | June        | 399505           |
| member          | July        | 418375           |
| member          | August      | 439658           |
| member          | September   | 387591           |
| member          | October     | 344549           |
| member          | November    | 252613           |
| member          | December    | 164618           |

</td></tr> </table>

+ The table depicts the monthly ride usage for casual and member users over a span of 12 months.
+ Casual users exhibit the highest ride counts during the summer months, peaking in **July (316,555 rides)**. 
+ While experiencing the lowest usage in **January (38,204 rides)**. This trend suggests that casual users primarily utilize the bike-sharing service for leisure or recreational purposes during warmer months, opting for alternative transportation methods during colder periods.
+ Similarly, member users also demonstrate the highest ride counts during the summer months, reaching a peak in **August (439,658 rides)**. 
+ The lowest ride counts occur during the winter months, in **February (140,067 rides)**. However, member users maintain relatively consistent usage throughout the year, suggesting a stable demand regardless of seasonal variations, which could indicate a diverse range of usage purposes beyond solely commuting.
+ While both user groups display decreased usage during the winter months, member users demonstrate a higher level of usage compared to casual users throughout the months.

#### Monthly Average Ride Length (minutes)

```{r}
trip_data_updated$month <- ordered(
  trip_data_updated$month, 
  levels=c(
    "January", 
    "February", 
    "March", 
    "April", 
    "May", 
    "June", 
    "July", 
    "August", 
    "September", 
    "October", 
    "November", 
    "December"))

trip_data_updated %>% 
  group_by(user_type, month) %>%
  summarise(
    average_ride_length = round(mean(ride_length_minute), 2), .groups = "drop") %>% 
  arrange(user_type, month)
```

<table> <tr><td>

| user_type <chr> | month <ord> | average_ride_length <dbl> |
|-----------------|-------------|---------------------------|
| casual          | January     | 13.91 minutes             |
| casual          | February    | 16.26 minutes             |
| casual          | March       | 15.59 minutes             |
| casual          | April       | 21.02 minutes             |
| casual          | May         | 22.57 minutes             |
| casual          | June        | 22.18 minutes             |
| casual          | July        | 23.25 minutes             |
| casual          | August      | 22.36 minutes             |
| casual          | September   | 21.66 minutes             |
| casual          | October     | 19.40 minutes             |
| casual          | November    | 16.25 minutes             |
| casual          | December    | 14.98 minutes             |

</td><td>

| user_type <chr> | month <ord> | average_ride_length <dbl> |
|-----------------|-------------|---------------------------|
| member          | January     | 10.41 minutes             |
| member          | February    | 10.81 minutes             |
| member          | March       | 10.52 minutes             |
| member          | April       | 11.87 minutes             |
| member          | May         | 12.94 minutes             |
| member          | June        | 13.17 minutes             |
| member          | July        | 13.51 minutes             |
| member          | August      | 13.45 minutes             |
| member          | September   | 12.86 minutes             |
| member          | October     | 11.77 minutes             |
| member          | November    | 11.12 minutes             |
| member          | December    | 11.00 minutes             |

</td></tr> </table>

+ The table presents the monthly average ride duration for both casual and member users over the course of a year.
+ Among casual users, the longest rides are observed during the summer months, peaking in **July (23.25 minutes)**.
+ While the shortest rides occur in **January (13.91 minutes)** during winter. This trend highlights the preference of casual users for utilizing the service for leisure or recreational purposes more frequently in warmer months than in winter.
+ Similarly, member users also experience longer rides during the summer months, reaching a peak in **July (13.51 minutes)**.
+ Their shortest rides occur in **January (10.41 minutes)** during winter, mirroring the pattern observed among casual users. + This suggests that member users' riding habits may differ from casual users due to factors such as commuting needs or habit consistency, resulting in shorter average ride durations.
+ Both user groups consistently demonstrate shorter ride durations during the winter months and longer durations in the summer months, showcasing the significant impact of weather conditions and seasonal fluctuations on their riding habits. Furthermore, casual users consistently maintain longer ride durations compared to member users across all months.

#### Monthly Average Ride Distance (miles)

```{r}
trip_data_updated$month <- ordered(
  trip_data_updated$month, 
  levels=c(
    "January", 
    "February", 
    "March", 
    "April", 
    "May", 
    "June", 
    "July", 
    "August", 
    "September", 
    "October", 
    "November", 
    "December"))

trip_data_updated %>% 
  group_by(user_type, month) %>% 
  summarise(
    average_ride_distance = mean(ride_distance),
    .groups = 'drop'
  ) %>%
  mutate(average_ride_distance = round(average_ride_distance, 2))
```

<table> <tr><td>

| user_type <chr> | month <ord> | average_ride_distance <dbl> |
|-----------------|-------------|-----------------------------|
| casual          | January     | 1.06 miles                  |
| casual          | February    | 1.13 miles                  |
| casual          | March       | 1.15 miles                  |
| casual          | April       | 1.31 miles                  |
| casual          | May         | 1.40 miles                  |
| casual          | June        | 1.43 miles                  |
| casual          | July        | 1.41 miles                  |
| casual          | August      | 1.41 miles                  |
| casual          | September   | 1.38 miles                  |
| casual          | October     | 1.29 miles                  |
| casual          | November    | 1.19 miles                  |
| casual          | December    | 1.10 miles                  |

</td><td>

| user_type <chr> | month <ord> | average_ride_distance <dbl> |
|-----------------|-------------|-----------------------------|
| member          | January     | 1.13 miles                  |
| member          | February    | 1.16 miles                  |
| member          | March       | 1.20 miles                  |
| member          | April       | 1.32 miles                  |
| member          | May         | 1.40 miles                  |
| member          | June        | 1.44 miles                  |
| member          | July        | 1.44 miles                  |
| member          | August      | 1.43 miles                  |
| member          | September   | 1.39 miles                  |
| member          | October     | 1.30 miles                  |
| member          | November    | 1.24 miles                  |
| member          | December    | 1.20 miles                  |

</td></tr> </table>

+ The table presents monthly average ride distance data for casual and member users over 12 months.
+ For casual users, the longest average ride distances occur during the summer months, peaking in **June (1.43 miles)**. 
+ While the shortest average is recorded in **January (1.06 miles)**. This suggests that longer bike rides may be associated with leisure and recreational usage during the summer months, as warmer weather conditions are more conducive to outdoor activities.
+ Similarly, member users also exhibit longer average ride distances during the summer months, with peaks in both **June (1.44 miles)** and **July (1.44 miles)**.
+ The shortest average occurring in **January (1.13 miles)**. This indicates that members may take advantage of the warmer weather to embark on longer rides, potentially explore new routes or destinations, enjoy recreational outings, or participate in outdoor events.
+ While both user groups generally show shorter average ride distances during the winter months, which may be attributed to weather conditions or commuting needs, member users consistently demonstrate longer average ride distances compared to casual users across most months.

--------------------------------------

### Quarterly Trends

#### Quarterly User Overview

```{r}
trip_data_updated %>%
  group_by(quarter, user_type) %>%
  summarise(
    ride_count = n(), .groups = "drop") %>% 
  arrange(user_type)
```

<table> <tr><td>

| quarter <int> | user_type <chr> | ride_count <int> |
|---------------|-----------------|------------------|
| 1             | casual          | 138591           |
| 2             | casual          | 650451           |
| 3             | casual          | 861959           |
| 4             | casual          | 311710           |

</td><td>

| quarter <int> | user_type <chr> | ride_count <int> |
|---------------|-----------------|------------------|
| 1             | member          | 469922           |
| 2             | member          | 1019054          |
| 3             | member          | 1245624          |
| 4             | member          | 761780           |

</td></tr> </table>

+ This table showcases the quarterly number of rides for casual and member users.
+ Casual users experience the highest number of rides in the **3rd quarter (July-September)** at **861,959 rides**.
+ While their lowest number of rides occurs in the **1st quarter (January-March)** at **138,591 rides**. These fluctuations may be influenced by weather and seasonal conditions, as the 3rd quarter falls in the summer months, while the 1st quarter corresponds to the winter months.
+ Similarly, member users also have their highest number of rides in the **3rd quarter (July-September)**, totaling **1,245,624**. 
+ While their lowest number occurring in the **1st quarter (January-March)** at **469,922**. This pattern aligns with casual users and may be attributed to similar seasonal factors.
+ Despite these similarities, member users consistently maintain higher ride numbers compared to casual users. This could be attributed to the fact that member users are more likely to use bike-sharing services for commuting purposes, which may be less affected by weather conditions compared to casual users who primarily use the service for leisure or recreational purposes.

#### Quarterly Average Ride Length (minutes)

```{r}
trip_data_updated %>%
  group_by(quarter, user_type) %>%
  summarise(
    average_ride_length = round(mean(ride_length_minute), 2), .groups="drop") %>%
  arrange(user_type)
```

<table> <tr><td>

| quarter <int> | user_type <chr> | average_ride_length <dbl> |
|---------------|-----------------|---------------------------|
| 1             | casual          | 15.32 minutes             |
| 2             | casual          | 22.07 minutes             |
| 3             | casual          | 22.48 minutes             |
| 4             | casual          | 17.76 minutes             |

</td><td>

| quarter <int> | user_type <chr> | average_ride_length <dbl> |
|---------------|-----------------|---------------------------|
| 1             | member          | 10.57 minutes             |
| 2             | member          | 12.75 minutes             |
| 3             | member          | 13.29 minutes             |
| 4             | member          | 11.39 minutes             |

</td></tr> </table>

+ The table presents the quarterly average ride lengths of casual and member users.
+ Casual users experience the longest average ride length during the **3rd quarter (22.48 minutes)**.
+ While the shortest duration occurs in the **1st quarter (15.32 minutes)**. These findings support the notion that casual users prefer the summer months, potentially indicating leisure or recreational usage during this season. Conversely, casual users tend to ride less frequently during the winter months, leading to shorter average ride durations.
+ Similarly, member users also display a comparable pattern, with the longest average ride length observed in the **3rd quarter (13.29 minutes)**.
+ While their shortest in the **1st quarter (10.57 minutes)**. This suggests that seasonal conditions influence ride durations for both user groups.
+ While both casual and member users exhibit similar seasonal trends, casual users consistently demonstrate higher average ride lengths across all quarters compared to members. This difference could potentially be attributed to the idea that casual users approach bike usage with a more leisurely or recreational mindset, resulting in longer rides.

#### Quarterly Average Ride Distance (miles)

```{r}
trip_data_updated %>%
  group_by(quarter, user_type) %>%
  summarise(
    average_ride_distance = mean(ride_distance),
    .groups = "drop"
  ) %>%
  mutate(average_ride_distance = round(average_ride_distance, 2))
```

<table> <tr><td>

| quarter <int> | user_type <chr> | average_ride_distance <dbl> |
|---------------|-----------------|-----------------------------|
| 1             | casual          | 1.12 miles                  |
| 2             | casual          | 1.39 miles                  |
| 3             | casual          | 1.40 miles                  |
| 4             | casual          | 1.23 miles                  |

</td><td>

| quarter <int> | user_type <chr> | average_ride_distance <dbl> |
|---------------|-----------------|-----------------------------|
| 1             | member          | 1.16 miles                  |
| 2             | member          | 1.40 miles                  |
| 3             | member          | 1.42 miles                  |
| 4             | member          | 1.26 miles                  |

</td></tr> </table>

+ The table presents quarterly average ride distances for casual and member users.
+ Casual users exhibit the longest average ride distance in the **3rd quarter (1.40 miles)**.
+ While the shortest distance occurs in the **1st quarter (1.12 miles)**. These findings align with the peak summer season and favorable weather conditions, suggesting that casual users are more inclined to engage in longer rides during this period.
+ Similarly, member users also demonstrate a comparable pattern, with the longest average ride distances observed in the **3rd quarter (1.42 miles)**. 
+ While the shortest distances in the **1st quarter (1.16 miles)**. This further supports the notion that ride distances for both user groups are influenced by seasonal and weather conditions.
+ Although both user groups show similar patterns in average ride distances, member users consistently have slightly longer averages across all quarters. This suggests that members may utilize the bike-sharing service for more practical purposes, potentially involving longer commutes or transportation needs.

--------------------------------------

### Rideable Trends

#### Rideable Type Trends

```{r}
trip_data_updated %>%
  group_by(user_type, rideable_type) %>%
  summarise(
    count = n(), .groups = "drop")
```

<table> <tr><td>

| user_type <chr> | rideable_type <chr> | count <int> |
|-----------------|---------------------|-------------|
| casual          | classic_bike        | 843957      |
| casual          | docked_bike         | 74850       |
| casual          | electric_bike       | 1043904     |

</td><td>

| user_type <chr> | rideable_type <chr> | count <int> |
|-----------------|---------------------|-------------|
| member          | classic_bike        | 1754117     |
| member          | electric_bike       | 1742263     |

</td></tr> </table>

+ The table presents an analysis of bike preferences among both casual and member users.
+ Among casual users, the most popular rideable type is the **electric_bike (1,043,904 rides)**, followed by the **classic_bike (843,957 rides)**, and then the **docked_bike (74,850 rides)**.
+ Casual users exhibit a preference for electric bikes, possibly due to their convenience and ease of use, especially for leisure or recreational rides.
+ Conversely, among member users, the most preferred rideable type is the **classic_bike (1,754,117 rides)**, closely followed by the **electric_bike (1,742,263 rides)**.
+ Member users also favor both classic bikes and electric bikes, which could be attributed to their commuting needs or cost considerations, as membership plans often provide cost reductions.
+ The docked bike option seems to have the lowest preference among both user groups. This may be attributed to the hassle of returning the bike to a docking station, which might not align with the flexibility and convenience users seek.

--------------------------------------

### Map Trends

#### User Type Quarterly Destination Interactive Map

```{r}
mapping_data <- na.omit(trip_data_updated)

mapping_data$quarter <- paste("Q", mapping_data$quarter, sep = "")

mapping_data <- mapping_data %>%
  filter(start_lat != end_lat | start_lng != end_lng)

subset <- sample_n(mapping_data, 500)

subset[, c("user_type", "quarter", "start_station_name", "end_station_name", "start_lat", "start_lng", "end_lat", "end_lng", "rideable_type")] %>% 
  filter(user_type == "casual") %>% 
  arrange(quarter)

subset[, c("user_type", "quarter", "start_station_name", "end_station_name", "start_lat", "start_lng", "end_lat", "end_lng", "rideable_type")] %>% 
  filter(user_type == "member") %>% 
  arrange(quarter)
```
| user_type <chr> | quarter <chr> | start_station_name <chr>     | end_station_name <chr>      | start_lat <dbl> | start_lng <dbl> | end_lat <dbl> | end_lng <dbl> | rideable_type <chr> |
|-----------------|---------------|------------------------------|-----------------------------|-----------------|-----------------|---------------|---------------|---------------------|
| casual          | Q1            | Canal St & Harrison St       | State St & Harrison St      | 41.87           | -87.64          | 41.87         | -87.63        | electric_bike       |
| casual          | Q1            | Damen Ave & Cortland St      | Leavitt St & Chicago Ave    | 41.92           | -87.68          | 41.90         | -87.68        | electric_bike       |
| casual          | Q1            | Campbell Ave & North Ave     | Walsh Park                  | 41.91           | -87.69          | 41.91         | -87.67        | classic_bike        |
| casual          | Q1            | Winthrop Ave & Lawrence Ave  | Wilton Ave & Belmont Ave    | 41.97           | -87.66          | 41.94         | -87.65        | electric_bike       |
| casual          | Q1            | Washtenaw Ave & Lawrence Ave | Keystone Ave & Montrose Ave | 41.97           | -87.70          | 41.96         | -87.73        | electric_bike       |
| casual          | Q1            | Indiana Ave & Roosevelt Rd   | Millennium Park             | 41.87           | -87.62          | 41.88         | -87.62        | classic_bike        |
| casual          | Q1            | Leavitt St & Addison St      | Western Ave & Leland Ave    | 41.95           | -87.68          | 41.97         | -87.69        | classic_bike        |
| casual          | Q1            | Ada St & Washington Blvd     | Racine Ave & 18th St        | 41.88           | -87.66          | 41.86         | -87.66        | electric_bike       |
| casual          | Q1            | Burnham Harbor               | Wentworth Ave & 63rd St     | 41.86           | -87.61          | 41.78         | -87.63        | classic_bike        |
| casual          | Q1            | Clark St & Lunt Ave          | Sheridan Rd & Greenleaf Ave | 42.01           | -87.67          | 42.01         | -87.66        | classic_bike        |

`1-10 of 171 rows` 

| user_type <chr> | quarter <chr> | start_station_name <chr>      | end_station_name <chr>                 | start_lat <dbl> | start_lng <dbl> | end_lat <dbl> | end_lng <dbl> | rideable_type <chr> |
|-----------------|---------------|-------------------------------|----------------------------------------|-----------------|-----------------|---------------|---------------|---------------------|
| member          | Q1            | State St & Kinzie St          | Clinton St & Washington Blvd           | 41.89           | -87.63          | 41.88         | -87.64        | classic_bike        |
| member          | Q1            | Halsted St & Clybourn Ave     | Sedgwick St & North Ave                | 41.91           | -87.65          | 41.91         | -87.64        | classic_bike        |
| member          | Q1            | Sedgwick St & North Ave       | Clark St & Wrightwood Ave              | 41.91           | -87.64          | 41.93         | -87.64        | electric_bike       |
| member          | Q1            | Sheffield Ave & Fullerton Ave | Lakeview Ave & Fullerton Pkwy          | 41.93           | -87.65          | 41.93         | -87.64        | electric_bike       |
| member          | Q1            | Greenwood Ave & 47th St       | Calumet Ave & 51st St                  | 41.81           | -87.60          | 41.80         | -87.62        | electric_bike       |
| member          | Q1            | Clark St & Drummond Pl        | Clark St & North Ave                   | 41.93           | -87.64          | 41.91         | -87.63        | classic_bike        |
| member          | Q1            | Canal St & Adams St           | Kingsbury St & Kinzie St               | 41.88           | -87.64          | 41.89         | -87.64        | classic_bike        |
| member          | Q1            | Southport Ave & Clybourn Ave  | DuSable Lake Shore Dr & Wellington Ave | 41.92           | -87.66          | 41.94         | -87.64        | classic_bike        |
| member          | Q1            | Clark St & Wrightwood Ave     | Sheffield Ave & Webster Ave            | 41.93           | -87.64          | 41.92         | -87.65        | classic_bike        |
| member          | Q1            | Financial Pl & Ida B Wells Dr | State St & Kinzie St                   | 41.88           | -87.63          | 41.89         | -87.63        | electric_bike       |

`1-10 of 329 rows`

+ The table presents a subset of data extracted from the main dataset, representing a random sample of user interactions and popular locations.
+ It showcases various attributes and patterns observed within this sample, offering insights into user behaviors, preferences, and engagement levels across different quarters and user types.

--------------------------------------

### **Summary of the Analysis**
This analysis provides critical insights into the behavior and preferences of Cyclistic's casual and member users. Leveraging this understanding, Cyclistic can better meet its needs and enhance its marketing strategies

### Key Tasks
- [x]  Aggregate your data so it’s useful and accessible.
- [x]  Organize and format your data.
- [x]  Perform calculations.
- [x]  Identify trends and relationships.

### Deliverable 
- [x]  A summary of your analysis.

## 🎁 The 'Share' Phase

### **User Type Trends**

![1 1 User Type Distribution](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/ca681f81-6c7a-4476-9648-0a8158e13d63)

![1 2 Average Ride Length (minutes) by User Type](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/3c65d509-6276-4416-8502-7b4bdc387e86)

![1 3 Average Ride Distance (miles) by User Type](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/82ebd99e-e7b2-4da0-b650-a6125ee163a4)

#### **Summary of User Type Trends**
The analysis of the "**User Type Trends**" visualizations demonstrates the ride statistics of casual and member users, highlighting:

+ **Casual User Key Points**: Casual users comprise a smaller portion of Cyclistic's total riders. Their preference for longer rides suggests a distinct inclination toward leisure or recreational activities. This behavior indicates that casual users may use the bike-sharing platform for city exploration or relaxed outings, distinguishing them from the more utilitarian mindset of member users. Additionally, the slightly higher average ride distance among casual users suggests a propensity for exploring various locations or taking scenic routes. This behavior could be influenced by their occasional or irregular usage patterns, enabling them to seize opportunities for sightseeing or leisurely exploration.
+ **Member User Key Points**: Member users constitute the majority of Cyclistic's riders. They prefer shorter rides, indicating a focus on practical commuting or transportation purposes. This behavior suggests that member users prioritize convenience, time efficiency, and cost-effectiveness in their bike-sharing usage. Additionally, their slightly lower average ride distance may be influenced by factors such as optimized routes, city familiarity, or an emphasis on efficiency. Overall, their approach reflects a utilitarian mindset, emphasizing efficiency and practicality in their bike-sharing activities.

#### **Key Questions:**
1. **How do annual members and casual riders use Cyclistic bikes differently?**
    - Annual members and casual riders exhibit different usage patterns with Cyclistic bikes. Annual members primarily use the bikes for shorter, routine commutes or transportation, as reflected in their shorter average ride lengths and distances. On the other hand, casual riders tend to opt for longer, leisure-oriented trips, resulting in longer average ride lengths and slightly greater distances.
2. **Why would casual riders buy Cyclistic annual memberships?**
    - Casual riders might opt for Cyclistic annual memberships for several reasons. Despite their leisure-oriented usage patterns, they may find annual memberships financially beneficial and convenient for frequent commuting or transportation needs. Additionally, incentives such as discounts or extra benefits could encourage them to upgrade to annual memberships, enhancing their overall experience.
3. **How can Cyclistic use digital media to influence casual riders to become members?**
    - Cyclistic can effectively utilize digital media to encourage casual riders to become members. Through targeted marketing, the company can highlight the cost-effectiveness and convenience of annual memberships for frequent users, tailored to individual usage patterns. Promoting additional features, discounts, or rewards exclusive to members could further incentivize casual riders to consider annual memberships. Furthermore, emphasizing the environmental and health benefits of bike-sharing through digital platforms can resonate with potential members, encouraging them to join the Cyclistic community.

These insights uncover a starting point for a better understanding of the characteristics of both casual and member users, which will help build an effective conversion strategy that aims to convert casual riders into annual members. Further analysis will provide deeper insights, enabling Cyclistic to refine its marketing strategies and enhance effectiveness even further.

--------------------------------------

### **Hourly Trends**

![2 1 Hourly User Overview](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/f58a4dc4-d8b9-44b4-b23a-410efbbf8b68)

![2 2 Hourly Average Ride Length Average (minutes)](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/635d8408-8133-4ec5-96ae-23b5e89ce0e1)

![2 3 Hourly Average Ride Distance Average (miles)](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/7b696cb6-7ce5-4b68-a57d-1fa7b8daa8df)

#### **Summary of Hourly Trends**
The analysis of the “**Hourly Trends**” visualizations demonstrates the ride statistics and usage patterns between casual and member users across different hours of the day, highlighting:

+ **Casual User Key Points**: Casual users exhibit leisure-oriented usage patterns, with heightened activity during non-work hours, especially in the late afternoon and evening when they prefer longer rides. While their ride counts peak during morning and evening commuting hours, indicating potential usage for transportation purposes, longer average rides are also observed in mid-morning to early afternoon. Notably, 5 PM emerges as the peak usage hour, while at 11 AM, they record their longest rides, suggesting a preference for midday activities such as sightseeing or recreational biking, rather than practical commuting needs. These trends suggest that casual users leverage Cyclistic for extended leisure rides, taking advantage of flexible schedules, while occasional peaks during the late afternoon and early evening showcase their versatile usage for both practical commuting and leisurely exploration
+ **Member User Key Points**: Member users demonstrate distinct usage patterns, with activity concentrated during morning commuting hours and late afternoon/evening, suggesting a blend of commuting and non-commuting purposes. They maintain shorter and consistent average ride lengths throughout the day, with peaks observed in the evening hours. Longer average distances occur during early morning and late hours, possibly reflecting longer commutes or non-commuting activities during these times. Notably, peak usage occurs at 5 PM, indicating a focus on commuting during this time. Interestingly, the longest average ride length for member users is observed at 5 PM, while the longest average ride distance is recorded at 4 AM. This usage pattern suggests that member users primarily utilize Cyclistic for commuting during peak hours and engage in leisure or non-commuting activities during off-peak hours, highlighting the versatility of their usage.

#### **Key Questions**:
1. **How do annual members and casual riders use Cyclistic bikes differently?**
    - Annual members and casual riders exhibit distinct usage patterns with Cyclistic bikes. Annual members predominantly utilize the service for commuting, especially during typical work hours, and also for non-commuting activities in the late afternoon and evening. This contrasts with casual riders, who primarily use the bikes for leisure or recreational purposes, showing higher usage and longer ride lengths in the afternoon and early evening, indicating a preference for non-commuting activities.
2. **Why would casual riders buy Cyclistic annual memberships?**
    - Casual riders might opt for Cyclistic annual memberships for various reasons. Despite their leisure-oriented usage, they may find the convenience and potential cost savings of annual memberships appealing, especially if they use the bike-sharing service frequently for commuting or transportation needs. Incentives like discounts or additional benefits could further entice casual riders to invest in annual memberships, despite their differing usage patterns from typical commuters.
3. **How can Cyclistic use digital media to influence casual riders to become members?**
    - Cyclistic can leverage digital media effectively to sway casual riders towards membership. Through targeted marketing efforts, the company can emphasize the advantages and cost-effectiveness of annual memberships for frequent users, tailoring messages to resonate with casual riders' specific usage patterns. Personalized offers based on these patterns could further incentivize membership upgrades. Highlighting the array of additional features, discounts, or rewards exclusive to members through digital channels can also serve as a persuasive tool. Moreover, promoting the environmental and health benefits of bike-sharing, alongside the convenience it offers for commuting or transportation, could effectively sway casual riders towards membership. Sharing success stories or case studies from similar industries could bolster the credibility of these digital media strategies.

These insights uncover valuable findings into the distinct behaviors of both user groups throughout the day, which will help develop an effective conversion strategy that aims to convert casual riders into annual members. Additionally, further analysis will provide deeper insights, enabling Cyclistic to refine its marketing strategies and enhance effectiveness even further.

--------------------------------------

### **Weekly Trends**

![3 1 Weekly User Overview](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/2fcbbef6-db75-41f7-91d2-6b3532d5e50b)

![3 2 Weekly Ride Length Average (minutes)](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/0589f21f-a96c-447d-b46c-6584a694bb4e)

![3 3 Weekly Ride Distance Average (miles)](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/f23dd113-b152-47a9-bfa5-e60304620a36)

#### **Summary of Weekly Trends**
The analysis of the "**Weekly Trends**" visualizations demonstrates the behavior patterns and preferences between casual and member users across different days of the week, highlighting:

+ **Casual User Key Points**: Casual users primarily engage in bike rides for leisure and recreational purposes, adopting a flexible and non-committal approach to bike-sharing. Their usage patterns indicate a preference for weekend outings or activities, with peak ride counts occurring on Saturdays and Sundays. Moreover, casual users tend to embark on longer rides, both in terms of duration and distance, during weekends, highlighting their inclination towards extended and exploratory rides. The consistently higher ride counts and longer ride durations on weekends reveal the recreational nature of their bike-sharing experiences, emphasizing Cyclistic's appeal as a platform for leisurely urban exploration and weekend getaways.
+ **Member User Key Points**: Member users demonstrate a structured and utilitarian approach to bike-sharing, primarily utilizing Cyclistic for commuting and practical transportation purposes. They maintain relatively consistent ride counts and durations throughout the week, with slight fluctuations during peak commuting hours, especially on weekdays. Unlike casual users, member users prioritize efficiency and time-saving benefits, preferring shorter average ride lengths and distances. Notably, the highest number of member users occurs on Thursdays, followed closely by Wednesdays and Tuesdays, indicating a commuting-oriented usage pattern during weekdays. While member users also utilize Cyclistic on weekends, their ride counts and durations are relatively lower compared to weekdays, suggesting reduced reliance on bike-sharing for leisure activities during weekends. The longest average ride lengths and distances for member users are observed on Saturdays and Sundays, potentially indicating longer non-commuting rides during weekends. This suggests that member users rely on Cyclistic as a convenient and cost-effective solution for daily commuting needs.

#### **Key Questions**:
1. **How do annual members and casual riders use Cyclistic bikes differently?**
    - Annual members and casual riders demonstrate differing usage patterns with Cyclistic bikes. Annual members predominantly utilize the bikes for commuting purposes on weekdays, characterized by higher usage and consistent ride lengths/distances during these days. Conversely, casual riders tend to use Cyclistic bikes more for leisure or recreational activities, showing increased usage and longer ride lengths/distances on weekends, particularly Saturdays and Sundays.
2. **Why would casual riders buy Cyclistic annual memberships?**
    - Casual riders might be inclined to purchase Cyclistic annual memberships for several reasons. Despite their leisure-oriented usage during weekends, they may find the convenience and potential cost savings of annual memberships appealing, especially if they frequently use the bike-sharing service for commuting or transportation purposes. Additionally, annual memberships could offer them cost savings and convenience, even if their usage patterns differ from typical commuters. Moreover, incentives such as discounts or additional benefits could serve as further motivation for casual riders to upgrade to annual memberships.
3. **How can Cyclistic use digital media to influence casual riders to become members?**
    - Cyclistic can effectively utilize digital media platforms to influence casual riders to become members. By showcasing the benefits and cost-effectiveness of annual memberships for frequent users, highlighting potential savings and convenience through targeted marketing campaigns, the company can effectively sway casual riders. Personalized offers tailored to casual riders' usage patterns could further encourage membership upgrades. Moreover, emphasizing the additional features, discounts, or rewards available to members through digital channels could incentivize casual riders to consider annual memberships. Lastly, promoting the environmental and health benefits of bike-sharing, along with its convenience for commuting or transportation, could resonate with casual riders and influence their decision to become members.

These insights uncover a clear grasp on the behavior between both types of users throughout the week, which will help develop an effective conversion strategy that aims to convert casual riders into annual members. Additionally, further analysis will provide deeper insights, enabling Cyclistic to refine its marketing strategies and enhance effectiveness even further.

--------------------------------------

### **Weekly and Hourly Bike Demand Trends**

![0 1 Weekly and Hourly Bike Demands](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/4c4798ac-a290-448c-b006-f92cf2e1dac2)

![0 2 Monday Hourly Bike Demands](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/26acdbc4-fd11-4dbc-acd9-01fc2af6fe44)

![0 3 Tuesday Hourly Bike Demands](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/07176c97-893a-44b8-a24a-44f2a9aa2845)

![0 4 Wednesday Hourly Bike Demands](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/0201a2b0-3898-4993-bef5-b60e321cbc88)

![0 5 Thursday Hourly Bike Demands](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/43e1f816-6353-44b7-927d-d418cd20b43a)

![0 6 Friday Hourly Bike Demands](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/1c66c716-acaf-4536-bb9c-8f41cdf7630d)

![0 7 Saturday Hourly Bike Demands](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/fbd25a82-295f-409c-8d42-cafce4b47e6c)

![0 8 Sunday Hourly Bike Demands](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/8bd57d4f-cd2d-4c87-a626-3e7382cff76a)

#### **Summary of Hourly Bike Demand Across Days of the Week Trends**
The analysis of the “**Hourly Bike Demand Across Days of the Week Trends**” visualizations demonstrates the bike demand patterns and hourly usage between casual and member users across different days of the week, highlighting:

+ **Casual User Key Points:**
    - Casual users demonstrate noticeable behavior with fluctuating and diverse demand throughout the week, particularly peaking during daytime hours and weekends. Weekdays witness a surge in bike demand around mid-morning (around 10 AM) and in the afternoon (between 2 PM to 4 PM), suggesting usage for recreational purposes rather than commuting. This consistent pattern from Monday to Thursday, marked by notable spikes in demand during late afternoon hours, suggests a preference for rides possibly after work or for leisure activities. Especially on Fridays, casual users maintain elevated demand levels throughout the day, with peak ride counts observed between 3 PM and 7 PM, signaling an increased preference for leisure activities as the weekend approaches. On weekends, casual users exhibit significantly heightened demand, particularly during daytime hours on both Saturdays and Sundays (between 10 AM to 4 PM), reflecting a preference for morning and midday leisurely bike rides and recreational activities. This usage pattern suggests that casual users display flexibility in their riding habits, with peak demand occurring during non-commuting hours and on weekends, indicating a preference for leisure and recreational riding experiences.
+ **Member User Key Points:**
    - Member users display a more consistent and commuter-oriented pattern of behavior, with steady demand observed across weekdays, particularly during peak commuting hours. From Monday to Thursday, member users exhibit a consistent demand for bikes, characterized by peak usage during morning (between 7 AM to 9 AM) and evening (around 5 PM to 7 PM) commuting hours, aligning with typical work schedules. This trend persists on Fridays as well, with member users demonstrating sustained demand throughout the day, with peak ride counts observed during evening rush hours (between 3 PM to 6 PM) indicating a preference for early evening rides, possibly after work. During weekends, member users exhibit moderate demand but display reduced activity compared to weekdays. On Saturdays and Sundays, the peak hour for member users is observed between 10 AM and 2 PM. Nonetheless, compared to casual users, member users show less pronounced fluctuations in demand and prioritize commuting needs, indicating a stronger reliance on the bike-sharing service for daily transportation purposes. These trends indicate that member users demonstrate consistent commuting patterns during weekdays, with reduced activity during weekends, reflecting their primary use of the bike-sharing service for everyday travel needs and maintaining a consistent presence throughout the week.

**Key Questions:**

1. **How do annual members and casual riders use Cyclistic bikes differently?**
    - Annual members primarily rely on Cyclistic bikes for commuting, maintaining consistent usage throughout weekdays, especially during typical commuting hours. In contrast, casual riders predominantly utilize the service for leisure and recreational activities, showing heightened demand during weekends and non-peak hours throughout the week. While annual members exhibit a stable and predictable demand pattern, indicating a reliance on Cyclistic for daily transportation needs, casual riders display more variable usage patterns, reflecting flexibility in bike usage for non-commuting purposes.
2. **Why would casual riders buy Cyclistic annual memberships?**
    - Casual riders may opt for Cyclistic annual memberships if they perceive value beyond occasional leisure rides. Annual memberships offer benefits such as consistent bike availability, priority access during peak hours, and potentially lower per-ride costs compared to casual riding rates. Cyclistic could incentivize casual riders to transition to annual memberships by offering promotional discounts, exclusive perks, and flexible payment options, and highlighting the environmental and health benefits of regular biking.
3. **How can Cyclistic use digital media to influence casual riders to become members?**
    - Cyclistic can leverage digital media channels to target casual riders and promote the advantages of annual memberships. This strategy could involve targeted advertising campaigns on social media, search engines, and cycling-related websites emphasizing cost savings, convenience, and access to exclusive features. Tailored content such as testimonials, interactive calculators demonstrating potential savings, and engaging visuals showcasing biking experiences could resonate with casual riders. Offering limited-time promotions, referral incentives, and free trial periods exclusively through digital channels could further incentivize casual riders to transition to membership status.

These insights uncover a comprehensive perspective on bike demand patterns and hourly usage, revealing distinct trends between casual and member users, which will help develop an effective conversion strategy that aims to convert casual riders into annual members. Additionally, further analysis will provide deeper insights, enabling Cyclistic to refine its marketing strategies and enhance effectiveness even further.

--------------------------------------

### **Monthly Trends**

![4 1 Monthly User Overview](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/cf7a3a83-0ac9-458b-862a-a90b1c4c8001)

![4 2 Monthly Ride Length Average (minutes)](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/34fd75f5-eb05-404f-a5c5-0e74e1df6463)

![4 3 Monthly Ride Distance Average (miles)](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/1dbd5b6d-c953-4cb1-9eb9-17e03a5771a8)

#### **Summary of Monthly Trends**
The analysis of the “**Monthly Trends**” visualizations demonstrates a comprehensive overview of bike-sharing usage among casual and member users across different months of the year, highlighting:

+ **Casual User Key Points:**
    - Casual users demonstrate seasonal fluctuations in bike usage, with peak rides occurring in warmer months and declining in colder ones. The highest ride count is recorded in July, while the lowest is in January. Average ride length varies throughout the year, with shorter rides in January and longer rides in July, reflecting preferences for extended rides during the summer. Similarly, average ride distance increases from January to June, indicating longer distances covered in warmer months. Casual users exhibit a preference for leisure and recreational biking, with peak usage on weekends during the summer, suggesting a seasonal pattern influenced by weather and outdoor activities.
+ **Member User Key Points:**
    - Member users exhibit a consistent pattern of bike-sharing usage year-round, with ride counts remaining stable and showing only minor fluctuations across months. The slight decrease towards December may be attributed to seasonal weather. The highest ride count is in August, while the lowest is in February. Average ride length remains steady, with shorter rides in January and longer ones in July. Similarly, there's minimal variation in average ride distance. These patterns suggest members rely consistently on the service for commuting or regular transportation needs, with peak usage on weekdays, indicating a stable and reliable user base.

**Key Questions:**
1. **How do annual members and casual riders use Cyclistic bikes differently?**
    - Annual members consistently use Cyclistic bikes throughout the year for commuting or regular transportation needs, with ride counts remaining relatively stable month-to-month and slightly higher usage during warmer months. They take shorter rides compared to casual riders, as reflected in the average ride length and distance data. In contrast, casual riders display more fluctuation in bike usage, with higher ride counts during warmer months and lower counts during colder months. They tend to have longer average ride lengths, suggesting more leisurely or recreational use, and exhibit sporadic usage, with ride counts peaking during weekends and warmer months, indicating a preference for leisure and recreational biking.
2. **Why would casual riders buy Cyclistic annual memberships?**
    - Casual riders might purchase annual memberships if they use the bike-sharing service frequently, especially during peak seasons or weekends, and to benefit from cost savings and convenience compared to paying per ride. Membership perks such as priority bike availability, discounts on accessories, or exclusive events could attract them, and an annual membership may be perceived as a commitment to a healthier and more sustainable lifestyle, motivating casual riders to purchase it.
3. **How can Cyclistic use digital media to influence casual riders to become members?**
    - Cyclistic can leverage targeted advertising campaigns on social media platforms to highlight the benefits of annual memberships, tailored to reach casual riders based on demographics and interests. Email marketing can offer personalized offers and incentives, such as limited-time promotions or referral discounts, to encourage casual riders to sign up. Partnering with influencers or fitness bloggers can increase brand visibility and credibility among casual riders, promoting annual memberships to their followers. Strategic use of digital media channels can effectively communicate the value proposition of annual memberships and motivate casual riders to make the switch.

These insights uncover noteworthy trends in bike usage between casual and member users in different months throughout the year, which will help develop an effective conversion strategy that aims to convert casual riders into annual members. Additionally, further analysis will provide deeper insights, enabling Cyclistic to refine its marketing strategies and enhance effectiveness even further.

--------------------------------------

### **Quarterly Trends**

![5 1 Quarterly User Overview](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/91a5e632-8810-4c24-88a5-79069d95e5ed)

![5 2 Quarterly Ride Length Average (minutes)](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/9ef45501-2e7e-4a81-8df6-7757247650c9)

![5 3 Quarterly Ride Distance Average (miles)](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/67ca4914-45b6-4189-abdc-c35f8e056d7d)

#### **Summary of Quarterly Trends**
The analysis of the “**Quarterly Trends**” visualizations demonstrates the bike usage habits between the two user groups across different quarters of the year, highlighting:

+ **Casual User Key Points:**
    - Casual users exhibit a notable fluctuation in bike usage across different quarters, with ride counts peaking in the 2nd and 3rd quarters and declining in the 1st and 4th quarters. The 3rd quarter sees the highest ride count, while the lowest count occurs in the 1st quarter. This corresponds to seasonal changes, with warmer months typically seeing higher ride volumes as individuals engage in outdoor activities. Average ride length also demonstrates longer durations in the third quarter and shorter durations in the first quarter. This could be attributed to casual users opting for leisurely rides or exploring outdoor destinations, resulting in longer ride durations. Furthermore, the average ride distance follows a similar trend, with longer distances covered during the summer months compared to the colder seasons. These usage patterns suggest a seasonal trend in casual users' biking behavior, influenced by factors such as weather conditions and outdoor activities.
+ **Member User Key Points:**
    - Member users demonstrate more consistent activity throughout the year, with ride counts steadily increasing from the 1st to the 2nd quarter before experiencing a slight decline in the 4th quarter. The 3rd quarter sees the highest ride count, while the lowest count occurs in the 1st quarter. Average ride length for members remains relatively stable across quarters, with minor fluctuations observed. Similarly, average ride distance shows consistency, with slight variations but no significant deviations from the overall trend. These findings indicate a steady and reliable usage pattern among member users, suggesting that they may be using the service for commuting or regular transportation needs rather than seasonal recreational activities.

**Key Questions**:
1. **How do annual members and casual riders use Cyclistic bikes differently?**
    - Annual members tend to use Cyclistic bikes more consistently throughout the year, with a relatively stable usage pattern, suggesting a combination of commuting and non-commuting purposes. In contrast, casual riders exhibit more pronounced fluctuations in biking behavior, with higher usage and longer durations and distances during the warmer quarters, indicating a preference for leisure or recreational activities during these periods.
2. **Why would casual riders buy Cyclistic annual memberships?**
    - Casual riders may consider purchasing annual memberships if they find themselves frequently using the bike-sharing service, even during non-peak quarters, for commuting or transportation purposes. This decision becomes especially attractive during peak seasons or months when they engage in more outdoor activities. Additionally, incentives, discounts, or additional benefits offered to members could serve as compelling reasons for casual riders to upgrade to annual memberships, particularly if they anticipate using the service more frequently or consistently throughout the year.
3. **How can Cyclistic use digital media to influence casual riders to become members?**
    - Cyclistic can leverage digital media platforms to showcase the benefits and cost-effectiveness of annual memberships for frequent users, highlighting potential savings and convenience across all seasons. Targeted marketing campaigns and personalized offers based on casual riders' usage patterns could be implemented to encourage membership upgrades, particularly during the off-peak quarters. Additionally, promoting the environmental and health benefits of bike-sharing, as well as the convenience of commuting or transportation throughout the year, could resonate with casual riders and influence their decision to become members.

These insights uncover an understanding of the distinct patterns of user behaviors and preferences throughout the different quarters of the year, which will help develop an effective conversion strategy that aims to convert casual riders into annual members. Additionally, further analysis will provide deeper insights, enabling Cyclistic to refine its marketing strategies and enhance effectiveness even further.

--------------------------------------

### **Rideable Trends**

![6 1 Rideable Type Trends](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/6ea13403-ca07-4b5a-9290-ddf3eb3420ee)

#### **Summary of Rideable Trends**
The analysis of the “**Rideable Trends**” visualizations demonstrates the popularity of different rideable types among casual and member users, highlighting:

+ **Casual User Key Points**:
    - Casual users clearly favor electric_bikes (1,043,904 rides), as evidenced by the significantly higher count compared to classic_bikes (843,957 rides) and docked_bikes (74,850 rides). This preference suggests a desire for convenience and flexibility, likely due to the ease of navigation and reduced physical exertion associated with electric_bikes. While classic_bikes also see considerable usage among casual users, their count is notably lower than electric_bikes, indicating a secondary preference for traditional biking experiences. Docked_bikes, however, are the least popular among casual users, suggesting limited usage of this rideable type within this user group. This may be attributed to the inconvenience of returning the bike to a docking station, which might not align with the flexibility and convenience users seek.
+ **Member User Key Points**:
    - Members primarily utilize classic_bikes (754,117 rides), making it the most popular rideable type among this user group. Electric_bikes (1,742,263 rides) also enjoy popularity among members, indicating a significant preference for these modern and convenient rideable types. The preference for classic_bikes among members may indicate a preference for traditional biking experiences or commuting purposes, given their association with everyday transportation. Overall, members display a more balanced usage pattern between classic_bikes and electric_bikes compared to casual users, suggesting potentially different usage behaviors and preferences among the two user types.

**Key Questions**:
1. **How do annual members and casual riders use Cyclistic bikes differently?**
    - Annual members primarily gravitate towards classic bikes, indicative of a preference for a traditional biking experience. This preference may stem from factors such as familiarity, comfort, or specific usage needs, suggesting a reliance on biking for regular commuting or transportation purposes. In contrast, casual riders exhibit a notable inclination towards electric bikes, highlighting a desire for convenience and flexibility in their biking experience. This preference may be driven by factors such as ease of use, accessibility, or the ability to cover longer distances with less physical exertion. The contrasting bike preferences between annual members and casual riders underscore distinct usage patterns and motivations, reflecting differing needs and priorities within Cyclistic's user base.
2. **Why would casual riders buy Cyclistic annual memberships?**
    - Casual riders might consider purchasing Cyclistic annual memberships due to the convenience and cost-effectiveness they offer. By becoming annual members, casual riders gain access to a wider range of rideable types, including classic and electric bikes, enabling them to choose the most suitable option for their needs. Additionally, annual memberships often include benefits such as discounted ride fees or access to exclusive promotions, making them an attractive option for casual riders seeking to save money on bike-sharing services.
3. **How can Cyclistic use digital media to influence casual riders to become members?**
    - Cyclistic can leverage digital media channels to target casual riders and promote the benefits of annual memberships. Through targeted advertising campaigns on social media platforms and email newsletters, Cyclistic can highlight the convenience, cost-effectiveness, and additional perks of becoming annual members. Utilizing engaging content such as user testimonials, promotional videos, and interactive quizzes can effectively communicate the value proposition of annual memberships and encourage casual riders to make the switch. Additionally, offering limited-time discounts or special promotions exclusively for casual riders who sign up for annual memberships through digital channels can further incentivize conversion and drive membership growth.

These insights uncover the distinct preferences between the two user groups in terms of their choice of bikes, which will help develop an effective conversion strategy that aims to convert casual riders into annual members. Additionally, further analysis will provide deeper insights, enabling Cyclistic to refine its marketing strategies and enhance effectiveness even further.

--------------------------------------

### **Map Trends**

[![7 0 Interactive Map](https://github.com/chaanalyst/Portfolio-Projects/assets/154933301/9fa82a65-ac85-4e28-9cb0-08adb215f22a)](https://htmlview.glitch.me/?https://github.com/chaanalyst/Portfolio-Projects/blob/main/Google%20Data%20Analytics%20Capstone%20Projects/Cyclistic%20Bike-Share%3A%20Case%20Study/R%20/Interactive%20Map/Interactive_Map.html)
> [!NOTE]
> Clicking the image will redirect you to an interactive map hosted on a different website, where you can explore further details and features.

#### **Summary of Map Trends**
The analysis of the "**Map Trends**" interactive map demonstrates a meticulous examination of popular locations for user pathways, characterized by the dynamic interplay between start points, end points, and quarterly fluctuations, drawing insights from sample data extracted from the main dataset, highlighting:

--------------------------------------

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
