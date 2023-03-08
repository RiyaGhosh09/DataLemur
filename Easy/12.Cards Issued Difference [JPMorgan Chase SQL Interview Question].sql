/*

Your team at JPMorgan Chase is soon launching a new credit card, and to gain some context, you are analyzing how many credit cards were issued each month.

Write a query that outputs the name of each credit card and the difference in issued amount between the month with the most cards issued, 
and the least cards issued. Order the results according to the biggest difference.

monthly_cards_issued Table:
|--------------|----------|
|Column Name   | Type     |
|--------------|----------|
|issue_month   | integer  |
|issue_year    | integer  |
|card_name     | string   |
|issued_amount | integer  |
|--------------|----------|

*/

with cte as(
    SELECT 
        distinct card_name,
        min(issued_amount) over(partition by card_name) as min_issue,
        max(issued_amount) over(partition by card_name) as max_issue
    FROM monthly_cards_issued
    order by card_name
)

select 
    card_name, 
    (max_issue-min_issue) as diff 
from cte
order by 2 desc;

