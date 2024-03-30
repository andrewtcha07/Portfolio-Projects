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
feb2023 <- read_csv("202302-divvy-tripdata.csv")
mar2023 <- read_csv("202303-divvy-tripdata.csv")
apr2023 <- read_csv("202304-divvy-tripdata.csv")
may2023 <- read_csv("202305-divvy-tripdata.csv")
jun2023 <- read_csv("202306-divvy-tripdata.csv")
jul2023 <- read_csv("202307-divvy-tripdata.csv")
aug2023 <- read_csv("202308-divvy-tripdata.csv")
sep2023 <- read_csv("202309-divvy-tripdata.csv")
oct2023 <- read_csv("202310-divvy-tripdata.csv")
nov2023 <- read_csv("202311-divvy-tripdata.csv")
dec2023 <- read_csv("202312-divvy-tripdata.csv")
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
