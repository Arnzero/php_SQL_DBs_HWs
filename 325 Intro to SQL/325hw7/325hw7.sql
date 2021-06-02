--Adrian Haro
--CS 325 - Homework 7 - Problem 3
--Last modified 10/22/2019

============================
--NOTE: My first ERD-1-PDF 
	is on the 2nd
	page, 1st is blank
============================
spool 325hw7-out.txt

prompt Homework 7 Problem 3
prompt Adrian Haro

prompt Problem  3-1 using ampersand, write select to project
prompt movie_title and yr released of movies
prompt whose director is inputed


select movie_title, movie_yr_released
from Movie
where movie_director_lname = '&dir_lname';

prompt Problem 3-2 using ampersand and nested select; project
prompt movie_title and director last name of movies
prompt whose category code is that of the category
prompt name inputed by ampersand

select movie_title, movie_director_lname
from Movie
where category_code =
	(select category_code
	 from Movie_category
	 where category_name = '&category');

prompt Problem 3-3 using ampersand and 3 table join, write select
prompt that projects number of videos of movies in category 
prompt whose category name is user_input
prompt also project column is "# Videos".
prompt 

select count(*) "# Videos"
from Video join Movie 
	on Video.Movie_num = Movie.Movie_num
	join Movie_category 
	on  Movie_category.category_code = Movie.category_code
where category_name ='&Category_name';

/*
select count(*) "# Videos"
from Video, Movie, Movie_category
where  Video.Movie_num = Movie.Movie_num and
	Movie_category.category_code = Movie.category_code
	and category_name = '&category';
*/


prompt Problem 3-4 write select projects last n first names of clients who never returned
prompt a rented video AFTER the date that it was due.

select client_lname, client_fname
from Client
where not exists
	(select 'users who returned movies LATE'
	 from  Rental  
	 where Rental.client_num = Client.client_num
	 and  date_due < date_returned);


prompt Problem 3-5 write select projecting lname, fave_cat_names
prompt and credit ratings for clients who have credit
prompt ratings higher than the avg credit rating of all

select client_lname, client_fave_cat, client_credit_rtg
from Client, Movie_category
where Client.client_fave_cat = Movie_category.category_code
	and client_credit_rtg > 
	(select avg(client_credit_rtg)
	 from Client)
order by client_credit_rtg desc;

prompt Problem 3-6 using a join and sub-select
prompt write a select that projects video_id, movie_title on that video
prompt and the format of that video, for never rented videos


select vid_id, movie_title, vid_format
from Video, Movie
where Video.movie_num = Movie.movie_num and
	 not exists
	(select 'Videos that havenot yet been rented'
	 from Rental
	 where Rental.vid_id = Video.vid_id) 	
	 order by movie_title;
spool off
