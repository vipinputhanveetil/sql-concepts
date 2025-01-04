CREATE OR REPLACE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department_id INT,
    salary DECIMAL(10, 2)
);

INSERT INTO employees (employee_id, employee_name, department_id, salary) VALUES
(1, 'John Doe', 1, 50000.00),
(2, 'Jane Smith', 2, 60000.00),
(3, 'Emily Johnson', 1, 55000.00),
(4, 'Michael Brown', 3, 70000.00),
(5, 'Lisa Davis', 2, 62000.00);

CREATE OR REPLACE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

INSERT INTO departments (department_id, department_name) VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'IT');

CREATE OR REPLACE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    contact_email VARCHAR(100)
);

INSERT INTO customers (customer_id, customer_name, contact_email) VALUES
(1, 'Acme Corp', 'contact@acmecorp.com'),
(2, 'Globex Inc', 'info@globex.com'),
(3, 'Soylent Corp', 'sales@soylent.com'),
(4, 'Initech', 'support@initech.com'),
(5, 'Umbrella Corp', 'admin@umbrellacorp.com');

CREATE OR REPLACE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO orders (order_id, customer_id, order_date, amount) VALUES
(1, 1, '2024-01-01', 250.00),
(2, 1, '2024-01-15', 350.00),
(3, 2, '2024-02-10', 200.00),
(4, 3, '2024-03-05', 150.00),
(5, 4, '2024-04-20', 400.00),
(6, 5, '2024-05-15', 180.00);


SELECT employee_id, employee_name
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

SELECT d.department_name, avg_salaries.avg_salary
FROM departments d
JOIN (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
) avg_salaries
ON d.department_id = avg_salaries.department_id;

SELECT customer_id, customer_name,
       (SELECT COUNT(*) FROM orders WHERE orders.customer_id = customers.customer_id) AS total_orders
FROM customers;


