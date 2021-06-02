--Adrian Haro
--CS 325 - Homework 4 - Problem 4-4
--Last mod 09/27/19

prompt 4 part a; pure relational projection Clients 1st names

select distinct Cli_fname
from Client;

prompt 4 part b; pure relational projection

select distinct Vid_rental_price, Vid_format
from video;

prompt 4 part c; relational selection of Video.length < 90 mins

select *
from Video
where Vid_length < 90;

prompt 4 part d; relational selection of Rental

select *
from Rental
where Vid_id = '11111H';

prompt 4 part e; Cartesian product

select   *
from Client C, Rental R;

prompt 4 part f; equi-join video and rental

select *
from Video V, Rental R
where V.Vid_id = R.Vid_id;

prompt 4 part g; equi-join Client and rental

select *
from Client C, Rental R
where C.Cli_id = R.Cli_id;

