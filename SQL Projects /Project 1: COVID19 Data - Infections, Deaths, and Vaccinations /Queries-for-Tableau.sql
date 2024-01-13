/* Queries used for Tableau Project */


-- 1. Global Numbers: Total Cases, Total Deaths, Death Percentage

select 
    sum(new_cases) as total_cases
    , sum(cast(new_deaths as int)) as total_deaths
    , sum(cast(new_deaths as int))/sum(new_cases)*100 as deathpercentage
from PortfolioProject.dbo.CovidDeaths
--where location like '%states%'
where continent is not null 
--group by date
order by 1,2


-- 2. Total Deaths Per Continent

select location, sum(cast(new_deaths as int)) as totaldeathcount
from PortfolioProject..CovidDeaths
--where location like '%states%'
where continent is null 
and location not in ('World', 'European Union', 'International')
group by location
order by totaldeathcount desc


-- 3. Percent Population Infected Per Country

select location, population, max(total_cases) as highestinfectioncount
    ,  max((total_cases/population))*100 as percentpopulationinfected
from PortfolioProject..CovidDeaths
--where location like '%states%'
group by location, population
order by percentpopulationinfected desc


-- 4. Percent Population Infected

select location, population, date, max(total_cases) as highestinfectioncount,  max((total_cases/population))*100 as percentpopulationinfected
from PortfolioProject..CovidDeaths
--where location like '%states%'
group by location, population, date
order by percentpopulationinfected desc
