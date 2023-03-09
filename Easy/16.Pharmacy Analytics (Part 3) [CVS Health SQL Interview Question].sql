/*

CVS Health is trying to better understand its pharmacy sales, and how well different products are selling. 
Each drug can only be produced by one manufacturer.

Write a query to find the total sales of drugs for each manufacturer. 
Round your answer to the closest million, and report your results in descending order of total sales.

Because this data is being directly fed into a dashboard which is being seen by business stakeholders, format your result like this: "$36 million".

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
    manufacturer, 
    CONCAT('$', ROUND(sum(total_sales) / 1000000), ' million') as total
FROM pharmacy_sales
group by 1
order by sum(total_sales) desc;

