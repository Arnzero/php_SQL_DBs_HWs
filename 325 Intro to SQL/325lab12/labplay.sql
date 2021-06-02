drop sequence seq;

create sequence seq
increment by	3
start with	100;


drop table tbl;

create table tbl
(id	char(3),
 age	varchar2(10),
 primary key (id));

insert into tbl
values
(seq.nextval, 0);


insert into tbl
values (seq.nextval, 0);

insert into tbl
values(seq.nextval, seq.currval);



select *
from tbl;


select seq.currval, seq.nextval
from tbl;
