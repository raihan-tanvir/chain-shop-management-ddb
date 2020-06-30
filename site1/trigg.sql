SET SERVEROUTPUT ON;

create or replace trigger customer_reg_trigger
after insert on Customer

begin
	dbms_output.put_line('Customer Registerd Successfully!');
end;
/

create or replace trigger customer_update_trigger
after update
on customer
for each row

begin
    dbms_output.put_line('old_val    new_val');

    dbms_output.put_line(:old.cus_name||' '||:new.cus_name);
    dbms_output.put_line(:old.city||' '||:new.city);
    dbms_output.put_line(:old.address||' '||:new.address);
end;
/

create or replace trigger customer_del_trigger
after DELETE on Customer

begin
	dbms_output.put_line('Account Deleted!');
end;
/

create or replace trigger order_place_trigger
after insert on orders

begin
	dbms_output.put_line('Order Has Been Placed!');
end;
/

create or replace trigger order_updel_trigg
after update or delete
on orders
for each row

begin
	insert into log_updel_order
	values(:old.o_id, :old.cus_id, :old.prod_id, :old.o_unit, :old.o_date, sysdate);
end;
/

/*
create or replace trigger trigger_log
after insert
on student
for each row

begin
	insert into log_insert
	values(:new.snum, sysdate);
end;
/
*/

/*
create or replace trigger trigger_log
after update or delete
on student
for each row

begin
	insert into log_updel
	values(:old.age, :new.age, sysdate);
end;
/
*/

/*
create or replace trigger trigger_log
after update or delete
of age
on student
for each row

begin
	insert into log_updel
	values(:old.age, :new.age, sysdate);
end;
/
*/

/*
create or replace trigger trigger_log
before update or delete
of age
on student
for each row

begin
	-- write the code
end;
/
*/