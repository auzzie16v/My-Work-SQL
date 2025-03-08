SELECT * FROM work_sample.superstore;
# This query returns total sales and profit 
SELECT 
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM 
    SuperStore;
    # This query returns sales and profit by region
    SELECT 
    Region,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM 
    SuperStore
GROUP BY 
    Region
ORDER BY 
    Total_Sales DESC;
    # This query returns sales and profits by category 
    SELECT 
    Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM 
    SuperStore
GROUP BY 
    Category
ORDER BY 
    Total_Sales DESC;
    # This query returns top 10 products by sales
   SELECT 
    Product_Name,
    SUM(Sales) AS Total_Sales
FROM 
    SuperStore
GROUP BY 
    Product_Name
ORDER BY 
    Total_Sales DESC
LIMIT 10;
# Top 10 products by profit
SELECT 
Product_Name,
    SUM(Profit) AS Total_Profit
FROM 
    SuperStore
GROUP BY 
    Product_Name
ORDER BY 
    Total_Profit DESC
LIMIT 10;
# Sales and PRofit by Customer Segment
SELECT 
    Segment,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM 
    SuperStore
GROUP BY 
    Segment
ORDER BY 
    Total_Sales DESC;
    # Sales and Profit by State
    SELECT 
    State,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM 
    SuperStore
GROUP BY 
    State
ORDER BY 
    Total_Sales DESC;
    # Average Discount by Category
    SELECT 
    Category,
    AVG(Discount) AS Average_Discount
FROM 
    SuperStore
GROUP BY 
    Category
ORDER BY 
    Average_Discount DESC;
    # Number of orders by ship mode
    SELECT 
    Ship_Mode,
    COUNT(Order_ID) AS Number_of_Orders
FROM 
    SuperStore
GROUP BY 
    Ship_Mode
ORDER BY 
    Number_of_Orders DESC;
# Sales and Profit by Year
SELECT 
    YEAR(Order_Dates) AS Order_Year,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM 
    SuperStore
GROUP BY 
    YEAR(Order_Dates)
ORDER BY 
    Order_Year;
   # Customer Lifetime Value (CLV)
   SELECT 
    Customer_ID,
    Customer_Name,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM 
    SuperStore
GROUP BY 
    Customer_ID, Customer_Name
ORDER BY 
    Total_Sales DESC;
# Orders with negative profit
SELECT 
    Order_ID,
    Product_Name,
    Sales,
    Profit
FROM 
    SuperStore
WHERE 
    Profit < 0
ORDER BY 
    Profit ASC;
#Sales and Profit by Month
  SELECT 
    YEAR(Order_Dates) AS Order_Year,
    MONTH(Order_Dates) AS Order_Month,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM 
    SuperStore
GROUP BY 
    YEAR(Order_Dates), MONTH(Order_Dates)
ORDER BY 
    Order_Year, Order_Month;  
#Top 5 Customers by Sales
SELECT 
    Customer_Name,
    SUM(Sales) AS Total_Sales
FROM 
    SuperStore
GROUP BY 
    Customer_Name
ORDER BY 
    Total_Sales DESC
LIMIT 5;
#Sales and Profit by Sub-Category
SELECT 
    Sub_Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM 
    SuperStore
GROUP BY 
    Sub_Category
ORDER BY 
    Total_Sales DESC;
#Average Order Value 
SELECT 
    AVG(Sales) AS Average_Order_Value
FROM 
    SuperStore;
#Sales and Profit by City
SELECT 
    City,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM 
    SuperStore
GROUP BY 
    City
ORDER BY 
    Total_Sales DESC;
#Orders with High Discounts 
SELECT 
    Order_ID,
    Product_Name,
    Discount,
    Sales,
    Profit
FROM 
    SuperStore
WHERE 
    Discount > 0.5
ORDER BY 
    Discount DESC;
# Sales and Profit by Product ID
SELECT 
    Product_ID,
    Product_Name,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM 
    SuperStore
GROUP BY 
    Product_ID, Product_Name
ORDER BY 
    Total_Sales DESC;
# Sales and Profit by Postal Code
SELECT 
    Postal_Code,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM 
    SuperStore
GROUP BY 
    Postal_Code
ORDER BY 
    Total_Sales DESC;