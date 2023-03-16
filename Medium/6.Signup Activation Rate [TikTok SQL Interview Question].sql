/*

New TikTok users sign up with their emails. They confirmed their signup by replying to the text confirmation to activate their accounts. 
Users may receive multiple text messages for account confirmation until they have confirmed their new account.

Write a query to find the activation rate of the users. Round the percentage to 2 decimal places.

Definitions:

emails table contain the information of user signup details.
texts table contains the users' activation information.
As of 29 Nov 2022, the term confirmation rate is changed to activation rate to reflect the nature of the new user activation process.

emails Table:
|--------------|---------------|
|Column Name   | Type          |
|--------------|---------------|
|email_id      | integer       |
|user_id       | integer       |
|signup_date   | datetime      |
|--------------|---------------|
  
texts Table:
|--------------|-------------|
|Column Name   | Type        |
|--------------|-------------|
|text_id       | integer     |
|email_id      | integer     |
|signup_action | varchar     |
|--------------|-------------|

*/


with cte as (
    select
      user_id,
      case when t.email_id is not null then 1
        else 0 end as activation_count
    from emails e
    left join texts t
      on e.email_id = t.email_id
      and signup_action = 'Confirmed'
)
  
select 
  round(sum(activation_count)::decimal / count(user_id), 2) as activation_rate
from cte;

