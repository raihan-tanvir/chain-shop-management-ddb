SET SERVEROUTPUT ON;
SET VERIFY OFF;

CREATE OR REPLACE FUNCTION search_other(pid IN product.prod_id%TYPE)
RETURN NUMBER IS
    X product.prod_id%TYPE;
    Y product.prod_unit%TYPE:=0;
    
BEGIN
     SELECT prod_id,prod_unit INTO X,Y FROM product@dhaka WHERE prod_id=pid;
     --dbms_output.put_line('Product Available at dhaka!');
     RETURN Y;
EXCEPTION 
   WHEN no_data_found THEN 
      dbms_output.put_line('Product Not Available at dhaka!');
      RETURN 0;
   WHEN others THEN 
      dbms_output.put_line('Error!');
      RETURN 0;
END search_other;
/