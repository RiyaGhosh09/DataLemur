/*

Assume you have an events table on app analytics. Write a query to get the app’s click-through rate (CTR %) in 2022. 
Output the results in percentages rounded to 2 decimal places.

Notes:
Percentage of click-through rate = 100.0 * Number of clicks / Number of impressions
To avoid integer division, you should multiply the click-through rate by 100.0, not 100.

events Table:

|-------------|------------|
|Column Name  | Type       |
|-------------|------------|
|app_id       | integer    |
|event_type   | string     |
|timestamp    | datetime   |
|-------------|------------|

*/


select app_id, round(sum(clicks)*100.0/sum(impressions),2) as rate from
(
    SELECT 
      app_id,
      case 
        when event_type = 'click' then count(*) else 0 
      end as clicks,
      case 
        when event_type = 'impression' then count(*) else 0
      end as impressions
    FROM events
    where extract(year from timestamp) = 2022
    group by 1, event_type
 ) as a 
group by 1; 

