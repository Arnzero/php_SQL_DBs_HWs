drop table parts cascade constraints;

create table parts(
part_num integer,
part_name varchar2(25),
quanity_on_hand smallint,
price decimal(6,2),
level_code char(3), -- level code MUST BE 3 digits
primary key (part_num)
);
