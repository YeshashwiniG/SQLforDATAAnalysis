-- Show all customers
SELECT * FROM customers;

-- Use WHERE, GROUP BY, ORDER BY
SELECT country, COUNT(*) AS total_customers
FROM customers
WHERE country != 'India'
GROUP BY country
ORDER BY total_customers DESC;

-- INNER JOIN
SELECT orders.order_id, customers.name AS customer, products.name AS product, orders.quantity
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id
JOIN products ON orders.product_id = products.product_id;

-- LEFT JOIN
SELECT customers.name AS customer, orders.order_id
FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id;

-- Subquery: products above average price
SELECT name, price
FROM products
WHERE price > (
    SELECT AVG(price) FROM products
);

-- Aggregate functions
SELECT 
  orders.customer_id, 
  SUM(orders.quantity * products.price) AS total_spent, 
  AVG(orders.quantity) AS avg_quantity
FROM orders
JOIN products ON orders.product_id = products.product_id
GROUP BY orders.customer_id;

-- Final view logic without using a view
SELECT 
  customers.name AS customer_name, 
  SUM(orders.quantity * products.price) AS total_spent
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id
JOIN products ON orders.product_id = products.product_id
GROUP BY customers.name;

-- Create index
CREATE INDEX idx_customer_id ON orders(customer_id);