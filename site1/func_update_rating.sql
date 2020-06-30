CREATE OR REPLACE FUNCTION update_rating(
    pid IN product.prod_id%TYPE
    )
    RETURN NUMBER
IS
    curr_rating review.rating%TYPE:=0;
    
BEGIN
     
    SELECT AVG(rating) INTO curr_rating  FROM review WHERE prod_id=pid;
    UPDATE product SET prod_rating=curr_rating WHERE;
    COMMIT;
    -- DBMS_OUTPUT.PUT_LINE('Procedure proc_register executed successfully');
END update_rating;
/
