/*

CVS Health is trying to better understand its pharmacy sales, and how well different products are selling. 
Each drug can only be produced by one manufacturer.

Write a query to find the top 3 most profitable drugs sold, and how much profit they made. Assume that there are no ties in the profits. 
Display the result from the highest to the lowest total profit.

Definition:
cogs stands for Cost of Goods Sold which is the direct cost associated with producing the drug.
Total Profit = Total Sales - Cost of Goods Sold


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


SELECT 
  drug,
  (total_sales-cogs) as profit
FROM pharmacy_sales
order by 2 desc
limit 3;

