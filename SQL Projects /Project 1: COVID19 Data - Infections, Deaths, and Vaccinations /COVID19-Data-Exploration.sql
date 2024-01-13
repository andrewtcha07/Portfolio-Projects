/* COVID 19 Vaccination and Deaths */

select *
from portfolioproject.dbo.CovidDeaths
where continent is not null
order by 3,4


-- Chooising the Data that we will Utlize

select 
    location
    , date
    , total_cases
    , new_cases
    , total_deaths
    , population
from PortfolioProject.dbo.CovidDeaths
where continent is not null
order by 1,2

    
-- Total Cases vs. Total Deaths
    -- shows likelihood of dying if you contract COVID in your country

select 
    location
    , date
    , total_cases
    , total_deaths
    , (convert(float, total_deaths) / nullif (convert(float,total_cases) ,0)) * 100 
    as death_percentage
from PortfolioProject.dbo.CovidDeaths
where location like '%states%' and continent is not null
order by 1,2


-- Total Cases vs. Population
    -- shows what percentage of population infected with COVID

select
    location
    , date
    , population
    , total_cases
    , (convert(float, total_cases) / nullif (convert(float,population) ,0)) * 100 as percent_population_infected
from PortfolioProject.dbo.CovidDeaths
--where location like '%states%' and continent is not null
order by 1,2

    
-- Countries with Highest Infection Rate compared to Population

select 
    location
    , population
    , max(total_cases) as highest_infection_count
    , max((convert(float, total_cases) / nullif (convert(float,population) ,0))) * 100 as percent_population_infected
from PortfolioProject.dbo.CovidDeaths
--where location like '%states%' and continent is not null
group by location, population
order by percent_population_infected desc

    
-- Countries with Highest Death Count per Population

select 
    location
    , max(cast(total_deaths as int)) as total_death_count
from PortfolioProject.dbo.CovidDeaths
--where location like '%states%' 
where continent is not null
group by location
order by total_death_count desc
    

-- Breaking Things Down By Continent
    -- Showing Continent with the Highest Death Count per Population

select 
    location
    , max(cast(total_deaths as int)) as total_death_count
from PortfolioProject.dbo.CovidDeaths
--where location like '%states%' 
where continent is not null
group by location
order by total_death_count desc

    
-- Global Number
    -- death across the world per day

select --date, 
    sum(new_cases) as total_cases, 
    sum(cast(new_deaths as int)) as total_deaths, 
    sum(cast(new_deaths as int))/sum(new_cases)*100 as death_percentage
from PortfolioProject.dbo.CovidDeaths
--where location like '%states%'
where continent is not null
--group by date
order by 1,2

    
-- Total Population vs. Vaccinations
    -- shows percentage of population that has recieved at least one COVID vaccine

select 
    dea.continent
    , dea.location
    , dea.date
    , dea.population
    , vac.new_vaccinations
    , sum(cast(vac.new_vaccinations as bigint)) over (partition by dea.location order by dea.location, dea.date) as rolling_people_vaccinated
    --, (rolling_people_vaccinated/population)*100
from PortfolioProject.dbo.CovidDeaths dea
join PortfolioProject.dbo.CovidVaccinations vac
    on dea.location = vac.location
    and dea.date = vac.date
where dea.continent is not null
order by 2,3

    
-- Using CTE to perform Calculations on Partition by in Previous Query

with popvsvac 
    (continent
    , location
    , date
    , population
    , vac_new_vaccinations
    , rolling_people_vaccinated)
as
(
select 
    dea.continent
    , dea.location
    , dea.date
    , dea.population
    , vac.new_vaccinations
    , sum(cast(vac.new_vaccinations as bigint)) over (partition by dea.location order by dea.location, dea.date) as rolling_people_vaccinated
    --, (rolling_people_vaccinated/population)*100
from PortfolioProject.dbo.CovidDeaths dea
join PortfolioProject.dbo.CovidVaccinations vac
    on dea.location = vac.location
    and dea.date = vac.date
where dea.continent is not null
--order by 2,3
) 
select *,
    (rolling_people_vaccinated/population)*100 as percent_population_vaccinated
from popvsvac

    
-- Using Temp Table to perform Calculation on Partition by in Previous Query 

drop table if exists #percent_population_vaccinated
create table #percent_population_vaccinated
(
continent nvarchar(255)
, location nvarchar(255)
, date datetime
, population numeric
, new_vaccinations numeric
, rolling_people_vaccinated numeric
)

insert into #percent_population_vaccinated
select 
    dea.continent
    , dea.location
    , dea.date
    , dea.population
    , vac.new_vaccinations
    , sum(cast(vac.new_vaccinations as bigint)) over (partition by dea.location order by dea.location, dea.date) as rolling_people_vaccinated
    --, (rolling_people_vaccinated/population)*100
from PortfolioProject.dbo.CovidDeaths dea
join PortfolioProject.dbo.CovidVaccinations vac
    on dea.location = vac.location
    and dea.date = vac.date
--where dea.continent is not null
--order by 2,3

select *,
    (rolling_people_vaccinated/population)*100 as percent_population_vaccinated
from #percent_population_vaccinated
