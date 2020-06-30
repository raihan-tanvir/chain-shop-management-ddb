CREATE OR REPLACE PROCEDURE update_customer(
    choice IN NUMBER,
    cid IN customer.cus_id%TYPE,
    cname IN customer.cus_name%TYPE,
    ccity IN customer.city%TYPE,
    cadd IN customer.address%TYPE)
IS
        A number;
        B number;
        excp EXCEPTION;
        PRAGMA EXCEPTION_INIT(excp, -00942);
BEGIN 
    SELECT COUNT(cus_id) INTO A FROM customer WHERE cus_id=cid;
    
    IF A!=0 THEN
        IF choice=1 THEN
            UPDATE customer SET cus_name=cname WHERE cus_id=cid;
        ELSIF choice=2 THEN
            UPDATE customer SET city=ccity WHERE cus_id=cid;    
            IF ccity='Chittagong' THEN
                INSERT INTO customer@chittagong SELECT * FROM customer WHERE cus_id=cid;
                DELETE FROM customer WHERE cus_id=cid;
            END IF;    
        ELSIF choice=3 THEN
            UPDATE customer SET address=cadd WHERE cus_id=cid;        		
        END IF;
        
        ELSE
            SELECT COUNT(cus_id) INTO A FROM customer@chittagong WHERE cus_id=cid;
            IF A!=0 THEN
                IF choice=1 THEN
                    UPDATE customer@chittagong SET cus_name=cname WHERE cus_id=cid;
                ELSIF choice=2 THEN
                    UPDATE customer@chittagong SET city=ccity WHERE cus_id=cid;    
                    INSERT INTO customer SELECT * FROM customer@chittagong WHERE cus_id=cid;
                    DELETE FROM customer@chittagong WHERE cus_id=cid;
                                        
                ELSIF choice=3 THEN
                    UPDATE customer@chittagong SET address=cadd WHERE cus_id=cid;		
                END IF;     
             END IF;         
    END IF;
    
    COMMIT;
END update_customer;
/