/*

Assume you are given the table containing information on Amazon customers and their spending on products in various categories.

Identify the top two highest-grossing products within each category in 2022. Output the category, product, and total spend.

product_spend Table:
|-----------------|--------------|
|Column Name      | Type         |
|-----------------|--------------|
|category         | string       |
|product          | string       |
|user_id          | integer      | 
|spend            | decimal      | 
|transaction_date | timestamp    |
|-----------------|--------------|

*/


select 
    category, product, total_spend 
from(
    select 
        category, product, extract(year from transaction_date) as yr, 
        sum(spend) as total_spend,
        dense_rank() over(partition by category order by sum(spend) desc) as rn
    from product_spend
    group by 1,2,3
    having extract(year from transaction_date) = '2022' 
) as a  
where rn<3;


