# E-commerce Customer Analytics Dashboard

![Dashboard](dashboard/dashboard_screenshot.png)

## Overview
End-to-end data analytics project analysing 100K+ orders from the 
Olist Brazilian E-commerce dataset using SQL, Python, and Power BI.

## Tools Used
- **MySQL** — data extraction, revenue analysis, RFM base table
- **Python (Pandas)** — RFM scoring and customer segmentation
- **Power BI** — interactive dashboard and KPI reporting

## Key Findings
1. **80% churn rate** — 800 out of 1,000 customers inactive for 90+ days
2. **Beleza & Saude** is the highest revenue category, followed by 
   Relogios Presentes
3. **Loyal customers (28.9%)** form the largest segment but At Risk 
   (24.6%) is close behind — retention strategy is critical
4. **Revenue peaked in July** before a sharp September dip — 
   seasonal pattern worth investigating
5. Only **65 Champions (6.5%)** drive disproportionate value — 
   protecting this segment is a business priority

## Customer Segments
| Segment | Customers | % Share |
|---|---|---|
| Loyal | 289 | 28.9% |
| At Risk | 246 | 24.6% |
| Potential Loyalist | 177 | 17.7% |
| New Customer | 168 | 16.8% |
| Champion | 65 | 6.5% |
| Lost | 55 | 5.5% |

## Project Structure
- `sql/` — MySQL queries for revenue, cohort and RFM analysis
- `notebooks/` — Python RFM segmentation notebook
- `dashboard/` — Power BI dashboard screenshot

## Dataset
[Brazilian E-Commerce Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)
