# Banking Customer & Financial Performance Analytics

## Project Overview

An end-to-end banking analytics project built with **PostgreSQL, SQL,
Power BI, DAX, and Power Query**. The project analyzes customers,
branches, accounts, loans, and transactions and converts the analysis
into a three-page interactive Power BI dashboard.

## Business Objective

The project focuses on: - Customer and segment analysis - Account
distribution and balances - Customer-level financial relationships -
Loan portfolio and outstanding exposure - Transaction volumes, values,
status, type, and channel - High-value and multi-account customers -
Branch-level financial analysis

## Project Structure

``` text
Banking Analytics Project/
├── Dataset/
│   ├── customers.csv
│   ├── branches.csv
│   ├── accounts.csv
│   ├── loans.csv
│   └── transactions.csv
├── SQL/
├── PowerBI/
│   └── Banking_Customer_Financial_Performance_Analytics.pbix
└── README.md
```

## Technology Stack

  Tool          Purpose
  ------------- ---------------------------------------
  PostgreSQL    Database and relational data storage
  SQL           Data validation and business analysis
  Power BI      Interactive dashboard
  DAX           KPI and analytical measures
  Power Query   Data preparation

## Database Schema

### Customers

Customer profile and demographic information: `customer_id`,
`customer_name`, `gender`, `date_of_birth`, `age`, `occupation`,
`customer_segment`, `city`, `state`, `postal_code`, `phone`, `email`,
`customer_since`, `customer_status`

### Branches

Branch information: `branch_id`, `branch_name`, `city`, `state`,
`postal_code`, `branch_status`

### Accounts

Customer account and balance information: `account_id`, `customer_id`,
`branch_id`, `account_type`, `opening_date`, `current_balance`,
`account_status`

### Loans

Loan portfolio information: `loan_id`, `customer_id`, `branch_id`,
`loan_type`, `loan_start_date`, `loan_amount`, `interest_rate`,
`tenure_months`, `outstanding_amount`, `loan_status`

### Transactions

Account transaction information: `transaction_id`, `account_id`,
`transaction_date`, `transaction_type`, `amount`, `channel`,
`transaction_status`, `reference_number`

## Relationships

``` text
Customers
   ├──< Accounts >── Branches
   │       └──< Transactions
   └──< Loans >──── Branches
```

Main foreign-key relationships: - `customers.customer_id` →
`accounts.customer_id` - `branches.branch_id` → `accounts.branch_id` -
`customers.customer_id` → `loans.customer_id` - `branches.branch_id` →
`loans.branch_id` - `accounts.account_id` → `transactions.account_id`

## SQL Analysis

The SQL folder contains business questions covering:

### Basic Analysis

-   Total customers, accounts, loans, branches, and transactions
-   Total loan and transaction amounts
-   Average account balance and transaction amount
-   Active accounts and active loans
-   Premium customers
-   Successful and failed transactions
-   Deposit and withdrawal amounts
-   Customers by state
-   Accounts by account type
-   Transactions by channel

### Customer Analysis

-   Customer account details and balances
-   Customers with balances above ₹50,000
-   Customers with loans above ₹10,00,000
-   Total accounts and total balance per customer
-   Customers above average account balance
-   Customer-segment total balances
-   Customers with high outstanding loan exposure
-   Customers with at least two accounts and high balances
-   Customer contribution to overall transaction amount

### Advanced SQL

-   CTEs
-   `ROW_NUMBER()`
-   `RANK()`
-   `DENSE_RANK()`
-   `PARTITION BY`
-   Latest transaction per customer
-   Top customers by total balance
-   Top 3 customers within each customer segment
-   Handling ties at ranking positions

## Power BI Dashboard

The final Power BI report contains three pages.

### Page 1 --- Banking Customer & Financial Performance

**KPIs** - Total Customers - Total Accounts - Total Loan Amount - Total
Outstanding Loans - Total Transaction Amount

**Visual analysis** - Customer segment - Account status - Account type -
Transaction channel - Transaction type - Loan status

**Slicers** - Customer Segment - Account Type

### Page 2 --- Customer & Account Analysis

**KPIs** - Active Accounts - Average Account Balance - Customers With
Multiple Accounts - Average Accounts Per Customer - Max Customer Balance

**Visual analysis** - Total Balance by Customer Segment - Accounts by
Customer Segment - Top 10 Customers by Total Balance - Total Balance by
Account Status - Total Balance by Branch

### Page 3 --- Loan & Transaction Analysis

**KPIs** - Total Loans - Total Loan Amount - Total Outstanding Loans -
Active Loans - Defaulted Loans

**Visual analysis** - Loans by Loan Status - Total Loan Amount by Loan
Type - Outstanding Amount by Loan Type - Total Loan Amount by Customer
Segment - Loan Amount vs Outstanding Amount by Loan Type

## Example DAX Measures

### Total Customers

``` dax
Total Customers =
COUNTROWS('public customers')
```

### Total Loans

``` dax
Total Loans =
COUNTROWS('public loans')
```

### Total Loan Amount

``` dax
Total Loan Amount =
SUM('public loans'[loan_amount])
```

### Total Outstanding Loans

``` dax
Total Outstanding Loans =
SUM('public loans'[outstanding_amount])
```

### Active Accounts

``` dax
Active Accounts =
CALCULATE(
    COUNTROWS('public accounts'),
    'public accounts'[Account Status] = "Active"
)
```

### Average Account Balance

``` dax
Average Account Balance =
AVERAGE('public accounts'[current_balance])
```

### Customers With Multiple Accounts

``` dax
Customers With Multiple Accounts =
COUNTROWS(
    FILTER(
        VALUES('public accounts'[customer_id]),
        CALCULATE(
            COUNT('public accounts'[account_id])
        ) >= 2
    )
)
```

### Max Customer Balance

``` dax
Max Customer Balance =
MAXX(
    VALUES('public accounts'[customer_id]),
    CALCULATE(
        SUM('public accounts'[current_balance])
    )
)
```

### Average Accounts Per Customer

``` dax
Average Accounts per Customer =
DIVIDE(
    DISTINCTCOUNT('public accounts'[account_id]),
    DISTINCTCOUNT('public accounts'[customer_id])
)
```

## Data Validation

Row counts were validated across all five tables before analysis:

``` sql
SELECT 'CUSTOMERS' AS TABLE_NAME, COUNT(*) AS ROW_COUNT FROM customers
UNION ALL
SELECT 'BRANCH', COUNT(*) FROM branches
UNION ALL
SELECT 'ACCOUNTS', COUNT(*) FROM accounts
UNION ALL
SELECT 'LOANS', COUNT(*) FROM loans
UNION ALL
SELECT 'TRANSACTIONS', COUNT(*) FROM transactions;
```

## End-to-End Workflow

``` text
Dataset
   ↓
PostgreSQL Database
   ↓
Table Creation & Data Loading
   ↓
Data Validation
   ↓
SQL Business Analysis
   ↓
Power BI Connection
   ↓
Data Modeling
   ↓
DAX Measures
   ↓
Dashboard Development
   ↓
Final Formatting
```

## Skills Demonstrated

-   PostgreSQL
-   SQL
-   Relational database design
-   Primary and foreign keys
-   Joins
-   Aggregations
-   `GROUP BY` and `HAVING`
-   Subqueries
-   CTEs
-   Window functions
-   `RANK`, `DENSE_RANK`, `ROW_NUMBER`
-   Power BI
-   Power Query
-   Data modeling
-   DAX
-   KPI development
-   Interactive slicers
-   Dashboard design
-   Business-focused data analysis

## Future Improvements

-   Add a dedicated transaction-focused page
-   Add date-based trend analysis when the required date field is
    available in the Power BI model
-   Add loan default-rate analysis
-   Add drill-through customer profiles
-   Add more branch performance metrics
-   Add automated data refresh

## Project Outcome

This project demonstrates a complete analytics workflow from **banking
datasets → PostgreSQL → SQL analysis → Power BI data modeling → DAX →
interactive business dashboard**.

It is designed as a portfolio project demonstrating practical Data
Analyst / BI Analyst skills.

## Author

**Mayank**

**Project:** Banking Customer & Financial Performance Analytics

**Core Stack:** PostgreSQL · SQL · Power BI · DAX · Power Query
