USE ol_shopping;

# Populate Vendor Table

SELECT * FROM vendor;
DESC vendor;

INSERT into vendor (
vendor_no,
vendor_name,
street_no,
street_name,
city,
province,
postal_code,
country,
phone_no,
email_address
)
values
(1,'Nike',23,'Boulevard Santa Barbara','Santa Bernardino','California','12345','United State','1-800-234-1234','info@nike.com'),
(2,'Adidas',45,'Boulevard Santa Barbara','Los Angeles','California','56892','United State','1-800-234-5698','info@adidas.com'),
(3,'Puma',76,'Paolo Georgia','San Bruno','California','59812','United State','1-800-234-5263','info@puma.com'),
(4,'UnderArmor',876,'Boulevard Renerba','San Alberto','California','98745','United State','1-800-234-4561','info@underarmor.com'),
(5,'Rebook',981,'Santa Clara','Georgia Barbano','California','52632','United State','1-800-234-5842','info@rebook.com');


# Populate Customer Table

select * from customer;
desc customer;

INSERT INTO customer 
(customer_no, first_name, last_name, street_no, apartment_no, street_name, city, province, postal_code, country, email_address, phone_no)
values
(101,'Amina', 'Sheperd', 44, 3, 'Boulevard Younge', 'Philadelphia', 'Pennsylvania', '19658', 'United Stated', 'sheperd@gmail.com', '215-596-4852'),
(102,'Peter', 'Stork', 98, 12, 'Boulevard Bouchard', 'Houston', 'Texas', '19521', 'United Stated', 'stork@gmail.com', '215-456-2521'),
(103,'Merivia', 'Viau', 56, 34, 'Benoit Street', 'Bronx', 'New York', '56941', 'United Stated', 'viau@gmail.com', '215-741-1325'),
(104,'Alexandre', 'Delpiero', 34, 8, 'Broadway Street', 'San Antonio', 'Texas', '56921', 'United Stated', 'delpiero@gmail.com', '215-112-1155'),
(105,'Raja', 'Nainggolan', 78, 2, 'Boulevard Mifflin', 'Chicago', 'Illinois', '15963', 'United Stated', 'nainggolan@gmail.com', '215-699-6999'),
(106,'Alison', 'Becker', 12, 5, 'Morris Street', 'San Diego', 'California', '19632', 'United Stated', 'becker@gmail.com', '215-521-4752');


# Populate transporter table

desc transporter;
select * from transporter;

INSERT into transporter (
transporter_no,
company_name,
street_no,
street_name,
city,
province,
postal_code,
country,
phone_no,
email_address
)
values
(7001,'Fedex',34,'Boulevard Janviera','Santa Bernardino','California','15896','United Stated','1-800-234-2233','info@fedex.com'),
(7002,'UPS',776,'Union Street','San Antonio','California','18516','United Stated','1-800-556-1288','info@ups.com'),
(7003,'Intelecom',213,'Laura Street','San Fransisco','California','18523','United Stated','1-800-121-5656','info@intelecom.com'),
(7004,'US Postal Service',345,'Boulevard Alexis','Texas','California','15569','United Stated','1-800-263-2855','info@usps.com'),
(7005,'DHL',450,'Boulevard Rene','Santa Barbara','California','15556','United Stated','1-800-237-2113','info@dhl.com');


# Populate Product Table

select * from product;
desc product;

INSERT INTO product
(product_no,vendor_no,name,type,color,size,brand,price,cost_of_goods,inventory_amount,availability_date)
values
( 9001, 1, 'Cool T-Shirt', 'Shirt', 'Black', 'M', 'Nike', 19, 7, 15, '2019-10-26'),
( 9002, 2, 'Summer Shorts', 'Shorts', 'Blue', 'S', 'Adidas', 30, 18, 20, '2019-10-01'),
( 9003, 3, 'Slim Pants', 'Pants', 'Light Blue', 'M', 'Puma', 35, 10, 18, '2019-10-12'),
( 9004, 4, 'Running Shoes', 'Shoes', 'Black', 'XL', 'UnderArmor', 150, 80, 22, '2019-10-06'),
( 9005, 5, 'Ankle Socks', 'Socks', 'Black', 'M', 'Rebook', 15, 5, 40, '2019-10-30');



# Populate Shipping Address

Select * from shipping_address;
desc shipping_address;

INSERT INTO shipping_address
(address_no, customer_no, street_no, apartment_no, street_name, city, province, postal_code, country)
values
(401, 101, 44, 3, 'Boulevard Younge', 'Philadelphia', 'Pennsylvania', '19658', 'United Stated'),
(402, 102, 98, 12, 'Boulevard Bouchard', 'Houston', 'Texas', '19521', 'United Stated'),
(403, 103, 56, 34, 'Benoit Street', 'Bronx', 'New York', '56941', 'United Stated'),
(404, 104, 34, 8, 'Broadway Street', 'San Antonio', 'Texas', '56921', 'United Stated'),
(405, 105, 78, 2, 'Boulevard Mifflin', 'Chicago', 'Illinois', '15963', 'United Stated'),
(406, 106, 12, 5, 'Morris Street', 'San Diego', 'California', '19632', 'United Stated'),
(407, 101, 85, 7, 'Boulevard Snyder', 'Philadelphia', 'Pennsylvania', '19657', 'United Stated'),
(408, 102, 66, 3, 'Boulevard Bouret', 'Houston', 'Texas', '19522', 'United Stated'),
(409, 103, 32, 14, 'Andreas Street', 'Bronx', 'New York', '56952', 'United Stated'),
(410, 104, 56, 9, 'Broadway Street', 'San Antonio', 'Texas', '56921', 'United Stated'),
(411, 105, 46, 2, 'Hickmore Street', 'Chicago', 'Illinois', '15596', 'United Stated'),
(412, 106, 69, 19, 'Tasker Street', 'San Diego', 'California', '19569', 'United Stated');


# Populate payment_method table

select * from payment_method;
desc payment_method;

INSERT INTO payment_method
(payment_method_no, customer_no, method, card_no, owner_name, expiry_date, security_no)
values
(201, 101, 'MasterCard', '4512 7456 1245', 'Amina Sheperd', '2020-12-10', 123),
(202, 101, 'VISA', '6512 5216 5226', 'Amina Sheperd', '2021-12-11', 985),
(203, 102, 'MasterCard', '4594 1234 2563', 'Peter Stork', '2022-11-10', 563),
(204, 103, 'VISA', '6598 2236 4529', 'Merivia Viau', '2023-12-21', 823),
(205, 103, 'MasterCard', '4559 5662 6658', 'Merivia Viau', '2021-09-10', 562),
(206, 104, 'MasterCard', '4556 9632 2213', 'Alexandre Delpiero', '2022-12-10', 353),
(207, 105, 'VISA', '6512 7526 1665', 'Raja Nainggolan', '2020-03-10', 883),
(208, 106, 'MasterCard', '4512 2238 6529', 'Alison Becker', '2021-12-11', 824);

# Nov 18
######################################## 
# Nov 19

select * from order_detail;
desc order_detail;

# Set Order-header

select * from order_header;
desc order_header;

INSERT INTO order_header
(order_no, customer_no, transporter_no, shipping_address_no, payment_method_no, order_date, total_amount, customer_note, shipping_date)
values
(301, 101, 7001, 401, 202, '2019-10-26', 49,'Please put the items in one package', '2019-10-28'),
(302, 102, 7002, 402, 203, '2019-10-22', 50, 'Mark as Gift', '2019-10-23'),
(303, 103, 7005, 403, 204, '2019-11-01', 180, 'Damage package will be refused', '2019-11-03'),
(304, 104, 7001, 404, 206, '2019-11-07', 150, 'Please make sure the size is 8 (US)', '2019-11-09'),
(305, 105, 7004, 405, 207, '2019-10-30', 60, 'Need it as soon as possible', '2019-10-15');


# Set order_detail table

select * from order_detail;
desc order_detail;

INSERT INTO order_detail values
(501, 301, 9001, 1),
(502, 301, 9002, 1),
(503, 302, 9003, 1),
(504, 302, 9005, 1),
(505, 303, 9002, 1),
(506, 303, 9004, 1),
(507, 304, 9004, 1),
(508, 305, 9002, 2);


# Review

select * from review;
desc review;

INSERT INTO review values ( 9001, 101, '5', 'Good Quality Shirt.', '2019-11-01');


#SET SQL_SAFE_UPDATES = 0;
#SET autocommit = 1;
#commit;

#rollback;



# All a new item as a seller
select * from product;

SELECT 
    brand, name, color, price, availability_date
FROM
    product
    where availability_date > '2019-10-25';
    
# Total Number of sold item in past month
select * from order_detail;

SELECT 
    COUNT(orderdetail_no) AS Total_Item_Sold
FROM
    order_detail od
    join
    order_header oh on oh.order_no = od.order_no
    where oh.order_date > '2019-10-20';
    
# Total income in CAD
select * from order_header;

SELECT 
    SUM(total_amount) AS Total_Income_In_CAD$
FROM
    order_header oh
    join
    order_detail od on oh.order_no = od.order_no
    where oh.order_date > '2019-10-20';
    



############################################
select * from order_header;
select * from order_detail;
select * from customer;
select * from product;
select * from payment_method;
show create table customer;
select * from transporter;
select * from vendor;
select * from review;
###############################################



# VIEWS

# View Order no 301 information
CREATE VIEW v_print_order_info_301 AS
    SELECT 
        c.first_name,
        c.last_name,
        CONCAT(' Apt: ',
                c.apartment_no,
                ', ',
                c.street_no,
                ' ',
                c.street_name,
                ', ',
                c.city,
                ' ',
                c.province,
                ' ',
                c.postal_code) AS Shipping_Address,
        CONCAT(p.color, ' ', brand, ' ', p.name) AS Item_Purchased,
        p.price,
        oh.order_date AS Purchased_Date,
        CONCAT(pm.method,
                ' Card No: ',
                pm.card_no,
                ' Exp: ',
                expiry_date) AS Payment_Method,
        t.company_name AS Delivery_by
    FROM
        customer c
            JOIN
        order_header oh ON c.customer_no = oh.customer_no
            JOIN
        order_detail od ON oh.order_no = od.order_no
            JOIN
        product p ON od.product_no = p.product_no
            JOIN
        payment_method pm ON oh.payment_method_no = pm.payment_method_no
            JOIN
        transporter t ON t.transporter_no = oh.transporter_no
    WHERE
        c.customer_no = 101;
    
    
# Print View
select * from v_print_order_info_301;
    

    
    
# TRIGGERS

# Inventory amount trigger - product table
INSERT
DELIMITER $$
CREATE TRIGGER before_inventory_insert
BEFORE
INSERT ON
product
FOR
EACH
ROW
BEGIN
    IF NEW.inventory_amount < 0 THEN
    SET NEW.inventory_amount = 0;
END
IF; 
END $$
DELIMITER ;

# price trigger - product table
INSERT
DELIMITER $$
CREATE TRIGGER before_price_insert
BEFORE
INSERT ON
product
FOR
EACH
ROW
BEGIN
    IF NEW.price < 0 THEN
    SET NEW.price = 1;
END
IF; 
END $$
DELIMITER ;


# order date trigger - order_header table
DELIMITER $$
CREATE TRIGGER trig_order_date  
BEFORE
INSERT ON
order_header
FOR
EACH
ROW
BEGIN
    IF NEW.order_date > date_format(sysdate(), '%Y-%m-%d') THEN
    SET NEW.order_date = date_format(sysdate(), '%Y-%m-%d');
END
IF;  
END $$  
DELIMITER ;

# review date trigger - review table
DELIMITER $$
CREATE TRIGGER trig_review_date  
BEFORE
INSERT ON
review
FOR
EACH
ROW
BEGIN
    IF NEW.date > date_format(sysdate(), '%Y-%m-%d') THEN
    SET NEW.date = date_format(sysdate(), '%Y-%m-%d');
END
IF;  
END $$  
DELIMITER ;


############################################
select * from order_header;
select * from order_detail;
select * from customer;
select * from product;
select * from payment_method;
select * from transporter;
select * from vendor;
select * from review;
select * from shipping_address;
############################################

## drop foreign key and add foreign key with on delete cascade
show create table order_detail;

alter table order_detail drop foreign key fk_order_detail_order_header1;

ALTER TABLE order_detail
ADD FOREIGN KEY (order_no) REFERENCES order_header(order_no) ON DELETE CASCADE;




# Create New Order
insert into order_header values ( 306, 101, 7001, 401, 202, '2019-11-11', 19, 'TEST TEST', '2019-11-13');
insert into order_detail values ( 509, 306, 9001, 1);

# Remove Order
delete from order_header where order_no = 306;

   
    