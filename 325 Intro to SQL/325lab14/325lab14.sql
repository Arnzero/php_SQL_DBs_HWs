-- Misael Munoz and Adrian Haro

spool 325lab14-out.txt

prompt MIsael Munoz and Adrian Haro

prompt lab problem 1

select to_char(empl_last_name) name, to_char(hiredate, 'DAY') day
from empl;

prompt lab problem 2
select upper(substr(empl_last_name,1,4))name
from empl;

prompt lab problem 3
select empl_last_name, hiredate, add_months(hiredate, 6) ELIG_DATE
from empl;

prompt lab problem 4
select to_char(hiredate, 'YYYY-MM-DD') hiretime
from empl;

select next_day(hiredate, 'Wednesday') nextWednesday
from empl;

select upper(empl_last_name) NAME
from empl;

select empl_last_name , length( empl_last_name)LEN
from empl;


prompt lab problem 5


create or replace trigger rep_affected
	BEFORE
	delete
	on customer
	for each row

DECLARE
	empl_lname varchar(20);

BEGIN

	select empl.empl_last_name
	into empl_lname
	from empl
	where empl.empl_num = :old.empl_rep;
	
	dbms_output.put_line('Deleting '||empl_lname );

END;
/

show errors
set serveroutput on
commit;

delete from customer;

select *
from customer;

rollback;

spool off
