/* Cleaning Data in Nashville Housing */


select *
from PortfolioProject.dbo.NashvilleHousing


select saledateconverted
from PortfolioProject.dbo.NashvilleHousing


-- Standarizerd Date Format


select saledateconverted
    , convert(date,saledate)
from PortfolioProject.dbo.NashvilleHousing

update NashvilleHousing
set saledate = convert(date,saledate)

alter table NashvilleHousing
add saledateconverted date;

update NashvilleHousing
set saledateconverted = convert(date,saledate)


-- Renaming a Column


EXEC sp_rename 'dbo.NashvilleHousing.saledateconverted', 'NewSaleDate', 'COLUMN';


-- Populate Property Address Data


select *
from PortfolioProject.dbo.NashvilleHousing
--where propertyaddress is null
order by parcelid

select propertyaddress
from PortfolioProject.dbo.NashvilleHousing
where propertyaddress is null

select a.parcelid
    , a.propertyaddress
    , b.parcelid
    , b.propertyaddress
    , isnull(a.propertyaddress,b.propertyaddress)
from PortfolioProject.dbo.NashvilleHousing a
join PortfolioProject.dbo.NashvilleHousing b
    on a.parcelid = b.parcelid
    and a.uniqueid <> b.uniqueid
where a.propertyaddress is null

update a
set propertyaddress = isnull(a.propertyaddress,b.propertyaddress)
from PortfolioProject.dbo.NashvilleHousing a
join PortfolioProject.dbo.NashvilleHousing b
    on a.parcelid = b.parcelid
    and a.uniqueid <> b.uniqueid
where a.propertyaddress is null



-- Breaking out Address into Individual Columns (Address, City, State)

-- Separate Property Address

select propertyaddress
from PortfolioProject.dbo.NashvilleHousing
--where propertyaddress is null
--order by parcelid

select
substring(propertyaddress, 1, charindex(',', propertyaddress) -1) as address
    , substring(propertyaddress, charindex(',', propertyaddress) +1, len(propertyaddress)) as address
from PortfolioProject.dbo.NashvilleHousing

alter table NashvilleHousing
add PropertySplitAddress nvarchar(MAX);

update NashvilleHousing
set PropertySplitAddress = substring(propertyaddress, 1, charindex(',', propertyaddress) -1)

alter table NashvilleHousing
add PropertySplitCity nvarchar(MAX);

update NashvilleHousing
set PropertySplitCity = substring(propertyaddress, charindex(',', propertyaddress) +1, len(propertyaddress))


-- Separate Owner Property


select owneraddress
from PortfolioProject.dbo.NashvilleHousing

select
parsename(replace(owneraddress, ',', '.') ,3)
    , parsename(replace(owneraddress, ',', '.') ,2)
    , parsename(replace(owneraddress, ',', '.') ,1)
from PortfolioProject.dbo.NashvilleHousing

alter table NashvilleHousing
add OwnerSplitAddress nvarchar(MAX);

update NashvilleHousing
set OwnerSplitAddress = parsename(replace(owneraddress, ',', '.') ,3)

alter table NashvilleHousing
add OwnerSplitCity nvarchar(MAX);

update NashvilleHousing
set OwnerSplitCity = parsename(replace(owneraddress, ',', '.') ,2)

alter table NashvilleHousing
add OwnerSplitState nvarchar(MAX);

update NashvilleHousing
set OwnerSplitState = parsename(replace(owneraddress, ',', '.') ,1)


-- Change Y and N to Yes and No in "Sold as Vacant" field


select distinct(soldasvacant)
    , count(soldasvacant)
from PortfolioProject.dbo.NashvilleHousing
group by soldasvacant
order by 2

select soldasvacant
    , case when soldasvacant = 'Y' then 'Yes'
        when soldasvacant = 'N' then 'No'
        else soldasvacant
        end
from PortfolioProject.dbo.NashvilleHousing

update NashvilleHousing
set soldasvacant = case when soldasvacant = 'Y' then 'Yes'
        when soldasvacant = 'N' then 'No'
        else soldasvacant
        end


-- Remove Duplicates


with RomNumCTE as(
select *
    , row_number() over(
        partition by parcelid
        , propertyaddress
        , saleprice
        , saledate
        , legalreference
        order by uniqueid
    ) row_num
from PortfolioProject.dbo.NashvilleHousing
-- order by parcelid
)
select *
from RomNumCTE
where row_num > 1
order by propertyaddress


with RomNumCTE as(
select *
    , row_number() over(
        partition by parcelid
        , propertyaddress
        , saleprice
        , saledate
        , legalreference
        order by uniqueid
    ) row_num
from PortfolioProject.dbo.NashvilleHousing
-- order by parcelid
)
delete
from RomNumCTE
where row_num > 1
-- order by propertyaddress


-- Delete unused Columns


select *
from PortfolioProject.dbo.NashvilleHousing

alter table PortfolioProject.dbo.NashvilleHousing
drop column owneraddress
    , taxdistrict
    , propertyaddress
    , saledate