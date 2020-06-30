INSERT INTO Customer(cus_id,cus_name,phone,city,address) VALUES(11,'Shawon Tanvir','01832803521','Chittagong','GEC');
INSERT INTO Customer(cus_id,cus_name,phone,city,address) VALUES(12,'Simon Peres','01832803522','Chittagong','Agrabad');
INSERT INTO Customer(cus_id,cus_name,phone,city,address) VALUES(13,'Mahmudur Rahman','01832803523','Chittagong','GEC');
INSERT INTO Customer(cus_id,cus_name,phone,city,address) VALUES(14,'Tanvir Shawon','01832803524','Chittagong','New Market');
INSERT INTO Customer(cus_id,cus_name,phone,city,address) VALUES(15,'Peres Simon','01832803525','Chittagong','Agrabad');
INSERT INTO Customer(cus_id,cus_name,phone,city,address) VALUES(16,'Rahman Mahmudud','01832803526','Chittagong','Khulshi');
INSERT INTO Customer(cus_id,cus_name,phone,city,address) VALUES(17,'Jeba Maliha','01832803527','Chittagong','Dewanhat');

COMMIT;

---------------------------------------------------------------
INSERT INTO ProductCategory VALUES(1,'Electronics');
INSERT INTO ProductCategory VALUES(2,'Accessories');
INSERT INTO ProductCategory VALUES(3,'Fashion');
INSERT INTO ProductCategory VALUES(4,'Health');
INSERT INTO ProductCategory VALUES(5,'Groceries');
INSERT INTO ProductCategory VALUES(6,'Beauty');
INSERT INTO ProductCategory VALUES(7,'Wathces');

COMMIT;

SELECT * FROM ProductCategory;



---------------------------------------------------------------
--Seller1
INSERT INTO Supplier VALUES(1,'AUST','01701023738','Dhaka','Tejgaon');
INSERT INTO Supplier VALUES(2,'Sumash Tech','01701023738','Dhaka','Bashundhara');
INSERT INTO Supplier VALUES(3,'KRY','01701023738','Dhaka','New Market');

--Supplier2
INSERT INTO Supplier VALUES(4,'Smart Gadget','01701023738','Chittagong','New Market');
INSERT INTO Supplier VALUES(5,'GnG','01701023738','Chittagong','Nasirabad');
INSERT INTO Supplier VALUES(6,'Ctech','01701023738','Chittagong','GEC');

COMMIT;

SELECT * FROM Supplier;

-------------------------------------------------------------------------------

INSERT INTO Product(prod_id,prod_name,prod_unit,prod_price, s_id,cat_id)  VALUES(1,'Redmi Note 4',100,14000,1,1);
INSERT INTO Product(prod_id,prod_name,prod_unit,prod_price, s_id,cat_id)  VALUES(2,'Mi Band 3',50,1600,1,2);
INSERT INTO Product(prod_id,prod_name,prod_unit,prod_price, s_id,cat_id)  VALUES(3,'Mi Band 4',100,2000,1,2);
INSERT INTO Product(prod_id,prod_name,prod_unit,prod_price, s_id,cat_id)  VALUES(4,'Redmi Note 7',250,17000,1,1);
INSERT INTO Product(prod_id,prod_name,prod_unit,prod_price, s_id,cat_id)  VALUES(5,'Polo T Shirt',25,250,1,6);
INSERT INTO Product(prod_id,prod_name,prod_unit,prod_price, s_id,cat_id)  VALUES(6,'Redmi Note 4',100,14000,1,1);
INSERT INTO Product(prod_id,prod_name,prod_unit,prod_price, s_id,cat_id)  VALUES(7,'Polo T Shirt',80,350,3,5);

COMMIT;

SELECT * FROM Product;




