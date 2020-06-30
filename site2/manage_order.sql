SET SERVEROUTPUT ON;
SET VERIFY OFF;
DECLARE
	X orders.o_status%TYPE:=&x;
    n NUMBER;
    --MSG VARCHAR2(25);
BEGIN  
	--site_name := manage_order(X);
    n:=manage_order(X);
    IF  X=0 THEN
        DBMS_OUTPUT.PUT_LINE('Total'||' '||n||' '||'unprocessed order found');
    ELSIF X=1 THEN
        DBMS_OUTPUT.PUT_LINE('Total'||' '||n||' '||'completed order found');
    END IF;
END;
/
--SELECT * from customer@chittagong;
--SELECT * from product;
