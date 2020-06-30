SET SERVEROUTPUT ON;
SET VERIFY OFF;
DECLARE
    prod_name VARCHAR2(15):=&prod_name;
    prod_unit INT:=&prod_unit;
    prod_price NUMBER:=&prod_price;
    s_id INT:=&s_id;
    cat_id INT:=&cat_id;
BEGIN  
    add_product(prod_name,prod_unit,prod_price,s_id,cat_id);
END;
/

SELECT * from product;