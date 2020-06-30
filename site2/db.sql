CLEAR SCREEN;

DROP TABLE Admins CASCADE CONSTRAINTS;
--DROP TABLE CITY CASCADE CONSTRAINTS;
--DROP TABLE LOCATIONS CASCADE CONSTRAINTS;
DROP TABLE Customer CASCADE CONSTRAINTS;
DROP TABLE Feedback CASCADE CONSTRAINTS;
DROP TABLE Supplier CASCADE CONSTRAINTS;
--DROP TABLE Manufacturer CASCADE CONSTRAINTS;
DROP TABLE ProductCategory CASCADE CONSTRAINTS;
DROP TABLE Product CASCADE CONSTRAINTS;
DROP TABLE Orders CASCADE CONSTRAINTS;
--DROP TABLE OrderItem CASCADE CONSTRAINTS;
DROP TABLE Review CASCADE CONSTRAINTS;
DROP TABLE Invoice CASCADE CONSTRAINTS;
--DROP TABLE Payment CASCADE CONSTRAINTS;
DROP TABLE Cart CASCADE CONSTRAINTS;

CREATE TABLE ADMINs
(
ad_id INT PRIMARY KEY,
ad_name VARCHAR2(15) NOT NULL,
phone VARCHAR2(15) NOT NULL,
email VARCHAR2(25) NOT NULL,
passwords VARCHAR2(25) NOT NULL
);

/*
Create Table CITY
(
CityId INT PRIMARY KEY,
CityName VARCHAR2(20) NOT NULL
);

Create Table Locations
(
LocationId INT PRIMARY KEY,
LocationName VARCHAR2(25),
CityId INT NOT NULL,
FOREIGN KEY(CityId) REFERENCES CITY(CityId)
);
*/
CREATE TABLE Customer
(
cus_id INT PRIMARY KEY,
cus_name VARCHAR2(20) NOT NULL,
Phone VARCHAR2(15) NOT NULL,
status INT DEFAULT 0,
city VARCHAR2(10) NOT NULL,
address VARCHAR2(25) 
);

CREATE TABLE Feedback
(
f_id INT PRIMARY KEY,
f_name VARCHAR2(15) NOT NULL,
phone VARCHAR2(15) NOT NULL,
feed_back VARCHAR2(100) NOT NULL
);

CREATE TABLE Supplier
(
s_id INT PRIMARY KEY,
s_name VARCHAR2(15) NOT NULL,
phone VARCHAR2(15) NOT NULL,
city VARCHAR2(15) NOT NULL,
address VARCHAR2(25) NOT NULL
);


CREATE TABLE ProductCategory
(
cat_id INT PRIMARY KEY,
cat_name VARCHAR2(15) NOT NULL
);

CREATE TABLE Product
(
prod_id INT PRIMARY KEY,
prod_name VARCHAR2(15) NOT NULL,
prod_unit INT NOT NULL,
prod_price NUMBER NOT NULL,
prod_rating INT,
s_id INT,
cat_id INT,
FOREIGN KEY(s_id) REFERENCES Supplier(s_id),
FOREIGN KEY(cat_id) REFERENCES ProductCategory(cat_id)
--ProductDescription VARCHAR2(100)
);

CREATE TABLE Orders
(
o_id INT PRIMARY KEY,
cus_id INT,
prod_id INT,
o_unit INT NOT NULL,
o_amount NUMBER,
o_date date,
o_status INT,
shipping_address VARCHAR2(50)
);


--INSERT INTO Orders VALUES(cid,pid,quan,total,sysdate,0,ship_add);
/*
CREATE TABLE OrderItem
(
OrderItemId INT PRIMARY KEY,
ProductId INT,
OrderId INT ,
OrderUnit INT NOT NULL,
OrderPrice NUMBER,
FOREIGN KEY(ProductId) REFERENCES Product(ProductId),
FOREIGN KEY(OrderId) REFERENCES Orders(OrderId)
);
*/

/*
CREATE TABLE Review
(
ReviewId INT PRIMARY KEY,
OrderItemId INT NOT NULL,
CustomerId INT NOT NULL,
Rating INT NOT NULL,
Commentt VARCHAR2(50),
FOREIGN KEY(OrderItemId) REFERENCES OrderItem(OrderItemId),
FOREIGN KEY(CustomerId) REFERENCES Customer (CustomerId)
);
*/

CREATE TABLE Review
(
rev_id INT PRIMARY KEY,
cus_id INT,
prod_id INT,
rating INT NOT NULL,
--Comments VARCHAR2(100),
FOREIGN KEY(prod_id) REFERENCES Product(prod_id)
);
 
CREATE TABLE Invoice
(
inv_id INT PRIMARY KEY,
o_id INT,
inv_status int ,
inv_date date ,
FOREIGN KEY(o_id) REFERENCES Orders(o_id)
);

/*
CREATE TABLE Payment
(
TransactionNumber INT PRIMARY KEY,
InvoiceNumber INT NOT NULL,
PaymentAmount NUMBER NOT NULL,
PaymentDate date NOT NULL,
FOREIGN KEY(InvoiceNumber) REFERENCES Invoice(InvoiceNumber)
);
*/

CREATE TABLE Cart
(
cart_id INT PRIMARY KEY,
prod_id INT ,
cus_id INT,
cart_unit INT,
status INT,
FOREIGN KEY(prod_id) REFERENCES Product(prod_id),
FOREIGN KEY(cus_id) REFERENCES Customer (cus_id)
);


-----------------------------------------------------------------------------------------------------------------------------------

ALTER TABLE product
  ADD prod_status INT DEFAULT 1;


ALTER TABLE product
  MODIFY prod_rating NUMBER(2,1);

