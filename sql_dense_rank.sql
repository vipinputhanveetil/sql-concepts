-- Create the Employees table
CREATE OR REPLACE TABLE employees (
    employee_id INT,
    department VARCHAR(50),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary DECIMAL(10, 2)
);

-- Insert sample data into the Employees table
INSERT INTO Employees (employee_id, department, first_name, last_name, salary)
VALUES 
(1, 'Sales', 'John', 'Doe', 50000.00),
(2, 'Sales', 'Jane', 'Smith', 60000.00),
(3, 'HR', 'Mike', 'Johnson', 45000.00),
(4, 'HR', 'Emily', 'Davis', 55000.00),
(5, 'IT', 'Chris', 'Brown', 70000.00),
(6, 'Sales', 'Alice', 'White', 60000.00),
(7, 'HR', 'Bob', 'Green', 55000.00);

SELECT 
    employee_id,
    first_name,
    last_name,
    department,
    salary,
    DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS dense_rank
FROM 
    employees;

SELECT 
    employee_id,
    first_name,
    last_name,
    department,
    salary,
    DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_rank
FROM 
    employees;
