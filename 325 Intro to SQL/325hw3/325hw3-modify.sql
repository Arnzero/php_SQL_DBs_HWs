--Adrian Haro
--CS 325 - Homework 3 - modify tables
--Last modified 09/16/19

start 325hw3-pop.sql

spool 325hw3-out.txt

prompt Adrian Haro Problem 4

prompt SHOULD SUCCEED; first name NOT required

insert into Client(Cli_id, Cli_lname, Cli_phone)
values
('666E','dover','747-9090');



prompt 4b SHOULD FAIL; client needs phone 

insert into Client(Cli_id,Cli_lname)
values
('777F', 'humboldt');


prompt 4c SHOULD FAIL; video needs legal format

update Video
set vid_format = 'Moo'
where vid_id = '11111H';

prompt 4d SHOULD SUCCEED;  demo of DEFAULT and more


insert into Video(Vid_id,Vid_format,Vid_rental_price)
values
('66666E','HD-DVD', 2.98);

prompt 4e SHOULD FAIL; no neg length 

insert into Video(Vid_id,Vid_format,Vid_purchase_date,Vid_rental_price,Vid_length)
values
('12121Z','BluRay','11-APR-2014',0.50, -50);

prompt 4f deleting a record

delete from Video
where Vid_id = '33333H';


prompt 4g updating a cell record

update Client
set Cli_phone = '888-3838'
where Cli_id = '333C';


prompt 4h select statements

select * 
from Client;

select *
from Video;

select *
from Rental;


spool off
