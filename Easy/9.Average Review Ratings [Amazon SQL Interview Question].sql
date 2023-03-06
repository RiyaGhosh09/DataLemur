/*

Given the reviews table, write a query to get the average stars for each product every month.

The output should include the month in numerical value, product id, and average star rating rounded to two decimal places. 
Sort the output based on month followed by the product id.


reviews Table:
|---------------|-----------------|
|Column Name    | Type            |
|---------------|-----------------|
|review_id      | integer         |
|user_id        | integer         |
|submit_date    | datetime        |
|product_id     | integer         |
|stars          | integer (1-5)   |
|---------------|-----------------|

*/


SELECT 
    extract(month from submit_date) as month, 
    product_id,	
    round(avg(stars),2) as avg_rating 
FROM reviews
group by 1,2
order by 1,2;

