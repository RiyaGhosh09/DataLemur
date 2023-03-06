/*

Given a table of Facebook posts, for each user who posted at least twice in 2021, 
write a query to find the number of days between each user’s first post of the year and last post of the year in the year 2021. 
Output the user and number of the days between each user's first and last post.

posts Table:

|---------------|--------------|
|Column Name    | Type         |
|---------------|--------------|
|user_id        | integer      |
|post_id        | integer      |
|post_date      | timestamp    |
|post_content   | text         |
|---------------|--------------|

*/


SELECT 
    user_id, 
    extract(days from (max(post_date) - min(post_date))) as days_diff
FROM posts
where extract(year from post_date) = 2021
group by 1
having extract(days from (max(post_date) - min(post_date))) > 0;

