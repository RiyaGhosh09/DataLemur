/*

UnitedHealth has a program called Advocate4Me, which allows members to call an advocate and receive support for their health care needs – 
whether that's behavioural, clinical, well-being, health care financing, benefits, claims or pharmacy help.

Write a query to find how many UHG members made 3 or more calls. case_id column uniquely identifies each call made.

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

select count(policy_holder_id) as members from (
    SELECT 
         DISTINCT policy_holder_id,
        count(case_id) over(PARTITION BY policy_holder_id) as ct
    FROM callers
    order by policy_holder_id) as a 
where ct>=3;

