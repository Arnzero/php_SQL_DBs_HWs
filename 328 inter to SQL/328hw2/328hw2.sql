-- Adrian Haro
--CS 328 - HW 2 - Problems 3-6
-- 2/3/2020


set serveroutput on

spool 328hw2-out.txt

prompt Adrian Haro
prompt Problem 3
prompt WARNING  

create or replace trigger ck_empl_rep
    before insert OR update
    on customer
    for each row
declare
    proposed_empl_rep customer.empl_rep%type;
    rep_job_title     empl.job_title%type;
begin
    -- get new or updated customer's proposed empl_rep

    proposed_empl_rep := :new.empl_rep;

    -- get job_title of this customer's proposed empl_rep

    select job_title
    into rep_job_title
    from empl
    where empl_num = proposed_empl_rep;

    -- print a tasteful message to screen if empl_rep is in
    --    Sales as is required

   exception
	when no_data_found then
	raise_application_error(-20001, 'ERROR NO DATA FOUND');
		
    if (rep_job_title = 'Sales') then
        dbms_output.put_line('This insert or update to customer IS allowed!');

    -- PREVENT this insert or update to customer if empl_rep
    --    has any OTHER job title

    else
        raise_application_error( -20000, 'customer''s empl rep must be in Sales');
    end if;
end;
/
show errors


insert into customer(cust_id, cust_lname, empl_rep)
values('jkjkjk', 'lastName', 8000);


prompt Problem 4

set serveroutput on
create or replace procedure silly_shout( msg varchar2, iterations integer) as

begin
	if iterations < 0 then
	   dbms_output.put_line('ERR, number must be non-negative!');
	else
	   for i in 0 .. iterations -1
	   loop
		dbms_output.put_line(upper(msg) || '!!');
	end loop;
	end if;

end;
/
show errors

@ silly_shout_test

prompt Problem 5

create or replace function title_total_cost(title_isbn varchar2) return number as
found_ttl_cost title.ttl_cost%type;
begin
	select ttl_cost * ttl_qty
	into found_ttl_cost
	from title
	where title_isbn = ttl_isbn;
	
	dbms_output.put_line(found_ttl_cost || ' is the cost. ');

	return found_ttl_cost;
exception
	when no_data_found then
	return -1;
end;
/
show errors

@ title_total_cost_test

prompt Problem 5 two examples

var temp_cost number
var temp number

exec :temp_cost :=title_total_cost('9780201144710')
print temp_cost

exec :temp :=title_total_cost('9780070465329')
print temp	

prompt Problem 6


create or replace procedure titles_in_range(low_number number, high_number number) as

begin

	for next_title in (select *
			   from title
			   where ttl_price >= low_number and ttl_price <= high_number
			   order by ttl_price, ttl_name)
	loop
	    dbms_output.put_line('$' || next_title.ttl_price ||' - '
				     ||next_title.ttl_name || ': '
				     ||next_title.ttl_qty);
	end loop;

end;
/
show errors

@ titles_in_range_test




spool off
