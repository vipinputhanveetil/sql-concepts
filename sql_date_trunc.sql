-- Create the Sales table
CREATE OR REPLACE TABLE sales (
    sale_id INT,
    sale_date TIMESTAMP,
    amount DECIMAL(10, 2)
);

-- Insert sample data into the Sales table
INSERT INTO sales (sale_id, sale_date, amount)
VALUES 
(1, '2024-01-15 10:23:54', 150.00),
(2, '2024-02-25 14:45:30', 250.00),
(3, '2024-02-25 14:47:00', 350.00),
(4, '2024-03-10 16:30:00', 450.00);

SELECT 
    sale_id,
    sale_date,
    DATE_TRUNC('year', sale_date) AS truncated_to_year,
    amount
FROM 
    sales;

SELECT 
    sale_id,
    sale_date,
    DATE_TRUNC('quarter', sale_date) AS truncated_to_quarter,
    amount
FROM 
    sales;
SELECT 
    sale_id,
    sale_date,
    DATE_TRUNC('month', sale_date) AS truncated_to_month,
    amount
FROM 
    sales;
SELECT 
    sale_id,
    sale_date,
    DATE_TRUNC('day', sale_date) AS truncated_to_day,
    amount
FROM 
    sales;
