# BMW Global Sales Analysis (SQL)

### Project Overview
This project analyzes BMW global sales data from 2018–2025 using SQL. The objective is to explore sales performance across regions, models, and time while identifying key trends that influence revenue and vehicle demand.

### Dataset Description
The dataset contains monthly BMW sales information across different regions and models.
| Column           | Description                           |
| ---------------- | ------------------------------------- |
| Year             | Year of the sales record              |
| Month            | Month of the sales record             |
| Region           | Market where the vehicle was sold     |
| Model            | BMW vehicle model                     |
| Units_Sold       | Number of vehicles sold               |
| Avg_Price_EUR    | Average price of the vehicle in euros |
| Revenue_EUR      | Total revenue generated               |
| BEV_Share        | Share of electric vehicle sales       |
| Premium_Share    | Share of premium segment vehicles     |
| GDP_Growth       | Regional economic growth indicator    |
| Fuel_Price_Index | Fuel price level indicator            |

### Tools Used

- SQL - MySql
- Data exploration with aggregation queries


### Data Cleaning
Before performing analysis, the dataset was checked and prepared using SQL.
Cleaning steps included:
+ Checking for missing values
``` SQL
select * from car_data
limit 10;
select * from car_data
where Month is null or Month = "null" or Month ="";
select * from car_data
where Year is null or Year = "null" or Year ="";
```
+ Verifying data types
``` SQL
Describe car_data;
```
+ Updating month number with month name
``` SQL
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
```
+ Inspecting duplicate records
+ Validating revenue calculations
+ Ensuring numeric columns were properly formatted

### Exploratory Data Analysis
The following business questions were explored:
+ How have BMW revenues changed over time?
``` SQL
select year,
       SUM(revenue_eur) AS total_revenue
from car_data
group by year
order by year;
```
+ Which regions generate the highest revenue?
``` SQL
Select Region, SUM(Revenue_EUR) AS revenue
from car_data
group by Region
order by revenue desc;
```
+ What are the top-selling BMW models?
``` SQL
select Model,sum(Units_Sold) as Qty_sold
from car_data
group by Model
Order by Qty_sold;
```
+ How does fuel price relate to vehicle sales?
+ How is electric vehicle adoption evolving?
SQL queries were used to aggregate revenue, units sold, and other metrics to answer these questions.

### Key Insights
+ Revenue shows consistent growth between 2023 and 2025.
+ China and RestOfWorld generate the largest share of sales.
+ Certain SUV models like X7,iX,X5,i4 contribute the highest revenue.
+ Higher fuel prices appear to correlate with increased electric vehicle adoption.
+ The share of electric vehicles has steadily increased over time.

### Recommendations
+ BMW should continue investing in electric vehicle models, especially in regions with rising fuel prices, as higher fuel costs appear to support increased EV adoption.
+ Marketing and supply efforts can be strengthened in top-performing regions to maximize revenue growth.
+ High-performing models should receive priority in production planning and promotional campaigns.
+ Seasonal sales patterns can be used to optimize inventory and pricing strategies.
