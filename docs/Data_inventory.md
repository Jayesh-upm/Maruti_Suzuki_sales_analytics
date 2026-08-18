\# Data Inventory



\## 1. Dataset Overview



The project uses three relational tables covering vehicle sales,

product characteristics, and dealer/geographic information for the

2021–2025 analysis period.



| Table | Description | Analytical Role |

|---|---|---|

| Sales | Transaction-level vehicle sales records containing sales, pricing, customer, financing, satisfaction and delivery information. | Fact table |

| Products | Product/model and variant characteristics. | Product dimension |

| Dealers | Dealer information including dealer name and geographic attributes. | Dealer/geographic dimension |



\---



\## 2. Table-Level Summary



| Table | Rows | Columns | Granularity | Primary/Candidate Key |

|---|---:|---:|---|---|

| Sales | 800,000 | 17 | Sales transaction | InvoiceID |

| Products | 57 | 6 | Product/variant | ProductID |

| Dealers | 16 | 4 | Dealer | DealerCode |

