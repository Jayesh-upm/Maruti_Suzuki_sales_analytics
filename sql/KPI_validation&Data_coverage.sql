USE MarutiSalesAnalytics;
GO 

/* Now lets check upon the KPI defined*/
-- sales value when summed up encounter overflow so change
-- casting of the salesvalue into bigint 


SELECT
    MIN(SaleDate) AS FirstSaleDate,
    MAX(SaleDate) AS LastSaleDate,
    SUM(UnitsSold) AS TotalUnitsSold,
    AVG(CAST(ExShowroomPrice AS BIGINT)) AS AvgExShowroomPrice,
    SUM(CAST(SalesValue AS BIGINT)) AS TotalSalesValue,
    AVG(CAST(DiscountApplied AS BIGINT)) AS AvgDiscount,
    AVG(SatisfactionScore) AS AvgSatisfaction,
    AVG(BookingToDeliveryDays) AS AvgDeliveryDays
FROM sales.sales_data;
-- sales value when summed up encounter overflow so change

-- checking back the data coverage issue and dropping the 2025 data for further analysis 
SELECT
    YEAR(SaleDate) AS SaleYear,
    MIN(SaleDate) AS FirstSaleDate,
    MAX(SaleDate) AS LastSaleDate,
    COUNT(*) AS RecordCount
FROM sales.sales_data
GROUP BY YEAR(SaleDate)
ORDER BY SaleYear;

-- Creating a duplicate table with further usage for the analyss 
-- CREATE VIEW sales.sales_analysis AS
/*SELECT *
FROM sales.sales_data
WHERE YEAR(SaleDate)!= 2025;*/

-- product and customer preference over 5 years and to study the change in every year 
SELECT
    p.Segment,
    SUM(s.UnitsSold) AS TotalUnitsSold,
    SUM(s.SalesValue) AS TotalSalesValue
FROM sales.sales_analysis s
JOIN sales.Products p
    ON s.ProductID = p.ProductID
GROUP BY p.Segment
ORDER BY TotalUnitsSold DESC;

SELECT
    YEAR(s.SaleDate) AS Year,
    p.Segment,
    SUM(s.UnitsSold) AS TotalUnitsSold,
    SUM(s.SalesValue) AS TotalSalesValue
FROM sales.sales_analysis s
JOIN sales.Products p
    ON s.ProductID = p.ProductID
GROUP BY YEAR(s.SaleDate),p.Segment
ORDER BY Year ASC, TotalUnitsSold DESC;