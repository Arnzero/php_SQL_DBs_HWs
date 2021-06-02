--Adrian and Misael
--09/20/19

spool 325lab04-out.txt

prompt Adrian and Misael

prompt true relational projection

select distinct
	dept_num, dept_loc
from dept; 

prompt true relational selection

select *
from customer 
where cust_balance  > 200;

prompt true relational equi-join


select *
from customer JOIN empl
	 ON customer.empl_rep = empl.empl_num;



spool off
