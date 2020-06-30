INSERT INTO Customer(cus_id,cus_name,phone,city,address) VALUES(1,'Raihan Tanvir','01832803540','Dhaka','Basabo');
INSERT INTO Customer(cus_id,cus_name,phone,city,address) VALUES(2,'Susmoy Kar','01832803541','Dhaka','Rampura');
INSERT INTO Customer(cus_id,cus_name,phone,city,address) VALUES(3,'Khalek Likhon','01832803542','Dhaka','Rampura');
INSERT INTO Customer(cus_id,cus_name,phone,city,address) VALUES(4,'Ridwan Masud','01832803543','Dhaka','Dhanmondi');
INSERT INTO Customer(cus_id,cus_name,phone,city,address) VALUES(5,'Sabbir Hosssain','01832803544','Dhaka','Niketon');
INSERT INTO Customer(cus_id,cus_name,phone,city,address) VALUES(6,'Tanvir Raihan','01832803545','Dhaka','Uttara');
INSERT INTO Customer(cus_id,cus_name,phone,city,address) VALUES(7,'Kar Susmoy','01832803546','Dhaka','Banani');
INSERT INTO Customer(cus_id,cus_name,phone,city,address) VALUES(8,'Likhon Khalek','01832803547','Dhaka','Khilgaon');
INSERT INTO Customer(cus_id,cus_name,phone,city,address) VALUES(9,'Masud Ridwan','01832803548','Dhaka','Bashundhara');
INSERT INTO Customer(cus_id,cus_name,phone,city,address) VALUES(10,'Hosssain Sabbir','01832803549','Dhaka','Mohakhali');

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

