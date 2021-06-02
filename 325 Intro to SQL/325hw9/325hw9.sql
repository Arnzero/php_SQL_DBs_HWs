--Adrian Haro
--CS 325 - Homework 9 Problem 5
-- 11/19/2019

spool 325hw9-out.txt

prompt Homework 9 Problem 5
prompt Adrian Haro



prompt Problem 5-1

drop view counter_client_info;
create view counter_client_info(client_lname, fave_category) as
select client_lname, category_name 
from client c
	join movie_category mc on
		 c.client_fave_cat = mc.category_code;

prompt Problem 5-2

select *
from counter_client_info
order by client_lname;

select fave_category, client_lname
from counter_client_info
order by fave_category;


prompt Problem 5-3

drop view movie_list;
create view movie_list as
select category_name,movie_rating, movie_title
from movie 
	join movie_category on
		 movie.category_code = movie_category.category_code;


prompt Problem 5-4
select *
from movie_list
order by category_name, movie_rating, movie_title;

prompt Problem 5-5
select category_name, count(category_name) "CATEGORY_QUANT"
from movie_list
group by category_name
order by "CATEGORY_QUANT" desc;


prompt Problem 5-6


drop table berries cascade constraints;
create table berries(
berry_id	number(6) not null,
berry_name	varchar2(15),
berry_qty	number(3),
berry_cost	number(3,2),
primary key(berry_id)
);

drop sequence b_keys;
create sequence b_keys
increment by 5
start with 50;

prompt Problem 5-7

insert into berries
values
(b_keys.nextval, 'Kiwi',12 , 3.99);

insert into berries
values
(b_keys.nextval, 'Blk Berries', 20, 4.60);

insert into berries
values
(b_keys.nextval, 'Raspberries', 24, 2.90);

select *
from berries;



spool off
