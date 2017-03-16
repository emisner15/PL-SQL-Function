/*=====
  testing script for function next_ord_needed_id

  by: Sharon Tuttle
  last modified: 2017-02-05
=====*/

spool next_ord_needed_id_test_out.txt
set serveroutput on

prompt
prompt *****************************************
prompt TESTING next_ord_needed_id
prompt *****************************************
prompt

prompt test passes if the next ord_needed_id suggested is 1011:
prompt ==========================================================

var result_key number
exec :result_key := next_ord_needed_id()
print result_key

commit;

-- temporarily remove all rows from order_needed

delete from order_needed;

prompt
prompt test passes if the next ord_needed_id suggested is 1:
prompt ==========================================================

exec :result_key := next_ord_needed_id
print result_key

-- "put back" all rows from order_needed

rollback;

-- temporarily modify a row from order_needed

update order_needed
set ord_needed_id = 2012
where ord_needed_id = 1006;

prompt
prompt test passes if the next ord_needed_id suggested is 2013:
prompt ==========================================================

exec :result_key := next_ord_needed_id()
print result_key

-- undo the temporary modification

rollback;

spool off
 
-- end of next_ord_needed_test.sql