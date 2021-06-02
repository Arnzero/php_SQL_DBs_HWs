
/*=====
    by: Sharon Tuttle
    last modified: 2018-09-08 (after Week 3 Lab)
=====*/

/*=====
    INTENT of this script is to give an INITIAL population to
    parts table, SO this modified version first DELETES any
    CURRENT contents of part_orders (child table!) and then
    parts
=====*/

delete from part_orders;

delete from parts;

/*=====
    NOW give parts some initial contents
=====*/

insert into parts
values
(10603, 'hexagonal wrench', 13, 9.99, '003', '07-SEP-2017');

insert into parts
values
(10604, 'tire', 287, 39.99, '333', '06-SEP-2018');

insert into parts
values
(10605, 'hammer', 30, 9.99, '003', '01-SEP-2018');

insert into parts
values
(10606, '3/8 in bolt', 5000, 0.03, '005', '04-SEP-2018');

insert into parts
values
(10607, '7/8 in bolt', 2655, 0.04, '005', '02-SEP-2018');

prompt the contents of the parts table:

select *
from   parts;

prompt the contents of the part_orders table:

select *
from part_orders;

