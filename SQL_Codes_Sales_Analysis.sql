
-- Data Exploration
-- -----------------------------------------------------------------------------------

-- Total Transactions
SELECT COUNT(*) AS Total_Transactions
FROM transactions;

-- Transactions for Chennai market
SELECT *
FROM transactions
WHERE market_code="Mark001";

-- Distrinct product codes 
SELECT COUNT(distinct product_code) AS Distinct_products
FROM transactions;

-- Unique currencies
SELECT DISTINCT currency
FROM transactions;

-- Total sales with INR
SELECT COUNT(*) 
FROM transactions
WHERE currency="INR";

-- Total sales with USD
SELECT *
FROM transactions
WHERE currency="USD";

-- Revenue by Year
SELECT d.year,CONCAT(ROUND(SUM(sales_amount/1000000),2),"M") AS Revenue
FROM transactions t
JOIN date d
ON t.order_date=d.date
GROUP BY d.year;

-- Revenue by Month over Each Year
SELECT d.year,
MONTHNAME(d.cy_date) AS `Month`,
CONCAT(ROUND(SUM(sales_amount/1000000),2),"M") AS Revenue
FROM transactions t
JOIN date d
ON t.order_date=d.date
GROUP BY d.year,`Month`;

-- Revenue by Market
SELECT m.markets_name,
CONCAT(ROUND(SUM(sales_amount)/1000000,2)," M") AS Revenue
FROM transactions t
JOIN markets m
ON t.market_code = m.markets_code
GROUP BY m.markets_name
ORDER BY SUM(sales_amount) DESC;

-- Identifying missing data of products
SELECT DISTINCT product_code
FROM transactions
WHERE product_code NOT IN (SELECT DISTINCT product_code
FROM products);

SELECT DISTINCT T.product_code
FROM Transactions T
LEFT JOIN Products P
ON T.product_code = P.product_code
WHERE T.product_code NOT IN (SELECT product_code FROM products);

-- -----------------------------------------------------------------------------------

-- Analysis
-- -----------------------------------------------------------------------------------

-- 1. What is the total sales amount and quantity over time?

SELECT 
	d.year,
	CONCAT(ROUND(SUM(sales_amount/1000000),2)," M") AS Total_sales,
    CONCAT(ROUND(SUM(sales_qty/1000000),2)," M") AS Total_Sold_quantity
FROM transactions t 
JOIN date d 
ON t.order_date=d.date
GROUP BY d.year;

-- -----------------------------------------------------------------------------------

-- 2. Which products generate the highest and lowest revenue?

WITH CTE AS (
SELECT 
	product_code,SUM(sales_amount) AS Total_sales
FROM  transactions 
GROUP BY product_code
ORDER BY Total_sales DESC)
SELECT *
FROM CTE
WHERE Total_sales = (SELECT MAX(Total_sales) FROM CTE)
OR Total_sales = (SELECT MIN(Total_sales) FROM CTE);

    
-- 3. Highest revenue generating products by each year
WITH CTE AS (
SELECT 
	d.year,
    t.product_code,
    CONCAT(ROUND(SUM(t.sales_amount)/1000000,2)," M") AS Total_sales,
    RANK() OVER(PARTITION BY year ORDER BY year,SUM(t.sales_amount) DESC) AS rnk
FROM 
	transactions t  
JOIN date d 
ON t.order_date=d.date
GROUP BY 
	d.year,t.product_code)
SELECT year,product_code,Total_sales
FROM CTE 
WHERE rnk=1;
    
-- -----------------------------------------------------------------------------------

-- 4. Which customer type spends the most, and what is their average purchase value?

SELECT 
	c.customer_type, ROUND(AVG(t.sales_amount)) Average_purchase_value
FROM 
	transactions t 
JOIN
	customers c
ON t.customer_code=c.customer_code
GROUP BY 
	c.customer_type
ORDER BY 
	Average_purchase_value DESC;
 
 -- -----------------------------------------------------------------------------------
 
-- 5. What is the distribution of profit margins across different products?

SELECT 
	product_code,
    ROUND(AVG(profit_margin)) AS Avg_profit_margin
FROM 
	transactions
GROUP BY 
	product_code
ORDER BY Avg_profit_margin DESC;

-- -----------------------------------------------------------------------------------

-- 6. How do sales vary across different market zones?

SELECT m.zone, 
	CONCAT(ROUND(SUM(t.sales_amount)/1000000,2)," M") AS Total_sales,
    CONCAT(ROUND(SUM(t.sales_qty)/1000000,2)," M") AS Sold_quantity,
    ROUND(AVG(t.profit_margin)) AS Avg_Profit_margin
FROM 
	transactions t
JOIN 
	markets m 
ON t.market_code=m.markets_code
GROUP BY 
	m.zone
ORDER BY SUM(t.sales_amount) DESC;

-- -----------------------------------------------------------------------------------

-- 7. Which customers have made the most purchases, and what is their total spend?

SELECT 
    c.custmer_name,
    COUNT(c.customer_code) AS Total_Transactions,
	CONCAT(ROUND(SUM(t.sales_amount)/1000000,2)," M") AS Total_purchase_value
FROM 
	transactions t 
JOIN
	customers c
ON t.customer_code=c.customer_code
GROUP BY 
	c.custmer_name
ORDER BY SUM(t.sales_amount) DESC;

-- -----------------------------------------------------------------------------------

-- 8. What are the peak sales months, and how do they compare year-over-year?

SELECT 
	d.year,
	d.month_name,
    CONCAT(ROUND(SUM(t.sales_amount)/1000000,2)," M") AS Total_sales
FROM 
	transactions t 
JOIN 
	date d 
ON t.order_date=d.date
GROUP BY 
	d.year,
    d.month_name
ORDER BY d.year,SUM(t.sales_amount) DESC;

-- -----------------------------------------------------------------------------------

-- 9. How does the cost of goods sold (COGS) compare to total sales across products?

WITH CTE AS (
SELECT 
	product_code,
    SUM(sales_amount) Total_sales,
    ROUND(SUM(cost_price),2) Total_cost_price
FROM 
	transactions
GROUP BY
	product_code)
SELECT *,ROUND((Total_sales-Total_cost_price),2) AS Gross_Profit,
CASE
WHEN Total_sales>Total_cost_price THEN "Profit"
WHEN Total_sales<Total_cost_price THEN "Loss"
END AS Sales_Result
FROM CTE;

-- -----------------------------------------------------------------------------------

-- 10. What is the average profit margin per market, and which markets are most profitable?

SELECT 
	m.markets_name,
    ROUND(AVG(t.profit_margin),2) AS Avg_profit_margin
FROM 
	transactions t
JOIN 
	markets m 
ON t.market_code=m.markets_code
GROUP BY 
	m.markets_name
HAVING 
	Avg_profit_margin > 0
ORDER BY 
	Avg_profit_margin DESC;

-- -----------------------------------------------------------------------------------

-- 11. How has customer purchasing behavior changed over time?

SELECT 
	c.custmer_name,
    d.year,
    CONCAT(ROUND(SUM(t.sales_amount)/1000000,2)," M") AS Sales
FROM 
	transactions t
JOIN 
	customers c
ON t.customer_code=c.customer_code
JOIN 
	date d 
ON t.order_date=d.date
GROUP BY 
	c.custmer_name, d.year
ORDER BY c.custmer_name,d.year;

-- -----------------------------------------------------------------------------------

-- 12. What is the distribution of sales across different products?

SELECT 
	COALESCE(P.product_code, '[Blank]') AS product_code,
    SUM(t.sales_amount) AS Total_sales
FROM 
	transactions t 
LEFT JOIN 
	products p
ON t.product_code=p.product_code
GROUP BY 
	t.product_code
ORDER BY SUM(t.sales_amount) DESC;

-- -----------------------------------------------------------------------------------

-- 13. What is the distribution of sales across different product_type?

SELECT 
	COALESCE(P.product_type, '[Blank]') AS product_type,
    SUM(t.sales_amount) AS Total_sales
FROM 
	transactions t 
LEFT JOIN 
	products p
ON t.product_code=p.product_code
GROUP BY 
	p.product_type
ORDER BY SUM(t.sales_amount) DESC;

-- -----------------------------------------------------------------------------------