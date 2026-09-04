CREATE DATABASE retail_sales;
USE retail_sales;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    signup_date DATE
);

INSERT INTO customers VALUES
(1, 'Amit Sharma', 'Mumbai', 'Maharashtra', '2023-01-15'),
(2, 'Priya Patel', 'Pune', 'Maharashtra', '2023-02-20'),
(3, 'Rahul Verma', 'Delhi', 'Delhi', '2023-03-10'),
(4, 'Sneha Joshi', 'Nagpur', 'Maharashtra', '2023-04-05'),
(5, 'Vikram Singh', 'Bangalore', 'Karnataka', '2023-05-18'),
(6, 'Neha Gupta', 'Hyderabad', 'Telangana', '2023-06-12'),
(7, 'Arjun Mehta', 'Mumbai', 'Maharashtra', '2023-07-25'),
(8, 'Kavya Rao', 'Chennai', 'Tamil Nadu', '2023-08-14'),
(9, 'Rohan Das', 'Kolkata', 'West Bengal', '2023-09-03'),
(10, 'Pooja Shah', 'Ahmedabad', 'Gujarat', '2023-10-21');

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

INSERT INTO products VALUES
(101, 'Laptop', 'Electronics', 55000),
(102, 'Smartphone', 'Electronics', 30000),
(103, 'Headphones', 'Electronics', 2500),
(104, 'Office Chair', 'Furniture', 8500),
(105, 'Desk', 'Furniture', 12000),
(106, 'Backpack', 'Accessories', 1800),
(107, 'Keyboard', 'Electronics', 1500),
(108, 'Mouse', 'Electronics', 800),
(109, 'Water Bottle', 'Lifestyle', 600),
(110, 'Notebook', 'Stationery', 250);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_status VARCHAR(30),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO orders VALUES
(1001, 1, '2024-01-05', 'Delivered'),
(1002, 2, '2024-01-08', 'Delivered'),
(1003, 3, '2024-01-12', 'Cancelled'),
(1004, 4, '2024-02-02', 'Delivered'),
(1005, 5, '2024-02-10', 'Delivered'),
(1006, 1, '2024-02-15', 'Delivered'),
(1007, 6, '2024-03-01', 'Pending'),
(1008, 7, '2024-03-07', 'Delivered'),
(1009, 8, '2024-03-15', 'Delivered'),
(1010, 9, '2024-03-20', 'Delivered'),
(1011, 10, '2024-04-05', 'Delivered'),
(1012, 3, '2024-04-10', 'Delivered'),
(1013, 4, '2024-04-18', 'Cancelled'),
(1014, 5, '2024-05-02', 'Delivered'),
(1015, 7, '2024-05-15', 'Delivered');

CREATE TABLE order_details (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO order_details VALUES
(1, 1001, 101, 1),
(2, 1001, 103, 2),
(3, 1002, 102, 1),
(4, 1002, 107, 1),
(5, 1003, 104, 1),
(6, 1004, 105, 1),
(7, 1004, 106, 2),
(8, 1005, 101, 1),
(9, 1005, 108, 2),
(10, 1006, 102, 1),
(11, 1006, 103, 1),
(12, 1007, 104, 1),
(13, 1008, 106, 3),
(14, 1008, 107, 1),
(15, 1009, 101, 1),
(16, 1009, 108, 1),
(17, 1010, 105, 1),
(18, 1010, 109, 2),
(19, 1011, 102, 2),
(20, 1012, 103, 2),
(21, 1012, 110, 5),
(22, 1013, 104, 1),
(23, 1014, 101, 1),
(24, 1014, 107, 2),
(25, 1015, 102, 1),
(26, 1015, 109, 3);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_date DATE,
    payment_method VARCHAR(30),
    amount DECIMAL(10,2),
    payment_status VARCHAR(30),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO payments VALUES
(501, 1001, '2024-01-05', 'Credit Card', 60000, 'Paid'),
(502, 1002, '2024-01-08', 'UPI', 31500, 'Paid'),
(503, 1003, '2024-01-12', 'Credit Card', 8500, 'Refunded'),
(504, 1004, '2024-02-02', 'Debit Card', 15600, 'Paid'),
(505, 1005, '2024-02-10', 'UPI', 56600, 'Paid'),
(506, 1006, '2024-02-15', 'Credit Card', 32500, 'Paid'),
(507, 1007, '2024-03-01', 'UPI', 8500, 'Pending'),
(508, 1008, '2024-03-07', 'Cash', 6900, 'Paid'),
(509, 1009, '2024-03-15', 'Credit Card', 55800, 'Paid'),
(510, 1010, '2024-03-20', 'UPI', 13200, 'Paid'),
(511, 1011, '2024-04-05', 'Credit Card', 60000, 'Paid'),
(512, 1012, '2024-04-10', 'Debit Card', 5500, 'Paid'),
(513, 1013, '2024-04-18', 'UPI', 8500, 'Refunded'),
(514, 1014, '2024-05-02', 'Credit Card', 58000, 'Paid'),
(515, 1015, '2024-05-15', 'UPI', 31800, 'Paid');

SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_details;
SELECT * FROM payments;

## From the customers table, display the customer name, city, and state of all customers who live in Maharashtra.
select customer_name,city,state from customers where state="Maharashtra";

## From the products table, display the product name, category, and price of all products whose price is greater than ₹5000
Select product_name,category, price from products where price>5000;

## From the products table, display the product name, category, and price of products that- belong to Electronics AND have a price greater than ₹2000
select product_name,category, price from products where category='Electronics' and price>2000;

## From the customers table, display the customer name, city, and state of customers who live in either Mumbai OR Pune.
select customer_name,state,city from customers where city in ('mumbai','pune');

## From the products table, display all products with their product name, category, and price, sorted from highest price to lowest price.
select product_name,category, price from products order by 3 desc;

## From the products table, find the 3 most expensive products.
select product_name,category, price from products order by 3 desc limit 3;

## From the customers table, display all unique states in which customers live.
select distinct state from customers;

## From the customers table, find the total number of customers.
select count(*)Total_customers from customers;

## How many customers are from Maharashtra?
select count(*)Maharashtra_count from customers where state='Maharashtra';

## From the payments table, calculate the total payment amount received from all payments.
select sum(amount)Total_amount from payments ;

## From the products table, find the average price of all products.
select avg(amount)Avg_price from payments;

## From the products table, find the lowest price and highest price.
select max(price)Max_price,min(price)Min_price from products;

## From the products table, find the number of products in each category.
select category,count(category)Product_count from products group by 1;

## From the order_details table, find the total quantity of products sold for each product_id
select product_id, sum(quantity)Total_quantity from order_details group by 1;

## From the payments table, find the average payment amount for each payment method.
select payment_method,avg(amount)Avg_amount from payments group by 1;

## From the products table, find the categories that have more than 2 products
select category, count(category)product_count from products group by 1 having count(category)>2; 

## From the orders table, find each customer's number of delivered orders, 
## but show only customers who have more than 1 delivered order.
select customer_id,count(*)delivered_order from orders 
where order_status='delivered' 
group by 1 having count(*)>1;

## From the customers table, find all customers who live in Mumbai, Pune, or Nagpur.
select customer_name,city,state from customers where city in ('mumbai','pune','nagpur');

## From the products table, find all products whose price is between ₹1,000 and ₹10,000, including both ₹1,000 and ₹10,000
select product_name,category,price from products where price between 1000 and 10000;

## From the customers table, find all customers whose name starts with the letter A
select customer_name,city,state from customers where customer_name like 'a%'; 

## From the products table, find all products whose name contains the word "o" anywhere in the product name.
select product_name,category,price from products where product_name like '%o%';

## From the orders table, find all orders where the order_status is NULL.
select customer_id,order_id,order_status from orders where order_status is Null;
## From the payments table, find all payments where payment_status is NOT NULL.
select payment_id,amount,payment_status from payments where payment_status is NOT Null;

## Display the customer name, order ID, and order date for every order.
select c.customer_name,o.order_id, o.order_date from customers as c 
join orders as o on c.customer_id=o.customer_id;

## Display:customer name,order ID,product name,quantity
select c.customer_name,o.order_id,p.product_name,od.quantity
from customers as c join orders as o on c.customer_id=o.customer_id 
join order_details as od on o.order_id=od.order_id
join products as p on od.product_id=p.product_id ;

## Find all customers, including customers who have never placed an order.
select c.customer_name,o.order_id from customers as c left join orders as o
on c.customer_id=o.customer_id ;

## Find only the customers who have never placed an order
select c.customer_name,o.order_id from customers as c left join orders as o
on c.customer_id=o.customer_id where order_id is null;

## Find the customer names and order IDs for orders whose status is Delivered.
select c.customer_name,o.order_id from customers as c 
join orders as o on c.customer_id=o.customer_id where order_status='Delivered';

## Find the number of orders placed by each customer.
select c.customer_name,count(o.order_id)Ordercount from customers as c 
join orders as o on c.customer_id=o.customer_id group by 1;

## Find the total amount paid by each customer.
select c.customer_name,sum(p.amount)Total_aount from customers as c 
join orders as o on c.customer_id=o.customer_id join 
payments as p on p.order_id=o.order_id group by 1;

## price_category:Price ≥ 10,000 → High, Price ≥ 5,000 → Medium, Price < 5,000 → Low
select *, case when price>=10000 then 'high' when price>=5000 then 'medium' else 'low' end
price_category from products;

## Create a column called order_priority:Delivered → Completed,Cancelled → Cancelled,Everything else → Pending
select *, case when order_status='DELIVERED' then 'Completed' when order_status='Cancelled' then
'Cancelled' else 'Pending' end as Order_priority from orders;

## Create a column called status_check:If order_status is NULL → 'Unknown',Otherwise → show the actual order_status
select *, case when order_status is null then 'Unknown' else Order_status end Status_check from orders;

## From the products table, find all products whose price is greater than the average product price.
select product_name,price,avg(price) from products where price>(select avg(price) from products) group by 1,2;

## From the products table, find the product(s) with the highest price.
select product_name,price from products where price=(select max(price) from products);
select product_name,price from products limit 1;
 
## Find all customers who have placed at least one order.
select customer_name,city from customers where customer_id in (
select customer_id from orders);  

## Find products whose price is greater than the average product price, using a CTE.
With anyname as (
select avg(price) as avg_price from products )
select product_name,category,price from products where price>(select avg_price from anyname);

## Using a CTE, first calculate the total amount paid for each order, then display the results.
with anyname as (
select order_id,sum(amount)Total_amount from payments group by 1)
select order_id,Total_amount from anyname;

## Using a CTE, find the customers who have placed more than 2 orders.
with anyname as (
select customer_id,count(*)Total_orders from orders group by 1)
select customer_id,Total_orders from anyname where Total_orders > 1; 

## Assign a unique row number to every product, starting from 1, ordered by price from highest to lowest.
select *,row_number() over(order by price desc)Row_no from products;

## From the products table, rank all products by price from highest to lowest.
select *, dense_rank() over(order by price desc)Rnk from products;

## Rank the products by price within each category.
select *, dense_rank() over(partition by category order by price desc)Category_Rnk from products;

## Shows the payment amount from the previous payment date.
select *,lag(amount) over(order by payment_date)previous_payment from payments;

## Find the customer who has placed the highest number of orders.
select customer_id,count(*)order_count from orders group by 1 order by 2 desc limit 1;

## Find the product that generated the highest total revenue.
select p.product_name,sum(p.price * od.quantity) AS total_revenue from products as p
join order_details as od on p.product_id = od.product_id group by p.product_name
order by total_revenue desc limit 1;

## Find all products that have never been ordered.
select p.product_name,p.category from products as p join order_details as od
on p.product_id=od.product_id where od.product_id is null;

## Find the top 3 customers by total spending.
select c.customer_name,sum(p.price*od.quantity)Total_spending from customers as c join orders as o
on c.customer_id=o.customer_id join order_details as od on o.order_id=od.order_id join products as p
on p.product_id=od.product_id group by 1 order by 2 limit 3;