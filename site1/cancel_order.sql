SET SERVEROUTPUT ON;
SET VERIFY OFF;
DECLARE
	X customer.cus_id%TYPE:=&x;
	Y INT:=&y;
    Z orders.o_id%TYPE:=&z;
BEGIN
    up_order_remote(X,Y,Z);
END;
/

--select * from orders where cus_id=2;

--select * from log_updel_order;