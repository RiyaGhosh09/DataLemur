/*

Assume you have the table below containing information on Facebook user actions. Write a query to obtain the active user retention in July 2022. 
Output the month (in numerical format 1, 2, 3) and the number of monthly active users (MAUs).

Hint: An active user is a user who has user action ("sign-in", "like", or "comment") in the current month and last month.

user_actions Table:
|-------------|-------------------------------------|
|Column Name  | Type                                |
|-------------|-------------------------------------|
|user_id      | integer                             |
|event_id     | integer                             |
|event_type   | string ("sign-in, "like", "comment")|
|event_date   | datetime                            |
|-------------|-------------------------------------|

*/


with cte as(
    SELECT *, extract(month from event_date) as month
    FROM user_actions
    where extract(month from event_date) in (6,7)
    and event_type in ('sign-in', 'like', 'comment')
),

cte2 as(
    select distinct user_id, month,
    dense_rank() over(partition by user_id order by month) as rn
    from cte
)

select 
    month, count(user_id) as monthly_active_users
from cte2  where rn>1 group by 1;

