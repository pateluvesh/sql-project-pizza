create database pizzasalesdb;
use pizzasalesdb;


create table pizzasales(
pizza_id int primary key auto_increment,
order_id int,
pizza_name_id varchar(50),
quantity int,
order_date date,
order_time time,
unit_price float,
total_price float,
pizza_size varchar(50),
pizza_category varchar(50),
pizza_ingredients varchar(200),
pizza_name varchar(100)
);





select* from pizzasales;





-- 1. Daily trend for total Orders.alter
	Select Day(order_date) as Day, Count(order_id) as "Total Orders" from pizzasales
    Group by Day;
    
-- 2. Monthly Trend for Total Orders.
	Select hour(order_time) as Hours,count(order_id) as "Total Orders" from pizzasales
    Group by Hours;

-- 3. Percentage of Sales by Pizza Category.
	Select pizza_category,Sum(quantity) as Sales from pizzasales
    Group by pizza_category;

-- 4. Percentage of Sales by Pizza Size.
	Select pizza_size,Sum(quantity) as Sales from pizzasales
    Group by pizza_size;

-- 5. Total Pizza Sold by Pizza Category.
	Select pizza_category,Count(*) as Total_Pizza_Sold from pizzasales
    Group by pizza_category;

-- 6. Top 5 Best Sellers by Revenue, Total Quantity and Total Orders.
	Select pizza_name, Round(sum(Total_price),2) as Revenue, sum(quantity) as Total_Quantity, count(*) as Total_Orders
    from pizzasales
    Group by pizza_name
    Order by Revenue desc,Total_Quantity desc,Total_Orders desc limit 5;

-- 7. Bottom 5 Best Sellers by Revenue, Total Quantity and Total Orders.
	Select pizza_name, Round(sum(Total_price),2) as Revenue, sum(quantity) as Total_Quantity, count(*) as Total_Orders
    from pizzasales
    Group by pizza_name
    Order by Revenue,Total_Quantity,Total_Orders limit 5;
    
    
    
    
    
    
    -- 1. Total Revenue: The sum of the total price of all pizza orders.
	Select Round(Sum(Total_price),2) as "Total Revenue" from pizzasales;

-- 2. Average Order Value: The average amount spent per order.
	Select Round(sum(total_price)/Count(distinct(order_id)),2) as "Average Order Value" from pizzasales; 
    
-- 3. Total Pizzas Sold: The sum of the quantities of all pizza sold.
	Select Sum(quantity) as "Total Pizzas Sold" from pizzasales;

-- 4. Total Orders: The total number of orders placed.
	Select Count(distinct(order_id)) as "Total Orders" from pizzasales;
    
-- 5. Average Pizza Per Order: The average number of pizzas sold per order.
	Select Round(sum(quantity)/Count(distinct(order_id))) as "Average Pizza Per Order" from pizzasales;