CREATE OR REPLACE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

CREATE OR REPLACE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INT,
    manager_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (manager_id) REFERENCES employees(employee_id)
);

-- Insert data into departments
INSERT INTO departments (department_id, department_name) VALUES
(1, 'Human Resources'),
(2, 'Finance'),
(3, 'Engineering');

-- Insert data into employees
INSERT INTO employees (employee_id, employee_name, salary, department_id, manager_id) VALUES
(1, 'Alice', 80000, 1, NULL),
(2, 'Bob', 90000, 2, NULL),
(3, 'Charlie', 75000, 2, 2),
(4, 'David', 70000, 3, NULL),
(5, 'Eve', 95000, 3, 4),
(6, 'Frank', 85000, 3, 4),
(7, 'Grace', 90000, 2, 2);

WITH avg_salaries AS
(
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
)
SELECT e.employee_id, e.employee_name, e.salary, a.avg_salary
FROM employees e
JOIN avg_salaries a
ON e.department_id = a.department_id
WHERE e.salary > a.avg_salary;

WITH employee_hierarchy AS
(
    SELECT employee_id, employee_name, manager_id
    FROM employees
    WHERE manager_id IS NULL
    UNION ALL
    SELECT e.employee_id, e.employee_name, e.manager_id
    FROM employees e
    JOIN employee_hierarchy eh
    ON e.manager_id = eh.employee_id
)
SELECT * FROM employee_hierarchy;


