SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE del_customer(CID customer.cus_id%TYPE)
IS
     A number;
BEGIN
    SELECT COUNT(cus_id) INTO A FROM customer WHERE cus_id=cid;
    
    IF A!=0 THEN
            UPDATE CUSTOMER SET status=99 WHERE cus_id=CID;
    ELSE
        SELECT COUNT(cus_id) INTO A FROM customer@dhaka WHERE cus_id=cid;
        IF A!=0 THEN
            UPDATE customer@dhaka SET status=99 WHERE cus_id=CID;
        END IF;
    END IF; 
    COMMIT;
END del_customer;
/

--select * from customer;
--select * from customer@chittagong;

