--Adrian Haro
--CS 325 - Homework 8 - Problem 6
--11/7/2019



set termout off
@ movies-pop
set termout on

spool 325hw8-out.txt

prompt Homework 8 - Problem 6
prompt Adrian Haro

prompt 6-2 displaying client credit rating increasing order

select *
from client
order by client_credit_rtg;

select *
from client
order by client_credit_rtg desc;

prompt prompt 6-3

select movie_title ||': ' || movie_rating "Movie: Rating "
from Movie
order by movie_rating, movie_title;

prompt 6-4 

select category_name, movie_title, movie_rating
from movie
	join movie_category on
		 movie.category_code = movie_category.category_code
order by movie_rating, movie. category_code;

prompt 6-5

select client_lname, client_phone, client_credit_rtg
from client
where client_credit_rtg < (select avg(client_credit_rtg)
				from client)
order by client_credit_rtg desc;

prompt 6-6

select vid_format,count(vid_format)"QTY", avg(vid_rental_price)
from video
group by vid_format;

prompt 6-7

select distinct vid_rental_price, count(vid_rental_price) "QUANTITY"
from video
group by vid_rental_price
order by vid_rental_price desc;

prompt 6-8

select distinct vid_rental_price, count(vid_rental_price) "QUANTITY" 
from video
group by vid_rental_price
having count(vid_rental_price) > 5
order by vid_rental_price desc;

prompt 6-9

(select movie_title
from movie
where movie_rating = 'G')
intersect
(select movie_title
from movie join video
	on movie.movie_num = video.movie_num
where vid_format = 'DVD')
order by movie_title;


prompt 6-10

(select  movie_title
 from movie)
 minus
(select movie.movie_title
	 from video 
		join movie on video.movie_num = movie.movie_num
		join rental on  rental.vid_id = video.vid_id)
order by movie_title desc;


prompt 6-11 

(select vid_id, vid_rental_price
 from  video
 where vid_format = 'HD-DVD')
 union
((select vid_id, vid_rental_price
 from video)
 minus
(select video.vid_id, vid_rental_price
 from video
	join rental on video.vid_id = rental.vid_id))
order by vid_rental_price desc;


prompt 6-12  !! 

(select distinct video.vid_id, count(*) "NUM_RENTALS"
 from video
	JOIN rental on video.vid_id = rental.vid_id
 group by video.vid_id)
 union 
 (select vid_id, 0 "NUM_RENTALS"
  from video
  where  video.vid_id not in
	(select vid_id
	 from rental))
order by "NUM_RENTALS" desc;


prompt 6-13

select client_lname, client_credit_rtg
from client
order by client_credit_rtg;

prompt updating..

update client
set client_credit_rtg = client_credit_rtg + client_credit_rtg*.1
where client_credit_rtg < 4.0 
	and client_credit_rtg
	 	>(select avg(client_credit_rtg)
		  from client);

select client_lname, client_credit_rtg
from client
order by client_credit_rtg;


prompt 6-14 !!

select count(*)
from video;

prompt deleting.. 

delete from video 
where vid_id not in( select vid_id
			from rental);
	

select *
from video;


spool off

