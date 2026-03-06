create database Project;

-- Calling out the table
select * from car_data;
Describe car_data;

-- Data Checks
select * from car_data
limit 10;
select * from car_data
where Month is null or Month = "null" or Month ="";
select * from car_data
where Year is null or Year = "null" or Year ="";

Select 
    Year,
    Month,
    Region,
    Model,
    COUNT(*) AS duplicate_count
from car_data
group by Year, Month, Region, Model
having COUNT(*) > 1;

Select distinct Month from car_data;
-- Replacing Month number with Month Name
Select Month, Case
when Month = 1 then "January"
when Month = 2 then "February"
when Month = 3 then "March"
when Month = 4 then "April"
when Month = 5 then "May"
when Month = 6 then "June"
when Month = 7 then "July"
when Month = 8 then "August"
when Month = 9 then "September"
when Month = 10 then "October"
when Month = 11 then "November"
else "December"
end as Month_name
from car_data;


Alter table car_data
add column Month_name text;

update car_data
set Month_name = Case
when Month = 1 then "January"
when Month = 2 then "February"
when Month = 3 then "March"
when Month = 4 then "April"
when Month = 5 then "May"
when Month = 6 then "June"
when Month = 7 then "July"
when Month = 8 then "August"
when Month = 9 then "September"
when Month = 10 then "October"
when Month = 11 then "November"
else "December"
end;

-- Revenue trend by year
Select Year,
  SUM(Revenue_EUR) AS total_revenue,
  SUM(Units_Sold) AS total_units,
  AVG(Avg_Price_EUR) AS avg_price
from car_data
group by year
order by total_revenue desc;

select year,
       SUM(revenue_eur) AS total_revenue
from car_data
group by year
order by year;

-- Top regions by revenue
Select Region, SUM(Revenue_EUR) AS revenue
from car_data
group by Region
order by revenue desc;


Select Region, sum(Units_Sold) as Total_Qty
from car_data
group by Region;

-- Top models by revenue
SELECT Model, SUM(Revenue_EUR) AS revenue, avg(GDP_Growth)
FROM car_data
GROUP BY Model
ORDER BY revenue DESC
LIMIT 10;

-- Top models by units_sold
select Model,sum(Units_Sold) as Qty_sold
from car_data
group by Model
Order by Qty_sold;

-- Monthly seasonality (all years combined)
SELECT Month_name, SUM(Revenue_EUR) AS revenue
FROM car_data
GROUP BY Month_name
ORDER BY revenue desc;

-- Electric share by year (BEV)
SELECT Year, AVG(BEV_Share) AS avg_bev_share
FROM car_data
GROUP BY Year
ORDER BY Year desc;

SELECT 
    AVG(Fuel_Price_Index) AS avg_fuel_price,
    SUM(Units_Sold) AS total_units
FROM car_data;