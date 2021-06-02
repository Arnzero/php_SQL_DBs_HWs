-- CS 328 - Homework 3
-- Adrian Haro
-- Last Modified 2/13/2020

set serveroutput on

spool 328hw3-out.txt

prompt Adrian Haro

prompt Problem 5a

select count(*) "Current Rows num"
from order_needed;

prompt Problem 5b
select max(ord_needed_id)
from order_needed;

prompt Problem 5c
insert into order_stock
values(11015, 111, '15-DEC-19', null );

insert into order_stock
values(11016, 201, '15-JAN-20', null );

insert into order_stock
values(11017, 150, '2-FEB-20', null);

insert into order_line_item
values(11016, 2, '9780201078282', 50);

insert into order_line_item
values(11017, 1, '9780133760064', 60);

select *
from titles_on_order;


prompt Problem 6


create or replace function next_ord_needed_id return number as
prev_id order_needed.ord_needed_id%type;
begin
	select max(ord_needed_id)
	into prev_id
	from order_needed;

	if prev_id is null then
		return 1;
	end if;

	return prev_id + 1;

exception
	when NO_DATA_FOUND then
	return 1;
	
end;
/
show errors


prompt running next_ord_needed_id_test dot sql

@ next_ord_needed_id_test.sql


prompt Problem 7

create or replace function is_on_order(isbn_check char) return boolean as
isbn_finder titles_on_order.ttl_isbn%type;
begin

	select ttl_isbn
	into isbn_finder
	from titles_on_order
	where ttl_isbn = isbn_check;

	if isbn_finder = isbn_check then
		return TRUE;
	end if;

	return FALSE;
exception
	when NO_DATA_FOUND then
	return FALSE;
end;
/
show errors

prompt  test 1 should return true 
var on_order_status varchar2(5)
exec :on_order_status := bool_to_string(is_on_order('9780133760064'))
print on_order_status

prompt test 2 should return false, in db but not in order
var on_order_status varchar2(5)
exec :on_order_status := bool_to_string(is_on_order('9780262534802'))
print on_order_status


prompt test 3 should return false, not in db
var on_order_status varchar2(5)
exec :on_order_status := bool_to_string(is_on_order('9878765432123'))
print on_order_status


spool off
