/*

CVS Health is trying to better understand its pharmacy sales, and how well different products are selling. 
Each drug can only be produced by one manufacturer.

Write a query to find out which manufacturer is associated with the drugs that were not profitable and how much money CVS lost on these drugs. 

Output the manufacturer, number of drugs and total losses. Total losses should be in absolute value. Display the results with the highest losses on top.


pharmacy_sales Table:
|-------------|------------|
|Column Name  | Type       |
|-------------|------------|
|product_id   | integer    |
|units_sold   | integer    |
|total_sales  | decimal    |
|cogs         | decimal    |
|manufacturer | varchar    |
|drug         | varchar    |
|-------------|------------|

*/


with cte as
    (SELECT 
      manufacturer,
      drug,
      (cogs-total_sales) as loss
    FROM pharmacy_sales
    where (cogs-total_sales)>0)

select 
  manufacturer,
  count(drug) as num_of_drugs,
  abs(sum(loss)) as total_losses
from cte 
group by 1
order by 3 desc;

