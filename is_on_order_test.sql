/*=====
  testing script for function is_on_order
  (including a helper-function, bool_to_string)

  by: Sharon Tuttle
  last modified: 2017-02-05
=====*/

spool is_on_order_test_out.txt
set serveroutput on

/*===
  (note: the is_on_order tests use the following helper-function)
===*/

/*----------         
   funct_bool_to_string.sql
   last modified: 2017-02-05
----------*/

/*****
 why? because apparently you CAN'T easily return a boolean
 at the SQL*Plus level...?
*****/

/*****
    function: bool_to_string: boolean -> varchar2
    purpose: expects a boolean, and returns an equivalent
        string version (for top-level SQL*Plus use...!)

    examples: bool_to_string(TRUE) = 'TRUE'
              bool_to_string(FALSE) = 'FALSE'
*****/

create or replace function bool_to_string(bool_val boolean)
                           return varchar2 as
begin
    if bool_val then
        return 'TRUE';
    else
        return 'FALSE';
    end if;
end;
/
show errors

prompt
prompt *****************************************
prompt TESTING is_on_order (note: uses bool_to_string)
prompt *****************************************
prompt

prompt test passes if 0805343024 is shown on-order (returns true)
prompt ==========================================================

var on_order_status varchar2(5)
exec :on_order_status := bool_to_string(is_on_order('0805343024'))
print on_order_status

prompt
prompt test passes if 087150331X is shown NOT on-order (rets false)
prompt ==========================================================

exec :on_order_status := bool_to_string(is_on_order('087150331X'))
print on_order_status

prompt
prompt test passes if 1313131313 is shown NOT on-order (rets false)
prompt ==========================================================

exec :on_order_status := bool_to_string(is_on_order('1313131313'))
print on_order_status

spool off

-- end of is_on_order_test.sql