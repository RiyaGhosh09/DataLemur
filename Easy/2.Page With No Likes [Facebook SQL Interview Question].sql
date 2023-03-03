/*
Assume you are given the tables below about Facebook pages and page likes. 
Write a query to return the page IDs of all the Facebook pages that don't have any likes. The output should be in ascending order.

pages Table:
|-------------|-----------|
|Column Name  | Type      |
|-------------|-----------|
|page_id      | integer   |
|page_name    | varchar   |
|-------------|-----------|

page_likes Table:
|-------------|-----------|
|Column Name  | Type      |
|-------------|-----------|
|user_id      | integer   |
|page_id      | integer   |
|liked_date   | datetime  |
|-------------|-----------|
*/


SELECT p.page_id 
FROM pages p left join page_likes l 
on p.page_id = l.page_id
where liked_date is null
order by 1;
