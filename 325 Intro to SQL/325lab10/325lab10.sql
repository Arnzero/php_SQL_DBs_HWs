-- Daysi Hilario and Adrian Haro
-- 11/01/2019

spool 325lab10-out.txt

prompt Daysi Hilario and Adrian Haro

prompt Lab Query 1

(select job_title, mgr
 from empl 
 where salary < 2000)
union
(select job_title, mgr
 from empl 
 where commission is not null);

prompt Lab Query 2


(select job_title, mgr
 from empl
 where salary < 2000)
 intersect
(select job_title, mgr
 from empl
 where commission is not null);


prompt Lab Query 3
(select job_title, mgr
 from empl
 where salary < 2000)
 minus
(select job_title, mgr
 from empl
 where commission is not null);



prompt Lab Query 4

(select empl_last_name, 2 * salary "Twice_Salary"
 from empl
 where  job_title = 'Clerk')
 minus
(select empl_last_name, 2 * salary "Twice_Salary"
 from empl
 where  hiredate  < '01-JAN-2015')
 order by "Twice_Salary" desc;


prompt Lab Query 5

(select empl_last_name, job_title, salary, commission
 from empl
 where commission is not null);

update empl
set commission = commission + 100
where job_title = 'Sales'
	and  salary <
	(select avg(salary)
	 from empl
	 where job_title = 'Sales');

select empl_last_name, job_title, salary, commission
from empl;

prompt Lab Query 6


delete from empl
where salary <
	(select min(salary)
	 from empl
	 where job_title = 'Sales');

select empl_last_name, job_title, salary
from empl;

spool off

