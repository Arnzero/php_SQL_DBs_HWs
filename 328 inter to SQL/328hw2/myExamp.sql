--BUILT UPON Jesse Garcia Oil_Changes Database



--Adrian Haro
--CS 328 - Homework 2 - Problem 7
--2/5/2020

spool 328hw2-7-out.txt

prompt Adrian Haro

create or replace trigger valid_vehicle_year
	before insert
	on car
	for each row
begin
	
	dbms_output.put_line('working' || to_char(sysdate, 'YYYY'));
	if :new.year_manu > to_char(sysdate, 'YYYY') then
		raise_application_error(-20000,'INVALID YEAR ENTERED');
	end if;
end;
/
show errors

prompt this should fail with INVALID YEAR ENTERED
prompt cannot insert cars from the year of 'this year + 1'

insert into car
values
('2045', 'Tesla','X3', '000010', 'c00000');

prompt this stored function checks to verify if the
prompt oil type preference has changed since last visit
prompt it returns the old type so it can be confirmed

create or replace function type_oil_change return varchar2 as
	before update
	on oil_change
	for each row
begin
	dbms_output.put_line(:old.oil_type || ' <old new >' || :new.oil_type); 

	if :old.oil_type <> :new.oil_type then
	return :old.oil_type

end;
/
show errors


create or replace function type_oil_change
        (curr_car_id char, curr_oil_type varchar2) return varchar2 as
last_oil_type   oil_change.oil_type%type;
curr_cust       oil_change.customer_id%type;
begin
        select customer_id
        into curr_cust
        from car
        where curr_car_id = car_id;

        select oil_type
        into last_oil_type
        from oil_change
        where customer_id = curr_cust;

        if last_oil_type <> curr_oil_type then
                return 'FALSE';
        else
                return 'TRUE';
        end if;

end;
/
show errors



spool off
