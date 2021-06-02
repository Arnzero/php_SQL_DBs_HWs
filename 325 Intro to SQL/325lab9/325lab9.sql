--Adrian Haro
--Misael Munoz
--10/25/2019

spool 325lab9-out.txt

prompt Adrian Haro and Misael Munoz

prompt lab query 1

select *
from dept
order by dept_loc;

prompt lab query 2

select *
from dept
order by dept_name;

prompt lab query 3

select empl_last_name, dept_name, salary, hiredate
from dept join empl on dept.dept_num = empl.dept_num
order by dept_name, hiredate;

prompt lab query 4

select empl_last_name, dept_name, salary, hiredate
from dept join empl on dept.dept_num = empl.dept_num
order by salary desc, hiredate;

prompt lab query 5

select mgr, max( hiredate)
from empl
group by mgr;


prompt lab query 6

select mgr, max(hiredate)
from empl
group by mgr
having max(hiredate) > '01-JAN-2015';


spool off

