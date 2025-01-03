CREATE OR REPLACE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2)
);

INSERT INTO orders (order_id, customer_id, order_date, total_amount) VALUES
(1, 101, '2024-01-10', 250.00),
(2, 102, '2024-01-15', 300.00),
(3, 101, '2024-01-20', 450.00),
(4, 103, '2024-01-25', 500.00),
(5, 104, '2024-01-30', 150.00);

SELECT customer_id, SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id
HAVING SUM(total_amount) > 400;

SELECT order_id, customer_id, total_amount
FROM orders
WHERE total_amount > 200;
