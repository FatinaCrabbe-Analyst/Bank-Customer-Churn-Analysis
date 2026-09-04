-- Bank Customer Churn Analysis
-- Tool: Google BigQuery
-- Dataset: Public Bank Customer Churn Dataset
-- Records: 28,382 customers
--
-- Purpose:
-- Validate the dataset, establish an overall churn baseline,
-- and investigate customer characteristics and activity patterns
-- associated with observed churn.
--
-- Important:
-- These queries identify observed relationships and do not
-- establish causation.


-- ============================================================
-- 1. TOTAL CUSTOMERS
-- Establish the total number of customer records.
-- ============================================================

SELECT
  COUNT(*) AS total_customers
FROM `enduring-lane-484402-k7.banking_analytics.customer_churn`;


-- ============================================================
-- 2. CHECK FOR DUPLICATE CUSTOMER IDs
-- Verify that each customer ID appears only once.
-- ============================================================

SELECT
  customer_id,
  COUNT(*) AS record_count
FROM `enduring-lane-484402-k7.banking_analytics.customer_churn`
GROUP BY customer_id
HAVING COUNT(*) > 1;


-- ============================================================
-- 3. CHECK FOR MISSING DATA
-- Review key fields for missing values before analysis.
-- ============================================================

SELECT
  COUNT(*) AS total_customers,
  COUNTIF(gender IS NULL) AS missing_gender,
  COUNTIF(city IS NULL) AS missing_city,
  COUNTIF(dependents IS NULL) AS missing_dependents,
  COUNTIF(last_transaction IS NULL) AS missing_last_transaction
FROM `enduring-lane-484402-k7.banking_analytics.customer_churn`;


-- ============================================================
-- 4. OVERALL CHURN RATE
-- Establish the baseline observed churn rate.
-- ============================================================

SELECT
  COUNT(*) AS total_customers,
  COUNTIF(churn = 1) AS churned_customers,
  ROUND(
    COUNTIF(churn = 1) / COUNT(*) * 100,
    2
  ) AS churn_rate_percent
FROM `enduring-lane-484402-k7.banking_analytics.customer_churn`;


-- ============================================================
-- 5. CHURN BY AGE GROUP
-- Compare observed churn rates across customer age groups.
-- ============================================================

SELECT
  CASE
    WHEN age < 25 THEN 'Under 25'
    WHEN age BETWEEN 25 AND 44 THEN '25-44'
    WHEN age BETWEEN 45 AND 64 THEN '45-64'
    ELSE '65+'
  END AS age_group,

  COUNT(*) AS total_customers,
  COUNTIF(churn = 1) AS churned_customers,

  ROUND(
    COUNTIF(churn = 1) / COUNT(*) * 100,
    2
  ) AS churn_rate_percent

FROM `enduring-lane-484402-k7.banking_analytics.customer_churn`

GROUP BY age_group
ORDER BY churn_rate_percent DESC;


-- ============================================================
-- 6. CHURN BY PERCENTAGE CHANGE IN DEBIT ACTIVITY
-- Compare observed churn rates based on changes in
-- monthly debit activity.
-- ============================================================

SELECT
  CASE
    WHEN current_month_debit = 0
      AND previous_month_debit = 0
      THEN 'No Decrease / Increased'

    WHEN previous_month_debit = 0
      THEN 'No Decrease / Increased'

    WHEN SAFE_DIVIDE(
      current_month_debit - previous_month_debit,
      previous_month_debit
    ) * 100 < -50
      THEN 'Large Decrease (>50%)'

    WHEN SAFE_DIVIDE(
      current_month_debit - previous_month_debit,
      previous_month_debit
    ) * 100 BETWEEN -50 AND -25
      THEN 'Moderate Decrease (25–50%)'

    WHEN SAFE_DIVIDE(
      current_month_debit - previous_month_debit,
      previous_month_debit
    ) * 100 BETWEEN -25 AND -1
      THEN 'Small Decrease (1–25%)'

    ELSE 'No Decrease / Increased'
  END AS debit_activity_group,

  COUNT(*) AS total_customers,
  COUNTIF(churn = 1) AS churned_customers,

  ROUND(
    COUNTIF(churn = 1) / COUNT(*) * 100,
    2
  ) AS churn_rate_percent

FROM `enduring-lane-484402-k7.banking_analytics.customer_churn`

GROUP BY debit_activity_group
ORDER BY churn_rate_percent DESC;
