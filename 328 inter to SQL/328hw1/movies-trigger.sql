--CS 328 HW 1 - Problem 4
--Adrian Haro
--1/30/2020

set serveroutput on

start movies-create.sql
start movies-pop.sql

spool movies-trigger-out.txt

prompt Adrian Haro

prompt make trigger for new rentals whose
prompt credit rating is < 1.5 and prevent rental

create or replace trigger approve_rental
	after insert
	on rental
	for each row
declare
	cli_cre_rtg client.client_credit_rtg%type;
begin
	
	select client_credit_rtg
	into cli_cre_rtg
	from client
	where client_num = :new.client_num;

	if cli_cre_rtg < 1.5 then
	 	 raise_application_error(-20111, 'Credit TOO LOW');
	end if;

	dbms_output.put_line('Credit approved for rental!');
end;
/

show errors
commit;

prompt Following rental insert should FAIL

insert into rental
values('0000025', '2222', '230074', sysdate, sysdate + 3, null);

prompt Following rental insert should SUCCEED
insert into rental
values('0000026', '3333', '230074', sysdate, sysdate + 3, null);

prompt Rental '0000025' was never inserted but '0000026 is inserted

select *
from rental;


rollback;
spool off
