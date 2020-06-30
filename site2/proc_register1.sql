CREATE OR REPLACE PROCEDURE register(
    cname IN customer.cus_name%TYPE,
    cphone IN customer.phone%TYPE,
    ccity IN customer.city%TYPE,
    cadd IN customer.address%TYPE)
IS
    site_name VARCHAR2(10);
    user_city customer.city%TYPE:=upper(ccity);
    cid customer.cus_id%TYPE;
    
BEGIN      
    --SELECT cus_id INTO cid  FROM (SELECT * FROM customer ORDER BY cus_id DESC ) WHERE ROWNUM = 1;
    SELECT cus_id  INTO cid FROM ((SELECT cus_id FROM customer UNION SELECT cus_id FROM customer@dhaka) ORDER BY cus_id DESC ) WHERE ROWNUM = 1;

    SELECT DB_LINK INTO site_name FROM USER_DB_LINKS;
    IF site_name=user_city THEN
            --SELECT cus_id INTO cid  FROM (SELECT * FROM Customer@dhaka ORDER BY cus_id DESC ) WHERE ROWNUM = 1;  
            INSERT INTO Customer@dhaka(cus_id,cus_name,phone,city,address) VALUES(cid+1,cname,cphone,ccity,cadd);
    ELSE
        INSERT INTO Customer(cus_id,cus_name,phone,city,address) VALUES(cid+1,cname,cphone,ccity,cadd);
    END IF;  
    
    COMMIT;
    -- DBMS_OUTPUT.PUT_LINE('Procedure proc_register executed successfully');
END register;
/
--INSERT INTO Customer@chittagong(cus_id,cus_name,phone,email,passwords,city,address) VALUES(cid+1,cname,cphone,cmail,cpass,ccity,cadd);
