SET SERVEROUTPUT ON;
SET VERIFY OFF;
DECLARE
    site_name VARCHAR2(10);
    
    cid customer.cus_id%TYPE;
    cname customer.cus_name%TYPE:=&cname;
    cphone customer.phone%TYPE:=&cphone;
    ccity customer.city%TYPE:=&ccity;
    cadd customer.address%TYPE:=&cadd;
BEGIN  
    --ccity:=upper(ccity);
    register(cname,cphone,ccity,cadd);
END;
/
SELECT * from customer;
--SELECT * from customer@chittagong;
