# Bank Loan Analysis 

## 📌 Project Overview

This project analyzes bank loan data using **MS SQL Server** for data querying and **Power BI** for interactive dashboard visualization.

The objective was to solve key business problems related to:

* Loan performance
* Good vs Bad loans
* Regional and borrower analysis
* Lending trends
* Financial KPIs

Workflow:

> Data → SQL Querying → KPI Calculation → Power BI Modeling → Dashboard Design → Business Insights

---

## 🛠️ Tools & Technologies Used

* **Microsoft SQL Server 19**
* **SQL Server Management Studio (SSMS)**
* **Power BI (June 2023 Version)**
* **Microsoft Excel 2021**


---

## 🎯 Business Problem

The goal was to analyze loan portfolio performance and build 3 dashboards:

### 1️⃣ Dashboard 1 – Summary

**Key Performance Indicators (KPIs):**

* Total Loan Applications
* Month-to-Date (MTD) Applications
* Total Funded Amount
* Total Amount Received
* Average Interest Rate
* Average Debt-to-Income Ratio (DTI)

#### Good Loan vs Bad Loan Analysis

**Good Loans**

* Fully Paid
* Current

**Bad Loans**

* Charged Off

Metrics calculated:

* Loan application %
* Funded amount
* Amount received

<img width="1970" height="1105" alt="Screenshot 2026-03-01 141915" src="https://github.com/user-attachments/assets/ad5c335a-608a-42ec-9d71-1241d5c72011" />


---

### 2️⃣ Dashboard 2 – Overview

Visual analysis including:

* Monthly Lending Trends
* Regional Analysis by State
* Loan Term Distribution
* Employment Length Impact
* Loan Purpose Breakdown
* Home Ownership Analysis

Metrics shown:

* Total Applications
* Total Funded Amount
* Total Amount Received


<img width="1972" height="1105" alt="Screenshot 2026-03-01 141938" src="https://github.com/user-attachments/assets/0e2676fe-ac00-4d44-ba61-5a5cea0d7efc" />


---

### 3️⃣ Dashboard 3 – Details

A comprehensive grid view including:

* Loan Status
* Funded Amount
* Amount Received
* Interest Rate
* DTI
* MTD Metrics

This dashboard provides a detailed operational view of the loan portfolio.


<img width="1967" height="1106" alt="Screenshot 2026-03-01 142006" src="https://github.com/user-attachments/assets/21b1370b-0b0f-420a-a512-3538927f89a6" />


---

## 🗄️ SQL Analysis

All KPIs were first calculated using SQL queries.

### Example Queries

#### Total Loan Applications

```sql
SELECT COUNT(id) AS Total_Applications 
FROM bank_loan_data;
```

#### Total Funded Amount

```sql
SELECT SUM(loan_amount) AS Total_Funded_Amount 
FROM bank_loan_data;
```

#### Good Loan Percentage

```sql
SELECT
    (COUNT(CASE 
        WHEN loan_status = 'Fully Paid' 
        OR loan_status = 'Current' 
    THEN id END) * 100.0) / COUNT(id) 
AS Good_Loan_Percentage
FROM bank_loan_data;
```

#### Monthly Trends

```sql
SELECT 
    MONTH(issue_date) AS Month_Number,
    DATENAME(MONTH, issue_date) AS Month_Name,
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date);
```

**Full Query:** <a href="https://github.com/YTFarhan/Bank_Loan_Analysis-/blob/main/Bank%20Loan%20Analysis.sql">View MS SQL</a>

---

## 📊 Power BI Features Implemented

* Data cleaning in Power Query
* Data modeling
* Date table creation
* DAX measures
* Time Intelligence (MTD, MoM)
* KPI cards
* Interactive filters & slicers
* Drill-through pages
* Dynamic visual formatting

---

## 🔍 Key Insights Generated

* Identified proportion of Good vs Bad loans
* Analyzed regional lending concentration
* Observed seasonal lending trends
* Determined which loan purposes dominate portfolio
* Measured portfolio health using DTI & Interest Rate
