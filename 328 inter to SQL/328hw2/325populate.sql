-- Jesse Garcia
-- CS 325 - Fall 2019
-- 11-20-19

delete from mechanic;
delete from manger;
delete from check_out;
delete from tools;
delete from car;
delete from oil_change;
delete from os_customer;
delete from employee;

prompt inserting into employee table

insert into employee
values
('e00000','Randy', '10-Jan-2018', 'Manager');

insert into employee
values
('e00001','Jesse', '10-Jan-2018', 'Manager');

insert into employee
values
('e00002','Patrick', '10-Jan-2018', 'Mechanic');

insert into employee
values
('e00003','Dave', '5-Feb-2018', 'Mechanic');

insert into employee
values
('e00004','Emerald', '5-Feb-2018', 'Mechanic');

insert into employee
values
('e00005','Jerry', '10-Apr-2018', 'Mechanic');

insert into employee
values
('e00006','Fred', '12-Apr-2018', 'Mechanic');

insert into employee
values
('e00007','Jasmine', '1-Jul-2018', 'Mechanic');

insert into employee
values
('e00008','Jenesis', '10-Jan-2018', 'Mechanic');

insert into employee
values
('e00009','Ben', '21-Mar-2019', 'Mechanic');


prompt inserting into os_customer

insert into os_customer
values
('c00000', '325 campus, arcata 95519', '3231234567');

insert into os_customer
values
('c00001', '654 b st, arcata 95519', '3232334455');

insert into os_customer
values
('c00002', '325 campus, arcata 95519', '3235551717');

insert into os_customer
values
('c00003', '104 newton, arcata 95519', '3233724122');

insert into os_customer
values
('c00004', '321 h st, eureka 95519', '3234573797');

insert into os_customer
values
('c00005', '1056 costco, eureka 95519', '3231213092');

insert into os_customer
values
('c00006', '5012 Myrtle, eureka 95519', '323754321');

insert into os_customer
values
('c00007', '1006 g st, arcata 95519', '3232121323');

insert into os_customer
values
('c00008', '1738 main, arcata 95519', '3233324332');

insert into os_customer
values
('c00009', '113 central, arcata 95519', '3239023452');

prompt inserting into oil_change table 

insert into oil_change
values
('000000', '10-JAN-2018', '5w20', 'c00000', 'e00003');

insert into oil_change
values
('000001', '12-JAN-2018', '5w20', 'c00001', 'e00003');

insert into oil_change
values
('000002', '05-FEB-2018', '10w30', 'c00002', 'e00004');

insert into oil_change
values
('000003', '10-JAN-2018', '5w30', 'c00002', 'e00005');

insert into oil_change
values
('000004', '10-Mar-2018', '10w40', 'c00002', 'e00006');

insert into oil_change
values
('000005', '12-Sep-2018', '5w20', 'c00005', 'e00007');

insert into oil_change
values
('000006', '16-Oct-2018', '5w20', 'c00006', 'e00008');

insert into oil_change
values
('000007', '25-Apr-2018', '5w20', 'c00007', 'e00009');

insert into oil_change
values
('000008','27-Mar-2018', '10w20', 'c00008', 'e00003');

insert into oil_change
values
('000009', '12-Feb-2018', '5w20', 'c00009', 'e00004');


prompt inserting into car table

insert into car
values
('1998', 'honda', 'civic', '000000', 'c00000');

insert into car
values
('2015', 'honda', 's2000', '000001', 'c00001');

insert into car
values
('2008', 'nissan', 'gtr', '000002', 'c00002');

insert into car
values
('2012', 'toyota', 'corolla', '000003', 'c00002');

insert into car
values
('2005', 'nissan', 'muanro', '000004', 'c00002');
insert into car
values
('2012', 'ferrari', 'enzo', '000005', 'c00005');

insert into car
values
('2006', 'honda', 'crv', '000006', 'c00006');

insert into car
values
('2007', 'toyota', 'rav4', '000007', 'c00007');

insert into car
values
('2019', 'nissan', 'skyline', '000008', 'c00008');

insert into car
values
('2016', 'nissan', 'leaf', '000009', 'c00009');


prompt inserting into tools table

insert into tools
values
('t0000');

insert into tools
values
('t0001');

insert into tools
values
('t0002');

insert into tools
values
('t0003');

insert into tools
values
('t0004');

insert into tools
values
('t0005');

insert into tools
values
('t0006');

insert into tools
values
('t0007');

insert into tools
values
('t0008');

insert into tools
values
('t0009');

prompt inserting into check_out table

insert into check_out
values
('10-Jan-2018', '10-Jan-2018','t0001','e00003');

insert into check_out
values
('12-Jan-2018', '12-Jan-2018','t0003','e00003');

insert into check_out
values
('05-Feb-2018', '05-Feb-2018','t0002','e00004');

insert into check_out
values
('10-Jan-2018', '10-Mar-2018','t0006','e00005');

insert into check_out
values
('10-Mar-2018', '10-Mar-2018','t0003','e00006');

insert into check_out
values
('12-Sep-2018', '12-Sep-2018','t0004','e00007');

insert into check_out
values
('16-Oct-2018', '16-Oct-2018','t0005','e00008');

insert into check_out
values
('25-Apr-2018', '25-Apr-2018','t0006','e00009');

insert into check_out
values
('27-Mar-2018', '27-Mar-2018','t0002','e00003');

insert into check_out
values
('12-Feb-2018', '12-Feb-2018','t0003','e00004');


prompt inserting into manager

insert into manger
values
('10-Jan-2018', '50,000', 'e00000');

insert into manger
values
('10-Jan-2018', '50,000', 'e00001');

prompt inserting into mechanic

insert into mechanic
values
('30,000', 'e00002');

insert into mechanic
values
('30,000', 'e00003');

insert into mechanic
values
('30,000', 'e00004');

insert into mechanic
values
('30,000', 'e00005');

insert into mechanic
values
('30,000', 'e00006');

insert into mechanic
values
('30,000', 'e00007');

insert into mechanic
values
('30,000', 'e00008');

insert into mechanic
values
('30,000', 'e00009');
