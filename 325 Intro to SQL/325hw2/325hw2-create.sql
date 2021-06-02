--Adrian Haro
--CS 325 Homeworrk 2 - create tables
--last modified: 09/09/2019

prompt Problem 2


drop table Client cascade constraint;
drop table Video cascade constraint;
drop table Rental cascade constraint;


create table Client(
Cli_id	char(4),
Cli_lname	varchar2(10),
Cli_fname	varchar2(10),
Cli_phone	varchar2(12),
primary key(Cli_id)
);

create table Video(
Vid_id	char(6),
Vid_format	varchar2(6),
Vid_purchased_date	date,
Vid_rental_price	number(3,2),
Vid_length	integer,
primary key(Vid_id)
);

create table Rental(
 Cli_id	char(4),
 Vid_id	char(6),
 primary key (Cli_id, Vid_id),
 foreign key(Cli_id) references Client(Cli_id),
 foreign key(Vid_id) references Video(Vid_id)
 );



