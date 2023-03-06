/*

Write a query to find the top 2 power users who sent the most messages on Microsoft Teams in August 2022. 
Display the IDs of these 2 users along with the total number of messages they sent. Output the results in descending count of the messages.

Assumption:
No two users has sent the same number of messages in August 2022.

messages Table:

|--------------|-----------|
|Column Name   | Type      |
|--------------|-----------|
|message_id    | integer   |
|sender_id     | integer   |
|receiver_id   | integer   |
|content       | varchar   |
|sent_date     | datetime  |
|--------------|-----------|

*/


select 
    sender_id, 
    count(message_id) as message_count from
        (SELECT 
            sender_id, 
            message_id,
            sent_date,
            extract(year from sent_date) as year,
            extract(month from sent_date) as month
        FROM messages) as a
where year = 2022 and month = 8
group by 1
order by 2 desc
limit 2;

