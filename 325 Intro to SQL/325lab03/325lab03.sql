-- Misael and Adrian
-- 09/13/2019

@ initial_parts.sql

spool 325lab03-out.txt

prompt Misael and Adrian


insert into part_orders
values
('500500', 3548787, 10603, '13-MAY-2016', 12, 'B','F');

insert into part_orders
values
('637101', 3548767, 10605, '23-FEB-2019', 2, 'I','P');

insert into part_orders
values
('123456', 9876543, 10606, '13-DEC-2016', 1, 'G','U');

delete from parts
where part_num = 10607;

update parts
set QUANTITY_ON_HAND = 200
where part_num = 10603;

update part_orders
set quantity = 20
where order_num = '500500';

select * from parts;


select * from part_orders;

spool off


