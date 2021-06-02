-- Adrian Haro
-- 325 HW 1 - my first table
-- last modified 9-5-2019

prompt last modified 9-5-2019 -AH

drop table sports; 

create table sports(
sports_id number(10),
sports_name varchar2(20),
ball_color varchar2(20),
num_of_ppl_in_team  number(10),
primary key( sports_id)
);



-- Enter five rows

insert into sports values
(1, 'Basketball', 'Orange', 12);
insert into sports values
(2, 'Baseball', 'White', 9);
insert into sports values
(3, 'Tennis', 'Green', 1);
insert into sports values
(4, 'Soccer', 'White/Black', 11);
insert into sports values
(5, 'Ping Pong', 'White', 1);
