SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION manage_order(X IN orders.o_status%TYPE)
RETURN NUMBER IS

    counts NUMBER:=0;
	
	oid orders.o_id%TYPE;
    cname customer.cus_name%TYPE;
    pname product.prod_name%TYPE;
	punit product.prod_unit%TYPE;
    oamount orders.o_amount%TYPE;
    ostatus orders.o_status%TYPE;
    ship_add orders.shipping_address%TYPE;
	
	CURSOR view_orders(flag orders.o_status%TYPE)
	IS
		SELECT o_id,cus_name,prod_name,prod_unit,o_amount,o_status,shipping_address
		FROM orders O,customer C,product P 
		WHERE O.cus_id=C.cus_id AND O.prod_id=P.prod_id AND o_status=flag;
        
BEGIN  
	OPEN view_orders(X);
		LOOP
			FETCH view_orders INTO oid,cname,pname,punit,oamount,ostatus,ship_add;
			EXIT WHEN view_orders%NOTFOUND;
			DBMS_OUTPUT.PUT_LINE(oid||' '||cname||' '||pname||' '||punit||' '||oamount||' '||ship_add);
            counts:=counts+1;
		END LOOP;
	CLOSE view_orders;
	--MSG:=('ALL ORDERS WITH STATUS'||' '||X||' '||'ARE SHOWN');
	RETURN counts;
END manage_order;
/
--SELECT * from customer@chittagong;
--SELECT * from product;
