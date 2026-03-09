CREATE DATABASE ecommerce_db;
USE ecommerce_db;

CREATE TABLE customers (
customer_id INT PRIMARY KEY,
name VARCHAR(50),
city VARCHAR(50)
);

CREATE TABLE products (
product_id INT PRIMARY KEY,
product_name VARCHAR(50),
price INT
);

CREATE TABLE orders (
order_id INT PRIMARY KEY,
customer_id INT,
product_id INT,
quantity INT,
order_date DATE
);

INSERT INTO customers VALUES
(1,'Alice','New York'),
(2,'Bob','Chicago'),
(3,'Charlie','Boston'),
(4,'David','Chicago'),
(5,'Emma','Seattle');

INSERT INTO products VALUES
(101,'Laptop',1200),
(102,'Phone',800),
(103,'Headphones',150),
(104,'Keyboard',100),
(105,'Mouse',50);

INSERT INTO orders VALUES
(1,1,101,1,'2023-01-10'),
(2,2,102,2,'2023-01-11'),
(3,1,103,3,'2023-01-15'),
(4,3,101,1,'2023-02-01'),
(5,4,105,4,'2023-02-10'),
(6,2,104,1,'2023-02-11'),
(7,5,102,1,'2023-02-15'),
(8,3,103,2,'2023-03-01');
