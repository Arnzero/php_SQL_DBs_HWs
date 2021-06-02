--Adrian Haro and Misael Munoz
-- 11/15/2019

prompt Adrian Haro and Misael Munoz
prompt 325lab12


spool 325lab12-out.txt


prompt lab problem 1

drop view empl_salaries;

create view empl_salaries as
select empl_last_name, salary
from empl;

prompt lab Problem 2

select *
from empl_salaries;

prompt lab problem 3

select max(salary)
from empl_salaries;


prompt lab problem 4

drop view earliest_hires;

create view earliest_hires as
select job_title, min(hiredate) hired
from empl
group by job_title;

prompt lab problem 5

select *
from earliest_hires;


prompt lab problem 6

select hired
from earliest_hires
where hired =
	(select min(hired)
	 from earliest_hires);


prompt Lab Query 7

drop sequence play_seq;

create sequence play_seq
increment by 100
start with 13;

select play_seq.nextval
from dual;

select play_seq.nextval
from dual;

select play_seq.currval
from dual;

prompt lab problem 8

select dept_name, salary
from dept
	join empl on dept.dept_num = empl.dept_num
order by dept_name;

prompt lab problem 9

set pagesize 50
set feedback off
/

prompt lab problem 10
set pagesize 14
set feedback 6


spool off
