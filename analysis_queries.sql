-- Q1: List all customers

SELECT name AS customers FROM customers;

-- Q2: Show all products costing more than 500.

SELECT * FROM products
WHERE price > 500;

-- Q3: Show all orders made in February.

SELECT order_id, quantity, order_date
FROM orders
WHERE order_date BETWEEN '2023-02-01' AND '2023-02-28';

-- Q4: Show customers who live in Chicago.

SELECT * 
FROM customers
WHERE city = 'Chicago';

-- Q5: Count total number of orders.

SELECT count(*) AS total_orders
FROM orders;

-- Q6: Find the average price of products.

SELECT avg(price) as avg_price FROM products;

-- Q7: Find the most expensive product.

SELECT product_name, price 
FROM products
WHERE price = (SELECT MAX(price) FROM products);

-- Q8: Show products ordered more than once.

SELECT * FROM products;

SELECT product_name, COUNT(*) AS times_ordered
FROM orders o
INNER JOIN products p
ON o.product_id = p.product_id
GROUP BY p.product_name
HAVING COUNT(*) > 1;

-- Q9: Show customer name and product they ordered.

SELECT c.name, o.product_id
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;

SELECT name, p.product_name
FROM
(SELECT c.name, o.product_id
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id) AS j
INNER JOIN products p
ON j.product_id = p.product_id;

-- Q10: Show total quantity ordered per product.
SELECT * FROM orders;
SELECT * FROM products;
SELECT * FROM customers;

SELECT product_name, sum(quantity) as total_ordered
FROM orders o
INNER JOIN products p
ON o.product_id = p.product_id
GROUP BY o.product_id; -- can be done as well: GROUP BY product_name;

-- Q11: Find total sales per product.
SELECT * FROM orders;
SELECT * FROM products;
SELECT * FROM customers;

SELECT p.product_name, o.product_id, sum(o.quantity * p.price) AS sales
FROM orders o
INNER JOIN products p
ON o.product_id = p.product_id
GROUP BY product_id;


-- Q 12: Which customer placed the most orders?

SELECT * FROM orders;
SELECT * FROM products;
SELECT * FROM customers;

SELECT c.name, COUNT(o.order_id) AS total_orders
FROM orders o
INNER JOIN customers c
ON o.customer_id = c.customer_id
GROUP BY c.customer_id
ORDER BY total_orders DESC
LIMIT 1;

-- Or
SELECT c.name, COUNT(o.order_id) AS total_orders
FROM orders o
INNER JOIN customers c
ON o.customer_id = c.customer_id
GROUP BY c.customer_id
HAVING COUNT(o.order_id) = ( 
			SELECT MAX(order_count) 
			FROM (
				SELECT COUNT(*) AS order_count
                FROM orders
                GROUP BY customer_id) t
			);

-- Q13: Find customers who bought Laptop.
SELECT * FROM orders;
SELECT * FROM products;
SELECT * FROM customers;

SELECT c.name, p.product_name as bought_item  
FROM orders o
INNER JOIN customers c 
ON o.customer_id = c.customer_id
INNER JOIN products p 
ON o.product_id = p.product_id
WHERE p.product_name = 'Laptop';

-- Q 14: Find top selling product by revenue.

SELECT product_name, total_revenue
FROM (SELECT p.product_name, SUM(o.quantity * p.price) AS total_revenue
		FROM orders o
        INNER JOIN products p
        ON o.product_id = p.product_id
        GROUP BY o.product_id) AS revenue_table
        WHERE total_revenue = (
				SELECT MAX(total_revenue)
                FROM (
				SELECT SUM(o.quantity * p.price) AS total_revenue
                FROM orders o
                INNER JOIN products p 
                ON o.product_id = p.product_id
                GROUP BY o.product_id
		) AS max_revenue);
        
-- Or

SELECT product_name, SUM(o.quantity * p.price) as total_revenue
FROM orders o
INNER JOIN products p
ON o.product_id = p.product_id
GROUP BY o.product_id
ORDER BY SUM(o.quantity * p.price) DESC
LIMIT 2;
