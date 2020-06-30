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
