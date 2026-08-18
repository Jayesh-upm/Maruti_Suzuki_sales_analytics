\# KPI Definition Document



\## Maruti Suzuki Sales \& Dealer Performance Analytics



\### Purpose



These KPIs will be used to measure overall sales performance, product performance, dealer performance, customer satisfaction, and operational efficiency.



| KPI | Definition | Calculation |

|---|---|---|

| \*\*Total Units Sold\*\* | Total number of vehicles sold | `SUM(UnitsSold)` |

| \*\*Total Transactions\*\* | Total number of unique sales invoices | `COUNT(DISTINCT InvoiceID)` |

| \*\*Vehicle Sales Value\*\* | Total value of vehicles sold based on ex-showroom price | `SUM(ExShowroomPrice × UnitsSold)` |

| \*\*Sales Growth %\*\* | Percentage change in sales compared with the previous comparable period | `(Current Sales − Previous Sales) / Previous Sales × 100` |

| \*\*Sales Mix %\*\* | Contribution of a product, model, dealer, region or channel to total sales | `Segment Sales / Total Sales × 100` |

| \*\*Average Discount\*\* | Average discount applied to vehicles | `AVG(DiscountApplied)` |

| \*\*Average Customer Satisfaction\*\* | Average recorded customer satisfaction score | `AVG(SatisfactionScore)` |

| \*\*Average Delivery Time\*\* | Average number of days from booking to delivery | `AVG(BookingToDeliveryDays)` |

| \*\*Dealer Sales\*\* | Total units sold by each dealer | `SUM(UnitsSold)` by Dealer |

| \*\*Regional Sales\*\* | Total units sold by each region/state | `SUM(UnitsSold)` by Region |

| \*\*Model Sales\*\* | Total units sold for each model | `SUM(UnitsSold)` by Model |

| \*\*Channel Sales\*\* | Total units sold through each sales channel | `SUM(UnitsSold)` by Channel |

| \*\*Customer Segment Sales\*\* | Total units sold to each customer type | `SUM(UnitsSold)` by CustomerType |



\### Important Calculation Decisions



\#### Vehicle Sales Value



```text

Vehicle Sales Value = ExShowroomPrice × UnitsSold

```



`ExShowroomPrice` is used instead of `OnRoadPrice` because the project focuses on the value of the vehicle sold, while on-road price includes additional charges such as taxes and registration.



\#### Missing Values



\- Missing `SatisfactionScore` → excluded when calculating average satisfaction.

\- Missing `BookingToDeliveryDays` → excluded when calculating average delivery time.

\- Missing values will not automatically be treated as zero.



\#### Time Period



The dataset covers \*\*2020–2025\*\*, but 2025 has substantially lower transaction coverage. Therefore, \*\*2021–2024 will be the primary period for comparable full-year trend analysis\*\*, while 2025 will be treated as limited-coverage/recent data.



\### KPI Categories



| Category | Main KPIs |

|---|---|

| \*\*Sales Performance\*\* | Units Sold, Transactions, Sales Value, Sales Growth |

| \*\*Product Performance\*\* | Model Sales, Sales Mix |

| \*\*Dealer \& Regional Performance\*\* | Dealer Sales, Regional Sales |

| \*\*Customer Experience\*\* | Satisfaction, Delivery Time |

| \*\*Pricing \& Channel\*\* | Discount, Channel Sales |

| \*\*Customer Preference\*\* | Customer Segment Sales |

