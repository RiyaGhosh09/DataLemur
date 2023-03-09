/*

Assume you are given the table below on Uber transactions made by users. Write a query to obtain the third transaction of every user. 
Output the user id, spend and transaction date.

transactions Table:
|-----------------|-----------|
|Column Name      | Type      |
|-----------------|-----------|
|user_id          | integer   |
|spend            | decimal   |
|transaction_date | timestamp |
|-----------------|-----------|

*/


select 
    user_id, 
    spend, 
    transaction_date 
from
    (SELECT *,
    rank() over(partition by user_id order by transaction_date) as rn
    FROM transactions
    order by user_id,transaction_date) as a 
where rn=3;

