/*
This is the same question as problem #3 in the SQL Chapter of Ace the Data Science Interview!

Assume that you are given the table below containing information on viewership by device type (where the three types are laptop, tablet, and phone). 
Define “mobile” as the sum of tablet and phone viewership numbers. Write a query to compare the viewership on laptops versus mobile devices.

Output the total viewership for laptop and mobile devices in the format of "laptop_views" and "mobile_views".

viewership Table:
|--------------|--------------------------------------|
|Column Name   | Type                                 |
|--------------|--------------------------------------|
|user_id       | integer                              |
|device_type   | string ('laptop', 'tablet', 'phone') |
|view_time     | timestamp                            |
|--------------|--------------------------------------|
*/


with cte as
(SELECT user_id, device_type,
case
  when device_type = 'tablet' or device_type = 'phone' then 1
  else 0
end as mobile,
case
  when device_type = 'laptop' then 1
  else 0
end as laptop
FROM viewership)

select 
  sum(laptop) as laptop_views,
  sum(mobile) as mobile_views
from cte;
