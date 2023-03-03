/*
Tesla is investigating bottlenecks in their production, and they need your help to extract the relevant data. 
Write a query that determines which parts have begun the assembly process but are not yet finished.

Assumptions
Table parts_assembly contains all parts in production.
A part with no finish_date is an unfinished part.

parts_assembly Table:
|---------------|-----------|
|Column Name    | Type      |
|---------------|-----------|
|part           | string    |
|finish_date    | datetime  |
|assembly_step  | integer   |
|---------------|-----------|
*/


SELECT distinct part 
FROM parts_assembly
where finish_date is null
and assembly_step is not null;
