SET SERVEROUTPUT ON;

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
    SELECT cus_id  INTO cid FROM ((SELECT cus_id FROM customer UNION SELECT cus_id FROM customer@chittagong) ORDER BY cus_id DESC ) WHERE ROWNUM = 1;

    SELECT DB_LINK INTO site_name FROM USER_DB_LINKS;
    IF site_name=user_city THEN
            
            --SELECT cus_id INTO cid  FROM (SELECT * FROM Customer@chittagong ORDER BY cus_id DESC ) WHERE ROWNUM = 1;  
            INSERT INTO Customer@chittagong(cus_id,cus_name,phone,city,address) VALUES(cid+1,cname,cphone,ccity,cadd);
    ELSE
        INSERT INTO Customer(cus_id,cus_name,phone,city,address) VALUES(cid+1,cname,cphone,ccity,cadd);
    END IF;  
    
    COMMIT;
    -- DBMS_OUTPUT.PUT_LINE('Procedure proc_register executed successfully');
END register;
/
--INSERT INTO Customer@chittagong(cus_id,cus_name,phone,email,passwords,city,address) VALUES(cid+1,cname,cphone,cmail,cpass,ccity,cadd);


---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------


CREATE OR REPLACE PROCEDURE update_customer(
    choice IN NUMBER,
    cid IN customer.cus_id%TYPE,
    cname IN customer.cus_name%TYPE,
    ccity IN customer.city%TYPE,
    cadd IN customer.address%TYPE)
IS
        A number;
        B number;
        excp EXCEPTION;
        PRAGMA EXCEPTION_INIT(excp, -00942);
BEGIN 
    SELECT COUNT(cus_id) INTO A FROM customer WHERE cus_id=cid;
    
    IF A!=0 THEN
        IF choice=1 THEN
            UPDATE customer SET cus_name=cname WHERE cus_id=cid;
        ELSIF choice=2 THEN
            UPDATE customer SET city=ccity WHERE cus_id=cid;    
            IF ccity='Chittagong' THEN
                INSERT INTO customer@chittagong SELECT * FROM customer WHERE cus_id=cid;
                DELETE FROM customer WHERE cus_id=cid;
            END IF;    
        ELSIF choice=3 THEN
            UPDATE customer SET address=cadd WHERE cus_id=cid;        		
        END IF;
        
        ELSE
            SELECT COUNT(cus_id) INTO A FROM customer@chittagong WHERE cus_id=cid;
            IF A!=0 THEN
                IF choice=1 THEN
                    UPDATE customer@chittagong SET cus_name=cname WHERE cus_id=cid;
                ELSIF choice=2 THEN
                    UPDATE customer@chittagong SET city=ccity WHERE cus_id=cid;    
                    INSERT INTO customer SELECT * FROM customer@chittagong WHERE cus_id=cid;
                    DELETE FROM customer@chittagong WHERE cus_id=cid;
                                        
                ELSIF choice=3 THEN
                    UPDATE customer@chittagong SET address=cadd WHERE cus_id=cid;		
                END IF;     
             END IF;         
    END IF;
    
    COMMIT;
END update_customer;
/


---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------


CREATE OR REPLACE PROCEDURE del_customer(CID customer.cus_id%TYPE)
IS
     A number;
BEGIN
    SELECT COUNT(cus_id) INTO A FROM customer WHERE cus_id=cid;
    
    IF A!=0 THEN
            UPDATE CUSTOMER SET status=99 WHERE cus_id=CID;
    ELSE
        SELECT COUNT(cus_id) INTO A FROM customer@chittagong WHERE cus_id=cid;
        IF A!=0 THEN
            UPDATE customer@chittagong SET status=99 WHERE cus_id=CID;
        END IF;
    END IF; 
    COMMIT;
END del_customer;
/



---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------


CREATE OR REPLACE PROCEDURE add_product(
    pname IN product.prod_name%TYPE,
    punit IN product.prod_unit%TYPE,
    pprice IN product.prod_price%TYPE,
    pcat IN product.cat_id%TYPE,
    psup IN product.s_id%TYPE)
IS
    pid product.prod_id%TYPE;
    
BEGIN
     
    SELECT prod_id INTO pid  FROM (SELECT * FROM product ORDER BY prod_id DESC ) WHERE ROWNUM = 1;
    INSERT INTO product(prod_id,prod_name,prod_unit,prod_price,s_id,cat_id) VALUES(pid+1,pname,punit,pprice,psup,pcat);  
    COMMIT;
    -- DBMS_OUTPUT.PUT_LINE('Procedure proc_register executed successfully');
END add_product;
/


---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE update_product(
    choice IN NUMBER, 
    pid IN product.prod_id%TYPE,
    pname IN product.prod_name%TYPE,
    punit IN product.prod_unit%TYPE,
    pprice IN product.prod_price%TYPE,
    pcat IN product.cat_id%TYPE,
    psup IN product.s_id%TYPE)
IS
        A number;
        B number;
        excp EXCEPTION;
        PRAGMA EXCEPTION_INIT(excp, -00942);
BEGIN 
        IF choice=1 THEN
            UPDATE product SET prod_name=pname WHERE prod_id=pid;
        ELSIF choice=2 THEN
            SELECT prod_unit INTO A FROM product WHERE prod_id=pid;
            IF (A+punit)>=0 THEN
                UPDATE product SET prod_unit=prod_unit+punit WHERE prod_id=pid; 
                
                ELSE
                    DBMS_OUTPUT.PUT_LINE('Invalid Attempt!');
            END IF;   
        ELSIF choice=3 THEN
            UPDATE product SET prod_price=pprice WHERE prod_id=pid;  
        ELSIF choice=4 THEN
            UPDATE product SET cat_id=pcat WHERE prod_id=pid;  
        ELSIF choice=5 THEN
            UPDATE product SET s_id=psup WHERE prod_id=pid;      
        END IF;
                  
    COMMIT;
END update_product;
/


---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------


CREATE OR REPLACE PROCEDURE product_visibility(
    pid IN product.prod_id%TYPE,
    pstat IN product.prod_status%TYPE)
IS
        A number;
        B number;
        excp EXCEPTION;
        PRAGMA EXCEPTION_INIT(excp, -00942);
BEGIN
    UPDATE product SET prod_status=pstat WHERE prod_id=pid;                
    COMMIT;
END product_visibility;
/


---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------


CREATE OR REPLACE PROCEDURE place_order(cid IN customer.cus_id%TYPE,pid IN product.prod_id%TYPE,quan IN product.prod_unit%TYPE)
IS
    shipp_city customer.city%TYPE;
    shipp_add customer.address%TYPE;
    shipp_to orders.shipping_address%TYPE;
    
    price product.prod_price%TYPE;
    avail_unit product.prod_unit%TYPE;
    
    amount product.prod_price%TYPE;
    last_o_id orders.o_id%TYPE:=0;
	
	X NUMBER;
BEGIN
    SELECT o_id INTO last_o_id  FROM (SELECT * FROM orders ORDER BY o_id DESC ) WHERE ROWNUM = 1;  
    
    SELECT address,city INTO shipp_add,shipp_city FROM (SELECT * FROM customer UNION SELECT * FROM customer@chittagong)WHERE cus_id=cid;
    SELECT prod_price,prod_unit INTO price,avail_unit FROM product WHERE prod_id=pid;
    
    IF (avail_unit-quan)>=0 THEN
        amount:=price*quan;   
        shipp_to:=shipp_add||', '||shipp_city;
        INSERT INTO Orders VALUES(last_o_id+1,cid,pid,quan,amount,sysdate,0,shipp_to);
        
		UPDATE product SET prod_unit=prod_unit-quan WHERE prod_id=pid;
        COMMIT;
       -- DBMS_OUTPUT.PUT_LINE('Procedure place_order executed successfully');
    ELSE
         DBMS_OUTPUT.PUT_LINE('Insufficient Stock');
    END IF;
         
EXCEPTION 
    WHEN no_data_found THEN 
        DBMS_OUTPUT.PUT_LINE('Product Not Available!'); 
		DBMS_OUTPUT.PUT_LINE('Checkig Other Site'); 
		X:=search_other(pid);
		IF X>0 THEN
			DBMS_OUTPUT.PUT_LINE(X||' unit available at site-chittagong'); 
		END IF;
    WHEN others THEN 
        DBMS_OUTPUT.PUT_LINE('Error!');   
          
END place_order;
/
--select * from ORDERS;


---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------

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


---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------

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


---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------

