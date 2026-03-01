-- KPI’s:

select * 
from [Bank Loan DB]..bank_loan_data;



-- total loan applications
select COUNT(id) as Total_Loan_Applications 
from [Bank Loan DB]..bank_loan_data


select COUNT(id) as MTD_Total_Loan_Applications 
from [Bank Loan DB]..bank_loan_data
where month(issue_date) = 12 and year(issue_date) = 2021


select COUNT(id) as PMTD_Total_Loan_Applications 
from [Bank Loan DB]..bank_loan_data
where month(issue_date) = 11



-- total funded amount
select sum(loan_amount) as Total_Funded_Amount 
from [Bank Loan DB]..bank_loan_data


select sum(loan_amount) as MTD_Total_Funded_Amount 
from [Bank Loan DB]..bank_loan_data
where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021


select sum(loan_amount) as PMTD_Total_Funded_Amount 
from [Bank Loan DB]..bank_loan_data
where MONTH(issue_date) = 11 and YEAR(issue_date) = 2021



-- total amount received
select sum(total_payment) as Total_Amount_Received
from [Bank Loan DB]..bank_loan_data


select sum(total_payment) as MTD_Total_Amount_Received
from [Bank Loan DB]..bank_loan_data
where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021


select sum(total_payment) as PMTD_Total_Amount_Received
from [Bank Loan DB]..bank_loan_data
where MONTH(issue_date) = 11 and YEAR(issue_date) = 2021



-- avg interest rate
select round(AVG(int_rate), 4)*100 as Avg_Interest_Rate
from [Bank Loan DB]..bank_loan_data


select round(AVG(int_rate), 4)*100 as MTD_Avg_Interest_Rate
from [Bank Loan DB]..bank_loan_data
where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021


select round(AVG(int_rate), 4)*100 as PMTD_Avg_Interest_Rate
from [Bank Loan DB]..bank_loan_data
where MONTH(issue_date) = 11 and YEAR(issue_date) = 2021



-- debt to income ratio
select *
from [Bank Loan DB]..bank_loan_data


select round(AVG(dti)*100,2) as Avg_DTI 
from [Bank Loan DB]..bank_loan_data


select round(AVG(dti)*100,2) as MTD_Avg_DTI 
from [Bank Loan DB]..bank_loan_data
where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021


select round(AVG(dti)*100,2) as PMTD_Avg_DTI 
from [Bank Loan DB]..bank_loan_data
where MONTH(issue_date) = 11 and YEAR(issue_date) = 2021




-- GOOD LOAN ISSUED (Fully Paid Loan Amounts):


-- Good loan percentage
select *
from [Bank Loan DB]..bank_loan_data

select loan_status
from [Bank Loan DB]..bank_loan_data


select
	(COUNT(case when loan_status = 'Fully Paid' or loan_status = 'Current' then id end)*100)
	/
	COUNT(id) as Good_Loan_Percentage
from [Bank Loan DB]..bank_loan_data



-- Good loan applications
select COUNT(id) as Good_Loan_Applications
from [Bank Loan DB]..bank_loan_data
where loan_status = 'Fully Paid' or loan_status = 'Current'



-- Good loan funded amount
select sum(id) as Good_Loan_Funded_Amount
from [Bank Loan DB]..bank_loan_data
where loan_status = 'Fully Paid' or loan_status = 'Current'



-- Good loan total received amount
select sum(total_payment) as Good_Loan_Received_Amount
from [Bank Loan DB]..bank_loan_data
where loan_status = 'Fully Paid' or loan_status = 'Current'




-- BAD LOAN ISSUED (Charged Loan Amounts):

-- Bad loan percentage
select
	(COUNT(case when loan_status = 'Charged Off' then id end)*100)
	/
	COUNT(id) as Bad_Loan_Percentage
from [Bank Loan DB]..bank_loan_data



-- Bad loan total applications
select COUNT(id) as Bad_Loan_Applications
from [Bank Loan DB]..bank_loan_data
where loan_status = 'Charged Off'



-- Bad loan funded amount
select SUM(loan_amount) AS Bad_Loan_Funded_Amount 
from [Bank Loan DB]..bank_loan_data
where loan_status = 'Charged Off'



--Bad loan amount received
select SUM(total_payment) AS Bad_Loan_Amount_Received 
from [Bank Loan DB]..bank_loan_data
where loan_status = 'Charged Off'




-- LOAN STATUS:

select 
	loan_status,
        COUNT(id) as Total_Loan_Applications,
        SUM(total_payment) as Total_Amount_Received,
        SUM(loan_amount) as Total_Funded_Amount,
        AVG(int_rate * 100) as Interest_Rate,
        AVG(dti * 100) as DTI
    from
        [Bank Loan DB]..bank_loan_data
    group by
        loan_status


select 
	loan_status, 
	SUM(total_payment) as MTD_Total_Amount_Received, 
	SUM(loan_amount) as MTD_Total_Funded_Amount 
from [Bank Loan DB]..bank_loan_data
where MONTH(issue_date) = 12 
group by loan_status




-- BANK LOAN REPORT:


-- month
select *
from [Bank Loan DB]..bank_loan_data


select 
	MONTH(issue_date) as Month_Munber, 
	DATENAME(MONTH, issue_date) as Month_name, 
	COUNT(id) as Total_Loan_Applications,
	SUM(loan_amount) as Total_Funded_Amount,
	SUM(total_payment) as Total_Amount_Received
from [Bank Loan DB]..bank_loan_data
group by MONTH(issue_date), DATENAME(MONTH, issue_date)
order by MONTH(issue_date)


-- state
select 
	address_state, 
	COUNT(id) as Total_Loan_Applications,
	SUM(loan_amount) as Total_Funded_Amount,
	SUM(total_payment) as Total_Amount_Received
from [Bank Loan DB]..bank_loan_data
group by address_state
order by address_state


-- term
select 
	term, 
	COUNT(id) as Total_Loan_Applications,
	SUM(loan_amount) as Total_Funded_Amount,
	SUM(total_payment) as Total_Amount_Received
from [Bank Loan DB]..bank_loan_data
group by term
order by term


-- employee length (working experience)
select 
	emp_length, 
	COUNT(id) as Total_Loan_Applications,
	SUM(loan_amount) as Total_Funded_Amount,
	SUM(total_payment) as Total_Amount_Received
from [Bank Loan DB]..bank_loan_data
group by emp_length
order by emp_length


-- purpose of the loans
select 
	purpose, 
	COUNT(id) as Total_Loan_Applications,
	SUM(loan_amount) as Total_Funded_Amount,
	SUM(total_payment) as Total_Amount_Received
from [Bank Loan DB]..bank_loan_data
group by purpose
order by COUNT(id) desc


--home ownership
select 
	home_ownership, 
	COUNT(id) as Total_Loan_Applications,
	SUM(loan_amount) as Total_Funded_Amount,
	SUM(total_payment) as Total_Amount_Received
from [Bank Loan DB]..bank_loan_data
group by home_ownership
order by COUNT(id) desc