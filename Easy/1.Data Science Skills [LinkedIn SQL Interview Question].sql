/* 
Given a table of candidates and their skills, you're tasked with finding the candidates best suited for an open Data Science job. 
You want to find candidates who are proficient in Python, Tableau, and PostgreSQL.

Write a query to list the candidates who possess all of the required skills for the job. Sort the output by candidate ID in ascending order.

Assumption:
There are no duplicates in the candidates table.

candidates Table:
|--------------|-----------|
| Column Name  | Type      |
|--------------|-----------|
| candidate_id | integer   |
| skill	       | varchar   |
|--------------|-----------|
*/


select candidate_id from
(SELECT *,
case 
  when skill = 'Python' then 1
  when skill = 'Tableau' then 1
  when skill = 'PostgreSQL' then 1
  else 0
end as skill_num
FROM candidates) as a
where skill_num != 0
group by 1
having sum(skill_num) = 3
order by 1;
