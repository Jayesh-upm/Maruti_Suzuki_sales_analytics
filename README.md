# Maruti Suzuki Sales & Dealer Performance Analytics

> **End-to-end sales analytics project using Python, SQL, and Power BI to evaluate product performance, customer preferences, dealer efficiency, pricing, discounts, delivery performance, and customer satisfaction.**

---

## 📌 Project Overview

This project analyzes **Maruti Suzuki sales and dealer performance data from 2021–2025** to identify patterns in product demand, customer preferences, pricing, discounts, dealer performance, delivery timelines, and customer satisfaction.

The project follows a business analytics workflow:

**Business Understanding → Data Quality Assessment → Data Cleaning → Exploratory Data Analysis → SQL Analysis → KPI Development → Dashboarding → Business Insights → Recommendations**

The objective is not only to understand what happened in historical sales, but also to identify **drivers of sales performance and opportunities for business improvement**.

---

## 🎯 Business Problem

Automotive sales performance is influenced by several interconnected factors, including:

- Product/model preference
- Product specifications and segments
- Pricing and discounts
- Dealer performance
- Customer type
- Booking-to-delivery time
- Customer satisfaction
- Sales trends over time

A structured analysis is required to understand these relationships and provide actionable insights for sales and business decision-makers.

### Core Business Objective

> **Analyze sales, product, dealer, pricing, delivery, and customer data to identify the major drivers of unit sales and customer satisfaction, evaluate dealer performance, and support data-driven sales and operational decisions.**

---

# 🔎 Business Questions

The analysis is designed to answer the following business questions.

### 1. Product & Customer Preference

- Which product segments, models, and specifications contribute most and least to unit sales?
- How has the product mix changed from **2021–2025**?
- Which products demonstrate sustained demand versus declining demand?
- Which customer types contribute most to sales?
- Are customer preferences changing over time?

### 2. Sales Performance

- How have unit sales changed from 2021–2025?
- Which months/quarters show the highest and lowest sales?
- Are there identifiable seasonal sales patterns?
- Which products contribute most to total units sold?
- Which dealers generate the highest sales volumes?

### 3. Pricing & Discounts

- How does discounting vary across products and dealers?
- Is there an observable relationship between discounts and unit sales?
- Which products require higher discounts to generate sales?
- Are higher discounts associated with improved sales performance?

### 4. Dealer Performance

- Which dealers consistently perform above or below the overall average?
- Which dealers contribute the most units sold?
- Are there differences in performance across customer types or products?
- Which dealers may require additional attention or intervention?

### 5. Delivery Performance

- How does **BookingToDeliveryDays** vary across products and dealers?
- Which dealers have the shortest and longest delivery timelines?
- Is longer delivery time associated with lower customer satisfaction?
- Are certain products associated with longer delivery periods?

### 6. Customer Satisfaction

- What factors are associated with customer satisfaction?
- Does booking-to-delivery time influence satisfaction?
- Is there a relationship between discounts and satisfaction?
- Which products/dealers have higher or lower satisfaction scores?

---

# 📊 Dataset

The dataset contains sales, product, and dealer-level information covering the period **2021–2025**.

The project uses three primary tables/sheets:

### 1. Products

Contains information about the vehicles/products being sold.

Example attributes include:

- ProductID
- Product/model information
- Product segment
- Product specifications

### 2. Dealers

Contains information related to dealerships.

Example attributes include:

- DealerCode
- Dealer information
- Location/region-related attributes

### 3. Sales

Contains individual sales transactions.

Important fields include:

| Column | Description |
|---|---|
| `SaleDate` | Date on which the sale was recorded |
| `InvoiceID` | Unique sales/invoice identifier |
| `ProductID` | Identifier linking the sale to a product |
| `DealerCode` | Identifier linking the sale to a dealer |
| `UnitsSold` | Number of units sold |
| `ExShowroomPrice` | Ex-showroom price of the product |
| `DiscountApplied` | Discount applied to the transaction |
| `OnRoadPrice` | On-road price |
| `CustomerType` | Type/category of customer |
| `SatisfactionScore` | Customer satisfaction score |
| `BookingToDeliveryDays` | Number of days between booking and delivery |

> **Note:** The exact dataset schema and additional fields are documented in the project files as the analysis progresses.

---

# 🧹 Data Quality & Preparation

Before conducting the analysis, the dataset is assessed for common data-quality issues.

### Data quality checks include:

- Missing values
- Duplicate records
- Invalid dates
- Incorrect data types
- Outliers
- Inconsistent categorical values
- Invalid numerical values
- Referential integrity between tables
- Potentially invalid identifiers

### Missing Data Analysis

Missing values are not automatically replaced without understanding their underlying pattern.

The analysis considers:

- Missing-value frequency
- Missingness by variable
- Missingness across relevant groups
- Potential MCAR/MAR-related patterns where appropriate
- Business implications of missing observations

For example, `SatisfactionScore` contains missing observations and is therefore evaluated before deciding on an appropriate treatment strategy.

---

# 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| **Python** | Data cleaning, EDA, statistical analysis |
| **Pandas** | Data manipulation |
| **NumPy** | Numerical analysis |
| **Matplotlib / Seaborn** | Data visualization |
| **SQL** | Business-oriented querying and KPI analysis |
| **Power BI** | Interactive dashboard development |
| **Excel** | Data inspection and supporting analysis |
| **Git & GitHub** | Version control and project documentation |

---

# 🔄 Project Workflow

```text
Raw Dataset
     ↓
Data Understanding
     ↓
Business Understanding
     ↓
Data Quality Assessment
     ↓
Data Cleaning & Transformation
     ↓
Exploratory Data Analysis
     ↓
SQL Business Analysis
     ↓
KPI Development
     ↓
Statistical / Relationship Analysis
     ↓
Power BI Dashboard
     ↓
Business Insights
     ↓
Recommendations
```

---

# 📈 Key Performance Indicators

The following KPIs are considered for evaluating sales and business performance.

### Sales KPIs

- **Total Units Sold**
- **Number of Transactions**
- **Average Units per Transaction**
- **Year-over-Year Sales Growth**
- **Monthly/Quarterly Sales**
- **Product Contribution to Total Sales**
- **Dealer Contribution to Total Sales**

### Pricing KPIs

- Average Ex-Showroom Price
- Average Discount
- Average On-Road Price
- Discount-to-Price Ratio

### Customer KPIs

- Average Satisfaction Score
- Satisfaction by Product
- Satisfaction by Dealer
- Satisfaction by Customer Type

### Operational KPIs

- Average Booking-to-Delivery Days
- Median Booking-to-Delivery Days
- Delivery performance by dealer
- Delivery performance by product

---

# 📊 Exploratory Data Analysis

The exploratory analysis investigates the distribution and relationships of important variables.

### Time-Series Analysis

Sales are analyzed across:

- Year
- Quarter
- Month
- Product
- Dealer

This helps identify:

- Growth/decline trends
- Seasonality
- Product mix changes
- Periods of unusually high or low sales

### Product Analysis

Product-level analysis focuses on:

- Unit sales
- Market contribution within the dataset
- Product segment
- Product specifications
- Pricing
- Discounting
- Customer satisfaction

### Dealer Analysis

Dealer performance is evaluated using:

- Total units sold
- Sales contribution
- Average discount
- Average delivery time
- Customer satisfaction
- Product mix

### Customer Analysis

Customer-level analysis evaluates:

- Customer type
- Purchase patterns
- Product preferences
- Satisfaction
- Delivery experience

---

# 🔍 Analytical Areas

## 1. Product Mix Analysis

The analysis evaluates how the contribution of different products and product segments changes over time.

Example questions:

```text
Which products dominate sales?

Which products are losing share?

Is the company becoming more dependent on a particular segment?

Are premium/lower-volume products gaining or losing demand?
```

---

## 2. Sales Trend Analysis

Historical sales are examined to identify changes in demand.

Key dimensions:

```text
Year
 ├── Quarter
 │    └── Month
 │
 ├── Product
 │
 └── Dealer
```

The objective is to distinguish between:

- Long-term growth
- Short-term fluctuations
- Seasonal patterns
- Product-specific trends

---

## 3. Discount vs Sales Analysis

The relationship between discounting and sales volume is evaluated to understand whether greater discounts are associated with increased sales.

However, **correlation will not automatically be interpreted as causation**.

Potential confounding factors such as:

- Product popularity
- Dealer characteristics
- Time period
- Customer type
- Pricing

must be considered before drawing business conclusions.

---

## 4. Delivery Time vs Satisfaction

The relationship between:

**Booking-to-Delivery Days → Customer Satisfaction**

is analyzed to determine whether longer delivery times are associated with lower satisfaction.

Potential analyses include:

- Correlation analysis
- Group comparison
- Satisfaction distribution by delivery-time bands
- Product-level comparison
- Dealer-level comparison

---

## 5. Dealer Performance Analysis

Dealers are compared using multiple dimensions rather than sales volume alone.

A dealer performance framework may include:

```text
Sales Volume
     +
Customer Satisfaction
     +
Delivery Performance
     +
Discount Efficiency
     +
Product Mix
```

This prevents high-volume dealers from automatically being considered the best-performing dealers.

---

# 🧮 SQL Analysis

SQL is used to answer business questions and demonstrate practical analytics skills.

Example analyses include:

- Monthly sales
- Yearly sales growth
- Top-performing products
- Bottom-performing products
- Dealer rankings
- Product contribution
- Average discounts
- Customer satisfaction
- Delivery performance
- Ranking using window functions
- Year-over-year comparisons

Example SQL concepts used:

```sql
GROUP BY
ORDER BY
CASE WHEN
JOIN
CTE
WINDOW FUNCTIONS
RANK()
ROW_NUMBER()
LAG()
SUM()
AVG()
COUNT()
```

---

# 📊 Power BI Dashboard

The final dashboard is designed for sales and business stakeholders.

### Planned Dashboard Sections

#### Executive Overview

Displays:

- Total Units Sold
- Sales Trend
- Top Products
- Top Dealers
- Average Satisfaction
- Average Delivery Time

#### Product Performance

Includes:

- Product ranking
- Segment contribution
- Product trend
- Product mix evolution

#### Dealer Performance

Includes:

- Dealer ranking
- Units sold
- Satisfaction
- Delivery performance
- Discounting

#### Customer & Operations

Includes:

- Customer type distribution
- Satisfaction analysis
- Delivery-time analysis
- Discount vs satisfaction/sales relationships

---

# 💡 Business Insights

> **This section will be updated after completing the final analysis. No business findings are pre-populated without analytical evidence.**

The final version will document findings in the following format:

### Finding 1 — Product Performance

**Observation:**  
[Insert evidence-based finding]

**Evidence:**  
[Metric / percentage / trend]

**Business implication:**  
[What this means for the business]

**Recommendation:**  
[Recommended action]

---

### Finding 2 — Sales Trend

**Observation:**  
[Insert evidence-based finding]

**Evidence:**  
[Metric / trend]

**Business implication:**  
[Business interpretation]

**Recommendation:**  
[Recommended action]

---

### Finding 3 — Dealer Performance

**Observation:**  
[Insert evidence-based finding]

**Evidence:**  
[Relevant KPI comparison]

**Business implication:**  
[Business interpretation]

**Recommendation:**  
[Recommended action]

---

### Finding 4 — Customer Satisfaction

**Observation:**  
[Insert evidence-based finding]

**Evidence:**  
[Relevant statistical/KPI evidence]

**Business implication:**  
[Business interpretation]

**Recommendation:**  
[Recommended action]

---

# 🎯 Expected Business Outcomes

The analysis aims to help stakeholders:

- Identify high-performing and underperforming products
- Understand changes in product mix
- Identify important customer preferences
- Evaluate dealer performance
- Understand the role of discounting in sales
- Identify potential delivery bottlenecks
- Understand factors associated with customer satisfaction
- Improve sales and dealer-performance monitoring
- Support data-driven promotional and operational decisions

---

# 📁 Project Structure

```text
maruti-suzuki-sales-analytics/
│
├── data/
│   ├── raw/
│   └── processed/
│
├── notebooks/
│   ├── 01_business_understanding.ipynb
│   ├── 02_data_quality.ipynb
│   ├── 03_data_cleaning.ipynb
│   ├── 04_exploratory_data_analysis.ipynb
│   └── 05_business_analysis.ipynb
│
├── sql/
│   ├── sales_analysis.sql
│   ├── product_analysis.sql
│   ├── dealer_analysis.sql
│   └── customer_analysis.sql
│
├── dashboard/
│   └── maruti_sales_dashboard.pbix
│
├── reports/
│   ├── figures/
│   └── business_report.pdf
│
├── src/
│   ├── data_cleaning.py
│   ├── data_quality.py
│   └── analysis.py
│
├── README.md
└── requirements.txt
```

> The folder structure may evolve as additional analysis and dashboard components are added.

---

# 🚀 Future Enhancements

The project can be extended beyond descriptive analytics into predictive and prescriptive analytics.

Potential extensions include:

### Sales Forecasting

Forecast future unit sales using:

- Time-series models
- Regression
- Machine learning

### Customer Satisfaction Prediction

Develop a model to identify factors associated with high/low customer satisfaction.

### Dealer Performance Scoring

Create a composite dealer-performance score using:

- Sales
- Satisfaction
- Delivery
- Discount efficiency

### Product Demand Prediction

Predict future product-level demand to support inventory and sales planning.

### What-if Analysis

Evaluate scenarios such as:

```text
What happens to sales if discounts increase?

What happens to satisfaction if delivery time decreases?

Which dealers have the largest improvement opportunity?

Which products should receive greater promotional focus?
```

---

# ⚠️ Important Analytical Considerations

This project focuses on **business analytics rather than assuming causality from observational data**.

For example:

> A positive relationship between discount and sales does not necessarily mean that discounts caused higher sales.

Other factors may influence both variables.

Therefore, conclusions will be supported using:

- Descriptive statistics
- Appropriate visualizations
- Group comparisons
- Correlation analysis where appropriate
- Statistical testing where justified
- Business context

---

# 📌 Project Status

| Component | Status |
|---|---|
| Business understanding | ✅ Completed |
| Business questions | ✅ Defined |
| Dataset understanding | ✅ Completed |
| Data quality assessment | 🔄 In progress |
| Data cleaning | 🔄 In progress |
| Exploratory analysis | 🔄 In progress |
| SQL analysis | 🔄 In progress |
| KPI development | 🔄 In progress |
| Power BI dashboard | ⏳ Planned |
| Business insights | ⏳ Pending final analysis |
| Final recommendations | ⏳ Pending |

---

# 👤 Author

**Jayesh Shanmugavel**

M.Tech Bioprocess Engineering  
Indian Institute of Technology Madras

### Areas Demonstrated

- Business Analytics
- Data Analysis
- Python
- SQL
- Exploratory Data Analysis
- Data Cleaning
- Statistical Analysis
- Data Visualization
- Power BI
- Business Problem Solving

---

# ⭐ Project Objective

The primary goal of this project is to demonstrate the ability to take a **real-world business problem**, transform raw data into a reliable analytical dataset, perform structured analysis, communicate insights through dashboards, and translate those insights into **actionable business recommendations**.

> **From raw sales data → analytical insights → business decisions.**