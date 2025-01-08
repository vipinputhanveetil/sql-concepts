CREATE OR REPLACE TABLE sales_data (
    product VARCHAR(50),
    region VARCHAR(50),
    sales INT
);

INSERT INTO sales_data (product, region, sales)
VALUES
('A', 'North', 100),
('A', 'South', 150),
('B', 'North', 200),
('B', 'South', 250),
('C', 'North', 300),
('C', 'South', 350);

SELECT * FROM sales_data;

SELECT Product, 'North' AS north_sales, 'South' AS south_sales
FROM 
(
    SELECT Product, Region, Sales
    FROM SalesData
) AS SourceTable
PIVOT 
(
    SUM(Sales) 
    FOR Region IN ('North', 'South')
) AS PivotTable;

