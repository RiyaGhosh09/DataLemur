/*

You are given the tables below containing information on Robinhood trades and users. 
Write a query to list the top three cities that have the most completed trade orders in descending order.

Output the city and number of orders.

trades Table:
|--------------|-----------------------------------|
|Column Name   | Type                              |
|--------------|-----------------------------------|
|order_id      | integer                           |
|user_id       | integer                           |
|price         | decimal                           |
|quantity      | integer                           |
|status        | string('Completed' ,'Cancelled')  |
|timestamp     | datetime                          |
|--------------|-----------------------------------|

users Table:
|--------------|------------------|
|Column Name   | Type             |
|--------------|------------------|
|user_id       | integer          |
|city          | string           |
|email         | string           |
|signup_date   | datetime         |
|--------------|------------------|

*/


SELECT 
    city, 
    count(order_id) as total_orders
FROM trades t join users u on t.user_id=u.user_id
where status = 'Completed'
group by 1
order by 2 desc
limit 3;

