/*

Your team at JPMorgan Chase is soon launching a new credit card. You are asked to estimate how many cards you'll issue in the first month.

Before you can answer this question, you want to first get some perspective on how well new credit card launches typically do in their first month.

Write a query that outputs the name of the credit card, and how many cards were issued in its launch month. 
The launch month is the earliest record in the monthly_cards_issued table for a given card. Order the results starting from the biggest issued amount.

monthly_cards_issued Table:
|---------------|------------|
|Column Name    | Type       |
|---------------|------------|
|issue_month    | integer    |
|issue_year     | integer    |
|card_name      | string     |
|issued_amount  | integer    |
|---------------|------------|

*/


with cte as
    (SELECT *,
    dense_rank() over(partition by card_name order by issue_year, issue_month) as rn
    FROM monthly_cards_issued)

select 
    card_name, sum(issued_amount) as issued_amount 
from cte where rn = 1 
group by 1
order by 2 desc;

