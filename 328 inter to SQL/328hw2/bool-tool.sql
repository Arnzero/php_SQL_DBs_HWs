--Adrian Haro
-- 2/5/2020

create or replace function bool_to_string(bool_val boolean) return varchar2 as

begin
	if bool_val = TRUE then
		 return 'TRUE';
	else
		return 'FALSE';
	end if;
end;
/
show errors

spool 328hw2-2-out.txt

prompt Adrian Haro
prompt bool_to_string(TRUE) should return TRUE

var result varchar2(5)
exec :result := bool_to_string(true)
print result


prompt bool_to_string(FALSE) should return FALSE

var result2 varchar2(5)
exec :result2 := bool_to_string(false)
print result2


spool off
