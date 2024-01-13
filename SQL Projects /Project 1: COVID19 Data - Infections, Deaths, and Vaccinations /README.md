# COVID-19 Data: Infections, Mortality, and Vaccinations

created by: Andrew Cha

## Summary

The provided queries explore and analyze a dataset related to the impact of COVID-19 across various countries and continents. The datasets contain information on COVID-19 cases, deaths, and vaccinations. The queries delve into different aspects of this dataset, offering insights into the spread of the virus, mortality rates, and the progress of vaccination campaigns.

### 1. Starting Data Selection:

Initial exploration of the dataset, ensuring that entries with valid continent information are selected.

### 2. Initial Data Fields:

Selection of fundamental data fields including location, date, total cases, new cases, total deaths, and population.

### 3. Total Cases vs Total Deaths:

Examination of the relationship between total cases and total deaths, highlighting the likelihood of mortality if an individual contracts COVID-19 in specific locations.

### 4. Total Cases vs Population:

Analysis of the percentage of the population infected with COVID-19 over time, providing insights into the impact on different regions.

### 5. Countries with Highest Infection Rate Compared to Population:

Identification of countries with the highest infection rates concerning their population, shedding light on the severity of the outbreak in specific regions.

### 6. Countries with Highest Death Count per Population:

Recognition of countries with the highest death counts relative to their population, offering insights into the gravity of the pandemic's impact on different nations.

### 7. Breakdown by Continent - Highest Death Count per Population:

Examination of continents to determine the regions with the highest death counts per population, providing a broader perspective on the global impact of COVID-19.

### 8. Global Numbers:

Aggregation of global statistics, including total cases, total deaths, and a calculated death percentage, offering an overview of the overall impact of the pandemic.

### 9. Total Population vs Vaccinations:

Exploration of the relationship between total population, new vaccinations, and the cumulative number of vaccinated individuals over time, showcasing the progress of vaccination efforts.

### 10. Calculations using CTE:

Utilization of a Common Table Expression (CTE) to perform calculations related to the rolling count of vaccinated individuals and the percentage of the population vaccinated.

### 11. Calculations using Temp Table:

Creation of a temporary table to store and analyze the relationship between population, new vaccinations, and the rolling count of vaccinated individuals.

### 12. View for Later Visualizations:

Creation of a view named "PercentPopulationVaccinated" that encapsulates relevant data for potential later visualizations and insights.

These queries provide a comprehensive exploration of COVID-19 data, offering valuable perspectives on infection rates, mortality, and vaccination progress at both the country and continent levels. The results obtained from these queries can be utilized for further analysis, reporting, and visualization to enhance our understanding of the global impact of the COVID-19 pandemic.

## Skills

```SQL
- Joins
- CTE
- Temp Tables
- Windows Functions
- Aggregate Functions
- Creating Views
- Converting Data Types
```

## Installations

```SQL
- MySQL
- Azure Data Studio
- Microsoft Excel
- Tableau
- Github
```

## Dataset(s)

`CovidDeath.csv`

`CovidVaccinations.csv`

## Visuals

## License, Authors, Acknowledgements

[Alex The Analysts](https://www.alextheanalyst.com/)
