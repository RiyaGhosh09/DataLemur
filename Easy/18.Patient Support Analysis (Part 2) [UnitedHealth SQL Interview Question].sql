/*

UnitedHealth Group has a program called Advocate4Me, which allows members to call an advocate and receive support for their health care needs – 
whether that's behavioural, clinical, well-being, health care financing, benefits, claims or pharmacy help.

Calls to the Advocate4Me call centre are categorised, but sometimes they can't fit neatly into a category. 
These uncategorised calls are labelled “n/a”, or are just empty (when a support agent enters nothing into the category field).

Write a query to find the percentage of calls that cannot be categorised. Round your answer to 1 decimal place.

callers Table:
|-------------------|-------------|
|Column Name        | Type        |
|-------------------|-------------|
|policy_holder_id   | integer     |
|case_id            | varchar     |
|call_category      | varchar     |
|call_received      | timestamp   |
|call_duration_secs | integer     |
|original_order     | integer     |
|-------------------|-------------|

*/


with cte as
(select 
  sum(case when category = 0 then 1 else 0 end) as ct1,
  ct2 from
    (SELECT 
        call_category,
        case 
            when call_category is null or call_category = 'n/a' then 0
            else 1
        end as category,
        count(*) over() as ct2 
    FROM callers) as a
group by category,2)

select round(ct1*100/ct2,1) as call_percent from cte where ct1>0;


