# Data Quality Report

## Maruti Suzuki Sales & Dealer Performance Analytics

**Data Coverage:** January 2020 – December 2025  
**Primary Analytical Period:** 2021–2024

---

## 1. Purpose

This document records the data-quality assessment and preprocessing performed on the Sales, Products, and Dealers tables before SQL analysis, exploratory analysis, dashboard development, and predictive modelling.

The assessment covers:

- Dataset structure and dimensions
- Data types
- Missing values
- Missingness patterns
- Formatting inconsistencies
- Identifier validation
- Table relationships
- Data cleaning decisions
- Temporal data coverage
- Post-cleaning validation
- Analytical limitations

The objective was to preserve valid information while ensuring that the processed dataset is suitable for business and statistical analysis.

---

# 2. Dataset Structure

The project contains three relational tables.

| Table | Rows | Columns | Analytical Role |
|---|---:|---:|---|
| Sales | 800,000 | 17 | Transaction-level sales data |
| Products | 57 | 6 | Product dimension |
| Dealers | 16 | 4 | Dealer and geographic dimension |

The `Sales` table is the primary transaction table.

The `Products` and `Dealers` tables provide additional product and geographic attributes through `ProductID` and `DealerCode`.

---

# 3. Data Type Assessment

Data types were reviewed for all columns to determine whether they were appropriate for their analytical purpose.

## 3.1 ExShowroomPrice

`ExShowroomPrice` was initially stored as a string rather than a numeric field.

The column contained currency encoding artifacts such as:

`â‚¹`

This prevented direct numerical calculations.

### Treatment

Currency encoding artifacts and unnecessary whitespace were removed, after which the column was converted to a numeric data type.

This allows the field to be used for pricing and sales-value analysis.

---

## 3.2 BookingToDeliveryDays

`BookingToDeliveryDays` was initially stored as `float64`, although delivery duration is conceptually measured in whole days.

The presence of missing values explains the floating-point representation, because pandas uses `NaN` for missing numerical observations.

### Treatment

The field was retained as a numeric column.

Missing values were investigated rather than automatically removed.

---

## 3.3 SaleDate

`SaleDate` was standardized into a consistent datetime format.

This is required for:

- Yearly analysis
- Quarterly analysis
- Monthly analysis
- Trend analysis
- Forecasting

Derived time features such as Year, Quarter, Month, and Month Number can be created during the analytical stage.

---

# 4. Missing Value Assessment

Missing values were assessed using both:

- Absolute missing-value counts
- Missing-value percentages

Missing values were not automatically treated as errors.

For each affected field, the following were considered:

1. How many observations are missing?
2. What proportion of the dataset is affected?
3. Is missingness associated with other observed variables?
4. Does the field remain useful when missing?
5. Should the entire record be removed, or should the record only be excluded from a specific analysis?

This approach prevents unnecessary loss of valid sales information.

---

# 5. Booking-to-Delivery Missingness

`BookingToDeliveryDays` contained **1,530 missing observations**.

Because delivery time is required only for specific customer-experience and operational analyses, these records were not treated as invalid sales transactions.

### Analytical treatment

| Analysis | Treatment |
|---|---|
| Sales analysis | Retain all valid sales records |
| Product analysis | Retain all valid sales records |
| Dealer analysis | Retain all valid sales records |
| Delivery-time analysis | Use records with available delivery time |
| Delivery vs satisfaction analysis | Use records where both variables are available |

This preserves valid sales information while maintaining analytical validity for delivery-related analysis.

---

# 6. Statistical Investigation of Missingness

Missingness was investigated beyond simple null counts.

Categorical variables were assessed using Chi-square-based comparisons, while numerical variables were assessed using the Mann–Whitney U test where appropriate.

Temporal patterns were also examined.

Because multiple statistical tests were performed, the Benjamini–Hochberg False Discovery Rate (FDR) procedure was used to reduce the risk of false-positive findings.

### Interpretation

A statistically significant relationship between missingness and another variable indicates that missingness is associated with that variable.

It does **not** by itself establish causality or prove that the data are Missing Not At Random (MNAR).

---

# 7. FinancePartner Missingness

`FinancePartner` was investigated in relation to `PaymentMode`.

Missing finance-partner information may be structurally expected when a transaction does not involve vehicle financing.

Therefore, missing `FinancePartner` values were not automatically classified as data-quality errors.

The relationship between `PaymentMode` and `FinancePartner` was considered when interpreting the missingness.

---

# 8. ProductID Assessment

`ProductID` is required to connect Sales transactions with the Products dimension.

A missing `ProductID` prevents reliable identification of:

- Model
- Variant
- Product segment
- Product specifications

Therefore, records with missing `ProductID` were excluded from the processed product-level dataset.

### Business justification

Removing these records protects the validity of model-, variant-, and segment-level analysis.

The trade-off is the loss of a small number of transaction records.

---

# 9. InvoiceID Assessment

`InvoiceID` was assessed as the transaction identifier.

After preprocessing:

- No duplicate InvoiceIDs were identified.
- InvoiceID can therefore be used as the transaction-level identifier.

The uniqueness of InvoiceID is important when calculating transaction counts.

However, `UnitsSold` can be greater than one.

Therefore:

- Transaction count → `COUNT(InvoiceID)`
- Vehicle sales → `SUM(UnitsSold)`

A row represents one transaction/invoice, but not necessarily one vehicle.

---

# 10. Relationship Validation

The relationships between the Sales fact table and the Products and Dealers dimension tables were validated.

## Sales → Products

Validation results:

- `Products.ProductID` is unique.
- Duplicate ProductIDs: **0**
- Unmatched non-null ProductIDs in Sales: **0**

Therefore, `Sales.ProductID` can reliably reference `Products.ProductID`.

## Sales → Dealers

Validation results:

- `Dealers.DealerCode` is unique.
- Duplicate DealerCodes: **0**
- Unmatched non-null DealerCodes in Sales: **0**

Therefore, `Sales.DealerCode` can reliably reference `Dealers.DealerCode`.

### Validated Data Model

```text
Products (1) ──────── (*) Sales (*) ──────── (1) Dealers
       ProductID                    DealerCode
```

The validated structure supports the use of Products and Dealers as dimension tables connected to the transaction-level Sales table.

---

# 11. Sales Table Grain

The grain of the Sales table was validated using `InvoiceID` and `UnitsSold`.

`InvoiceID` contains unique values, indicating that each row represents one sales transaction/invoice.

However, `UnitsSold` can be greater than one.

Therefore:

> One row = one transaction, not necessarily one vehicle.

### KPI implications

**Transaction count**

```text
COUNT(InvoiceID)
```

**Vehicle/unit sales**

```text
SUM(UnitsSold)
```

This distinction will be maintained throughout the SQL, Python, and Power BI analysis.

---

# 12. Temporal Data Coverage

The Sales dataset contains transactions from:

**4 January 2020 to 3 December 2025**

The number of records is not evenly distributed across the period.

The data shows:

- Lower coverage during 2020
- Relatively stable coverage during 2021–2024
- Reduced coverage during 2025
- A particularly large reduction in transaction volume from April 2025 onward

The reduction was also observed across dealers, products, and channels.

Therefore, the reduction does not appear to be concentrated in a specific dealer, product, or sales channel.

### Analytical implication

2021–2024 will be treated as the **primary comparable historical period** for full-year trend analysis.

2025 will be treated as a **limited-coverage/recent period**.

Raw 2025 totals should therefore not be directly compared with complete historical years without accounting for the difference in data coverage.

This is particularly important for forecasting, where the reduced 2025 coverage should not automatically be interpreted as a genuine decline in market demand.

---

# 13. Data Cleaning Summary

| Issue | Field | Treatment | Reason |
|---|---|---|---|
| Incorrect data type | ExShowroomPrice | Converted to numeric | Required for pricing analysis |
| Currency encoding | ExShowroomPrice | Removed encoding artifact | Enabled numerical conversion |
| Missing values | BookingToDeliveryDays | Investigated and retained | Missing delivery time does not invalidate the transaction |
| Missing values | FinancePartner | Investigated with PaymentMode | Missingness may be structurally expected |
| Missing key | ProductID | Excluded from product-level processed dataset | Required for product relationship |
| Transaction identifier | InvoiceID | Validated | Required for transaction traceability |
| Date inconsistency | SaleDate | Standardized to datetime | Required for time-series analysis |
| Uneven temporal coverage | 2025 | Flagged as limited coverage | Prevents misleading year-over-year comparison |

---

# 14. Post-Cleaning Validation

After preprocessing, the dataset was rechecked to ensure that:

- Expected tables remained available.
- Column names were preserved.
- Data types were appropriate.
- Numeric fields could be used in calculations.
- Date fields supported time-based analysis.
- ProductID could connect Sales with Products.
- DealerCode could connect Sales with Dealers.
- InvoiceID had no duplicates.
- Remaining missing values were understood.
- Sales table grain was established.
- The dataset remained suitable for downstream analysis.

---

# 15. Data Limitations

Several limitations should be considered when interpreting the results.

## 15.1 Revenue Definition

The project uses `ExShowroomPrice` as the basis for vehicle sales value.

`OnRoadPrice` includes additional charges such as taxes and registration and is therefore not used as the primary vehicle sales-value measure.

The project KPI is:

```text
Vehicle Sales Value = ExShowroomPrice × UnitsSold
```

---

## 15.2 Forecasting Granularity

Although the dataset contains several years of data, forecasting every combination of model, colour, fuel type, transmission, and dealer may result in insufficient observations.

Forecasting granularity will therefore be selected based on historical data volume and coverage.

---

## 15.3 Variant Introduction

The dataset does not necessarily contain an explicit variant launch date or predecessor relationship.

Therefore, claims about the success of a "new variant" should only be made where its introduction can be reliably established.

---

## 15.4 Causality

The dataset is observational.

Relationships between variables such as discount, sales, delivery time, and customer satisfaction should be interpreted as **associations**, not automatically as causal effects.

---

## 15.5 Inventory

Actual inventory or stock-level information is not available.

Therefore, inventory recommendations will be based on observed and forecasted demand rather than actual stock availability.

---

## 15.6 Market Share

Actual automotive market share cannot be calculated using this dataset alone because external market-sales data are not available.

The project can calculate **sales mix within the dataset**, but this should not be described as actual market share.

---

## 15.7 Customer-Level Analysis

There is no `CustomerID` in the available schema.

Therefore, customer analysis is based on transaction-level information and categories such as `CustomerType`, rather than individual customer purchase histories.

---

# 16. Overall Data Quality Assessment

The dataset is considered **suitable for the planned analytics project after preprocessing and validation**.

The main quality issues identified were:

- Data-type inconsistencies
- Currency/formatting artifacts
- Missing values
- Missing identifiers
- Date-format inconsistencies
- Uneven temporal coverage

The analysis followed a targeted approach rather than deleting all records containing missing values.

Missing values were investigated according to their business meaning and analytical impact.

The Sales–Products and Sales–Dealers relationships were successfully validated, and the Sales table grain was established.

The processed dataset can therefore proceed to the **SQL analysis layer**.

Before analysis, KPI definitions should be applied consistently across SQL, Python, and Power BI.
