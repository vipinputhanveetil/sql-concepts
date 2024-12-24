#Exercise:1
CREATE OR REPLACE TABLE monthly_sales(
  empid INT,
  dept TEXT,
  jan INT,
  feb INT,
  mar INT,
  apr INT
);

INSERT INTO monthly_sales VALUES
  (1, 'electronics', 100, 200, 300, 100),
  (2, 'clothes', 100, 300, 150, 200),
  (3, 'cars', 200, 400, 100, 50),
  (4, 'appliances', 100, NULL, 100, 50);
  
SELECT * FROM monthly_sales;

SELECT *
  FROM monthly_sales
    UNPIVOT (sales FOR month IN (jan, feb, mar, apr))
  ORDER BY empid;
  
SELECT *
  FROM monthly_sales
    UNPIVOT INCLUDE NULLS (sales FOR month IN (jan, feb, mar, apr))
  ORDER BY empid;


#Exercise:2
CREATE TABLE sales (
    Product VARCHAR(50),
    Q1 INT,
    Q2 INT,
    Q3 INT,
    Q4 INT
);

INSERT INTO sales (Product, Q1, Q2, Q3, Q4)
VALUES 
('ProductA', 100, 150, 200, 250),
('ProductB', 300, 350, 400, 450);

SELECT * FROM sales;

SELECT 
    product,
    quarter,
    salesAmount
FROM
    (SELECT Product, Q1, Q2, Q3, Q4 FROM sales) 
    AS sourcetable
UNPIVOT
    (salesamount FOR quarter IN (Q1, Q2, Q3, Q4)) 
    AS unpivotedtable;
