--Adrians homebrew lab7


spool 325lab7-out.txt
prompt Subselect practice

prompt lab query 1
prompt project: empl_last_name, hiredate
prompt  of lowest-paid employee with job title of 'Manager'



select empl_last_name, hiredate
from empl
where job_title = 'Manager' and  salary 
	= ( select min(salary)
		from empl
		where job_title = 'Manager');

prompt lab query 2
prompt using subselect, project 
prompt hiredates of the employees whose 
prompt department location is New York

select hiredate
from empl
where dept_num in ( select dept_num
		    from dept
		    where dept_loc = 'New York');

prompt lab query 3
prompt use subselect to project empl lname and hiredates
prompt for all employees hired after the last hired manager


select empl_last_name, hiredate
from empl
where hiredate >=
		(select max(hiredate)
		 from empl
 		 where job_title = 'Manager');


prompt lab query 4
prompt project a single column with the format
prompt emplolyee_last_name - $empl_salary w. column alias "Employee Salaries"

select empl_last_name || ' - ' ||'$'||salary "Employee Salaries"
from empl;


prompt lab query 5
prompt use EXISTS predicate and correlated subquery
prompt to show the names ofdepartments of at least
prompt one employee making more than $3k salary

select dept_name
from dept
where exists
	( select 'a'
	  from empl
	  where empl.dept_num = dept.dept_num and salary >= 3000);

prompt lab query 6
prompt use NOT EXISTS predicate and correlated subquery
prompt to show employee last names w/ job_title of
prompt sales for which there does NOT exist a customer 
prompt they represent

select empl_last_name
from empl
where job_title = 'Sales' and
	not exists( select 'a'
		  from customer
		  where customer.empl_rep = empl.empl_num);

spool off

