SET SERVEROUTPUT ON;
SET VERIFY OFF;
DECLARE    
    choice NUMBER;
    field_name varchar2(10);
    
    pid product.prod_id%TYPE:=&pid;
    pname product.prod_name%TYPE;
    punit  product.prod_unit%TYPE;
    pprice  product.prod_price%TYPE;
    pcat  product.cat_id%TYPE;
    psup  product.s_id%TYPE;
    pstat product.prod_status%TYPE;
    
    A NUMBER;
    B NUMBER;
    
    x varchar2(1);
BEGIN 
    choice:=&choice;
    
    IF choice=1 THEN
    	pname:=&pname;
        update_product(choice,pid,pname,x,x,x,x);
    
    ELSIF choice=2 THEN
        punit:=&punit;
        update_product(choice,pid,x,punit,x,x,x);
        
    ELSIF choice=3 THEN
        pprice:=&pprice;
        update_product(choice,pid,x,x,pprice,x,x);
        
    ELSIF choice=4 THEN
        pcat:=&pcat;
        update_product(choice,pid,x,x,x,pcat,x);
        
    ELSIF choice=5 THEN
        psup:=&psup;
        update_product(choice,pid,x,x,x,x,psup);
    ELSIF choice=6 THEN
        pstat:=&pstat;
        product_visibility(pid,pstat);
    END IF;
    --DBMS_OUTPUT.PUT_LINE(field_name||' '||cname);
END;
/

--SELECT * FROM product;
--SELECT cus_id,cus_name,city FROM customer@chittagong;
