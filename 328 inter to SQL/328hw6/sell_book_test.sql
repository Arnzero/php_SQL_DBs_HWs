/*=====
  testing script for function sell_book

  (note: because it runs COMMITTING transactions as
  part of tests, running pop-bks.sql at beginning
  and at end of testing script)

  by: Sharon Tuttle
  last modified: 2020-03-07
=====*/

set feedback off
start pop-bks.sql
set feedback 6

set serveroutput on
set linesize 100

col ttl_order_point heading ORD_PT
col ttl_auto_order_qty heading AUTO_QTY 

prompt
prompt ***************************************
prompt test sell_book
prompt ***************************************
prompt

prompt ===================
prompt TEST 1
prompt ===================
prompt

prompt =============================================================
prompt there is an order_needed row for 9780256033205, but NOT 
prompt     a PENDING order_needed row (ord_num not null):
prompt =============================================================

select *
from   order_needed
where  ttl_isbn = '9780256033205';

prompt =============================================================
prompt Trying to sell 5 copies of 9780256033205 should SUCCEED
prompt with a code of 0:
prompt =============================================================

var results_code number;
exec :results_code := sell_book('9780256033205', 5)
print results_code

prompt =============================================================
prompt Are there now 5 copies of 9780256033205?
prompt =============================================================

select ttl_isbn, ttl_name, ttl_qty, ttl_order_point, ttl_auto_order_qty
from   title
where  ttl_isbn = '9780256033205';

prompt =============================================================
prompt ttl_qty less than ttl_order_point, so should be a NEW order_needed
prompt row for 9780256033205 now:
prompt =============================================================

select *
from   order_needed
where  ttl_isbn = '9780256033205';

prompt ===================
prompt TEST 2
prompt ===================
prompt

prompt =============================================================
prompt Trying to sell 10 copies of 0130355488XXX should FAIL
prompt with a code of -1 (this ISBN is not in the database):
prompt =============================================================

exec :results_code := sell_book('0130355488XXX', 10)
print results_code

prompt ===================
prompt TEST 3
prompt ===================
prompt

prompt =============================================================
prompt there should NOT be an order_needed row for '9780805367829':
prompt =============================================================

select *
from   order_needed
where  ttl_isbn = '9780805367829';

prompt =============================================================
prompt Trying to sell 11 copies of 9780805367829 should SUCCEED
prompt with a code of 0:
prompt =============================================================

exec :results_code := sell_book('9780805367829', 11)
print results_code

prompt =============================================================
prompt are there now 39 copies of 9780805367829, 
prompt    but NO row for it in titles_on_order?
prompt    (it needs an order, has not been ordered yet)
prompt =============================================================

select ttl_isbn, ttl_name, ttl_qty, ttl_order_point, ttl_auto_order_qty
from   title
where  ttl_isbn = '9780805367829';

select *
from   titles_on_order
where  ttl_isbn = '9780805367829';

prompt =============================================================
prompt there SHOULD now be an order_needed row for 9780805367829
prompt    (with an order quantity of 10):
prompt =============================================================

select *
from   order_needed
where  ttl_isbn = '9780805367829';

prompt ===================
prompt TEST 4
prompt ===================
prompt

prompt =============================================================
prompt there should NOT be an order_needed row for '9780871502445':
prompt =============================================================

select *
from   order_needed
where  ttl_isbn = '9780871502445';

prompt =============================================================
prompt Trying to sell 1 copy of 9780871502445 should SUCCEED
prompt with a code of 0:
prompt =============================================================

exec :results_code := sell_book('9780871502445', 1)
print results_code

prompt =============================================================
prompt are there now 2 copies of 9780871502445, 
prompt    but NO row for it in titles_on_order?
prompt    (it needs an order, has not been ordered yet)
prompt =============================================================

select ttl_isbn, ttl_name, ttl_qty, ttl_order_point, ttl_auto_order_qty
from   title
where  ttl_isbn = '9780871502445';

select *
from   titles_on_order
where  ttl_isbn = '9780871502445';

prompt =============================================================
prompt there SHOULD now be an order_needed row for 9780871502445
prompt    (with an order quantity of 5):
prompt =============================================================

select *
from   order_needed
where  ttl_isbn = '9780871502445';

prompt ===================
prompt TEST 5
prompt ===================
prompt

prompt =============================================================
prompt Trying to sell 1 copy of 9780871502445 should SUCCEED
prompt with a code of 0:
prompt =============================================================

exec :results_code := sell_book('9780871502445', 1)
print results_code

prompt =============================================================
prompt is there now 1 copy of 9780871502445?
prompt =============================================================

select ttl_isbn, ttl_name, ttl_qty, ttl_order_point
from   title
where  ttl_isbn = '9780871502445';

prompt =============================================================
prompt BUT there SHOULD still be ONLY ONE order_needed row for 9780871502445:
prompt =============================================================

select *
from   order_needed
where  ttl_isbn = '9780871502445';

prompt ===================
prompt TEST 6
prompt ===================
prompt

prompt =============================================================
prompt Trying to sell -5 copies of 9780131889187 should FAIL
prompt with a code of -2 (should not sell a non-positive
prompt number of books!):
prompt =============================================================

exec :results_code := sell_book('9780131889187', -5)
print results_code

prompt ===================
prompt TEST 7
prompt ===================
prompt

prompt =============================================================
prompt there should NOT be an order_needed row for '9780070465329':
prompt =============================================================

select *
from   order_needed
where  ttl_isbn = '9780070465329';

prompt =============================================================
prompt Trying to sell 4 copies of 9780070465329 should SUCCEED
prompt with a code of 0:
prompt =============================================================

exec :results_code := sell_book('9780070465329', 4)
print results_code

prompt =============================================================
prompt are there now 71 copies of 9780070465329?
prompt =============================================================

select ttl_isbn, ttl_name, ttl_qty, ttl_order_point
from   title
where  ttl_isbn = '9780070465329';

prompt =============================================================
prompt there should NOT be an order_needed for this title:
prompt =============================================================

select *
from   order_needed
where  ttl_isbn = '9780070465329';

prompt ===================
prompt TEST 8
prompt ===================
prompt

prompt =============================================================
prompt Trying to sell 21 copies of 9780805360400 should FAIL
prompt with a code of -3 (should not sell MORE than the current
prompt quantity on hand of a book):
prompt =============================================================

exec :results_code := sell_book('9780805360400', 21)
print results_code

prompt =============================================================
prompt had better still have 20 of this title (sale not permitted
prompt    for more than on-hand...!)
prompt =============================================================

select ttl_isbn, ttl_name, ttl_qty, ttl_order_point
from   title
where  ttl_isbn = '9780805360400';

prompt =============================================================
prompt there should NOT be an order_needed for this title:
prompt =============================================================

select *
from   order_needed
where  ttl_isbn = '9780805360400';

-- required post-test_sell_book-calls' queries

prompt =============================================
prompt title table after tests but before rollback:
prompt =============================================

select   ttl_isbn, ttl_qty, ttl_order_point
from     title
order by ttl_isbn;

prompt ====================================================
prompt order_needed table after tests but before call
prompt pop-bks.sql again:
prompt ====================================================

select   *
from     order_needed
order by ord_needed_id;

set feedback off
start pop-bks.sql
set feedback 6
set linesize 80

-- end of sell_book_test.sql
