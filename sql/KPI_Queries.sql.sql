select * from bank_loan_table
/* LOAN STATUS*/
select 
loan_status,
count(id) as loancount,
sum(total_payment) as total_amount_recieved,
sum(loan_amount) as total_funded_amount,
avg(int_rate *100) as interest_rate,
avg(dti*100) as DTI
from bank_loan_table
group by loan_status


SELECT 
	loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM bank_loan_table
WHERE MONTH(issue_date) = 12 
GROUP BY loan_status


/*BANK LOAN REPORT | OVERVIEW*/
select  
Month(issue_date) as month_number,
DATENAME(Month,issue_date) as month_name,
count(id) as total_applications,
sum(loan_amount)as total_funded_amount,
sum(total_payment) as total_amount_recieved

from bank_loan_table
group by Month(issue_date),DATENAME(Month,issue_date) 
order by Month(issue_date)


/*STATE*/
SELECT 
	address_state AS State, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_table
GROUP BY address_state
ORDER BY address_state

/*TERM*/
SELECT 
	term AS Term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_table
GROUP BY term
ORDER BY term

/*EMPLOYEE LENGTH*/
SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_table
GROUP BY emp_length
ORDER BY emp_length

/*PURPOSE*/
SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_table
GROUP BY purpose
ORDER BY purpose

/*HOME OWNERSHIP*/
SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_table
GROUP BY home_ownership
ORDER BY home_ownership









