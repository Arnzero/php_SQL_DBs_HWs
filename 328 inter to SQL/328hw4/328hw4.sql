-- CS 328 - Homework 4
-- Adrian Haro
-- Last Modified: 2/19/2020

spool 328hw4-out.txt

prompt Adrian Haro

prompt Problem 4

create or replace function pending_order_needed(ISBN varchar2) 
	return boolean as
pend_checker number;
begin
	select ord_num
	into pend_checker
	from order_needed 
	where ISBN = ttl_isbn and ord_num is null;

	if pend_checker is not null then
		return false;
	end if;
	
	if pend_checker is null then
		return true;
	end if;

exception
	when NO_DATA_FOUND then
		return false;
end;
/
show errors

@ pending_order_needed_test.sql

prompt Problem 5

create or replace function insert_order_needed(ISBN char, par_ord_qty number)
	return varchar2 as
switchvar varchar2(25);
next_id number(6);

begin


	if is_on_order(ISBN) then
	switchvar := 'already on order';
	return switchvar;
	end if;
	
	if pending_order_needed(ISBN)  then
	switchvar := 'Already known needed';
	return switchvar;
	end if;

	next_id := next_ord_needed_id();


	insert into order_needed(ord_needed_id, ttl_isbn, qty_desired, date_need_noted)
	values(next_id, ISBN, par_ord_qty, sysdate);

	switchvar := 'success';
	return switchvar;
exception 

	when others then
	switchvar:= 'insertion failed';
	return switchvar;
end;
/
show errors

@ insert_order_needed_test.sql
spool off


