--Adrian Haro
--CS 325 Homework 3 - create tables
--last modified: 09/16/2019

prompt Problem 3a


drop table Client cascade constraint;
drop table Video cascade constraint;
drop table Rental cascade constraint;


create table Client(
Cli_id	char(4),
Cli_lname	varchar2(10) not null,
Cli_fname	varchar2(10),
Cli_phone	varchar2(12) not null,
primary key(Cli_id)
);

create table Video(
Vid_id	char(6),
Vid_format	varchar2(6) check(vid_format in ('DVD','HD-DVD','BluRay')) not null,
Vid_purchase_date	date default sysdate,
Vid_rental_price	number(3,2) check(Vid_rental_price >= 0) not null,
Vid_length	integer check(Vid_length >= 0),
primary key(Vid_id)
);

create table Rental(
 Cli_id	char(4),
 Vid_id	char(6),
 primary key (Cli_id, Vid_id),
 foreign key(Cli_id) references Client(Cli_id),
 foreign key(Vid_id) references Video(Vid_id)
 );



