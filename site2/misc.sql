SET SERVEROUTPUT ON;
SET VERIFY OFF;
DECLARE
    site_name VARCHAR2(10);
    city VARCHAR2(10);

BEGIN
    city:='chittagong';
    city:=upper(city);
            DBMS_OUTPUT.PUT_LINE(city);

    SELECT DB_LINK INTO site_name FROM USER_DB_LINKS;
    IF site_name='CHITTAGONG' THEN
        DBMS_OUTPUT.PUT_LINE(site_name);
    END IF;    
END;
/
--SELECT * from customer@chittagong;
