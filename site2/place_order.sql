/*
INSERT INTO Product(prod_id,prod_name,prod_unit,prod_price, s_id,cat_id)  VALUES(1,'Redmi Note 4',100,14000,1,1);
INSERT INTO Product(prod_id,prod_name,prod_unit,prod_price, s_id,cat_id)  VALUES(2,'Mi Band 3',50,1600,1,2);
INSERT INTO Product(prod_id,prod_name,prod_unit,prod_price, s_id,cat_id)  VALUES(3,'Mi Band 4',100,2000,1,2);
INSERT INTO Product(prod_id,prod_name,prod_unit,prod_price, s_id,cat_id)  VALUES(4,'Redmi Note 7',250,17000,1,1);
INSERT INTO Product(prod_id,prod_name,prod_unit,prod_price, s_id,cat_id)  VALUES(5,'Polo T Shirt',25,250,1,6);
INSERT INTO Product(prod_id,prod_name,prod_unit,prod_price, s_id,cat_id)  VALUES(6,'Redmi Note 4',100,14000,1,1);
INSERT INTO Product(prod_id,prod_name,prod_unit,prod_price, s_id,cat_id)  VALUES(7,'Polo T Shirt',80,350,3,5);

COMMIT;

SELECT * FROM Product;
SELECT * FROM Customer;
SELECT * FROM orders;

*/

SET SERVEROUTPUT ON;
SET VERIFY OFF;
DECLARE
    site_name VARCHAR2(10);
    
    cid customer.cus_id%TYPE:=&cid;
    pid product.prod_id%TYPE:=&pid;
    punit product.prod_unit%TYPE:=&punit;
BEGIN  
     place_order(cid,pid,punit);
     --DBMS_OUTPUT.PUT_LINE('Procedure make_order executed successfully');
END;
/

select * from ORDERS;

