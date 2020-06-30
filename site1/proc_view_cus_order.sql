SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE cancel_order(X IN customer.cus_id%TYPE,Y IN orders.o_status%TYPE,Z IN orders.o_id%TYPE)
IS	
	oid orders.o_id%TYPE;
    pid product.prod_id%TYPE;
    pname product.prod_name%TYPE;
	punit product.prod_unit%TYPE;
    oamount orders.o_amount%TYPE;
    ostatus orders.o_status%TYPE;
	
	CURSOR cus_orders(C_ID customer.cus_id%TYPE,flag orders.o_status%TYPE)
	IS
		SELECT o_id,prod_name,o_unit,o_amount
		FROM orders O,product P 
		WHERE cus_id=C_ID AND O.prod_id=P.prod_id AND o_status=flag;
BEGIN  
	OPEN cus_orders(X,Y);
		LOOP
			FETCH cus_orders INTO oid,pname,punit,oamount;
			EXIT WHEN cus_orders%NOTFOUND;
			DBMS_OUTPUT.PUT_LINE(oid||'    '||' '||pname||'     '||punit||'     '||oamount);
		END LOOP;
	CLOSE cus_orders;
    
    SELECT prod_id,o_unit INTO pid,punit FROM orders WHERE o_id=Z;
    UPDATE product SET prod_unit=prod_unit+punit WHERE prod_id=pid;
	DELETE orders WHERE o_id=Z;  
    COMMIT;
END cancel_order;
/
