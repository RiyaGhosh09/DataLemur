/*
This is the same question as problem #8 in the SQL Chapter of Ace the Data Science Interview!

Assume you are given the table below that shows job postings for all companies on the LinkedIn platform. 
Write a query to get the number of companies that have posted duplicate job listings.

Clarification:
Duplicate job listings refer to two jobs at the same company with the same title and description.

job_listings Table:
|--------------|----------|
|Column Name   | Type     |
|--------------|----------|
|job_id        | integer  |
|company_id    | integer  |
|title         | string   |
|description   | string   |
|--------------|----------|
*/


with cte as
(SELECT 
    company_id, 
    count(distinct title) as dt
FROM job_listings
group by 1
order by company_id)


select 
    count(distinct company_id) as company_with_duplicates
from
    (SELECT 
        j.company_id, 
        count(*) over(partition by j.company_id) as ct, 
        dt,
        title, 
        description 
    FROM job_listings j join cte on j.company_id = cte.company_id
    order by 1) as a 
where ct>dt;


