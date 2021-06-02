--Adrian Haro
--Misael Munoz
-- 1/24/2020

start set-up-ex-tbls.sql

set serveroutput on

spool 328lab1-2-out.txt

prompt Adrian Haro and Misael Munoz


create or replace trigger ck_empl_rep
	before update or insert
	on customer
	for each row
declare
	job_t empl.job_title%type;
begin
	select job_title
	into job_t
	from empl
	where :new.empl_rep = empl_num;

	if job_t = 'Sales' then
		dbms_output.put_line('Success! Customer in Sales Verified');
	else raise_application_error(-20000, 'error, not in Sales');

	end if;
end;
/


insert into customer(cust_id, cust_lname, empl_rep)
values('666666', 'Gomez', '7499');


insert into customer(cust_id, cust_lname, empl_rep)
values('666667', 'Dora', '7900');


update customer
set cust_fname = 'George'
where cust_id = '666666';

update customer
set cust_fname = 'Sally'
where cust_id = '666667';


select *
from   customer;

spool off
