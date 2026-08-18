# Business Question Framework

## Maruti Suzuki Sales & Dealer Performance Analytics (2021–2025)

### Purpose

This document defines the business questions that guide the analytics project. The questions are organized by business objective and level of analytics:

- **Descriptive:** What happened?
- **Diagnostic:** Why did it happen / what is associated with the outcome?
- **Predictive:** What is likely to happen next?
- **Prescriptive:** What should management do?



## 1. Product & Customer Preference

| Analytics | Business Question | Why It Matters | Can Dataset Answer? |
|---|---|---|---|
| Descriptive | Which product segments, models and specifications contribute most and least to unit sales, and how has the product mix changed from 2021–2025? | Identifies high- and low-performing products and reveals changes in customer preferences over time, supporting product portfolio and marketing decisions. | Yes |
| Diagnostic | What product, pricing, channel and customer characteristics are associated with differences in model/configuration performance? | Helps identify the factors associated with strong or weak product performance and provides direction for pricing, positioning and channel strategy. | Yes |
| Predictive | What is the expected demand for key models and segments in the next quarter? | Supports short-term production, inventory and distribution planning by providing an evidence-based estimate of future demand. | Yes |
| Prescriptive | Which models and configurations should receive inventory/production priority based on demand and forecast? | Converts historical performance and forecasts into actionable inventory and production priorities, helping reduce potential stock imbalances. | Yes |

---

## 2. Dealer & Regional Performance

| Analytics | Business Question | Why It Matters | Can Dataset Answer? |
|---|---|---|---|
| Descriptive | Which dealers and regions outperform or underperform, and what product/customer mix characterizes their performance? | Identifies high- and low-performing markets and helps management understand the product and customer mix behind dealer and regional performance. | Yes |
| Descriptive | Which dealers show longer booking-to-delivery times for a given model compared with their peers? | Identifies dealer-specific operational gaps and helps prioritize improvements in delivery performance and customer experience. | Yes |
| Diagnostic | What product mix, customer mix, channel, pricing and operational characteristics are associated with dealer performance differences? | Helps determine the characteristics associated with dealer performance and supports targeted dealer-level interventions rather than applying the same strategy to every dealer. | Yes |
| Predictive | What is the expected delivery time for a given product at a given dealer? | Provides an evidence-based delivery estimate that can support operational planning and more realistic customer expectations. | Yes |
| Predictive | What is the expected demand for key models at major dealers in the next quarter? | Supports dealer-level inventory allocation and helps align vehicle availability with expected local demand. | Yes |
| Prescriptive | Which dealers or regions should receive performance interventions or inventory reallocation? | Translates performance and forecast results into targeted management actions for improving sales, service levels and resource allocation. | Yes |

---

## 3. Customer Experience & Operational Efficiency

| Analytics | Business Question | Why It Matters | Can Dataset Answer? |
|---|---|---|---|
| Descriptive | How do customer satisfaction and booking-to-delivery performance vary across models, dealers, regions, channels and customer types? | Identifies where customer experience is strongest or weakest and highlights operational areas requiring further investigation. | Yes |
| Diagnostic | Are discount levels, delivery times, payment methods and product/dealer characteristics associated with customer satisfaction? | Helps identify factors associated with customer satisfaction and provides direction for customer-experience and operational improvement. | Yes |
| Diagnostic | Is discount level associated with sales performance across dealers, cities and states over the five-year period? | Evaluates whether higher discount levels coincide with stronger sales performance and helps assess the effectiveness of discounting strategies. | Yes |
| Predictive | Can booking-to-delivery time or customer satisfaction be predicted using available transaction characteristics? | Determines whether transaction and operational information can be used to anticipate delivery performance or customer experience. | Yes |
| Prescriptive | Which dealers, models or operational areas should be prioritized to improve customer experience? | Converts customer satisfaction and delivery findings into targeted improvement priorities. | Yes |

---

## 4. Sales & Revenue Performance

| Analytics | Business Question | Why It Matters | Can Dataset Answer? |
|---|---|---|---|
| Descriptive | How have units sold and revenue changed across years, quarters, months, dealers, regions, models and channels? | Establishes the overall sales and revenue trajectory and identifies major growth, decline and seasonal patterns. | Yes |
| Diagnostic | What product, dealer, regional, channel, pricing and customer characteristics are associated with sales growth or decline? | Helps explain differences in sales performance and identify areas where management can investigate or intervene. | Yes |
| Predictive | What is the expected sales volume for key models in the next quarter? | Supports sales planning, production planning and inventory preparation using expected future demand. | Yes |
| Prescriptive | How should management prioritize sales efforts, inventory and regional/dealer interventions based on historical and forecasted performance? | Converts analytical findings into business actions by prioritizing resources toward the products, dealers and regions with the greatest opportunity or risk. | Yes |

---

## Analytical Interpretation Guidelines

### Descriptive Analysis — What happened?

Focuses on measuring and summarizing historical performance.

Typical methods:
- Aggregation
- Trend analysis
- Growth rates
- Market/product mix analysis
- Rankings
- Distribution analysis
- Time-series visualization

### Diagnostic Analysis — Why did it happen?

Focuses on investigating factors associated with observed performance differences.

Typical methods:
- Comparative analysis
- Segmentation
- Correlation
- Statistical testing
- Regression/explanatory analysis
- Drill-down analysis


### Predictive Analysis — What will happen?

Focuses on estimating future outcomes using historical patterns and available explanatory variables.

Potential applications:
- Model-level demand forecasting
- Dealer-level demand forecasting
- Delivery-time prediction
- Customer-satisfaction prediction


### Prescriptive Analysis — What should management do?

Focuses on translating findings and predictions into actionable decisions.

Potential decisions:
- Inventory prioritization
- Dealer intervention
- Regional allocation
- Production planning
- Customer-experience improvement
- Sales-resource allocation

---

## Important Data Limitations to Validate

The “Can Dataset Answer?” column currently represents theoretical feasibility based on the available fields. It must be validated during Data Understanding.

Particular areas to verify:

1. **Revenue definition** — determine how `UnitsSold`, `ExShowroomPrice`, `DiscountApplied` and `OnRoadPrice` should be used.
2. **Forecasting granularity** — avoid forecasting every possible combination of model, colour, fuel, transmission and dealer unless sufficient historical observations exist.
3. **Variant introduction** — the current schema may not contain an explicit launch date or predecessor relationship.
4. **Causality** — the observational dataset can identify associations but may not establish causal effects.
5. **Inventory decisions** — actual inventory/production data is not present, so recommendations will be based on demand rather than observed stock levels.
6. **Market share** — actual market share cannot be calculated without external total-market data.
7. **Customer-level analysis** — there is no CustomerID in the stated schema, so analysis is at transaction/customer-type level rather than individual-customer level.

These limitations will be documented and updated after data-quality assessment.
