--Adrian Haro
--CS 325 - Homework 4 - Problem 3
--Last modified: 9/23/19

spool 325hw04-3-out.txt

select *
from empl
where salary between 1500 and 2500;

select job_title, salary
from empl
where job_title = 'Clerk' and salary > 1200;

select empl_last_name, job_title, salary
from empl, dept
where empl.dept_num = dept.dept_num and 
	dept_loc in ('Dallas','Chicago');


spool off
