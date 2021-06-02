drop table parts_orders;

create table parts_orders(
order_num 	char(6),
cust_num 	char(8),
part_num 	integer,
quantity 	integer,
order_code 	char(1),
order_date 	date,
primary key 	(order_num),
last_inspected date,
foreign key	(part_num) references parts
);


prompt inserting some rows into parts and parts_orders

insert into parts
values
(10603, 'hexagonal wrench', 13, 9.99, '003', '05-sep-2018');

/*
insert into parts
values
(10604, 'tire', 287, 39.985, '333', sysdate);

*/
