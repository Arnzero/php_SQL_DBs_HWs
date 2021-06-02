--Adrian haro
--CS 325 - Homework 11 - Problem 3
--12/8/19

spool 325hw11-out.txt

prompt Homework 11 Problem 3
prompt Adrian Haro

prompt Problem 3-1

drop view rentals_by_day;
create view rentals_by_day as
select rental_num, client_num, vid_id, to_char(date_out, 'Day') day_out,
		to_char(date_due,'Day') day_due, 
		to_char( date_returned, 'Day') day_returned
from rental;

select *
from rentals_by_day;

prompt Problem 3-2

col day_out format a9
col day_due format a9
col day_returned format a9
/


prompt Problem 3-3

select day_out, count(*) num_rentals
from rentals_by_day
group by day_out
order by num_rentals desc



prompt Problem 3-4

select to_char(vid_purchase_date,'Mon YYYY') purchase_date,
	movie_title, vid_format "FORMAT"
from video
	join movie on movie.movie_num = video.movie_num
order by purchase_date, movie_title, "FORMAT";

prompt Problem 3-5 

select   client_lname||', '||client_fname "CLIENT",
	to_char(min(date_out), 'Month DD, YYYY') "FIRST RENTAL"
from rental
	join client on rental.client_num = client.client_num
group by client_lname,client_fname
order by client_lname,client_fname;

--clear columns or anything SQL*PLUS FORMATING DEFAULTS

clear column break compute


prompt Problem 3-6


set serveroutput on

create or replace trigger approve_rental
	before insert
	on rental
	for each row

declare
	ccr client.client_credit_rtg%type;
	
begin
	-- grab iputed client's ccr value	
	select client_credit_rtg
	into ccr
	from client
	where client_num = :new.client_num;
	
	dbms_output.put_line('fired');	

	if  ccr < 1.5 then
	raise_application_error(-20101, 'sorry  you can not rent this!');
	dbms_output.put_line('exception found!');
	end if;
	
	
end;
/

show errors

commit;

insert into rental
values('0000025', '7777','420031',sysdate, sysdate+3,null);

insert into rental
values('0000025', '6666','420031',sysdate,sysdate+3,null);

update client
set client_credit_rtg = 1.6
where client_num = '7777';

insert into rental
values('0000026','7777', '220072', sysdate, sysdate+3,null);

/*
select *
from rental
order by rental_num;
*/
rollback;

spool off
