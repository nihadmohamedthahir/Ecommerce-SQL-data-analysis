# E-Commerce SQL Analysis

## Project Overview

This project focuses on analyzing an e-commerce dataset using SQL to understand customer behavior, product performance, seller performance, orders, revenue, shipping, and other key business metrics.

The project includes data exploration and 60 business-focused SQL questions, divided into Basic, Intermediate, and Advanced levels. Business insights were derived from selected analysis results to identify meaningful patterns and trends in the data.

## Project Objective

The objective of this project is to use SQL to analyze e-commerce data and extract meaningful business insights. The analysis focuses on customers, orders, products, sellers, revenue, shipping charges, and customer spending patterns.

The project also demonstrates the ability to solve business problems using SQL techniques such as aggregations, joins, subqueries, CTEs, and window functions.

## Dataset / Tables

The project uses an e-commerce dataset consisting of the following tables:

### 1. Customers
Contains customer-related information such as customer details and location.

### 2. Orders
Contains information about customer orders, including order details and order status.

### 3. Order items
Contains item-level details for each order, such as products, sellers, and prices.

### 4. Products
Contains cleaned product information used for product-level analysis.

### 5. Payments
Contains payment-related information for customer orders.

These tables are connected through common keys such as customer IDs, order IDs, and product IDs, allowing analysis across customers, orders, products, and payments.

## SQL Skills & Concepts Used

The following SQL skills and concepts were used in this project:

- SELECT statements
- WHERE clause
- GROUP BY and HAVING
- ORDER BY
- TOP clause
- LIKE operator
- Aggregate Functions: SUM(), AVG(), MIN(), MAX(), COUNT()
- INNER JOIN, LEFT JOIN, RIGHT JOIN and FULL JOIN.
- CASE statements
- Subqueries
- Common Table Expressions (CTEs)
- Window Functions
- RANK(), DENSE_RANK(), ROW_NUMBER()
- LAG()
- Date Functions YEAR(), MONTH() ,DATEPART(), DAY()
- Data filtering and business analysis.

## Analysis Performed

The project includes the following business analysis:

- Customer purchase and order analysis
- Orders and sellers sales performance analysis
- Product performance analysis
- product category wise analysis
- Payment analysis
- Customer-wise spending analysis
- Order value analysis
- Top-performing products and customers analysis
- Order status analysis
- Business performance insights based on e-commerce data.

## Business Insights

The analysis provided the following business insights:

- Product ID oucVZ3sCjN84 is the highest-priced product in the catalog, with a price of Rs 6,729.
- The highest shipping charge recorded in the dataset is Rs 409.68.
- The top 10 sellers recorded product sales ranging from 383 to 719, with seller yGBPyLPc8PmT having the highest product sales of 719.
- The top 10 customers recorded total spending ranging from Rs 4,601.89 to Rs 6,767.93,
  with customer klIZ7q6nbrIL having the highest total spending of Rs 6,767.93.
- The top 10 customers recorded one total order each.
- The top 10 products recorded revenue ranging from Rs 51,736.30 to Rs 320,901.56, with product ID 9NwzO0Pm0fDM generating the highest revenue of Rs 
  320,901.56.
- The top 10 product categories recorded revenue ranging from Rs 1,950,722.59 to Rs 11,076,789.74, 
  with the Toys category generating the highest revenue of Rs 11,076,789.74.
- The Toys category has the highest-priced product at Rs 6,729.
- The top 10 sellers recorded revenue ranging from Rs 126,980.10 to Rs 1,117,655.29,
  with seller r7VXef0TVHbb generating the highest revenue of Rs 1,117,655.29.
- Seller r7VXef0TVHbb ranked first based on revenue, securing the highest seller revenue performance.
- The analysis shows the monthly revenue trend from October 2016 to September 2018.
- Product categories were ranked based on revenue using DENSE_RANK(), with the Toys category achieving Rank 1.
- The top 5 customers were identified based on total spending, with customer klIZ7q6nbrIL generating the highest total spending of Rs 6,767.93.
- The analysis identified customers whose spending is above the average customer spending within their respective states.

## Conclusion

This Ecommerce Data Analysis project helped me understand how SQL can be used to analyze real-world business data and generate useful insights. I worked with customer, order, product, seller, payment, and review data to understand sales performance, customer behavior, product performance, and business trends.

During this project, I used SQL concepts such as filtering, aggregation, GROUP BY, HAVING, JOINs, subqueries, CASE statements, CTEs, and window functions. I also created business-focused queries to answer practical questions and identify important patterns in the data.

The analysis provided useful business insights related to revenue, customers, orders, products, sellers, payments, and customer reviews. These insights can help an e-commerce business understand its performance, identify areas for improvement, and make better data-driven decisions.

Overall, this project improved my SQL skills and gave me practical experience in solving business problems using data. It also helped me understand how a Data Analyst can convert raw data into meaningful information that supports business decision-making.