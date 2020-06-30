CLEAR SCREEN;

DROP TABLE log_updel_order CASCADE CONSTRAINTS;

CREATE TABLE log_updel_order
(
o_id INT,
cus_id INT,
pro_id INT,
o_unit INT,
o_date date,
mod_date date
);