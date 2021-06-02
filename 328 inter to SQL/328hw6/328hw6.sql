--Adrian Haro
-- 3/13/2020
spool 328hw6-out.txt

create or replace function sell_book(par_ISBN varchar2, par_book_qty number)
                return number as
      local_qty   number(3);
      local_order_point   number(3);
      local_message   varchar2(20);
      local_auto_qty  number(3);
begin
commit;

select  ttl_qty
into    local_qty
from    title
where   ttl_isbn = par_ISBN;

if 0 > par_book_qty then
   rollback;
   return -2;
end if;


if  par_book_qty > local_qty then
   rollback;
   return -3;
end if;


update  title
set     ttl_qty = ttl_qty - par_book_qty
where   title.ttl_isbn = par_ISBN;


select  ttl_order_point
into    local_order_point
from    title
where   title.ttl_isbn = par_ISBN;

select  ttl_auto_order_qty
into    local_auto_qty
from    title
where   title.ttl_isbn = par_ISBN;


if (local_qty <= local_order_point and is_on_order(par_ISBN) = FALSE
	 and pending_order_needed(par_ISBN)) = FALSE then
	 local_message := insert_order_needed(par_ISBN, local_auto_qty);
end if;
commit;
return 0;

exception

    when no_data_found then
        rollback;
        return -1;
end;
/
show errors

spool off
