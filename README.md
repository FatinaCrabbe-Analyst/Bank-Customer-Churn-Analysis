# Bank Customer Churn Analysis

## Project Overview

### Business Question

What customer characteristics and activity patterns are associated with observed bank customer churn?

### Objective

Analyze customer data to identify patterns associated with observed churn and provide data-driven insights that could help inform customer retention efforts.

### Project Summary

This project analyzes customer churn patterns using SQL and Tableau. The analysis examines customer demographics, tenure, account balances, and changes in debit activity to identify patterns associated with observed churn.

The analysis focuses on two key areas:

- Churn rates across customer age groups
- Churn rates associated with changes in monthly debit activity

The findings are presented through SQL analysis in BigQuery and an interactive Tableau dashboard.

## Data & Methodology

### Data Source

The analysis uses a publicly available bank customer churn dataset containing 28,382 customer records and 21 variables.

The dataset includes customer demographics, account balances, banking activity, tenure, and an observed churn indicator.

### Tools

- **BigQuery / SQL** — Data validation, exploration, aggregation, and churn analysis
- **Tableau Public** — Data visualization and dashboard development
- **CSV / Excel** — Initial data review and preparation

### Data Validation

Before conducting the analysis, the dataset was reviewed for:

- Total customer records
- Duplicate customer IDs
- Missing values
- Customer age and tenure ranges
- Account balance distributions

### Analytical Approach

The analysis began with the overall observed churn rate to establish a baseline.

Additional exploratory analysis examined customer characteristics and activity patterns, including:

- Gender
- Occupation
- Age
- Customer tenure
- Current account balance
- Debit activity
- Changes in monthly debit activity

The final analysis focused on two areas that provided meaningful, business-relevant differences in observed churn:

1. Churn rates across customer age groups
2. Churn rates associated with percentage changes in monthly debit activity

### Analytical Note

The analysis identifies observed relationships in the dataset. These relationships should not be interpreted as evidence that a particular customer characteristic or behavior causes churn.

## Key Findings & Business Recommendations

### Finding 1: Overall Churn

The overall observed churn rate was **18.53%** across 28,382 customers.

This provides a baseline for evaluating differences in churn across customer segments and activity patterns.

### Finding 2: Churn by Age Group

Customers ages **25–44** had the highest observed churn rate at **19.66%**, followed by customers ages **45–64** at **19.00%**.

Customers under 25 had an observed churn rate of **16.72%**, while customers ages 65+ had the lowest rate at **15.85%**.

The higher observed churn among customers ages 25–44 warrants additional investigation to better understand the factors contributing to this pattern.

### Finding 3: Changes in Debit Activity

Customers with a **large decrease in monthly debit activity of more than 50%** had an observed churn rate of **23.32%**.

By comparison, customers with **no decrease or increased debit activity** had an observed churn rate of **16.39%**.

This represents the strongest business-relevant pattern identified in the analysis.

### Business Recommendation

Significant declines in debit activity could be considered a potential early-warning indicator of customer disengagement.

The bank could investigate this customer segment further and test targeted engagement strategies to determine whether proactive intervention improves retention.

### Limitation

The analysis identifies observed relationships in the dataset and does not establish causation.

Additional data, such as transaction frequency, product usage, customer interactions, account closure information, and reasons for leaving, would be needed to better understand the drivers of churn.

## Interactive Dashboard

View the interactive Tableau dashboard:

[Bank Customer Churn Dashboard](https://public.tableau.com/app/profile/fatina.crabbe/viz/BankCustomerChurnAnalysis_17882275139180/BankCustomerChurnDashboard)
