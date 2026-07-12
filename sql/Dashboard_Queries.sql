

select * from bank_loan_table

/*  total loan applications */

select count(id) as total_loan_appl from bank_loan_table

/*Total applications Month-to-Date (MTD)*/
select count(id) as month_applicatons from bank_loan_table
group by Month(issue_date)
order by  Month(issue_date)

/* Total funded amount */
select sum(loan_amount) as total_funded_amount from bank_loan_table

/* MTD Total Funded Amount*/
select  sum(loan_amount) as total_funded_amount from bank_loan_table
group by month(issue_date)
order by month(issue_date) 

/*Total Amount Received*/

select  sum(total_payment) as total_payment_recieved
from bank_loan_table
group by month(issue_date)
order by month(issue_date)

/*Average Interest Rate -for MTD*/

select month(issue_date) as issue_month,Round(avg(int_rate),4)* 100 as avg_int_rate from bank_loan_table
group by month(issue_date)
order by month(issue_date)

/*Average Debt-to-Income Ratio (DTI)*/
select Round(avg(dti),4)*100 as avg_dti from bank_loan_table
group by month(issue_date)
order by month(issue_date) 

/*Good Loan KPIs:*/
SELECT 
    (COUNT(CASE WHEN loan_status = 'Fully Paid' or loan_status = 'Current' THEN id end) * 100)
    / COUNT(id) AS good_loan_percent
FROM bank_loan_table;

/* good loan application*/
select count(id) as good_loan_applications from bank_loan_table
where loan_status ='Fully Paid' or loan_status='Current'

/* good_loan_funded _amount*/
select sum(loan_amount) as good_loan_funded_amount from bank_loan_table
where loan_status ='Fully Paid' or loan_status='Current'

select sum(total_payment) as good_loan_funded_amount from bank_loan_table
where loan_status ='Fully Paid' or loan_status='Current'

/*BAD LOAN ISSUED*/
/*Bad Loan Percentage*/
SELECT
    (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) / 
	COUNT(id) AS Bad_Loan_Percentage
FROM bank_loan_table

/*Bad Loan Applications*/
select count(*) from bank_loan_table
where loan_status ='Charged off'

/*Bad Loan Funded Amount*/
SELECT SUM(loan_amount) AS Bad_Loan_Funded_amount FROM bank_loan_table
WHERE loan_status = 'Charged Off'



















