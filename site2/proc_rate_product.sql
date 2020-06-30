CREATE OR REPLACE PROCEDURE rate_product(
    cid IN customer.cus_id%TYPE,
    pid IN product.prod_id%TYPE,
    rating IN review.rating%TYPE)
IS
    rid review.rev_id%TYPE:=0;
    curr_rating product.prod_rating%TYPE:=0;
BEGIN
     
    SELECT rev_id INTO rid  FROM (SELECT * FROM review ORDER BY rev_id DESC ) WHERE ROWNUM = 1;
    INSERT INTO review VALUES(rid+1,cid,pid,rating);  
    
    --SELECT AVG(rating) INTO curr_rating  FROM review WHERE prod_id=pid;
    SELECT AVG(rating) INTO curr_rating from (select rating from review where prod_id=pid UNION select rating from review@dhaka where prod_id=pid) ;

    UPDATE product SET prod_rating=curr_rating WHERE prod_id=pid;
    COMMIT;
    -- DBMS_OUTPUT.PUT_LINE('Procedure proc_register executed successfully');
END rate_product;
/


