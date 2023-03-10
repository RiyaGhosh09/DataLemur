/*

Assume you are given the tables below containing information on Snapchat users, their ages, and their time spent sending and opening snaps. 
Write a query to obtain a breakdown of the time spent sending vs. opening snaps(as a percentage of total time spent on these activities) for each age group.

Output the age bucket and percentage of sending and opening snaps. Round the percentage to 2 decimal places.

Notes:

You should calculate these percentages:
time sending / (time sending + time opening)
time opening / (time sending + time opening)

To avoid integer division in percentages, multiply by 100.0 and not 100.

activities Table:
|----------------|---------------------------------|
|Column Name     | Type                            |
|----------------|---------------------------------|
|activity_id     | integer                         |
|user_id         | integer                         |
|activity_type   | string ('send', 'open', 'chat') |
|time_spent      | float                           |
|activity_date   | datetime                        |
|----------------|---------------------------------|

age_breakdown Table:
|--------------|------------------------------------|
|Column Name   | Type                               |
|--------------|------------------------------------|
|user_id       | integer                            |
|age_bucket    | string ('21-25', '26-30', '31-25') |
|--------------|------------------------------------|

*/


with cte as
    (SELECT age_bucket,
    sum(case when activity_type = 'open' then time_spent else 0 end) as open,
    sum(case when activity_type = 'send' then time_spent else 0 end) as send
    FROM activities a join age_breakdown b
    on a.user_id = b.user_id
    where activity_type in ('open','send')
    group by 1)

select 
    age_bucket, 
    round(send*100/(open+send),2) as send_percent,
    round(open*100/(open+send),2) as open_percent
from cte;

