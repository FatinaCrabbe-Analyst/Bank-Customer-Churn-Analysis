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
