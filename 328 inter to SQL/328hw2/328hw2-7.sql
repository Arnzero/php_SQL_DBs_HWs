--BUILT UPON Jesse Garcia Oil_Changes Database



--Adrian Haro
--CS 328 - Homework 2 - Problem 7
--2/5/2020

spool 328hw2-7-out.txt

prompt Adrian Haro

create or replace function valid_vehicle_year(carYrManu varchar2) return varchar2 as

begin
	
	dbms_output.put_line('working' || to_char(sysdate, 'YYYY'));
	if carYrManu > to_char(sysdate, 'YYYY') then
		return 'FALSE';
	else
		return 'TRUE';
	end if;
	
end;
/
show errors
prompt testing if the year 2045 for a car is valid, expecting FALSE

var check_car_yr_manu varchar2(5)
exec :check_car_yr_manu :=valid_vehicle_year('2045')
print check_car_yr_manu

prompt Check if this is a returning or new guest
prompt 

create or replace function newGuest(curr_cust_id varchar2) return varchar2 as
found_cust 	customer.cust_id%type;
begin
	select cust_id
	into found_cust
	from customer
	where cust_id = curr_cust_id;

		
	if found_cust = '' then
		return 'FALSE';
	else
		return 'TRUE';
	end if;	

exception
	when NO_DATA_FOUND then
	return 'FALSE';
end;
/
show errors

prompt var testNewGuest should be false, since it's returning guest
var testNewGuest varchar2(6)
exec :testNewGuest :=newGuest('c00000')
print testNewGuest

spool off
