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
