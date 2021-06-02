--Adrian Haro
--CS 325 - Homework 5 - Problem 1
--Last Modified 9/29/2019

spool 325hw5-out.txt

prompt Homework 5 Problem 1
prompt Adrian Haro

prompt Problem 1-1: relational selection where client rating > 3.4

select *
from Client
where client_credit_rtg > 3.4;

prompt Problem 1-2: pure relational projection from table
prompt 		    of  'movie rating' and 'year released'

select distinct movie_rating, movie_yr_released
from Movie;

prompt Problem 1-3: equi-join client and movie_category tables

select *
from Movie_category
	   join Client on
	   Movie_category.CATEGORY_CODE = Client. client_fave_cat;

prompt Problem 1-4: project rented video IDs, date out and date due

select vid_id, date_out, date_due
from Rental
where date_returned is null;


prompt Problem 1-5: project video ID's, format, prices for sans(format)BlueRay

select VID_ID, vid_format, vid_rental_price
from Video
where vid_format  != 'Blu-Ray';


prompt Problem 1-6: project movie_cat_name, cli_lnam, cli_crd_rtg
prompt		    using equi-join for movie_cat and client tables


select category_name, C.client_lname, C.client_credit_rtg
from Client C
	 join Movie_category on
	 C.client_fave_cat = Movie_category.CATEGORY_CODE;


prompt Problem 1-7: selection on videos purchased between
prompt		     July 15, 2008 and December 1, 2011 inclusive

select *
from Video
where vid_purchase_date between '15-JUL-2008' and '1-DEC-2011';


prompt Problem 1-8: selection on videos where rental_price >= $3.99
prompt		     and purchase_date after January 1, 2011

select *
from Video
where vid_rental_price >= 3.99 and vid_purchase_date > '1-JAN-2011';


prompt Problem 1-9: project only movie title and movie rating for
prompt		     all movies containing 'the' anywhere in title
prompt !! check solution for this one! 

select *
from Movie
where movie_title like '% the%';


prompt Problem 1-10:
prompt	Project only video ID, format, rental_price - 20% off
prompt  for videos sans format 'Blu-Ray'. use column alias
prompt  so 3rd column says IF_DISCT
prompt  note I will use 4th column to display orignal price!


select VID_ID, vid_format, 
	vid_rental_price - vid_rental_price * 0.20 "IF DISCT",
	 vid_rental_price "Original Price"
from Video
where vid_format not in ('Blu-Ray');


prompt Problem 1-11:
prompt  Project only movie rating and movie title for all movies
prompt  w/ rating PG-13 or R or A only using 'in' operator

select movie_rating, movie_title
from Movie
where  movie_rating in ('PG-13', 'R', 'A');

prompt Problem 1-12:
prompt  project current total number of videos and avg rental price
prompt  for a video. Use column aliases: "Total Videos" and "Avg Rental".

select count(VID_ID) "Total Videos", avg(vid_rental_price) "Avg Rental"
from Video;


prompt EOF

spool off
