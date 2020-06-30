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