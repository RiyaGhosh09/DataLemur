/*

Assume you are given the table on Walmart user transactions. Based on a user's most recent transaction date, 
write a query to obtain the users and the number of products bought.

Output the user's most recent transaction date, user ID and the number of products sorted by the transaction date in chronological order.

P.S. As of 10 Nov 2022, the official solution was changed from output of the transaction date, number of users and number of products to the current output.

user_transactions Table:
|-----------------|--------------|
|Column Name      | Type         |
|-----------------|--------------|
|product_id       | integer      |
|user_id          | integer      |
|spend            | decimal      |
|transaction_date | timestamp    |
|-----------------|--------------|

*/

select 
    transaction_date, user_id, count(product_id) as purchase_count from
        (SELECT *,
            max(transaction_date) over(partition by user_id) as recent_date
        FROM user_transactions
        order by user_id) as d
where transaction_date = recent_date
group by 1,2;

