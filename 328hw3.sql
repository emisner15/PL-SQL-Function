set serveroutpu on

spool 328hw3-out.txt

prompt Eric Misner


prompt problem 1


create or replace function next_ord_needed_id return number as
        ord_id number;

begin


        select max(ord_needed_id)
        into ord_id
        from order_needed;

        if ord_id is null then
                ord_id := 1;

        else
                ord_id := ord_id + 1;

        end if;


        return ord_id;




end;
/


show errors


prompt problem 2

prompt Eric Misner


create or replace function is_on_order(ord_isbn varchar2) return boolean as
		on_order boolean;
		cur_date date;
		
		
		
begin
		select date_placed
		into cur_date
		from order_needed
		where isbn = ord_isbn;
		
		if cur_date is null then	
				on_order := FALSE;
		else
				on_order:= TRUE;
		end if;
		
		return on_order;


exception
	when no_data_found then
			return FALSE;
			

end;
/




spool off
		
	 








































