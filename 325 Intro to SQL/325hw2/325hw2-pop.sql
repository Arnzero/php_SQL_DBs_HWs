-- Adrian Haro
-- CS 325 Homework 2 - populate tables
-- last modified 09/09/2019


/*========
 in case this is re-run (to get a "fresh" set of initial
 contents), delete any current contents
========*/


delete from rental;
delete from video;
delete from client;


prompt Problem 3: Inserting Rows

insert into Client(Cli_id, Cli_lname, Cli_fname, Cli_phone)
values
('000A', 'Alpha', 'Ann', '000-0001');

insert into Client(Cli_id, Cli_lname, Cli_fname, Cli_phone)
values
('111B', 'Beta','bob', '111-1112');

insert into Client(Cli_id, Cli_lname, Cli_fname, Cli_phone)
values
('222B', 'Beta', 'Ann', '222-2223');

insert into Client(Cli_id, Cli_lname, Cli_fname, Cli_phone)
values
('333C', 'Carlos', 'David', '333-3334');

insert into Client(Cli_id, Cli_lname, Cli_fname, Cli_phone)
values
('444D', 'Delta', 'Edie', '111-1112');

prompt inserting Video rows




insert into Video(Vid_id, Vid_format, Vid_purchased_date, Vid_rental_price, Vid_length)
values
('00000D', 'DVD', '10-JAN-2018', 1.99, 73);

insert into Video(Vid_id, Vid_format, Vid_purchased_date, Vid_rental_price, Vid_length)
values
('11111H', 'HD-DVD', '20-FEB-2019', 4.99, 91);

insert into Video(Vid_id, Vid_format, Vid_purchased_date, Vid_rental_price, Vid_length)
values
('22222B', 'BluRay', '30-MAR-2017', 1.99, 105);

insert into Video(Vid_id, Vid_format, Vid_purchased_date, Vid_rental_price, Vid_length)
values
('33333H', 'HD-DVD', '20-FEB-2019', 3.99, 69);

insert into Video(Vid_id, Vid_format, Vid_purchased_date, Vid_rental_price, Vid_length)
values
('44444B', 'BluRay', '04-APR-2015', 0.99, 91);


prompt Inserting rows into Rental


insert into Rental(Cli_id, Vid_id)
values
('111B', '11111H');


insert into Rental(Cli_id, Vid_id)
values
('222B', '00000D');


insert into Rental(Cli_id, Vid_id)
values
('222B', '22222B');


insert into Rental(Cli_id, Vid_id)
values
('333C', '22222B');


insert into Rental(Cli_id, Vid_id)
values
('333C', '00000D');


insert into Rental(Cli_id, Vid_id)
values
('333C', '11111H');


insert into Rental(Cli_id, Vid_id)
values
('000A', '44444B');


prompt Problem 4: Inserting additional Rows


insert into Client(Cli_id, Cli_lname, Cli_fname, Cli_phone)
values
('555F', 'Jack', 'Lumber', '121-2121');

insert into Video(vid_id, vid_format, vid_purchased_date, vid_rental_price, vid_length)
values
('55555B', 'BluRay', '30-MAR-2019', 3.99, 102);

insert into Rental(cli_id, Vid_id)
values
('555F', '55555B');


