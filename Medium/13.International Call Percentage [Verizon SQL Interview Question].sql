/*

A phone call is considered an international call when the person calling is in a different country than the person receiving the call.
What percentage of phone calls are international? Round the result to 1 decimal.

Assumption:
The caller_id in phone_info table refers to both the caller and receiver.

phone_calls Table:
|-------------|-------------|
|Column Name  | Type        |
|-------------|-------------|
|caller_id    | integer     |
|receiver_id  | integer     |
|call_time    | timestamp   |
|-------------|-------------|

phone_info Table:
|-------------|-------------|
|Column Name  | Type        |
|-------------|-------------|
|caller_id    | integer     |
|country_id   | integer     |
|network      | integer     |
|phone_number | string      |
|-------------|-------------|

*/


with cte_c as(
SELECT p.caller_id, country_id as caller_country, p.receiver_id 
FROM phone_calls p join phone_info i on p.caller_id = i.caller_id),

cte_r as(
SELECT p.caller_id,  p.receiver_id, country_id as receiver_country
FROM phone_calls p join phone_info i on p.receiver_id = i.caller_id),

cte as(
select distinct c.caller_id, caller_country, c.receiver_id, receiver_country
from cte_c c join cte_r r on c.caller_id = r.caller_id)

select round(sum(case when caller_country != receiver_country then 1 end)*100.0/count(*),1) as international_calls 
from cte;

