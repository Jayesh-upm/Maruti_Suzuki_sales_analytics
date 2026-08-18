\# Data Dictionary



\## Maruti Suzuki Sales \& Dealer Performance Analytics (2021–2025)



\### Purpose



This document defines the fields available in the three tables used for

the Maruti Suzuki Sales \& Dealer Performance Analytics project.



The dataset consists of:



\- `Sales` — transaction-level sales data

\- `Products` — product and model characteristics

\- `Dealers` — dealer and geographic characteristics



\---



\# 1. Sales Table



The `Sales` table contains transaction-level vehicle sales records for

the 2021–2025 analysis period.



| Column | Description | Logical Data Type | Role in Analysis |

|---|---|---|---|

| `SaleDate` | Date on which the vehicle sale transaction was recorded. | Date | Time-series analysis, trend analysis, forecasting |

| `InvoiceID` | Identifier associated with the sales transaction/invoice. | String | Transaction identification |

| `ProductID` | Identifier linking a sales transaction to the corresponding product in the `Products` table. | String | Product-level analysis and table relationship |

| `FuelType` | Fuel type associated with the vehicle sold. | Categorical | Product preference and configuration analysis |

| `Transmission` | Transmission type of the vehicle sold. | Categorical | Product preference and configuration analysis |

| `Color` | Vehicle colour associated with the transaction. | Categorical | Product configuration and customer preference analysis |

| `DealerCode` | Identifier linking the sales transaction to a dealer in the `Dealers` table. | String | Dealer and regional performance analysis |

| `Channel` | Sales channel through which the transaction was completed. | Categorical | Channel performance analysis |

| `UnitsSold` | Number of vehicle units represented by the transaction. | Numeric | Sales volume and demand analysis |

| `ExShowroomPrice` | Ex-showroom price associated with the vehicle transaction before applicable on-road costs. | Numeric | Pricing and revenue analysis |

| `DiscountApplied` | Discount applied to the vehicle transaction. | Numeric | Pricing and discount analysis |

| `OnRoadPrice` | On-road price associated with the vehicle transaction. | Numeric | Pricing and revenue analysis |

| `PaymentMode` | Payment method used for the transaction. | Categorical | Payment behaviour and customer experience analysis |

| `FinancePartner` | Financing/banking partner associated with the transaction where applicable. | Categorical | Financing analysis |

| `CustomerType` | Customer category associated with the transaction, such as Individual, Corporate or Fleet. | Categorical | Customer-segment analysis |

| `SatisfactionScore` | Customer satisfaction score associated with the transaction. | Numeric | Customer experience analysis |

| `BookingToDeliveryDays` | Number of days between vehicle booking and delivery. | Numeric | Operational efficiency and delivery analysis |



\---



\# 2. Products Table



The `Products` table contains product, model and variant characteristics

used to provide additional product-level information for sales

transactions.



| Column | Description | Logical Data Type | Role in Analysis |

|---|---|---|---|

| `ProductID` | Unique identifier for the product/variant and the key used to link the product to the Sales table. | String | Primary/candidate key and table relationship |

| `Model` | Vehicle model associated with the product. | Categorical | Model performance and demand analysis |

| `VariantCode` | Identifier representing the specific variant of a vehicle model. | Categorical | Variant-level analysis |

| `Segment` | Vehicle segment/category to which the model or variant belongs. | Categorical | Product mix and segment analysis |

| `BasePriceVariant` | Base price associated with the product variant. | Numeric | Product pricing analysis |

| `AvailableFuels` | Fuel types available for the corresponding product/variant. | Categorical/String | Product configuration analysis |



\---



\# 3. Dealers Table



The `Dealers` table contains dealer and geographic information used to

analyse dealer and regional sales performance.



| Column | Description | Logical Data Type | Role in Analysis |

|---|---|---|---|

| `DealerCode` | Unique identifier for the dealer and the key used to link dealer information to the Sales table. | String | Primary/candidate key and table relationship |

| `DealerName` | Name of the dealership. | Categorical/String | Dealer identification and performance analysis |

| `City` | City in which the dealer operates. | Categorical | Geographic and dealer analysis |

| `State` | State in which the dealer operates. | Categorical | Regional analysis |



\---



\# 4. Key Relationships



The dataset follows a relational structure in which the Sales table acts

as the central transaction table.



\### Sales → Products



`Sales.ProductID` → `Products.ProductID`



This relationship allows transaction-level sales records to be enriched

with model, variant and segment information.



\### Sales → Dealers



`Sales.DealerCode` → `Dealers.DealerCode`



This relationship allows transaction-level sales records to be

enriched with dealer and geographic information.







