-- Adrian Haro
-- CS 325 - Homework 10 - Problem 2
-- 11/26/2019

set termout off
@ movies-pop.sql
set termout on


spool 325hw10-out.txt

prompt HW10 Problem 2
prompt Adrian Haro

prompt Problem 2-2
prompt project for each rental, renting client's last name,
prompt 	 the rented video's movie title and video format, order by
prompt	 client's last name and secondary order by rented video's movie title


select client_lname, movie_title,vid_format
from Rental R
	join Client C on R.client_num = C.client_num
	join Video V on R.vid_id = V.vid_id
	join Movie M on V.movie_num = M.movie_num
order by client_lname, movie_title;

prompt Problem 2-3
prompt project JUST for not-yet-returned rentals,
prompt 	the renting client's last name, the rented
prompt	video's movie title and date due for that rental
prompt	order by rental date due, secondary order client last name

select client_lname, movie_title, date_due
from Rental R
        join Client C on R.client_num = C.client_num
        join Video V on R.vid_id = V.vid_id
        join Movie M on V.movie_num = M.movie_num
where date_returned is null
order by date_due, client_lname;

prompt Problem 2-4
prompt clear all column breakds and computes
prompt	create a top title and bottom  title
prompt	make pagesize 35 lines and linesize 75 characters
prompt  turn feedback off

clear column breaks computes

ttitle "Welcome to Oracle"
btitle "End of page"
set pagesize 35
set linesize 75
set feedback off


prompt Problem 2-5

drop view rental_history;
create view rental_history( client_name, movie_title,
				vid_format, vid_rental_price) as
select client_lname || ', ' || client_fname, movie_title, vid_format, vid_rental_price
from Rental R
        join Client C on R.client_num = C.client_num
        join Video V on R.vid_id = V.vid_id
        join Movie M on V.movie_num = M.movie_num;


select *
from rental_history
order by client_name, vid_rental_price desc, movie_title;


prompt Problem 2-6
prompt write column commands
prompt 	give client_name heading Client
prompt	narrower than default width but big enough
prompt Write column commands for movie_title
prompt 	give movie_title heading Movie Title
prompt  same as above character width

col client_name heading Client format a15
col movie_title heading "Movie Title" format a36
col vid_format heading 'Format' format a7
col vid_rental_price heading "Rental Price" format $999.99
/


prompt Problem 2-7

drop view category_stats;
create view category_stats(Cate_Name, Video_Count, Avg_rental_price) as
select category_name, count(category_name), avg(vid_rental_price)
from Video V
	join Movie M on V.movie_num = M.movie_num
	join Movie_category MC on M.category_code = MC.category_code
group by category_name;

select *
from category_stats
order by Video_Count desc, Avg_rental_price desc;

set pagesize 20
col Cate_Name heading Category format a8
col Video_Count heading "# Videos" format 9999
col Avg_rental_price heading "Avg Price" format $999.99
/


prompt Problem 2-9 commit

commit

prompt Problem 2-9a

update Video
set vid_rental_price = vid_rental_price - .25
where vid_format = 'Blu-Ray';

select *
from category_stats
order by Video_Count desc, Avg_rental_price desc;

prompt Problem 2-9b

select distinct client_name
from rental_history
where movie_title = 'Gone with the Wind'
order by client_name;

prompt Problem 2-9c

delete from rental
where client_num = '5555';

select distinct client_name
from rental_history
where movie_title = 'Gone with the Wind'
order by client_name;

prompt Problem 2-9d

select client_name, count(client_name)
from rental_history
group by client_name
order by count(client_name) desc;

roll back

prompt We have rolledback


prompt Problem 2-10 (people and their rented movies)

set pagesize 45
break on client_name skip 1

select distinct client_name, movie_title
from rental_history
order by client_name, movie_title;

prompt Problem 2-11

set pagesize 55

compute count of movie_title on client_name
/

prompt Problem 2-12
set pagesize 70

compute  avg of vid_rental_price on client_name

select *
from rental_history
order by client_name, movie_title;

prompt Problem 2-13(calling cleanup script after spool off)
spool off


@ cleanup.sql
