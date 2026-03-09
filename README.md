# SQL E-Commerce Sales Analysis

This project simulates a small e-commerce database and demonstrates how SQL can be used to analyze business data.

The goal of this project is to practice real-world SQL queries such as joins, aggregations, filtering, and revenue analysis.

---

## Database Structure

The project contains three tables:

### Customers
- customer_id
- name
- city

### Products
- product_id
- product_name
- price

### Orders
- order_id
- customer_id
- product_id
- quantity
- order_date

---

## Key SQL Concepts Practiced

- SELECT statements
- Filtering with WHERE
- Aggregate functions (COUNT, SUM, AVG, MAX)
- GROUP BY and HAVING
- INNER JOIN
- Subqueries
- Revenue calculations

---

## Example Business Questions Solved

1. List all customers
2. Show products costing more than $500
3. Show all orders placed in February
4. Find customers living in Chicago
5. Count total number of orders
6. Find the average product price
7. Identify the most expensive product
8. Find products ordered more than once
9. Show which customer ordered which product
10. Calculate total quantity ordered per product
11. Calculate total sales per product
12. Find the customer with the most orders
13. Identify customers who purchased a Laptop
14. Find the top-selling product by revenue

---

## Example Query

```sql
SELECT p.product_name,
       SUM(o.quantity * p.price) AS total_revenue
FROM orders o
JOIN products p
ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC;
