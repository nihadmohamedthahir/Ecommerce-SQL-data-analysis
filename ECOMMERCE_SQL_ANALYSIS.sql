 E - COMMERCE SQL ANALYSIS PROJECT 
  
 STEP 1 - DATA EXPLORATION [EDA]

=============================================


--TABLES

select * from customers;
select * from Orders;
select * from OrderItems;
select * from products;
select * from Payments;

--TOTAL ROWS

select count(*) as no_of_rows from customers;
select count(*)  as no_of_rows from Orders;
select count(*) as no_of_rows from OrderItems;
select count(*)  as no_of_rows from Payments;
select count(*)  as no_of_rows from Products;

--RECORDS

select top 50 * from customers;

select top 10 * from orders;

select top 30 * from OrderItems;

select top 20 * from Products;

select top 50 * from Payments;

--NULL VALUES CHECK

select 
	  sum(case when customer_id is null then 1 else 0 end) as customer_id_null_values,
	  sum(case when customer_zip_code_prefix is null then 1 else 0 end) as customer_zip_code_prefix_null_values,
	  sum(case when customer_city is null then 1 else 0 end) customer_city_null_values,
	  sum(case when customer_state is null then 1 else 0 end) as customer_state_null_val
from customers;


select 
	  sum(case when order_id is null then 1 else 0 end) as order_id_null_values,
	  sum(case when customer_id is null then 1 else 0 end) as customer_id_null_values,
	  sum(case when order_purchase_timestamp is null then 1 else 0 end) order_purchase_timestamp_null_values,
	  sum(case when order_approved_at is null then 1 else 0 end) as order_approved_at_cm_null_val
from Orders;

select 
	  sum(case when order_id is null then 1 else 0 end) as order_id_null_values,
	  sum(case when product_id is null then 1 else 0 end) as product_id_null_values,
	  sum(case when seller_id is null then 1 else 0 end) seller_id_null_values,
	  sum(case when price is null then 1 else 0 end) as price_null_val,
	  sum(case when shipping_charges is null then 1 else 0 end) shipping_charges_null_values
from OrderItems


select 
	  sum(case when product_id is null then 1 else 0 end) as product_id,
	  sum(case when product_category_name is null then 1 else 0 end) product_category_null_values,
	  sum(case when product_height_cm is null then 1 else 0 end) as product_height_cm_null_val,
	  sum(case when product_length_cm is null then 1 else 0 end) product_length_cm_null_val,
	  sum(case when product_width_cm is null then 1 else 0 end) as product_width_cm_null_val,
	  sum(case when product_weight_g is null then 1 else 0 end) as product_weight_g_null_val
from Products;

select 
	  sum(case when order_id is null then 1 else 0 end) as order_id,
	  sum(case when payment_sequential is null then 1 else 0 end) payment_sequential,
	  sum(case when payment_type is null then 1 else 0 end) as payment_type,
	  sum(case when payment_installments is null then 1 else 0 end) payment_installments,
	  sum(case when payment_value is null then 1 else 0 end) as payment_value 
from Payments;

--DUPLICATE RECORDS

select count(distinct customer_id) as cus_count from customers;

select count(distinct customer_zip_code_prefix) as cus_count from customers;

select count(distinct order_id) as orders_count from Orders;

select count(distinct seller_id) from OrderItems;

select count(product_id) from Products;
select count(distinct product_id) from Products;


select count(distinct payment_sequential) from Payments;

select count(distinct payment_installments) from Payments;

select product_id,count(*) as product_count
from Products
group by product_id having count(*) > 1;

select * from Products
where product_id = 'Ph7gx9xXX1Y1';

--select distinct * into products_clean from Products;

select count(*) from Products;
select count(*) from products_clean;

select product_id,count(*) as productscount
from products_clean
group by product_id having count(*) > 1;

select * from products_clean where product_category_name is null;

--DISTINCT VALUES

select * from customers

select count(distinct customer_id) as cus_counts from customers;

select count(distinct customer_zip_code_prefix) zip_code_counts from customers;

select count(distinct customer_city) zip_code_counts from customers;

select count(distinct customer_state) zip_code_counts from customers;

select count(distinct order_id)
from OrderItems

select count(distinct product_id)
from OrderItems

select count(distinct seller_id)
from OrderItems

select count(distinct product_category_name)
from products_clean;

select count(distinct payment_type)
from Payments

--DATE RANGE

select min(order_purchase_timestamp),max(order_purchase_timestamp)
from Orders

--UNIQUE VALUES
select count(distinct customer_id) as cus_counts from customers;

select count(distinct customer_zip_code_prefix) zip_code_counts from customers;

select count(distinct customer_city) zip_code_counts from customers;

select count(distinct customer_state) zip_code_counts from customers;

select count(distinct order_id)
from OrderItems

select count(distinct product_id)
from OrderItems

select count(distinct seller_id)
from OrderItems

select * from Products

select count(distinct product_category_name)
from products_clean;

select * from Payments;

select count(distinct payment_type)
from Payments

=============================================

  STEP 2 - BASIC BUSINESS QUESTIONS

=============================================

-- Q1 . Total number of Customers.

SELECT COUNT(DISTINCT customer_id) AS Total_customers
FROM customers;

--Total Customers : 38279


-- Q2 . Total number of Orders.

SELECT COUNT(DISTINCT order_id) AS Total_Orders
FROM Orders;

--Total Orders : 38279


-- Q3 . Total number of Products.

SELECT COUNT(DISTINCT product_id) AS Total_Products
FROM products_clean;

--Total Products : 16604


-- Q4 . Total number of sellers.

SELECT COUNT(DISTINCT seller_id) AS Total_sellers
FROM OrderItems;

--Total Sellers : 2476


-- Q5 . Total number of Product categories.

SELECT COUNT(DISTINCT product_category_name) AS Total_product_categories
FROM products_clean;

--Total Product categories : 66


--Q6 . Total Revenue

SELECT SUM(price) AS Total_Revenue
FROM OrderItems;

--Total Revenue : 13110554.99


--Q7 . Average Product Price

SELECT AVG(price) AS Average_product_price
FROM OrderItems;

--Average Product Price : 342.49


--Q8 . Highest Product Price

SELECT TOP 1 WITH TIES 
	   product_id,
	   price AS Highest_price
FROM OrderItems
ORDER BY price DESC; 

-- Business Insight : Product ID oucVz3sCjN84 is the Highest priced product in the catalog,
--                    with a price of Rs 6,729.


--Q9 . Lowest Product Price

SELECT TOP 1 WITH TIES 
	   product_id,
	   price AS Lowest_price
FROM OrderItems
ORDER BY price ASC; 


--Q10 . Average shpping charges

SELECT AVG(shipping_charges) AS Avg_shipping_charges
FROM OrderItems;

--Q11 . Highest shipping charges

SELECT MAX(shipping_charges) AS Highest_shipping_charges
FROM OrderItems;

--Business Insight : The highest shipping charge recorded in the dataset is Rs 409.68

--Q12 . Total payment value

SELECT SUM(payment_value) AS Total_payment_value
FROM Payments;

--Q13 . Average Payment value

SELECT AVG(payment_value) AS Average_payment_value
FROM Payments;

--Q14 . Payment Type-wise transaction count

SELECT payment_type,COUNT(*) AS Transactions_count
FROM Payments
GROUP BY payment_type;

--Q15 . Payment Type-wise Total payment

SELECT payment_type,SUM(payment_value) AS Total_amount
FROM Payments
GROUP BY payment_type;

--Q16 . Average product weight

SELECT AVG(product_weight_g) AS Average_product_weight
FROM products_clean;

--Q17 . Top 10 product categories by product count

SELECT TOP 10 WITH TIES 
	   product_category_name,COUNT(product_id) AS Product_count
FROM products_clean
GROUP BY product_category_name
ORDER BY Product_count DESC;

--Q18 . Top 10 customer states by customer count

SELECT TOP 10 WITH TIES
	   customer_state,COUNT(customer_id) AS customer_count
FROM customers
GROUP BY customer_state
ORDER BY customer_count DESC;

--Q19 . Top 10 sellers by number of products sold

SELECT TOP 10 WITH TIES
	   seller_id,COUNT(product_id) AS no_of_products_sold
FROM OrderItems
GROUP BY seller_id
ORDER BY no_of_products_sold DESC;

--Business Insight : The top 10 sellers recorded product sales ranging from 383 to 719.
--				     with seller yGbPyLPc8PmT having the highest product sales 719.

--Q20 . Orders per year

SELECT YEAR(order_purchase_timestamp) AS Years,COUNT(order_id) AS Orders_per_year
FROM Orders
GROUP BY YEAR(order_purchase_timestamp);

=============================================

 STEP - 3  INTERMEDIATE BUSINESS QUESTIONS 

=============================================

--Q21 . Total spending of each customer

SELECT C.customer_id,
	   SUM(price+shipping_charges) AS customer_total_spending
FROM customers C
JOIN Orders O
ON C.customer_id=O.customer_id
JOIN OrderItems OI
ON O.order_id=OI.order_id
GROUP BY C.customer_id;

--Q22 . Top 10 customers by total spending

SELECT TOP 10 WITH TIES
	   C.customer_id,
	   SUM(price+shipping_charges) AS Total_spending
FROM customers C
JOIN Orders O
ON C.customer_id=O.customer_id
JOIN OrderItems OI
ON O.order_id=OI.order_id
GROUP BY C.customer_id
ORDER BY Total_spending DESC;

--Business Insight : Here top 10 customers recorded in the catalog based on total spending in the dataset Ranging from 4601.89 to 6767.93,
--					 customer klIZ7q6nbRlL has the highest total spending Rs 6767.93 .


--Q23 . NO.OF Orders placed by each customer

SELECT customer_id,
	   COUNT(order_id) AS Total_Orders
FROM Orders
GROUP BY customer_id;

--Q24 . Top 10 customers by number of Orders

SELECT TOP 10 WITH TIES 
	   customer_id,
	   COUNT(order_id) AS Total_Orders
FROM Orders
GROUP BY customer_id
ORDER BY Total_Orders DESC;

--Business Insight : The top 10 customers recorded total orders .
--				     all customers have the same total orders that is 1.


--Q25 . Revenue generated by each seller

SELECT seller_id,
	   SUM(price+shipping_charges) AS Revenue_by_seller
FROM OrderItems
GROUP BY seller_id;

--Q26 . Revenue generated by each product

SELECT product_id,
	   SUM(price+shipping_charges) AS Product_revenue
FROM OrderItems
GROUP BY product_id;

--Q27 . Top 10 products by revenue

SELECT TOP 10 WITH TIES
	   product_id,
	   SUM(price+shipping_charges) AS Product_revenue
FROM OrderItems
GROUP BY product_id
ORDER BY Product_revenue DESC;

--Business Insight : Here the 10 products recorded based on revenue ranging from 51736.30 to 320901.56,
--					 The 9NwzO0Pm0fDM productID generated the highest revenue Rs 320901.56 among all products.


--Q28 . Top 10 products categories by revenue

SELECT TOP 10 WITH TIES
	   product_category_name,
	   SUM(price+shipping_charges) AS category_revenue
FROM OrderItems OI
JOIN products_clean P
ON OI.product_id=P.product_id
GROUP BY product_category_name
ORDER BY category_revenue DESC;

--Business Insight : Here the 10 product categories recorded based on revenue ranging from 195072.59 to 11076789.74,
--					 The toys category generated the highest revenue Rs 11076789.74 among all product categories.

--Q29 . Average price of products in each category

SELECT product_category_name,
	   AVG(price) AS Avg_product_price
FROM OrderItems OI
JOIN products_clean P
ON OI.product_id=P.product_id
GROUP BY product_category_name;

--Q30 . Highest priced product in each category

SELECT product_category_name,
	   MAX(price) AS Highest_priced_product
FROM OrderItems OI
JOIN products_clean P
ON OI.product_id=P.product_id
GROUP BY product_category_name
ORDER BY Highest_priced_product DESC;

--Business Insight : Each category has a different highest-priced product. 
--					 The toys category has the highest priced product at Rs 6,729 .

--Q31 . Number of products sold by each seller 

SELECT seller_id,COUNT(product_id) AS Total_products
FROM OrderItems
GROUP BY seller_id;

--Q32 . Top 10 sellers by revenue

SELECT TOP 10 WITH TIES
	   seller_id,SUM(price+shipping_charges) AS Revenue
FROM OrderItems
GROUP BY seller_id
ORDER BY Revenue DESC;

--Business Insight : Here the top 10 sellers recorded based on revenue ranging from 126980.10 to 1117655.29,
--					 The sellerID r7VxefoTVHbb generated the highest revenue Rs 1117655.29 among all sellers.


--Q33 . Average shipping charges collected by each seller

SELECT seller_id,AVG(shipping_charges) AS Avg_shipping_charges
FROM OrderItems
GROUP BY seller_id;

--Q34 . Number of customers in each state

SELECT customer_state,COUNT(customer_id) AS NO_OF_CUSTOMERS
FROM customers
GROUP BY customer_state;

--Q35 . Total revenue generated from each state

SELECT C.customer_state,SUM(OI.price+OI.shipping_charges) AS State_revenue
FROM customers C
JOIN Orders O
ON C.customer_id=O.customer_id
JOIN OrderItems OI
ON O.order_id=OI.order_id
GROUP BY customer_state;

--Q36 . Average order value for each state

SELECT customer_state,
	   AVG(Orders_revenue) AS State_avg_revenue
FROM(
SELECT C.customer_state,
	   OI.order_id,
	   SUM(price+shipping_charges) AS Orders_revenue
FROM customers C
JOIN Orders O
ON C.customer_id=O.customer_id
JOIN OrderItems OI
ON O.order_id=OI.order_id
GROUP BY C.customer_state,OI.order_id
)t
GROUP BY customer_state;

--Q37 . Average payment value by payment type

SELECT payment_type,AVG(payment_value) AS Average_payment_value
FROM Payments
GROUP BY payment_type;

--Q38 . Total number of installments for each payment type

SELECT payment_type,SUM(payment_installments) AS TOTAL_INSTALLMENTS
FROM Payments
GROUP BY payment_type;

--Q39 . Rank sellers based on revenue.

SELECT seller_id,
	   SUM(price+shipping_charges) AS Revenue,
	   RANK() OVER(ORDER BY SUM(price+shipping_charges) DESC) AS Rank
FROM OrderItems
GROUP BY seller_id;

--Business Insight : Here The Rank sellers recorded based on the Revenue,
--					 Seller r7VxefoTVHbb generated the Highest revenue among all sellers,
--			         securing Ranks in seller revenue performance.


--Q40 . Monthly order count

SELECT YEAR(order_purchase_timestamp) AS Year,
	   MONTH(order_purchase_timestamp) AS Monthno,
	   DATENAME(MONTH,order_purchase_timestamp) AS month,
	   COUNT(order_id) as Total_orders
FROM Orders
GROUP BY YEAR(order_purchase_timestamp),
	     MONTH(order_purchase_timestamp),
         DATENAME(MONTH,order_purchase_timestamp)
ORDER BY YEAR,Monthno,month;

/*
=============================================

 STEP - 4 ADVANCED BUSINESS QUESTIONS 

=============================================
*/

--Q41 . Monthly revenue trend 

SELECT year(order_purchase_timestamp) as year,
	   MONTH(order_purchase_timestamp) AS monthno,
	   datename(month,order_purchase_timestamp) as month,
	   SUM(price+shipping_charges) AS Revenue
FROM Orders O
JOIN OrderItems OI
ON O.order_id=OI.order_id
GROUP BY year(order_purchase_timestamp),MONTH(order_purchase_timestamp),datename(month,order_purchase_timestamp)
ORDER BY year,monthno ASC;

--Business Insight : The analysis shows the mothly revenue trend from october 2016 to september 2018.



--Q42 . Year wise revenue

SELECT YEAR(order_purchase_timestamp) AS YEAR,
	   SUM(price+shipping_charges) AS Revenue
FROM Orders O
JOIN OrderItems OI
ON O.order_id=OI.order_id
GROUP BY YEAR(order_purchase_timestamp)
ORDER BY YEAR ASC;

--Q43 . Highest revenue month

SELECT TOP 1 WITH TIES 
	   year(order_purchase_timestamp) as year,
	   MONTH(order_purchase_timestamp) AS monthno,
	   datename(month,order_purchase_timestamp) as month,
	   SUM(price+shipping_charges) AS Revenue
FROM Orders O
JOIN OrderItems OI
ON O.order_id=OI.order_id
GROUP BY year(order_purchase_timestamp),MONTH(order_purchase_timestamp),datename(month,order_purchase_timestamp)
ORDER BY Revenue DESC;

--Q44 . Dense Rank product categories based on revenue.

SELECT product_category_name,
	   SUM(price+shipping_charges) AS Revenue,
	   DENSE_RANK() OVER(ORDER BY SUM(price+shipping_charges) DESC) d_rank
FROM OrderItems OI
JOIN products_clean P
ON OI.product_id=P.product_id
GROUP BY product_category_name;

--Business Insight : Product categories were ranked based on revenue using dense ranking ,
--					 with Toys category achieving Rank 1 as the Highest revenue category.

--Q45 . Top-selling product in each category using row_number().
WITH CTENAME AS(
SELECT product_category_name,
	   OI.product_id,
	   COUNT(OI.product_id) AS Top_selling_products,
	   ROW_NUMBER() OVER(PARTITION BY product_category_name ORDER BY COUNT(OI.product_id) DESC) AS row_num
FROM OrderItems OI
JOIN products_clean P
ON OI.product_id=P.product_id
GROUP BY product_category_name,OI.product_id
)
SELECT * FROM CTENAME
WHERE row_num = 1 and product_category_name is not null;

--Q46 . Find customers whose spending is above the average customers spending.
WITH CUS_SPENDING_DETAILS AS(
SELECT C.customer_id,
	   SUM(price+shipping_charges) AS cus_revenue,
	   AVG(SUM(price+shipping_charges)) OVER() AS avg_revenue
FROM customers C
JOIN Orders O
ON C.customer_id=O.customer_id
JOIN OrderItems OI
ON O.order_id=OI.order_id
GROUP BY C.customer_id
)
SELECT * FROM CUS_SPENDING_DETAILS
WHERE cus_revenue > avg_revenue;


--Q47 . Find sellers whose revenue is above the average seller revenue.
WITH SELLER_DETAILS AS(
SELECT seller_id,
	   SUM(price+shipping_charges) AS revenue,
	   AVG(SUM(price+shipping_charges)) OVER() AS avg_seller_revenue
FROM OrderItems
GROUP BY seller_id
)
SELECT * FROM SELLER_DETAILS
WHERE revenue > avg_seller_revenue;

--Q48 . Find the top 5 customers based on their total spending.

SELECT TOP 5 C.customer_id,
	   SUM(price+shipping_charges) AS customer_total_spending
FROM customers C
JOIN Orders O
ON C.customer_id=O.customer_id
JOIN OrderItems OI
ON O.order_id=OI.order_id
GROUP BY C.customer_id
ORDER BY customer_total_spending DESC;

--Business Insight : Here The top 5 customers recorded based on total spending ,
--					 customer klIZ7q6nbRlL generated the highest total spending Rs 6767.93 among all customers.

--Q49 . Find the top 3 products in each product category based on the number of times they were ordered.

SELECT product_category_name,
	   product_id,
	   orders_count
FROM(
SELECT product_category_name,
	   OI.product_id,
	   COUNT(OI.product_id) AS orders_count,
	   ROW_NUMBER() OVER(PARTITION BY product_category_name ORDER BY COUNT(OI.product_id) DESC) AS r_num
FROM OrderItems OI
JOIN products_clean P
ON OI.product_id=P.product_id
GROUP BY product_category_name,OI.product_id
) t
WHERE r_num <= 3 AND product_category_name IS NOT NULL;


--Q50 . Find the month-over-month revenue growth for each month.

WITH Month_revenue_details AS(
SELECT YEAR(order_purchase_timestamp) AS Year,
	   MONTH(order_purchase_timestamp) AS Monthno,
	   DATENAME(MONTH,order_purchase_timestamp) AS Month,
	   SUM(price+shipping_charges) AS Month_revenue,
	   LAG(SUM(price+shipping_charges)) OVER(ORDER BY YEAR(order_purchase_timestamp),
											     MONTH(order_purchase_timestamp) ASC) AS Previous_month_revenue
FROM Orders O
JOIN OrderItems OI
ON O.order_id=OI.order_id
GROUP BY YEAR(order_purchase_timestamp),
	   MONTH(order_purchase_timestamp),
	   DATENAME(MONTH,order_purchase_timestamp)
)
SELECT *,
	   (((Month_revenue-Previous_month_revenue)/Previous_month_revenue) * 100) AS Month_over_month_revenue_growth
FROM Month_revenue_details
;

--Q51 . Find customers who placed orders in at least  3 different years.

SELECT customer_id,
	   COUNT(DISTINCT YEAR(order_purchase_timestamp)) AS years
FROM Orders
GROUP BY customer_id HAVING COUNT(DISTINCT YEAR(order_purchase_timestamp)) >= 3;

--Q52 . Find the average order value for each customer and display customers whose average order value is above 500 rs.

WITH CUS_DETAILS AS(
SELECT customer_id,
	   SUM(price+shipping_charges) AS cus_revenue,
	   COUNT(DISTINCT O.order_id) AS order_counts
FROM Orders O
JOIN OrderItems OI
ON O.order_id=OI.order_id
GROUP BY customer_id 
)
SELECT *,
	   cus_revenue/order_counts AS Avg_order_value
FROM CUS_DETAILS
where cus_revenue/order_counts > 500;


--Q53 . Find the product category having the highest total revenue.

SELECT TOP 1 WITH TIES
	   product_category_name,
	   SUM(price+shipping_charges) AS Total_revenue
FROM OrderItems OI
JOIN products_clean P
ON OI.product_id=P.product_id
GROUP BY product_category_name
ORDER BY Total_revenue DESC;

--Q54 . Find sellers who sold products from more than 3 different categories.

SELECT seller_id,
	   COUNT(DISTINCT product_category_name) AS categories
FROM OrderItems OI
JOIN products_clean P
ON OI.product_id=P.product_id
GROUP BY seller_id HAVING COUNT(DISTINCT product_category_name) > 3;

--Q55 . Find customers whose total spending is greater than the average total spending 
--	    of all customers who have placed at least 2 orders.

WITH CUSTOMER_DETAILS AS(
SELECT C.customer_id,
	   SUM(price+shipping_charges) AS Total_spending,
	   COUNT(DISTINCT O.order_id) AS orders_count,
	   AVG(SUM(price+shipping_charges)) OVER() AS AVG_Total_spending
FROM customers C
JOIN Orders O
ON C.customer_id=O.customer_id
JOIN OrderItems OI
ON O.order_id=OI.order_id
GROUP BY C.customer_id HAVING COUNT(DISTINCT O.order_id) > 1
)
SELECT * FROM CUSTOMER_DETAILS
WHERE Total_spending > AVG_Total_spending;

--Q56 . For each product category,find the top 3 products based on total revenue generated ,
--      but include only products whose revenue is greater than the average product revenue within that category.
SELECT product_category_name,
	   product_id,
	   product_revenue
FROM(
SELECT product_category_name,
	   OI.product_id,
	   SUM(price+shipping_charges) AS product_revenue,
	   AVG(SUM(price+shipping_charges)) OVER(PARTITION BY product_category_name) as avg_product_revenue,
	   DENSE_RANK() OVER(PARTITION BY product_category_name ORDER BY SUM(price+shipping_charges) DESC) AS rnk
FROM OrderItems OI
JOIN products_clean P
ON OI.product_id=P.product_id
GROUP BY product_category_name,OI.product_id
) T 
WHERE product_revenue > avg_product_revenue AND rnk <= 3 AND product_category_name IS NOT NULL;

--Q57 . Customer spending above their state average.

SELECT * FROM(
SELECT C.customer_id,
       C.customer_state,
	   SUM(price+shipping_charges) AS Customer_spending,
	   AVG(SUM(price+shipping_charges)) OVER(PARTITION BY C.customer_state) AS state_avg
FROM customers C
JOIN Orders O
ON C.customer_id=O.customer_id
JOIN OrderItems OI
ON O.order_id=OI.order_id
GROUP BY C.customer_id,C.customer_state
)t
WHERE Customer_spending > state_avg;

--Business Insight : The analysis identified customers whose spending is above the average customer spending within their respective states.

--Q58 . Second-Highest product revenue within each category.

SELECT product_category_name,
	   product_id,
	   Total_revenue AS Second_highest_product_revenue
FROM(
SELECT product_category_name,
	   OI.product_id,
	   SUM(price+shipping_charges) AS Total_revenue,
	   DENSE_RANK() OVER(PARTITION BY product_category_name ORDER BY SUM(price+shipping_charges) DESC) rnk
FROM OrderItems OI 
JOIN products_clean P 
ON OI.product_id=P.product_id
GROUP BY product_category_name,OI.product_id
)t
WHERE rnk = 2 AND product_category_name IS NOT NULL;

--Q59 . Products performing below their own category average.

WITH Prod_revenue AS(
SELECT product_category_name,
	   OI.product_id,
	   SUM(price+shipping_charges) AS Products_revenue
FROM OrderItems OI 
JOIN products_clean P
ON OI.product_id=P.product_id
GROUP BY product_category_name,OI.product_id
), Category_avg AS(
SELECT *,
	   AVG(Products_revenue) OVER(PARTITION BY product_category_name) AS Category_average
FROM Prod_revenue
)
SELECT * FROM Category_avg
WHERE Products_revenue < Category_average AND product_category_name IS NOT NULL;

--Q60 . Customer Revenue and Repeat purchase Analysis.
--      Find top 10 customers by total spending
WITH Order_details AS(
SELECT O.order_id,
	   customer_id,
	   SUM(price) + MAX(shipping_charges) AS Order_total
FROM Orders O
JOIN OrderItems OI
ON O.order_id=OI.order_id
GROUP BY O.order_id,customer_id
),Cus_details AS(
SELECT C.customer_id,
	   customer_city,
	   customer_state,
	   COUNT(order_id) AS Order_count,
	   SUM(Order_total) AS cus_spending
FROM customers C
JOIN Order_details OD
ON C.customer_id=OD.customer_id
GROUP BY C.customer_id,customer_city,customer_state
)
SELECT TOP 10 * 
FROM CUS_DETAILS
WHERE Order_count >= 2 
ORDER BY cus_spending DESC;


