--Adrian Haro
--Last Modified 10/13/2019

spool 325hw6-out.txt

prompt Homework 6 Problem 2
prompt Adrian Haro
prompt
prompt Problem 2-1
prompt project average video rental price

select avg(vid_rental_price)
from Video;

prompt Problem 2-2
prompt Use Subselect to project video_ids and video_format
prompt that have rental price less than average video 
prompt rental price W/O join or cartesian prod operations
prompt

select vid_id, vid_format
from Video
where vid_rental_price <
	(select avg(vid_rental_price)
	 from Video);

prompt Problem 2-3
prompt Use Subselect W/O join's or cartesian prod oper..
prompt project last/first names only for clients
prompt who rented video ID '130012'

select client_lname, client_fname
from Client
where CLIENT_NUM in
	(select client_num
	 from Rental
	 where vid_id = '130012');

prompt Problem 2-4
prompt project 1 column w/ column alias "Movie: Rating"
prompt showing each movie; title: rating

select movie_title ||': ' || movie_rating "Movie: Rating "
from Movie;

prompt Problem 2-5
prompt Project 2 columns; Movies and Date 
prompt and directors last name

select movie_title ||' ('||movie_yr_released||')' "Movies",
	movie_director_lname "Directors"
from Movie;

prompt Problem 2-6
prompt project movie titles of movies that have
prompt earliest video purchase date
prompt Which Videos were avail when store opened
prompt


select MOVIE_TITLE
from Movie
where MOVIE_NUM in
	(select MOVIE_NUM
	 from Video
	 where vid_purchase_date =
		(select min(vid_purchase_date)
		 from Video));

prompt Problem 2-7
prompt Using Exists project all Clients
prompt who have a current rental in DB
prompt use correlated subquery

select client_lname, client_fname, client_phone
from Client
where exists
	(select 'a'
	 from Rental
	 where date_returned is null
	 and Rental.client_num = Client.CLIENT_NUM);

prompt Problem 2-8
prompt Using NOT EXISTS project titles of movies
prompt for video sans format Blu-Ray
prompt use correlated subquery

select movie_title
from Movie
where NOT EXISTS
	(select 'a'
	 from Video
	 where Video.movie_num = Movie.MOVIE_NUM and
	 vid_format = 'Blu-Ray');




spool off
