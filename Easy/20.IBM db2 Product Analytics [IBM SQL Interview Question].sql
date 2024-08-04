/*
IBM is analyzing how their employees are utilizing the Db2 database by tracking the SQL queries executed by their employees. 
The objective is to generate data to populate a histogram that shows the number of unique queries run by employees during the third quarter of 2023 (July to September). 
Additionally, it should count the number of employees who did not run any queries during this period.

Display the number of unique queries as histogram categories, along with the count of employees who executed that number of unique queries.

queries Schema:
|-----------------|----------|------------------------------------------------------|
|Column Name      |Type      |  Description                                         |
|-----------------|----------|------------------------------------------------------|
|employee_id      |integer   |  The ID of the employee who executed the query.      |
|query_id         |integer   |  The unique identifier for each query (Primary Key). |
|query_starttime  |datetime  |  The timestamp when the query started.               |
|execution_time   |integer   |  The duration of the query execution in seconds.     |
|-----------------|----------|------------------------------------------------------|

employees Schema:
Assume that the table below displays all employees in the table:
|-----------------|----------|------------------------------------------------------|
|Column Name      |Type      |  Description                                         |
|-----------------|----------|------------------------------------------------------|
|employee_id      |integer   |  The ID of the employee who executed the query.      |
|full_name        |string    |  The full name of the employee.                      |
|gender           |string    |  The gender of the employee.                         |
|-----------------|----------|------------------------------------------------------|

*/


select 
  query_count,
  count(distinct employee_id)
from(
  select 
    e.employee_id,
    COALESCE(COUNT(DISTINCT q.query_id), 0) as query_count
  from employees as e 
  left join queries as q
  on e.employee_id = q.employee_id
  and extract(year from q.query_starttime) = 2023
  and extract(month from q.query_starttime) in ('7','8','9')
  group by 1
) as x 
group by 1
order by 1;
