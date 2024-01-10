select *
from portfolioproject.dbo.coviddeaths
where continent is not null
order by 3,4

select *
from portfolioproject.dbo.CovidVaccinations
order by 3,4

-- "Select Data that we are going to be using"

select 
    location
    , date
    , total_cases
    , new_cases
    , total_deaths
    , population
from PortfolioProject.dbo.coviddeaths
where continent is not null
order by 1,2

-- "Looking at Total Cases vs. Total Deaths"
    -- Shows the likelihood of dying if you contract covid in your country

select 
    location
    , date
    , total_cases
    , total_deaths
    , (total_deaths/total_cases) * 100 as death_percentage
from PortfolioProject.dbo.coviddeaths
order by 1,2

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


-- "Looking at Total Cases vs. Percentage"
    -- Shows what percentage of population got covid

select
    location
    , date
    , population
    , total_cases
    , (convert(float, total_cases) / nullif (convert(float,population) ,0)) * 100 as percent_population_infected
from PortfolioProject.dbo.CovidDeaths
--where location like '%states%' and continent is not null
order by 1,2

-- "Looking at Countries with Highest Infection Rate compared to Population"

select 
    location
    , population
    , max(total_cases) as highest_infection_count
    , max((convert(float, total_cases) / nullif (convert(float,population) ,0))) * 100 as percent_population_infected
from PortfolioProject.dbo.CovidDeaths
--where location like '%states%' and continent is not null
group by location, population
order by percent_population_infected desc

-- "Showing Countries with Highest Death Count per Population"

-- "Incorrect datatype"

select 
    location
    , max(total_deaths) as total_death_count
from PortfolioProject.dbo.CovidDeaths
--where location like '%states%' 
where continent is not null
group by location
order by total_death_count desc

-- "Using cast function to convert to a different datatype"

select 
    location
    , max(cast(total_deaths as int)) as total_death_count
from PortfolioProject.dbo.CovidDeaths
--where location like '%states%' 
where continent is not null
group by location
order by total_death_count desc

-- "LET'S BREAK THINGS DOWN BY CONTINENT"

-- "Showing Continent with the Highest Death Count per Population"

select 
    continent
    , max(cast(total_deaths as int)) as total_death_count
from PortfolioProject.dbo.CovidDeaths
--where location like '%states%' 
where continent is not null
group by continent
order by total_death_count desc

-- accurate set data of total_death_count

select 
    location
    , max(cast(total_deaths as int)) as total_death_count
from PortfolioProject.dbo.CovidDeaths
--where location like '%states%' 
where continent is null
group by location
order by total_death_count desc

-- "GLOBAL NUMBERS"

-- "Death Across the World Per Day"

select date, 
    sum(new_cases) as total_cases, 
    sum(cast(new_deaths as int)) as total_deaths, 
    sum(cast(new_deaths as int))/sum(new_cases)*100 as death_percentage
from PortfolioProject.dbo.CovidDeaths
--where location like '%states%'
where continent is not null
group by date
order by 1,2

-- "Total Across the World"

select --date, 
    sum(new_cases) as total_cases, 
    sum(cast(new_deaths as int)) as total_deaths, 
    sum(cast(new_deaths as int))/sum(new_cases)*100 as death_percentage
from PortfolioProject.dbo.CovidDeaths
--where location like '%states%'
where continent is not null
--group by date
order by 1,2

-- "Joining CovidDeaths and CovidVaccinations"

select *
from PortfolioProject.dbo.CovidDeaths dea
join PortfolioProject.dbo.CovidVaccinations vac
    on dea.location = vac.location
    and dea.date = vac.date

-- "Looking at Total Population vs Vaccinations"

select 
    dea.continent
    , dea.location
    , dea.date
    , dea.population
    , vac.new_vaccinations 
from PortfolioProject.dbo.CovidDeaths dea
join PortfolioProject.dbo.CovidVaccinations vac
    on dea.location = vac.location
    and dea.date = vac.date
where dea.continent is not null
order by 2,3

-- select 
--     dea.continent
--     , dea.location
--     , dea.date
--     , dea.population
--     , vac.new_vaccinations
-- from PortfolioProject.dbo.CovidDeaths dea
-- join PortfolioProject.dbo.CovidVaccinations vac
--     on dea.location = vac.location
--     and dea.date = vac.date
-- where dea.continent is not null and vac.new_vaccinations is not null
-- order by 2,3

-- "New Vaccinations Per Day"

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

-- "Use CTE"

with popvsvac
    (continent
    , location
    , date
    , population
    , vac_new_vaccinations
    , rolling_people_vaccinated)
as
(select 
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
select *
from popvsvac

-- "Percent of Population Vaccinated"

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

-- check out the max table version

-- "Temp Table"

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
where dea.continent is not null
--order by 2,3

select *,
    (rolling_people_vaccinated/population)*100 as percent_population_vaccinated
from #percent_population_vaccinated

-- "Drop Temp Table"

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

-- "Creating View to Store Data for Later Vizualization"

create view percent_population_vaccinated as
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

create view total_death_count as
select 
    location
    , max(cast(total_deaths as int)) as total_death_count
from PortfolioProject.dbo.CovidDeaths
--where location like '%states%' 
where continent is null
group by location
--order by total_death_count desc
