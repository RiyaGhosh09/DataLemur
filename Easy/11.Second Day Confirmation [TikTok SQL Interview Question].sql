/*

New TikTok users sign up with their emails and each user receives a text confirmation to activate their account. 
Assume you are given the below tables about emails and texts.

Write a query to display the ids of the users who did not confirm on the first day of sign-up, but confirmed on the second day.

Assumption:
action_date is the date when the user activated their account and confirmed their sign-up through the text.

emails Table:
|--------------|----------|
|Column Name   | Type     |
|--------------|----------|
|email_id      | integer  |
|user_id       | integer  |
|signup_date   | datetime |
|--------------|----------|

texts Table:
|--------------|---------------------------------------|
|Column Name   | Type                                  |
|--------------|---------------------------------------|
|text_id       | integer                               |
|email_id      | integer                               |
|signup_action | string ('Confirmed', 'Not confirmed') |
|action_date   | datetime                              |
|--------------|---------------------------------------|

*/

select user_id from(
    SELECT 
        user_id,
        e.email_id,
        signup_action,
        signup_date,
        action_date,
        (action_date::date-signup_date::date) as diff
    FROM emails e join texts t 
    on e.email_id = t.email_id) as a
where signup_action = 'Confirmed' and diff = 1;

