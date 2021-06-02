--CS 328 - HW 1 - Problem 3
--Adrian Haro
-- Last modified 1/30/2020


spool bks-play-out.txt

prompt Adrian Haro

prompt Problem 3a project 2 columns, name of pubs'
prompt and state of pubs' with alias in alphabetic order

col pub_state format a20

select pub_name "Published Name", pub_city ||', '||pub_state "Published State"
from publisher
order by pub_name;

prompt Problem 3b

col ttl_price format $999.99

select ttl_name, ttl_price
from title
	join publisher on publisher.pub_id = title.pub_id
where pub_name ='Benjamin/Cummings'
order by ttl_name;


prompt Problem 3c

col "AVG PRICE" format $999.99

select pub_name, count(*) "# TITLES", avg(ttl_price) "AVG PRICE"
from publisher
	join title on publisher.pub_id = title.pub_id
group by pub_name
order by "AVG PRICE";


prompt Problem 3d

select ttl_name, ord_line_qty
from title
	join order_line_item on title.ttl_isbn = order_line_item.ttl_isbn
where ord_num = 11012;

prompt Problem 3e

select pub_name, ord_line_qty
from order_stock
	join publisher on publisher.pub_id = order_stock.pub_id
	join order_line_item on order_line_item.ord_num = order_stock.ord_num
where ord_line_qty = ( select max(ord_line_qty)
		       from order_line_item );



spool off
