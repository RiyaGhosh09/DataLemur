/*

Assume you are given the table containing measurement values obtained from a Google sensor over several days. 
Measurements are taken several times within a given day.

Write a query to obtain the sum of the odd-numbered and even-numbered measurements on a particular day, in two different columns. 
Refer to the Example Output below for the output format.

Definition:
1st, 3rd, & 5th measurements taken within a day are considered odd-numbered measurements and 
the 2nd, 4th, & 6th measurements are even-numbered measurements.

measurements Table:
|-------------------|-------------|
|Column Name        | Type        |
|-------------------|-------------|
|measurement_id     | integer     |
|measurement_value  | decimal     |
|measurement_time   | datetime    |
|-------------------|-------------|

*/


with cte as
  (select 
      row_number() over(partition by dt order by measurement_time) as rn, *
  from(
      SELECT 
          measurement_value,	measurement_time,
          date(measurement_time) as dt
      FROM measurements) as t),

cte2 as(
  select 
      dt,
      case when (rn%2)::int != 0 then sum(measurement_value) else 0 end as odd_sum,
      case when (rn%2)::int = 0 then sum(measurement_value) else 0 end as even_sum
  from cte
  group by 1,rn
  order by 1)

select 
    dt as measurement_day, 
    sum(odd_sum) as odd_sum, 
    sum(even_sum) as even_sum
from cte2 
group by 1 
order by 1;

