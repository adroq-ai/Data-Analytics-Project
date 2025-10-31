SELECT * FROM sales.transactions;

# Get the total sales from the transactions table
SELECT count(*) FROM sales.transactions;

# Get the total customers
SELECT count(*) FROM sales.customers;

# Total transactions were performed in chennai
SELECT count(*) FROM sales.transactions where market_code="Mark001";

# All transactions were performed in chennai
SELECT * FROM sales.transactions where market_code="Mark001";

# How many transactions performed with USD
SELECT * FROM sales.transactions where currency="USD";

# Joining transactions table with the date table
select sales.transactions.*, sales.date.* from sales.transactions inner join sales.date on sales.transactions.order_date=sales.date.date;

# All transactions in 2020
select sales.transactions.*, sales.date.* from sales.transactions inner join sales.date on sales.transactions.order_date=sales.date.date where sales.date.year=2020

# Total revenue or Total sales in 2020
SELECT SUM(sales.transactions.sales_amount) from sales.transactions inner join sales.date on sales.transactions.order_date=sales.date.date where sales.date.year=2020

# Total revenue or Total sales in chennai in the year 2020
SELECT SUM(sales.transactions.sales_amount) from sales.transactions inner join sales.date on sales.transactions.order_date=sales.date.date 
where sales.date.year=2020 and sales.transactions.market_code="Mark001";

# Distinct product sold in Chennai
select distinct product_code from sales.transactions where market_code="Mark001";

## Distinct Currency in transanction
select distinct (transactions.currency) from transactions;

## We want to check how many INR currency with special character
select count(*) from transactions where transactions.currency = 'INR\r';

## Calculate Sum of Sales Transaction
select sum(transactions.sales_amount) from transactions;

## Show total revenue in year 2020, January Month
Select sum(transactions.sales_amount) from transactions inner join date ON transactions.order_date = date.date 
where date.year=2020 and date.month_name="January" 
and transactions.currency = 'INR\r' or transactions.currency = 'USD\r';

## Show total revenue in year 2019
Select sum(transactions.sales_amount) from transactions inner join date ON transactions.order_date = date.date 
where date.year=2019  and transactions.currency = 'INR\r' or transactions.currency = 'USD\r';