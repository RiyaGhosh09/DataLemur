/*

Assume you are given the table below containing information on user transactions for particular products. 
Write a query to obtain the year-on-year growth rate for the total spend of each product for each year.

Output the year (in ascending order) partitioned by product id, current year's spend, previous year's spend and
year-on-year growth rate(percentage rounded to 2 decimal places).

user_transactions Table:
|------------------|--------------|
|Column Name       | Type         |
|------------------|--------------|
|transaction_id    | integer      |
|product_id        | integer      |
|spend             | decimal      |
|transaction_date  | datetime     |
|------------------|--------------|

*/

with cte as(
    select 
        extract(year from transaction_date) as year, product_id, spend as curr_year_spend,
        lag(spend,1) over(partition by product_id order by extract(year from transaction_date)) as prev_year_spend
    from user_transactions
    order by 2,1
)

select 
    *, round((curr_year_spend-prev_year_spend)*100.0/prev_year_spend,2) as yoy_rate
from cte;

