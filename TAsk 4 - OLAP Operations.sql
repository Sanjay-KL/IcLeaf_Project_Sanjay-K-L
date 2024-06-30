
--Creating Sales table
CREATE TABLE sales_sample (
    Product_Id INT,
    Region VARCHAR(50),
    Date DATE,
    Sales_Amount INT
);

-- Inserting 10 sample records

INSERT INTO sales_sample (Product_Id, Region, Date, Sales_Amount) VALUES
(1, 'East', '2023-01-01', 500),(2, 'West', '2023-01-01', 250),(3, 'North', '2023-01-01', 450),
(4, 'South', '2023-01-01', 300),(5, 'East', '2022-01-01', 700),(6, 'West', '2021-01-01', 750),
(7, 'North', '2021-01-01', 210), (8, 'South', '2023-01-01', 900),(9, 'South', '2023-01-01', 600),
(10, 'East', '2021-01-01', 750);

--1) Drill Down
SELECT Product_Id, Region, Sales_Amount
FROM sales_sample
WHERE Region = 'West';

--2. Rollup

SELECT Region, SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
GROUP BY Region;

--3. Cube

SELECT Product_Id, Region, Date, SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
GROUP BY CUBE (Product_Id, Region, Date);


--4. Slice

SELECT * FROM sales_sample WHERE Region = 'East';


5.	Dice

SELECT * FROM sales_sample 
	WHERE Region = 'East' 
	AND Date BETWEEN '2022-01-01' AND '2023-01-31';


