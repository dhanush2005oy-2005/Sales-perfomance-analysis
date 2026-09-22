USE sales_analysis;

-- 1. Total Sales and Profit
SELECT
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit
FROM superstore;


-- 2. Sales and Profit by Category
SELECT
    Category,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit
FROM superstore
GROUP BY Category
ORDER BY SUM(Sales) DESC;


-- 3. Sales and Profit by Region
SELECT
    Region,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit
FROM superstore
GROUP BY Region
ORDER BY SUM(Profit) DESC;


-- 4. Sales and Profit by Segment
SELECT
    Segment,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit
FROM superstore
GROUP BY Segment
ORDER BY SUM(Sales) DESC;


-- 5. Top 10 Products by Sales
SELECT
    `Product Name`,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit
FROM superstore
GROUP BY `Product Name`
ORDER BY SUM(Sales) DESC
LIMIT 10;


-- 6. Top 10 Products by Profit
SELECT
    `Product Name`,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit
FROM superstore
GROUP BY `Product Name`
ORDER BY SUM(Profit) DESC
LIMIT 10;


-- 7. Loss-Making Sub-Categories
SELECT
    `Sub-Category`,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit
FROM superstore
GROUP BY `Sub-Category`
HAVING SUM(Profit) < 0
ORDER BY SUM(Profit) ASC;


-- 8. Top 10 Customers by Sales
SELECT
    `Customer Name`,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit
FROM superstore
GROUP BY `Customer Name`
ORDER BY SUM(Sales) DESC
LIMIT 10;


-- 9. Top 10 Customers by Profit
SELECT
    `Customer Name`,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit
FROM superstore
GROUP BY `Customer Name`
ORDER BY SUM(Profit) DESC
LIMIT 10;


-- 10. Monthly Sales Trend
SELECT
    YEAR(STR_TO_DATE(`Order Date`, '%d-%m-%Y')) AS order_year,
    MONTH(STR_TO_DATE(`Order Date`, '%d-%m-%Y')) AS order_month,
    SUM(Sales) AS total_sales
FROM superstore
GROUP BY
    YEAR(STR_TO_DATE(`Order Date`, '%d-%m-%Y')),
    MONTH(STR_TO_DATE(`Order Date`, '%d-%m-%Y'))
ORDER BY
    YEAR(STR_TO_DATE(`Order Date`, '%d-%m-%Y')),
    MONTH(STR_TO_DATE(`Order Date`, '%d-%m-%Y'));


-- 11. Profit Margin by Category
SELECT
    Category,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit,
    (SUM(Profit) / SUM(Sales)) * 100 AS profit_margin
FROM superstore
GROUP BY Category
ORDER BY profit_margin DESC;


-- 12. Sales and Profit by Ship Mode
SELECT
    `Ship Mode`,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit
FROM superstore
GROUP BY `Ship Mode`
ORDER BY SUM(Sales) DESC;


-- 13. Average Discount by Category
SELECT
    Category,
    AVG(Discount) AS average_discount,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit
FROM superstore
GROUP BY Category
ORDER BY average_discount DESC;


-- 14. Yearly Sales and Profit
SELECT
    YEAR(STR_TO_DATE(`Order Date`, '%d-%m-%Y')) AS order_year,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit
FROM superstore
GROUP BY YEAR(STR_TO_DATE(`Order Date`, '%d-%m-%Y'))
ORDER BY order_year;
