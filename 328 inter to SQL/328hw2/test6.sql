prompt Problem 6

set serveroutput on

create or replace procedure titles_in_range(low_number integer, high_number integer) is
begin

	dbms_output.put_line('Working plz');
        
	for next_title in (select *
                           from title
                           where ttl_price >= low_number and ttl_price <= high_number
                           order by ttl_price, ttl_name)
        loop
            dbms_output.put_line('$' || next_title.ttl_price ||' - '
                                   ||  next_title.ttl_name || ': ' ||
                                   next_title.ttl_qty);
        end loop;

end;
/
show errors

