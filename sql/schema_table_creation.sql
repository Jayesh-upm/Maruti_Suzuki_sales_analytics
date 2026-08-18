-- Create database and switch to it
CREATE DATABASE MarutiSalesAnalytics;
GO

USE MarutiSalesAnalytics;
GO

-- Create schema
CREATE SCHEMA sales;
GO

-- Create tables with primary keys
CREATE TABLE sales.Sales_data (
    SaleDate DATETIME,
    InvoiceID VARCHAR(100) NOT NULL,
    ProductID VARCHAR(100) NOT NULL,
    FuelType VARCHAR(50),
    Transmission VARCHAR(50),
    Color VARCHAR(50),
    DealerCode VARCHAR(50),
    Channel VARCHAR(50),
    UnitsSold INT,
    ExShowroomPrice INT,
    DiscountApplied INT,
    OnRoadPrice INT,
    PaymentMode VARCHAR(50),
    FinancePartner VARCHAR(100),
    CustomerType VARCHAR(50),
    SatisfactionScore INT,
    BookingToDeliveryDays INT,
    Year INT,
    Month INT,
    SalesValue BIGINT,

    CONSTRAINT PK_Sales_Data PRIMARY KEY (InvoiceID)
);
GO

CREATE TABLE sales.Products (
    ProductID VARCHAR(100) NOT NULL,
    Model VARCHAR(100),
    VariantCode VARCHAR(50),
    Segment VARCHAR(50),
    BasePriceVariant INT,
    AvailableFuels VARCHAR(100),

    CONSTRAINT PK_Products PRIMARY KEY (ProductID)
);
GO

CREATE TABLE sales.Dealers (
    DealerCode VARCHAR(50) NOT NULL,
    DealerName VARCHAR(150),
    City VARCHAR(100),
    State VARCHAR(100),

    CONSTRAINT PK_Dealers PRIMARY KEY (DealerCode)
);
GO

-- Verify creation
SELECT * 
FROM sales.Sales_data;

SELECT * 
FROM sales.Dealers;

SELECT * 
FROM sales.Products;