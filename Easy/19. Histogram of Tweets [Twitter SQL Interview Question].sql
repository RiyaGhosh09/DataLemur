/*
Assume you're given a table Twitter tweet data, write a query to obtain a histogram of tweets posted per user in 2022. 
Output the tweet count per user as the bucket and the number of Twitter users who fall into that bucket.

In other words, group the users by the number of tweets they posted in 2022 and count the number of users in each group.

tweets Table:
|------------|------------|
|Column Name |	Type      |
|------------|------------|
|tweet_id    |integer     |
|user_id     |integer     |
|msg         |string      |
|tweet_date  |timestamp   |
|------------|------------|

*/


select 
  tweet_count, 
  count(distinct user_id)
from(
  SELECT 
    user_id, 
    count(distinct tweet_id) as tweet_count
  FROM tweets
  where extract(year from tweet_date)=2022
  group by 1
) as x
group by 1;
