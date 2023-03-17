/*

A Microsoft Azure Supercloud customer is a company which buys at least 1 product from each product category.

Write a query to report the company ID which is a Supercloud customer.

As of 5 Dec 2022, data in the customer_contracts and products tables were updated.

customer_contracts Table:
|-------------|---------------|
|Column Name  | Type          |
|-------------|---------------|
|customer_id  | integer       |  
|product_id   | integer       |      
|amount       | integer       |
|-------------|---------------|

products Table:
|------------------|------------|
|Column Name       | Type       |
|------------------|------------|
|product_id        | integer    |
|product_category  | string     |
|product_name      | string     |
|------------------|------------|

*/


select customer_id from
    (SELECT 
        customer_id, 
        count(distinct(product_category)) as ct
    FROM customer_contracts c join products p on c.product_id = p.product_id
    group by 1
    order by 1) as l
where ct = 3;


