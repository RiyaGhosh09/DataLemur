/*

You are trying to find the mean number of items bought per order on Alibaba, rounded to 1 decimal place.

However, instead of doing analytics on all Alibaba orders, you have access to a summary table, which describes how many items were in an order(item_count), 
and the number of orders that had that many items (order_occurrences).

items_per_order Table:
|-------------------|----------|
|Column Name        | Type     |
|-------------------|----------|
|item_count         | integer  |
|order_occurrences  | integer  |
|-------------------|----------|

*/


select 
    round(sum(total_items)::decimal/sum(order_occurrences)::decimal,1)
from
    (SELECT * ,
      (order_occurrences*item_count) as total_items
    FROM items_per_order) as a;

