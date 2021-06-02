--Adrian Haro
--CS 325 Fall 2019
--11/16/2019
--

drop table nutr cascade constraints;

-- table for nutritionist
create table nutr(
 nutr_id	number(6) not null,
 nutr_lname	varchar2(15),
 nutr_fname	varchar2(15),
 primary key(nutr_id)
);

drop table clientP cascade constraints;

--table for client project
create table clientP(
 cli_id		number(6) not null,
 cli_lname	varchar2(15),
 cli_fname     varchar2(15),
 primary key(cli_id)
);

drop table cliP_email cascade constraints;

-- client project email multivalue
create table cliP_email(
 cli_id		number(6) not null,
 email_id	varchar2(30) not null,
 primary key	(cli_id, email_id),
 foreign key	(cli_id) references clientP
);

drop table consultation cascade constraints;

--association table between nutr, consultation and client
create table consultation(
 nutr_id	number(6) not null,
 cli_id		number(6) not null,
 cons_date	date,
 primary key	(cli_id, nutr_id),
 foreign key	(cli_id) references clientP,
 foreign key	(nutr_id) references nutr
);

drop table prescription cascade constraints;

--association table between nutr, prescription and client
create table prescription(
 nutr_id        number(6) not null,
 cli_id         number(6) not null,
 drug_id	number(6),
 drug_name	varchar(20),
 presc_date	date,
 primary key    (cli_id, nutr_id),
 foreign key    (cli_id) references clientP,
 foreign key    (nutr_id) references nutr,
 foreign key	(drug_id) references drug
);

drop table consul_symps cascade constraints;

--client symptoms are multivalued
create table consul_symps(
 nutr_id        number(6) not null,
 cli_id         number(6) not null,
 cli_symps	varchar2(15) not null,
 primary key	(nutr_id, cli_id, cli_symps),
 foreign key    (cli_id) references clientP,
 foreign key    (nutr_id) references nutr,
);

drop table drug cascade constraints;

-- table for drug objects
create table drug(
 drug_id	number(6) not null,
 drug_cost	number(6,2),
 drug_name	varchar2(15),
 drug_type	char(1), -- 0 for over the counter, 1 for presc
 primary key(drug_id) 
);


drop table drug_purchase cascade constraints;

-- association table between client and drugs
create table drug_purchase(
 drug_id        number(6) not null,
 cli_id		number(6) not null,
 drug_amt	number(6,2), --in mg's
 amt_spent	number(6,2), --in $$
 primary key	(drug_id, cli_id),
 foreign key	(drug_id) references drug,
 foreign key	(cli_id) references clientP
);
