SET SERVEROUTPUT ON;
SET VERIFY OFF;
DECLARE
	cid customer.cus_id%TYPE:=&cid;
	pid product.prod_id%TYPE:=&pid;
    rating review.rating%TYPE:=&rating;
BEGIN
    rate_product(cid,pid,rating);
END;
/

--select * from orders where cus_id=2;

--select * from log_updel_order;

select * from review;
select * from product;