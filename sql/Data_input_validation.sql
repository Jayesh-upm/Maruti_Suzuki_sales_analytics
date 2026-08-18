USE MarutiSalesAnalytics;
GO

SELECT*
FROM sales.Sales_data;

SELECT*
FROM sales.Dealers;

SELECT*
FROM sales.Products;

-- validating the row count to see if it matches 
SELECT COUNT(*) AS salesRows 
FROM sales.Sales_data;
SELECT COUNT(*) AS ProductRows
FROM sales.Products;
SELECT COUNT(*) AS DealerRows
FROM sales.Dealers;

-- Checking for the duplicate invoice id 
SELECT InvoiceID,COUNT(*)
FROM sales.sales_data
GROUP BY InvoiceID
HAVING COUNT(*)>1

-- validating the table relationship between sales and products
-- checking the out of catrgory product ID
SELECT COUNT(*) AS UnmatchedProducts
FROM sales.Sales_data s
LEFT JOIN sales.Products p
    ON s.ProductID = p.ProductID
WHERE s.ProductID IS NOT NULL
  AND p.ProductID IS NULL;

-- validating the table relationship between sales and the dealers 
SELECT COUNT(*) AS UnmatchedDealers
FROM sales.Sales_data s
LEFT JOIN sales.Dealers d
    ON s.DealerCode = d.DealerCode
WHERE s.DealerCode IS NOT NULL
  AND d.DealerCode IS NULL;

/* so there is no missing relationship between the data and it needs
so it is good to go further */
