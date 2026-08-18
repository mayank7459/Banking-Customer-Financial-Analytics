Q1. Find the total number of customers.
    SELECT COUNT(*) AS total_customers
    FROM customers;

Q2. Find the total number of accounts in the bank.
    SELECT COUNT(*) AS total_accounts
    FROM accounts;

Q3. Find the total number of transaction records.
    SELECT COUNT(*) AS total_transactions
    FROM transactions;

Q4. Find the total number of loan records.
    SELECT COUNT(*) AS total_loans
    FROM loans;

Q5. Find the total number of branches in the bank.
    SELECT COUNT(*) AS total_branches
    FROM branches;    

Q6. Find the total loan amount across all loans.
    SELECT SUM(loan_amount) AS total_loan_amount
    FROM loans;

Q7. Find the average current balance across all accounts.
    SELECT AVG(current_balance) AS average_current_balance
    FROM accounts;

Q8. Find the average transaction amount.
    SELECT AVG(amount) AS average_transaction_amount
    FROM transactions;   

Q9. Find the total transaction amount.
     SELECT COUNT(*) AS total_active_accounts
     FROM accounts
     WHERE account_status = 'Active';     

Q11. Find the total number of customers in the Premium segment.
     SELECT COUNT(*) AS premium_customers
     FROM customers
     WHERE customer_segment = 'Premium';    

Q12. Find the total number of active loans.
     SELECT COUNT(*) AS total_active_loans
     FROM loans
     WHERE loan_status = 'Active';

Q13. Find the total loan amount for currently active loans.
     SELECT SUM(loan_amount) AS active_loan_amount
     FROM loans
     WHERE loan_status = 'Active';

Q14. Find the total number of successful transactions.
     SELECT COUNT(*) AS successful_transactions
     FROM transactions
     WHERE transaction_status = 'Successful';

Q15. Find the total number of failed transactions.
     SELECT COUNT(*) AS failed_transactions
     FROM transactions
     WHERE transaction_status = 'Failed';     

Q16. Find the total deposit transaction amount.
     SELECT SUM(amount) AS total_deposit_amount
     FROM transactions
     WHERE transaction_type = 'Deposit';    

Q17. Find the total withdrawal transaction amount.
     SELECT SUM(amount) AS total_withdrawal_amount
     FROM transactions
     WHERE transaction_type = 'Withdrawal';     

Q18. Find the total number of customers from each state.
     SELECT
     state,
     COUNT(*) AS total_customers
     FROM customers
     GROUP BY state
     ORDER BY total_customers DESC; 

Q19. Find the number of accounts for each account type.
     SELECT
     account_type,
     COUNT(*) AS total_accounts
     FROM accounts
     GROUP BY account_type
     ORDER BY total_accounts DESC;  

Q20. Find the number of transactions for each transaction channel.            
     SELECT
     channel,
     COUNT(*) AS total_transactions
     FROM transactions
     GROUP BY channel
     ORDER BY total_transactions DESC;

Q21. Display each customer along with their account type and current balance.
     SELECT
     c.customer_id,
     c.customer_name,
     a.account_type,
     a.current_balance
     FROM customers AS c
     INNER JOIN accounts AS a
     ON c.customer_id = a.customer_id;     

Q22. Find customers whose account current balance is greater than ₹50,000.
     SELECT
     c.customer_id,
     c.customer_name,
     a.account_id,
     a.account_type,
     a.current_balance
     FROM customers AS c
     INNER JOIN accounts AS a
     ON c.customer_id = a.customer_id
     WHERE a.current_balance > 50000;     

Q23. Find customers whose loan amount is greater than ₹10,00,000.
     SELECT
     c.customer_id,
     c.customer_name,
     l.loan_id,
     l.loan_type,
     l.loan_amount,
     l.outstanding_amount,
     l.loan_status
     FROM customers AS c
     INNER JOIN loans AS l
     ON c.customer_id = l.customer_id
     WHERE l.loan_amount > 1000000;     

Q24. Calculate the total number of accounts and total current balance for each customer.
     SELECT
     c.customer_id,
     c.customer_name,
     COUNT(a.account_id) AS total_accounts,
     SUM(a.current_balance) AS total_current_balance
     FROM customers AS c
     INNER JOIN accounts AS a
     ON c.customer_id = a.customer_id
     GROUP BY
     c.customer_id,
     c.customer_name;     

Q25. Find customers whose total account balance is greater than the average current balance of all accounts.
     SELECT
     c.customer_id,
     c.customer_name,
     SUM(a.current_balance) AS total_current_balance
     FROM customers AS c
     INNER JOIN accounts AS a
     ON c.customer_id = a.customer_id
     GROUP BY
     c.customer_id,
     c.customer_name
     HAVING SUM(a.current_balance) >
     (SELECT AVG(current_balance)
     FROM accounts);     

Q27. Calculate total loan amount and total outstanding amount for each customer. 
      Show only customers whose outstanding amount is more than 50% of their total loan amount.     
     SELECT
     c.customer_id,
     c.customer_name,
     SUM(l.loan_amount) AS total_loan_amount,
     SUM(l.outstanding_amount) AS total_outstanding_amount
     FROM customers AS c
     INNER JOIN loans AS l
     ON c.customer_id = l.customer_id
     GROUP BY
     c.customer_id,
     c.customer_name
     HAVING SUM(l.outstanding_amount) >
     SUM(l.loan_amount) * 0.50;

Q28. Find customers who have at least 2 accounts and whose total current balance is greater than ₹2,00,000.
     SELECT
     c.customer_id,
     c.customer_name,
     COUNT(a.account_id) AS total_accounts,
     SUM(a.current_balance) AS total_current_balance
     FROM customers AS c
     INNER JOIN accounts AS a
     ON c.customer_id = a.customer_id
     GROUP BY
     c.customer_id,
     c.customer_name
     HAVING COUNT(a.account_id) >= 2
     AND SUM(a.current_balance) > 200000;     

     