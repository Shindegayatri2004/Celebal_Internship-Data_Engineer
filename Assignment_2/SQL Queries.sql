mysql> -- =====================================
mysql> -- Celebal Technologies Internship
mysql> -- Week-2 SQL Assignment
mysql> -- Created by: Gayatri Shinde
mysql> -- =====================================
mysql>
mysql> CREATE DATABASE shopease;
Query OK, 1 row affected (0.02 sec)

mysql> USE shopease;
Database changed
mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| hr_analysis        |
| information_schema |
| mysql              |
| performance_schema |
| scoe_cs_b          |
| shopease           |
| simple_jdbc        |
| sys                |
+--------------------+
8 rows in set (0.05 sec)

mysql> -- =====================================
mysql> -- Creating Customers Table
mysql> -- =====================================
mysql>
mysql> CREATE TABLE customers (
    ->     customer_id INT PRIMARY KEY,
    ->     first_name VARCHAR(50) NOT NULL,
    ->     last_name VARCHAR(50) NOT NULL,
    ->     email VARCHAR(100) UNIQUE NOT NULL,
    ->     city VARCHAR(50) NOT NULL,
    ->     state VARCHAR(50) NOT NULL,
    ->     join_date DATE NOT NULL,
    ->     is_premium BOOLEAN DEFAULT FALSE
    -> );
Query OK, 0 rows affected (0.10 sec)

mysql> -- Index for faster searching by city
mysql> CREATE INDEX idx_customers_city
    -> ON customers(city);
Query OK, 0 rows affected (0.09 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> -- Index for faster searching by state
mysql> CREATE INDEX idx_customers_state
    -> ON customers(state);
Query OK, 0 rows affected (0.09 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> -- =====================================
mysql> -- Creating Products Table
mysql> -- =====================================
mysql>
mysql> CREATE TABLE products (
    ->
    ->     product_id INT PRIMARY KEY,
    ->
    ->     product_name VARCHAR(100) NOT NULL,
    ->
    ->     category VARCHAR(50) NOT NULL,
    ->
    ->     brand VARCHAR(50) NOT NULL,
    ->
    ->     unit_price DECIMAL(10,2) NOT NULL CHECK(unit_price>0),
    ->
    ->     stock_qty INT NOT NULL DEFAULT 0 CHECK(stock_qty>=0)
    ->
    -> );
Query OK, 0 rows affected (0.08 sec)

mysql> -- Index for category search
mysql> CREATE INDEX idx_products_category
    -> ON products(category);
Query OK, 0 rows affected (0.08 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> -- =====================================
mysql> -- Creating Orders Table
mysql> -- =====================================
mysql>
mysql> CREATE TABLE orders(
    ->
    ->     order_id INT PRIMARY KEY,
    ->
    ->     customer_id INT NOT NULL,
    ->
    ->     order_date DATE NOT NULL,
    ->
    ->     status VARCHAR(20)
    ->     NOT NULL DEFAULT 'Pending'
    ->     CHECK(status IN
    ->     ('Pending','Shipped','Delivered','Cancelled')),
    ->
    ->     total_amount DECIMAL(12,2)
    ->     NOT NULL CHECK(total_amount>=0),
    ->
    ->     FOREIGN KEY(customer_id)
    ->     REFERENCES customers(customer_id)
    ->
    -> );
Query OK, 0 rows affected (0.12 sec)

mysql>
mysql> -- Indexes
mysql> CREATE INDEX idx_orders_date
    -> ON orders(order_date);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql>
mysql> CREATE INDEX idx_orders_status
    -> ON orders(status);
Query OK, 0 rows affected (0.09 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> -- =====================================
mysql> -- Creating Order Items Table
mysql> -- =====================================
mysql>
mysql> CREATE TABLE order_items(
    ->
    ->     item_id INT PRIMARY KEY,
    ->
    ->     order_id INT NOT NULL,
    ->
    ->     product_id INT NOT NULL,
    ->
    ->     quantity INT
    ->     NOT NULL CHECK(quantity>0),
    ->
    ->     unit_price DECIMAL(10,2)
    ->     NOT NULL CHECK(unit_price>0),
    ->
    ->     discount_pct DECIMAL(5,2)
    ->     DEFAULT 0
    ->     CHECK(discount_pct BETWEEN 0 AND 100),
    ->
    ->     FOREIGN KEY(order_id)
    ->     REFERENCES orders(order_id),
    ->
    ->     FOREIGN KEY(product_id)
    ->     REFERENCES products(product_id)
    ->
    -> );
Query OK, 0 rows affected (0.11 sec)

mysql> -- Show all tables
mysql>
mysql> SHOW TABLES;
+--------------------+
| Tables_in_shopease |
+--------------------+
| customers          |
| order_items        |
| orders             |
| products           |
+--------------------+
4 rows in set (0.00 sec)

mysql> -- =====================================
mysql> -- Insert Customer Records
mysql> -- =====================================
mysql>
mysql> INSERT INTO customers VALUES
    -> ...
    -> -- Insert Products
    -> Insert Orders
    -> -- Insert Order Items
    -> -- =====================================
    -> -- Q1. Display all customer records
    -> -- =====================================
    ->
    -> SELECT * FROM customers;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '...

Insert Orders





SELECT * FROM customers' at line 2
mysql> -- =====================================
mysql> -- Insert Customer Records
mysql> -- =====================================
mysql>
mysql> INSERT INTO customers VALUES
    -> (101,'Aarav','Sharma','aarav.s@email.com','Mumbai','Maharashtra','2024-01-15',TRUE),
    -> (102,'Priya','Patel','priya.p@email.com','Ahmedabad','Gujarat','2024-02-20',FALSE),
    -> (103,'Rohan','Gupta','rohan.g@email.com','Delhi','Delhi','2024-03-10',TRUE),
    -> (104,'Sneha','Reddy','sneha.r@email.com','Hyderabad','Telangana','2024-04-05',FALSE),
    -> (105,'Vikram','Singh','vikram.s@email.com','Jaipur','Rajasthan','2024-05-12',TRUE),
    -> (106,'Ananya','Iyer','ananya.i@email.com','Chennai','Tamil Nadu','2024-06-18',FALSE),
    -> (107,'Karan','Mehta','karan.m@email.com','Pune','Maharashtra','2024-07-22',TRUE),
    -> (108,'Divya','Nair','divya.n@email.com','Kochi','Kerala','2024-08-30',FALSE);
Query OK, 8 rows affected (0.06 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM customers;
+-------------+------------+-----------+--------------------+-----------+-------------+------------+------------+
| customer_id | first_name | last_name | email              | city      | state       | join_date  | is_premium |
+-------------+------------+-----------+--------------------+-----------+-------------+------------+------------+
|         101 | Aarav      | Sharma    | aarav.s@email.com  | Mumbai    | Maharashtra | 2024-01-15 |          1 |
|         102 | Priya      | Patel     | priya.p@email.com  | Ahmedabad | Gujarat     | 2024-02-20 |          0 |
|         103 | Rohan      | Gupta     | rohan.g@email.com  | Delhi     | Delhi       | 2024-03-10 |          1 |
|         104 | Sneha      | Reddy     | sneha.r@email.com  | Hyderabad | Telangana   | 2024-04-05 |          0 |
|         105 | Vikram     | Singh     | vikram.s@email.com | Jaipur    | Rajasthan   | 2024-05-12 |          1 |
|         106 | Ananya     | Iyer      | ananya.i@email.com | Chennai   | Tamil Nadu  | 2024-06-18 |          0 |
|         107 | Karan      | Mehta     | karan.m@email.com  | Pune      | Maharashtra | 2024-07-22 |          1 |
|         108 | Divya      | Nair      | divya.n@email.com  | Kochi     | Kerala      | 2024-08-30 |          0 |
+-------------+------------+-----------+--------------------+-----------+-------------+------------+------------+
8 rows in set (0.00 sec)

mysql> -- =====================================
mysql> -- Insert Product Records
mysql> -- =====================================
mysql>
mysql> INSERT INTO products VALUES
    -> (201,'Wireless Earbuds','Electronics','BoAt',1499.00,250),
    -> (202,'Cotton T-Shirt','Clothing','Levis',799.00,500),
    -> (203,'Smart Watch','Electronics','Noise',2999.00,150),
    -> (204,'Running Shoes','Clothing','Nike',4599.00,120),
    -> (205,'Bluetooth Speaker','Electronics','JBL',3499.00,200),
    -> (206,'Bedsheet Set','Home','Spaces',1299.00,300),
    -> (207,'Laptop Stand','Electronics','AmazonBasics',899.00,180),
    -> (208,'Cushion Covers (Set)','Home','HomeCenter',599.00,400);
Query OK, 8 rows affected (0.02 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM products;
+------------+----------------------+-------------+--------------+------------+-----------+
| product_id | product_name         | category    | brand        | unit_price | stock_qty |
+------------+----------------------+-------------+--------------+------------+-----------+
|        201 | Wireless Earbuds     | Electronics | BoAt         |    1499.00 |       250 |
|        202 | Cotton T-Shirt       | Clothing    | Levis        |     799.00 |       500 |
|        203 | Smart Watch          | Electronics | Noise        |    2999.00 |       150 |
|        204 | Running Shoes        | Clothing    | Nike         |    4599.00 |       120 |
|        205 | Bluetooth Speaker    | Electronics | JBL          |    3499.00 |       200 |
|        206 | Bedsheet Set         | Home        | Spaces       |    1299.00 |       300 |
|        207 | Laptop Stand         | Electronics | AmazonBasics |     899.00 |       180 |
|        208 | Cushion Covers (Set) | Home        | HomeCenter   |     599.00 |       400 |
+------------+----------------------+-------------+--------------+------------+-----------+
8 rows in set (0.00 sec)

mysql> -- =====================================
mysql> -- Insert Orders
mysql> -- =====================================
mysql>
mysql> INSERT INTO orders VALUES
    -> (1001,101,'2024-08-01','Delivered',4498.00),
    -> (1002,102,'2024-08-03','Delivered',799.00),
    -> (1003,103,'2024-08-05','Shipped',7498.00),
    -> (1004,101,'2024-08-10','Delivered',3499.00),
    -> (1005,104,'2024-08-12','Cancelled',2999.00),
    -> (1006,105,'2024-08-15','Delivered',5898.00),
    -> (1007,106,'2024-08-18','Pending',1299.00),
    -> (1008,103,'2024-08-20','Delivered',899.00),
    -> (1009,107,'2024-08-25','Shipped',6098.00),
    -> (1010,108,'2024-08-28','Delivered',1598.00);
Query OK, 10 rows affected (0.06 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM orders;
+----------+-------------+------------+-----------+--------------+
| order_id | customer_id | order_date | status    | total_amount |
+----------+-------------+------------+-----------+--------------+
|     1001 |         101 | 2024-08-01 | Delivered |      4498.00 |
|     1002 |         102 | 2024-08-03 | Delivered |       799.00 |
|     1003 |         103 | 2024-08-05 | Shipped   |      7498.00 |
|     1004 |         101 | 2024-08-10 | Delivered |      3499.00 |
|     1005 |         104 | 2024-08-12 | Cancelled |      2999.00 |
|     1006 |         105 | 2024-08-15 | Delivered |      5898.00 |
|     1007 |         106 | 2024-08-18 | Pending   |      1299.00 |
|     1008 |         103 | 2024-08-20 | Delivered |       899.00 |
|     1009 |         107 | 2024-08-25 | Shipped   |      6098.00 |
|     1010 |         108 | 2024-08-28 | Delivered |      1598.00 |
+----------+-------------+------------+-----------+--------------+
10 rows in set (0.00 sec)

mysql> -- =====================================
mysql> -- Insert Order Items
mysql> -- =====================================
mysql>
mysql> INSERT INTO order_items VALUES
    -> (5001,1001,201,2,1499.00,0),
    -> (5002,1001,207,1,899.00,10),
    -> (5003,1002,202,1,799.00,0),
    -> (5004,1003,203,1,2999.00,0),
    -> (5005,1003,204,1,4599.00,5),
    -> (5006,1004,205,1,3499.00,0),
    -> (5007,1005,203,1,2999.00,0),
    -> (5008,1006,201,1,1499.00,10),
    -> (5009,1006,204,1,4599.00,5),
    -> (5010,1007,206,1,1299.00,0),
    -> (5011,1008,207,1,899.00,0),
    -> (5012,1009,205,1,3499.00,0),
    -> (5013,1009,208,2,599.00,15),
    -> (5014,1010,206,1,1299.00,0),
    -> (5015,1010,208,1,599.00,0);
Query OK, 15 rows affected (0.06 sec)
Records: 15  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM order_items;
+---------+----------+------------+----------+------------+--------------+
| item_id | order_id | product_id | quantity | unit_price | discount_pct |
+---------+----------+------------+----------+------------+--------------+
|    5001 |     1001 |        201 |        2 |    1499.00 |         0.00 |
|    5002 |     1001 |        207 |        1 |     899.00 |        10.00 |
|    5003 |     1002 |        202 |        1 |     799.00 |         0.00 |
|    5004 |     1003 |        203 |        1 |    2999.00 |         0.00 |
|    5005 |     1003 |        204 |        1 |    4599.00 |         5.00 |
|    5006 |     1004 |        205 |        1 |    3499.00 |         0.00 |
|    5007 |     1005 |        203 |        1 |    2999.00 |         0.00 |
|    5008 |     1006 |        201 |        1 |    1499.00 |        10.00 |
|    5009 |     1006 |        204 |        1 |    4599.00 |         5.00 |
|    5010 |     1007 |        206 |        1 |    1299.00 |         0.00 |
|    5011 |     1008 |        207 |        1 |     899.00 |         0.00 |
|    5012 |     1009 |        205 |        1 |    3499.00 |         0.00 |
|    5013 |     1009 |        208 |        2 |     599.00 |        15.00 |
|    5014 |     1010 |        206 |        1 |    1299.00 |         0.00 |
|    5015 |     1010 |        208 |        1 |     599.00 |         0.00 |
+---------+----------+------------+----------+------------+--------------+
15 rows in set (0.00 sec)

mysql> SHOW TABLES;
+--------------------+
| Tables_in_shopease |
+--------------------+
| customers          |
| order_items        |
| orders             |
| products           |
+--------------------+
4 rows in set (0.00 sec)

mysql>
mysql> SELECT COUNT(*) FROM customers;
+----------+
| COUNT(*) |
+----------+
|        8 |
+----------+
1 row in set (0.00 sec)

mysql> SELECT COUNT(*) FROM products;
+----------+
| COUNT(*) |
+----------+
|        8 |
+----------+
1 row in set (0.00 sec)

mysql> SELECT COUNT(*) FROM orders;
+----------+
| COUNT(*) |
+----------+
|       10 |
+----------+
1 row in set (0.00 sec)

mysql> SELECT COUNT(*) FROM order_items;
+----------+
| COUNT(*) |
+----------+
|       15 |
+----------+
1 row in set (0.00 sec)

mysql> -- ============================================================
mysql> -- SECTION A : SQL BASICS (SELECT, CONSTRAINTS, PRIMARY KEYS)
mysql> -- ============================================================
mysql> -- ============================================================
mysql> -- Q1. Display all columns and rows from the customers table.
mysql> -- ============================================================
mysql>
mysql> SELECT * FROM customers;
+-------------+------------+-----------+--------------------+-----------+-------------+------------+------------+
| customer_id | first_name | last_name | email              | city      | state       | join_date  | is_premium |
+-------------+------------+-----------+--------------------+-----------+-------------+------------+------------+
|         101 | Aarav      | Sharma    | aarav.s@email.com  | Mumbai    | Maharashtra | 2024-01-15 |          1 |
|         102 | Priya      | Patel     | priya.p@email.com  | Ahmedabad | Gujarat     | 2024-02-20 |          0 |
|         103 | Rohan      | Gupta     | rohan.g@email.com  | Delhi     | Delhi       | 2024-03-10 |          1 |
|         104 | Sneha      | Reddy     | sneha.r@email.com  | Hyderabad | Telangana   | 2024-04-05 |          0 |
|         105 | Vikram     | Singh     | vikram.s@email.com | Jaipur    | Rajasthan   | 2024-05-12 |          1 |
|         106 | Ananya     | Iyer      | ananya.i@email.com | Chennai   | Tamil Nadu  | 2024-06-18 |          0 |
|         107 | Karan      | Mehta     | karan.m@email.com  | Pune      | Maharashtra | 2024-07-22 |          1 |
|         108 | Divya      | Nair      | divya.n@email.com  | Kochi     | Kerala      | 2024-08-30 |          0 |
+-------------+------------+-----------+--------------------+-----------+-------------+------------+------------+
8 rows in set (0.00 sec)

mysql>
mysql>
mysql> -- ============================================================
mysql> -- Q2. Retrieve only the first_name, last_name, and city of all customers.
mysql> -- ============================================================
mysql>
mysql> SELECT first_name,
    ->        last_name,
    ->        city
    -> FROM customers;
+------------+-----------+-----------+
| first_name | last_name | city      |
+------------+-----------+-----------+
| Aarav      | Sharma    | Mumbai    |
| Priya      | Patel     | Ahmedabad |
| Rohan      | Gupta     | Delhi     |
| Sneha      | Reddy     | Hyderabad |
| Vikram     | Singh     | Jaipur    |
| Ananya     | Iyer      | Chennai   |
| Karan      | Mehta     | Pune      |
| Divya      | Nair      | Kochi     |
+------------+-----------+-----------+
8 rows in set (0.00 sec)

mysql>
mysql>
mysql> -- ============================================================
mysql> -- Q3. List all unique categories available in the products table.
mysql> -- ============================================================
mysql>
mysql> SELECT DISTINCT category
    -> FROM products;
+-------------+
| category    |
+-------------+
| Clothing    |
| Electronics |
| Home        |
+-------------+
3 rows in set (0.00 sec)

mysql>
mysql>
mysql> -- ============================================================
mysql> -- Q4. Identify the Primary Key of each table in the schema.
mysql> -- Explain why a Primary Key must be UNIQUE and NOT NULL.
mysql> -- ============================================================
mysql>
mysql> -- Primary Keys:
mysql> -- customers    -> customer_id
mysql> -- products     -> product_id
mysql> -- orders       -> order_id
mysql> -- order_items  -> item_id
mysql>
mysql> -- Explanation:
mysql> -- 1. A Primary Key uniquely identifies each record in a table.
mysql> -- 2. It cannot contain NULL values.
mysql> -- 3. It prevents duplicate records.
mysql> -- 4. It is used to establish relationships between tables.
mysql>
mysql>
mysql> -- ============================================================
mysql> -- Q5. What constraints are applied to the email column in the
mysql> -- customers table? What happens if a duplicate email is inserted?
mysql> -- ============================================================
mysql>
mysql> -- The email column has the following constraints:
mysql> -- 1. UNIQUE
mysql> -- 2. NOT NULL
mysql>
mysql> -- Example:
mysql>
mysql> INSERT INTO customers
    -> VALUES
    -> (
    -> 109,
    -> 'Rahul',
    -> 'Patil',
    -> 'aarav.s@email.com',
    -> 'Nashik',
    -> 'Maharashtra',
    -> '2024-09-01',
    -> TRUE
    -> );
ERROR 1062 (23000): Duplicate entry 'aarav.s@email.com' for key 'customers.email'
mysql>
mysql> -- Expected Result:
mysql> -- ERROR 1062 (23000):
mysql> -- Duplicate entry 'aarav.s@email.com'
mysql> -- for key 'customers.email'
mysql>
mysql>
mysql> -- ============================================================
mysql> -- Q6. Try inserting a product with unit_price = -50.
mysql> -- What happens and which constraint prevents it?
mysql> -- ============================================================
mysql>
mysql> INSERT INTO products
    -> VALUES
    -> (
    -> 209,
    -> 'Test Product',
    -> 'Electronics',
    -> 'ABC Brand',
    -> -50,
    -> 100
    -> );
ERROR 3819 (HY000): Check constraint 'products_chk_1' is violated.
mysql>
mysql> -- ============================================================
mysql> -- Q7. Retrieve all orders with status = 'Delivered'
mysql> -- ============================================================
mysql>
mysql> SELECT *
    -> FROM orders
    -> WHERE status = 'Delivered';
+----------+-------------+------------+-----------+--------------+
| order_id | customer_id | order_date | status    | total_amount |
+----------+-------------+------------+-----------+--------------+
|     1001 |         101 | 2024-08-01 | Delivered |      4498.00 |
|     1002 |         102 | 2024-08-03 | Delivered |       799.00 |
|     1004 |         101 | 2024-08-10 | Delivered |      3499.00 |
|     1006 |         105 | 2024-08-15 | Delivered |      5898.00 |
|     1008 |         103 | 2024-08-20 | Delivered |       899.00 |
|     1010 |         108 | 2024-08-28 | Delivered |      1598.00 |
+----------+-------------+------------+-----------+--------------+
6 rows in set (0.00 sec)

mysql> -- ============================================================
mysql> -- Q8. Find all products in the 'Electronics' category
mysql> -- with unit_price greater than ₹2000
mysql> -- ============================================================
mysql>
mysql> SELECT *
    -> FROM products
    -> WHERE category = 'Electronics'
    -> AND unit_price > 2000;
+------------+-------------------+-------------+-------+------------+-----------+
| product_id | product_name      | category    | brand | unit_price | stock_qty |
+------------+-------------------+-------------+-------+------------+-----------+
|        203 | Smart Watch       | Electronics | Noise |    2999.00 |       150 |
|        205 | Bluetooth Speaker | Electronics | JBL   |    3499.00 |       200 |
+------------+-------------------+-------------+-------+------------+-----------+
2 rows in set (0.00 sec)

mysql> -- ============================================================
mysql> -- Q9. Display customers who joined in 2024
mysql> -- and belong to Maharashtra
mysql> -- ============================================================
mysql>
mysql> SELECT *
    -> FROM customers
    -> WHERE state = 'Maharashtra'
    -> AND join_date BETWEEN '2024-01-01' AND '2024-12-31';
+-------------+------------+-----------+-------------------+--------+-------------+------------+------------+
| customer_id | first_name | last_name | email             | city   | state       | join_date  | is_premium |
+-------------+------------+-----------+-------------------+--------+-------------+------------+------------+
|         101 | Aarav      | Sharma    | aarav.s@email.com | Mumbai | Maharashtra | 2024-01-15 |          1 |
|         107 | Karan      | Mehta     | karan.m@email.com | Pune   | Maharashtra | 2024-07-22 |          1 |
+-------------+------------+-----------+-------------------+--------+-------------+------------+------------+
2 rows in set (0.00 sec)

mysql> -- ============================================================
mysql> -- Q10. Display orders placed between
mysql> -- 2024-08-10 and 2024-08-25
mysql> -- excluding cancelled orders
mysql> -- ============================================================
mysql>
mysql> SELECT *
    -> FROM orders
    -> WHERE order_date BETWEEN '2024-08-10' AND '2024-08-25'
    -> AND status <> 'Cancelled';
+----------+-------------+------------+-----------+--------------+
| order_id | customer_id | order_date | status    | total_amount |
+----------+-------------+------------+-----------+--------------+
|     1004 |         101 | 2024-08-10 | Delivered |      3499.00 |
|     1006 |         105 | 2024-08-15 | Delivered |      5898.00 |
|     1007 |         106 | 2024-08-18 | Pending   |      1299.00 |
|     1008 |         103 | 2024-08-20 | Delivered |       899.00 |
|     1009 |         107 | 2024-08-25 | Shipped   |      6098.00 |
+----------+-------------+------------+-----------+--------------+
5 rows in set (0.00 sec)

mysql> -- ============================================================
mysql> -- Q11. Explain the purpose of idx_orders_date
mysql> -- ============================================================
mysql>
mysql> -- Explanation:
mysql> -- idx_orders_date is an index created on the order_date column.
mysql> -- It improves query performance by allowing MySQL to quickly
mysql> -- locate rows based on order_date instead of scanning the
mysql> -- entire orders table.
mysql>
mysql> -- Sample Query
mysql>
mysql> SELECT *
    -> FROM orders
    -> WHERE order_date = '2024-08-15';
+----------+-------------+------------+-----------+--------------+
| order_id | customer_id | order_date | status    | total_amount |
+----------+-------------+------------+-----------+--------------+
|     1006 |         105 | 2024-08-15 | Delivered |      5898.00 |
+----------+-------------+------------+-----------+--------------+
1 row in set (0.00 sec)

mysql> -- ============================================================
mysql> -- Q12. Index-Friendly (SARGable) Query
mysql> -- ============================================================
mysql>
mysql> -- Original Query
mysql>
mysql> SELECT *
    -> FROM customers
    -> WHERE YEAR(join_date) = 2024;
+-------------+------------+-----------+--------------------+-----------+-------------+------------+------------+
| customer_id | first_name | last_name | email              | city      | state       | join_date  | is_premium |
+-------------+------------+-----------+--------------------+-----------+-------------+------------+------------+
|         101 | Aarav      | Sharma    | aarav.s@email.com  | Mumbai    | Maharashtra | 2024-01-15 |          1 |
|         102 | Priya      | Patel     | priya.p@email.com  | Ahmedabad | Gujarat     | 2024-02-20 |          0 |
|         103 | Rohan      | Gupta     | rohan.g@email.com  | Delhi     | Delhi       | 2024-03-10 |          1 |
|         104 | Sneha      | Reddy     | sneha.r@email.com  | Hyderabad | Telangana   | 2024-04-05 |          0 |
|         105 | Vikram     | Singh     | vikram.s@email.com | Jaipur    | Rajasthan   | 2024-05-12 |          1 |
|         106 | Ananya     | Iyer      | ananya.i@email.com | Chennai   | Tamil Nadu  | 2024-06-18 |          0 |
|         107 | Karan      | Mehta     | karan.m@email.com  | Pune      | Maharashtra | 2024-07-22 |          1 |
|         108 | Divya      | Nair      | divya.n@email.com  | Kochi     | Kerala      | 2024-08-30 |          0 |
+-------------+------------+-----------+--------------------+-----------+-------------+------------+------------+
8 rows in set (0.00 sec)

mysql>
mysql> -- Explanation:
mysql> -- The YEAR() function is applied to every row,
mysql> -- therefore MySQL cannot efficiently use an index
mysql> -- on the join_date column.
mysql>
mysql> -- Optimized (SARGable) Query
mysql>
mysql> SELECT *
    -> FROM customers
    -> WHERE join_date >= '2024-01-01'
    -> AND join_date < '2025-01-01';
+-------------+------------+-----------+--------------------+-----------+-------------+------------+------------+
| customer_id | first_name | last_name | email              | city      | state       | join_date  | is_premium |
+-------------+------------+-----------+--------------------+-----------+-------------+------------+------------+
|         101 | Aarav      | Sharma    | aarav.s@email.com  | Mumbai    | Maharashtra | 2024-01-15 |          1 |
|         102 | Priya      | Patel     | priya.p@email.com  | Ahmedabad | Gujarat     | 2024-02-20 |          0 |
|         103 | Rohan      | Gupta     | rohan.g@email.com  | Delhi     | Delhi       | 2024-03-10 |          1 |
|         104 | Sneha      | Reddy     | sneha.r@email.com  | Hyderabad | Telangana   | 2024-04-05 |          0 |
|         105 | Vikram     | Singh     | vikram.s@email.com | Jaipur    | Rajasthan   | 2024-05-12 |          1 |
|         106 | Ananya     | Iyer      | ananya.i@email.com | Chennai   | Tamil Nadu  | 2024-06-18 |          0 |
|         107 | Karan      | Mehta     | karan.m@email.com  | Pune      | Maharashtra | 2024-07-22 |          1 |
|         108 | Divya      | Nair      | divya.n@email.com  | Kochi     | Kerala      | 2024-08-30 |          0 |
+-------------+------------+-----------+--------------------+-----------+-------------+------------+------------+
8 rows in set (0.00 sec)

mysql> -- ============================================================
mysql> -- Q13. Count the total number of orders
mysql> -- ============================================================
mysql>
mysql> SELECT COUNT(*) AS Total_Orders
    -> FROM orders;
+--------------+
| Total_Orders |
+--------------+
|           10 |
+--------------+
1 row in set (0.00 sec)

mysql> -- ============================================================
mysql> -- Q14. Calculate total revenue from Delivered orders
mysql> -- ============================================================
mysql>
mysql> SELECT SUM(total_amount) AS Total_Revenue
    -> FROM orders
    -> WHERE status = 'Delivered';
+---------------+
| Total_Revenue |
+---------------+
|      17191.00 |
+---------------+
1 row in set (0.00 sec)

mysql> -- ============================================================
mysql> -- Q15. Calculate average product price for each category
mysql> -- ============================================================
mysql>
mysql> SELECT category,
    ->        AVG(unit_price) AS Average_Price
    -> FROM products
    -> GROUP BY category;
+-------------+---------------+
| category    | Average_Price |
+-------------+---------------+
| Clothing    |   2699.000000 |
| Electronics |   2224.000000 |
| Home        |    949.000000 |
+-------------+---------------+
3 rows in set (0.00 sec)

mysql> -- ============================================================
mysql> -- Q16. Count orders and calculate total revenue
mysql> -- for each order status
mysql> -- ============================================================
mysql>
mysql> SELECT status,
    ->        COUNT(*) AS Total_Orders,
    ->        SUM(total_amount) AS Total_Revenue
    -> FROM orders
    -> GROUP BY status
    -> ORDER BY Total_Revenue DESC;
+-----------+--------------+---------------+
| status    | Total_Orders | Total_Revenue |
+-----------+--------------+---------------+
| Delivered |            6 |      17191.00 |
| Shipped   |            2 |      13596.00 |
| Cancelled |            1 |       2999.00 |
| Pending   |            1 |       1299.00 |
+-----------+--------------+---------------+
4 rows in set (0.00 sec)

mysql> -- ============================================================
mysql> -- Q17. Find the maximum and minimum product price
mysql> -- in each category
mysql> -- ============================================================
mysql>
mysql> SELECT category,
    ->        MAX(unit_price) AS Most_Expensive_Product,
    ->        MIN(unit_price) AS Cheapest_Product
    -> FROM products
    -> GROUP BY category;
+-------------+------------------------+------------------+
| category    | Most_Expensive_Product | Cheapest_Product |
+-------------+------------------------+------------------+
| Clothing    |                4599.00 |           799.00 |
| Electronics |                3499.00 |           899.00 |
| Home        |                1299.00 |           599.00 |
+-------------+------------------------+------------------+
3 rows in set (0.00 sec)

mysql> -- ============================================================
mysql> -- Q18. Display categories whose average product
mysql> -- price is greater than ₹2000
mysql> -- ============================================================
mysql>
mysql> SELECT category,
    ->        AVG(unit_price) AS Average_Price
    -> FROM products
    -> GROUP BY category
    -> HAVING AVG(unit_price) > 2000;
+-------------+---------------+
| category    | Average_Price |
+-------------+---------------+
| Clothing    |   2699.000000 |
| Electronics |   2224.000000 |
+-------------+---------------+
2 rows in set (0.00 sec)

mysql> -- ============================================================
mysql> -- Q19. Display each order with customer details
mysql> -- Using INNER JOIN
mysql> -- ============================================================
mysql>
mysql> SELECT
    ->     o.order_id,
    ->     o.order_date,
    ->     c.first_name,
    ->     c.last_name,
    ->     o.total_amount
    -> FROM orders o
    -> INNER JOIN customers c
    -> ON o.customer_id = c.customer_id;
+----------+------------+------------+-----------+--------------+
| order_id | order_date | first_name | last_name | total_amount |
+----------+------------+------------+-----------+--------------+
|     1001 | 2024-08-01 | Aarav      | Sharma    |      4498.00 |
|     1004 | 2024-08-10 | Aarav      | Sharma    |      3499.00 |
|     1002 | 2024-08-03 | Priya      | Patel     |       799.00 |
|     1003 | 2024-08-05 | Rohan      | Gupta     |      7498.00 |
|     1008 | 2024-08-20 | Rohan      | Gupta     |       899.00 |
|     1005 | 2024-08-12 | Sneha      | Reddy     |      2999.00 |
|     1006 | 2024-08-15 | Vikram     | Singh     |      5898.00 |
|     1007 | 2024-08-18 | Ananya     | Iyer      |      1299.00 |
|     1009 | 2024-08-25 | Karan      | Mehta     |      6098.00 |
|     1010 | 2024-08-28 | Divya      | Nair      |      1598.00 |
+----------+------------+------------+-----------+--------------+
10 rows in set (0.00 sec)

mysql> -- ============================================================
mysql> -- Q20. Display all customers and their orders
mysql> -- Using LEFT JOIN
mysql> -- ============================================================
mysql>
mysql> SELECT
    ->     c.customer_id,
    ->     c.first_name,
    ->     c.last_name,
    ->     o.order_id,
    ->     o.order_date,
    ->     o.status,
    ->     o.total_amount
    -> FROM customers c
    -> LEFT JOIN orders o
    -> ON c.customer_id = o.customer_id;
+-------------+------------+-----------+----------+------------+-----------+--------------+
| customer_id | first_name | last_name | order_id | order_date | status    | total_amount |
+-------------+------------+-----------+----------+------------+-----------+--------------+
|         101 | Aarav      | Sharma    |     1001 | 2024-08-01 | Delivered |      4498.00 |
|         101 | Aarav      | Sharma    |     1004 | 2024-08-10 | Delivered |      3499.00 |
|         102 | Priya      | Patel     |     1002 | 2024-08-03 | Delivered |       799.00 |
|         103 | Rohan      | Gupta     |     1003 | 2024-08-05 | Shipped   |      7498.00 |
|         103 | Rohan      | Gupta     |     1008 | 2024-08-20 | Delivered |       899.00 |
|         104 | Sneha      | Reddy     |     1005 | 2024-08-12 | Cancelled |      2999.00 |
|         105 | Vikram     | Singh     |     1006 | 2024-08-15 | Delivered |      5898.00 |
|         106 | Ananya     | Iyer      |     1007 | 2024-08-18 | Pending   |      1299.00 |
|         107 | Karan      | Mehta     |     1009 | 2024-08-25 | Shipped   |      6098.00 |
|         108 | Divya      | Nair      |     1010 | 2024-08-28 | Delivered |      1598.00 |
+-------------+------------+-----------+----------+------------+-----------+--------------+
10 rows in set (0.00 sec)

mysql> -- ============================================================
mysql> -- Q20. Display all customers and their orders
mysql> -- Using LEFT JOIN
mysql> -- ============================================================
mysql>
mysql> SELECT
    ->     c.customer_id,
    ->     c.first_name,
    ->     c.last_name,
    ->     o.order_id,
    ->     o.order_date,
    ->     o.status,
    ->     o.total_amount
    -> FROM customers c
    -> LEFT JOIN orders o
    -> ON c.customer_id = o.customer_id;
+-------------+------------+-----------+----------+------------+-----------+--------------+
| customer_id | first_name | last_name | order_id | order_date | status    | total_amount |
+-------------+------------+-----------+----------+------------+-----------+--------------+
|         101 | Aarav      | Sharma    |     1001 | 2024-08-01 | Delivered |      4498.00 |
|         101 | Aarav      | Sharma    |     1004 | 2024-08-10 | Delivered |      3499.00 |
|         102 | Priya      | Patel     |     1002 | 2024-08-03 | Delivered |       799.00 |
|         103 | Rohan      | Gupta     |     1003 | 2024-08-05 | Shipped   |      7498.00 |
|         103 | Rohan      | Gupta     |     1008 | 2024-08-20 | Delivered |       899.00 |
|         104 | Sneha      | Reddy     |     1005 | 2024-08-12 | Cancelled |      2999.00 |
|         105 | Vikram     | Singh     |     1006 | 2024-08-15 | Delivered |      5898.00 |
|         106 | Ananya     | Iyer      |     1007 | 2024-08-18 | Pending   |      1299.00 |
|         107 | Karan      | Mehta     |     1009 | 2024-08-25 | Shipped   |      6098.00 |
|         108 | Divya      | Nair      |     1010 | 2024-08-28 | Delivered |      1598.00 |
+-------------+------------+-----------+----------+------------+-----------+--------------+
10 rows in set (0.00 sec)

mysql> -- ============================================================
mysql> -- Q21. Display order details using JOIN
mysql> -- orders → order_items → products
mysql> -- ============================================================
mysql>
mysql> SELECT
    ->     o.order_id,
    ->     p.product_name,
    ->     oi.quantity,
    ->     oi.unit_price,
    ->     oi.discount_pct
    -> FROM orders o
    -> INNER JOIN order_items oi
    -> ON o.order_id = oi.order_id
    -> INNER JOIN products p
    -> ON oi.product_id = p.product_id;
+----------+----------------------+----------+------------+--------------+
| order_id | product_name         | quantity | unit_price | discount_pct |
+----------+----------------------+----------+------------+--------------+
|     1001 | Wireless Earbuds     |        2 |    1499.00 |         0.00 |
|     1006 | Wireless Earbuds     |        1 |    1499.00 |        10.00 |
|     1002 | Cotton T-Shirt       |        1 |     799.00 |         0.00 |
|     1003 | Smart Watch          |        1 |    2999.00 |         0.00 |
|     1005 | Smart Watch          |        1 |    2999.00 |         0.00 |
|     1003 | Running Shoes        |        1 |    4599.00 |         5.00 |
|     1006 | Running Shoes        |        1 |    4599.00 |         5.00 |
|     1004 | Bluetooth Speaker    |        1 |    3499.00 |         0.00 |
|     1009 | Bluetooth Speaker    |        1 |    3499.00 |         0.00 |
|     1007 | Bedsheet Set         |        1 |    1299.00 |         0.00 |
|     1010 | Bedsheet Set         |        1 |    1299.00 |         0.00 |
|     1001 | Laptop Stand         |        1 |     899.00 |        10.00 |
|     1008 | Laptop Stand         |        1 |     899.00 |         0.00 |
|     1009 | Cushion Covers (Set) |        2 |     599.00 |        15.00 |
|     1010 | Cushion Covers (Set) |        1 |     599.00 |         0.00 |
+----------+----------------------+----------+------------+--------------+
15 rows in set (0.00 sec)

mysql> -- ============================================================
mysql> -- Q22. Difference between LEFT JOIN, RIGHT JOIN
mysql> -- and FULL OUTER JOIN
mysql> -- ============================================================
mysql>
mysql> -- LEFT JOIN:
mysql> -- Returns all records from the left table
mysql> -- and matching records from the right table.
mysql> -- If no match exists, NULL values are returned.
mysql>
mysql> -- Example:
mysql>
mysql> SELECT
    ->     c.customer_id,
    ->     c.first_name,
    ->     o.order_id
    -> FROM customers c
    -> LEFT JOIN orders o
    -> ON c.customer_id = o.customer_id;
+-------------+------------+----------+
| customer_id | first_name | order_id |
+-------------+------------+----------+
|         101 | Aarav      |     1001 |
|         101 | Aarav      |     1004 |
|         102 | Priya      |     1002 |
|         103 | Rohan      |     1003 |
|         103 | Rohan      |     1008 |
|         104 | Sneha      |     1005 |
|         105 | Vikram     |     1006 |
|         106 | Ananya     |     1007 |
|         107 | Karan      |     1009 |
|         108 | Divya      |     1010 |
+-------------+------------+----------+
10 rows in set (0.00 sec)

mysql>
mysql>
mysql> -- RIGHT JOIN:
mysql> -- Returns all records from the right table
mysql> -- and matching records from the left table.
mysql> -- If no match exists, NULL values are returned.
mysql>
mysql> -- Example:
mysql>
mysql> SELECT
    ->     c.customer_id,
    ->     c.first_name,
    ->     o.order_id
    -> FROM customers c
    -> RIGHT JOIN orders o
    -> ON c.customer_id = o.customer_id;
+-------------+------------+----------+
| customer_id | first_name | order_id |
+-------------+------------+----------+
|         101 | Aarav      |     1001 |
|         101 | Aarav      |     1004 |
|         102 | Priya      |     1002 |
|         103 | Rohan      |     1003 |
|         103 | Rohan      |     1008 |
|         104 | Sneha      |     1005 |
|         105 | Vikram     |     1006 |
|         106 | Ananya     |     1007 |
|         107 | Karan      |     1009 |
|         108 | Divya      |     1010 |
+-------------+------------+----------+
10 rows in set (0.00 sec)

mysql>
mysql>
mysql> -- FULL OUTER JOIN:
mysql> -- Returns all matching rows from both tables,
mysql> -- including unmatched rows from both sides.
mysql> --
mysql> -- Note:
mysql> -- MySQL does NOT support FULL OUTER JOIN directly.
mysql> -- It can be simulated using
mysql> -- LEFT JOIN
mysql> -- UNION
mysql> -- RIGHT JOIN.
mysql> -- ============================================================
mysql> -- Q23. Foreign Key Relationships
mysql> -- ============================================================
mysql>
mysql> -- Foreign Keys:
mysql>
mysql> -- orders.customer_id
mysql> -- REFERENCES customers(customer_id)
mysql>
mysql> -- order_items.order_id
mysql> -- REFERENCES orders(order_id)
mysql>
mysql> -- order_items.product_id
mysql> -- REFERENCES products(product_id)
mysql>
mysql> -- Example:
mysql>
mysql> INSERT INTO orders
    -> VALUES
    -> (
    -> 1011,
    -> 999,
    -> '2024-09-01',
    -> 'Pending',
    -> 1000
    -> );
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`shopease`.`orders`, CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`))
mysql>
mysql> -- Expected Result:
mysql>
mysql> -- ERROR 1452 (23000):
mysql> -- Cannot add or update a child row:
mysql> -- a foreign key constraint fails.
mysql>
mysql> -- Explanation:
mysql> -- Customer ID 999 does not exist in the
mysql> -- customers table, so MySQL prevents
mysql> -- the insertion to maintain referential integrity.
mysql> -- ============================================================
mysql> -- Q24. Classify products into price tiers using CASE statement
mysql> -- ============================================================
mysql>
mysql> SELECT
    ->     product_name,
    ->     unit_price,
    ->     CASE
    ->         WHEN unit_price < 1000 THEN 'Budget'
    ->         WHEN unit_price BETWEEN 1000 AND 3000 THEN 'Mid-Range'
    ->         WHEN unit_price > 3000 THEN 'Premium'
    ->     END AS price_tier
    -> FROM products;
+----------------------+------------+------------+
| product_name         | unit_price | price_tier |
+----------------------+------------+------------+
| Wireless Earbuds     |    1499.00 | Mid-Range  |
| Cotton T-Shirt       |     799.00 | Budget     |
| Smart Watch          |    2999.00 | Mid-Range  |
| Running Shoes        |    4599.00 | Premium    |
| Bluetooth Speaker    |    3499.00 | Premium    |
| Bedsheet Set         |    1299.00 | Mid-Range  |
| Laptop Stand         |     899.00 | Budget     |
| Cushion Covers (Set) |     599.00 | Budget     |
+----------------------+------------+------------+
8 rows in set (0.00 sec)

mysql> -- ============================================================
mysql> -- Q25. Count Delivered and Not Delivered Orders
mysql> -- Using CASE with Aggregate Function
mysql> -- ============================================================
mysql>
mysql> SELECT
    ->     SUM(
    ->         CASE
    ->             WHEN status = 'Delivered' THEN 1
    ->             ELSE 0
    ->         END
    ->     ) AS Delivered_Orders,
    ->
    ->     SUM(
    ->         CASE
    ->             WHEN status <> 'Delivered' THEN 1
    ->             ELSE 0
    ->         END
    ->     ) AS Not_Delivered_Orders
    ->
    -> FROM orders;
+------------------+----------------------+
| Delivered_Orders | Not_Delivered_Orders |
+------------------+----------------------+
|                6 |                    4 |
+------------------+----------------------+
1 row in set (0.00 sec)

mysql> -- ============================================================
mysql> -- Q26. ACID Properties
mysql> -- ============================================================
mysql>
mysql> -- A - Atomicity
mysql> -- A transaction is completed entirely or not at all.
mysql> -- Example:
mysql> -- During a bank transfer, if money is debited from one account
mysql> -- but cannot be credited to another account, the entire
mysql> -- transaction is rolled back.
mysql>
mysql> -- C - Consistency
mysql> -- Ensures that the database remains in a valid state before
mysql> -- and after every transaction.
mysql> -- Example:
mysql> -- A customer's account balance cannot become negative
mysql> -- after a transaction.
mysql>
mysql> -- I - Isolation
mysql> -- Multiple transactions execute independently without
mysql> -- affecting each other.
mysql> -- Example:
mysql> -- Two customers booking tickets simultaneously should
mysql> -- not receive the same seat.
mysql>
mysql> -- D - Durability
mysql> -- Once a transaction is committed, the data is permanently
mysql> -- stored even if the system crashes.
mysql> -- Example:
mysql> -- After an online payment is successful, the transaction
mysql> -- remains saved even after a power failure.
mysql> -- ============================================================
mysql> -- Q27. SQL Transaction
mysql> -- Insert Order, Insert Order Items,
mysql> -- Update Stock and Commit/Rollback
mysql> -- ============================================================
mysql>
mysql> START TRANSACTION;
Query OK, 0 rows affected (0.00 sec)

mysql>
mysql> -- Step 1 : Insert a new order
mysql>
mysql> INSERT INTO orders
    -> VALUES
    -> (
    -> 1011,
    -> 102,
    -> CURDATE(),
    -> 'Pending',
    -> 1598.00
    -> );
Query OK, 1 row affected (0.00 sec)

mysql>
mysql> -- Step 2 : Insert first order item
mysql>
mysql> INSERT INTO order_items
    -> VALUES
    -> (
    -> 5016,
    -> 1011,
    -> 206,
    -> 1,
    -> 1299.00,
    -> 0
    -> );
Query OK, 1 row affected (0.00 sec)

mysql>
mysql> -- Step 3 : Insert second order item
mysql>
mysql> INSERT INTO order_items
    -> VALUES
    -> (
    -> 5017,
    -> 1011,
    -> 208,
    -> 1,
    -> 599.00,
    -> 0
    -> );
Query OK, 1 row affected (0.00 sec)

mysql>
mysql> -- Step 4 : Update stock quantity
mysql>
mysql> UPDATE products
    -> SET stock_qty = stock_qty - 1
    -> WHERE product_id = 206;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>
mysql> UPDATE products
    -> SET stock_qty = stock_qty - 1
    -> WHERE product_id = 208;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>
mysql> -- Step 5 : Save all changes
mysql>
mysql> COMMIT;
Query OK, 0 rows affected (0.06 sec)

mysql>
mysql> -- If any statement fails before COMMIT,
mysql> -- execute the following command manually:
mysql>
mysql> -- ROLLBACK;
mysql> -- verifying tables
mysql> SELECT * FROM customers;
+-------------+------------+-----------+--------------------+-----------+-------------+------------+------------+
| customer_id | first_name | last_name | email              | city      | state       | join_date  | is_premium |
+-------------+------------+-----------+--------------------+-----------+-------------+------------+------------+
|         101 | Aarav      | Sharma    | aarav.s@email.com  | Mumbai    | Maharashtra | 2024-01-15 |          1 |
|         102 | Priya      | Patel     | priya.p@email.com  | Ahmedabad | Gujarat     | 2024-02-20 |          0 |
|         103 | Rohan      | Gupta     | rohan.g@email.com  | Delhi     | Delhi       | 2024-03-10 |          1 |
|         104 | Sneha      | Reddy     | sneha.r@email.com  | Hyderabad | Telangana   | 2024-04-05 |          0 |
|         105 | Vikram     | Singh     | vikram.s@email.com | Jaipur    | Rajasthan   | 2024-05-12 |          1 |
|         106 | Ananya     | Iyer      | ananya.i@email.com | Chennai   | Tamil Nadu  | 2024-06-18 |          0 |
|         107 | Karan      | Mehta     | karan.m@email.com  | Pune      | Maharashtra | 2024-07-22 |          1 |
|         108 | Divya      | Nair      | divya.n@email.com  | Kochi     | Kerala      | 2024-08-30 |          0 |
+-------------+------------+-----------+--------------------+-----------+-------------+------------+------------+
8 rows in set (0.00 sec)

mysql> SELECT * FROM products;
+------------+----------------------+-------------+--------------+------------+-----------+
| product_id | product_name         | category    | brand        | unit_price | stock_qty |
+------------+----------------------+-------------+--------------+------------+-----------+
|        201 | Wireless Earbuds     | Electronics | BoAt         |    1499.00 |       250 |
|        202 | Cotton T-Shirt       | Clothing    | Levis        |     799.00 |       500 |
|        203 | Smart Watch          | Electronics | Noise        |    2999.00 |       150 |
|        204 | Running Shoes        | Clothing    | Nike         |    4599.00 |       120 |
|        205 | Bluetooth Speaker    | Electronics | JBL          |    3499.00 |       200 |
|        206 | Bedsheet Set         | Home        | Spaces       |    1299.00 |       299 |
|        207 | Laptop Stand         | Electronics | AmazonBasics |     899.00 |       180 |
|        208 | Cushion Covers (Set) | Home        | HomeCenter   |     599.00 |       399 |
+------------+----------------------+-------------+--------------+------------+-----------+
8 rows in set (0.00 sec)

mysql> SELECT * FROM orders;
+----------+-------------+------------+-----------+--------------+
| order_id | customer_id | order_date | status    | total_amount |
+----------+-------------+------------+-----------+--------------+
|     1001 |         101 | 2024-08-01 | Delivered |      4498.00 |
|     1002 |         102 | 2024-08-03 | Delivered |       799.00 |
|     1003 |         103 | 2024-08-05 | Shipped   |      7498.00 |
|     1004 |         101 | 2024-08-10 | Delivered |      3499.00 |
|     1005 |         104 | 2024-08-12 | Cancelled |      2999.00 |
|     1006 |         105 | 2024-08-15 | Delivered |      5898.00 |
|     1007 |         106 | 2024-08-18 | Pending   |      1299.00 |
|     1008 |         103 | 2024-08-20 | Delivered |       899.00 |
|     1009 |         107 | 2024-08-25 | Shipped   |      6098.00 |
|     1010 |         108 | 2024-08-28 | Delivered |      1598.00 |
|     1011 |         102 | 2026-06-25 | Pending   |      1598.00 |
+----------+-------------+------------+-----------+--------------+
11 rows in set (0.00 sec)

mysql> SELECT * FROM order_items;
+---------+----------+------------+----------+------------+--------------+
| item_id | order_id | product_id | quantity | unit_price | discount_pct |
+---------+----------+------------+----------+------------+--------------+
|    5001 |     1001 |        201 |        2 |    1499.00 |         0.00 |
|    5002 |     1001 |        207 |        1 |     899.00 |        10.00 |
|    5003 |     1002 |        202 |        1 |     799.00 |         0.00 |
|    5004 |     1003 |        203 |        1 |    2999.00 |         0.00 |
|    5005 |     1003 |        204 |        1 |    4599.00 |         5.00 |
|    5006 |     1004 |        205 |        1 |    3499.00 |         0.00 |
|    5007 |     1005 |        203 |        1 |    2999.00 |         0.00 |
|    5008 |     1006 |        201 |        1 |    1499.00 |        10.00 |
|    5009 |     1006 |        204 |        1 |    4599.00 |         5.00 |
|    5010 |     1007 |        206 |        1 |    1299.00 |         0.00 |
|    5011 |     1008 |        207 |        1 |     899.00 |         0.00 |
|    5012 |     1009 |        205 |        1 |    3499.00 |         0.00 |
|    5013 |     1009 |        208 |        2 |     599.00 |        15.00 |
|    5014 |     1010 |        206 |        1 |    1299.00 |         0.00 |
|    5015 |     1010 |        208 |        1 |     599.00 |         0.00 |
|    5016 |     1011 |        206 |        1 |    1299.00 |         0.00 |
|    5017 |     1011 |        208 |        1 |     599.00 |         0.00 |
+---------+----------+------------+----------+------------+--------------+
17 rows in set (0.00 sec)

mysql>