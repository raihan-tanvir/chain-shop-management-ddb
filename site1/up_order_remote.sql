SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE up_order_remote(X IN customer.cus_id%TYPE,Y IN orders.o_status%TYPE,Z IN orders.o_id%TYPE)
IS	
	oid orders.o_id%TYPE;
    pid product.prod_id%TYPE;
    pname product.prod_name%TYPE;
	punit product.prod_unit%TYPE;
    oamount orders.o_amount%TYPE;
    ostatus orders.o_status%TYPE;
	
BEGIN
    IF Y=0 
        THEN
            SELECT COUNT(o_id) INTO oid FROM orders WHERE o_id=Z;
            IF oid>0
                THEN
                    SELECT prod_id,o_unit INTO pid,punit FROM orders WHERE o_id=Z;
                    UPDATE product SET prod_unit=prod_unit+punit WHERE prod_id=pid;
                    DELETE orders WHERE o_id=Z; 
            END IF;
        ELSIF Y=1 THEN
            SELECT COUNT(o_id) INTO oid FROM orders@chittagong WHERE o_id=Z;
            IF oid>0
                THEN
                    SELECT prod_id,o_unit INTO pid,punit FROM orders@chittagong WHERE o_id=Z;
                    UPDATE product SET prod_unit=prod_unit+punit WHERE prod_id=pid;
                    DELETE orders@chittagong WHERE o_id=Z;    
            END IF;                    
    END IF;
    
    COMMIT;
END up_order_remote;
/
