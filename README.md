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

* **Microsoft SQL Server**
* **SQL Server Management Studio (SSMS)**
* **Power BI**
* **Microsoft Excel**


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

<img width="1970" height="1105" alt="Screenshot 2026-03-01 141915" src="https://github.com/user-attachments/assets/451c12c5-b3d3-4b60-9790-41cd46d3a03b" />


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

<img width="1977" height="1109" alt="Screenshot 2026-03-25 101420" src="https://github.com/user-attachments/assets/359cb5ab-2e98-445d-9002-e06512d8e166" />


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


<img width="1973" height="1110" alt="Screenshot 2026-03-25 101445" src="https://github.com/user-attachments/assets/0431e6b7-cb69-4e4e-99a5-60615b73e406" />


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

**Full Query:** <a href="https://github.com/YTFarhan/Bank_Loan_Analysis/blob/main/Bank%20Loan%20Analysis.sql">View MS SQL</a>

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
