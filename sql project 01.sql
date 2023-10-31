create table pizzaSales (
	pizza_id int8 primary key,
	order_id int8,
	pizza_name_id varchar(80),
	quantity int8,
	order_date date,
	order_time time,
	unit_price float,
	total_price float,
	pizza_size varchar(10),
	pizza_category varchar(100),
	pizza_ingredients varchar(255),
	pizza_name varchar(255)

);


select * from pizzaSales;
-- total revenue
SELECT SUM(total_price) as Total_price FROM pizzaSales;

-- Average Order Values
SELECT (SUM(total_price)/COUNT(DISTINCT order_id)) as Avg_order FROM pizzaSales;

SELECT CAST(ROUND
			((SUM(total_price)/COUNT(DISTINCT order_id)) ::numeric,2)
			as DOUBLE PRECISION) as avg_order from pizzaSales;

-- Total Pizzas Sold
SELECT SUM(quantity) as total_pizza_sold FROM pizzaSales;

-- Total Orders
SELECT COUNT(DISTINCT order_id) FROM pizzaSales;

-- Average Pizzas Per Order = total_pizza/distinct order_id
SELECT (SUM(quantity)/COUNT(DISTINCT order_id)) AS Average_pizza_PerOrder FROM pizzaSales;

select * from pizzaSales;
-- Daily Trend for Total Orders
SELECT TO_CHAR(order_date, 'Day') AS day_of_week,
COUNT(DISTINCT order_id) FROM pizzaSales 
GROUP BY Day_of_week;
			
-- Monthly trend for orders
SELECT TO_CHAR(order_date,'Month') as month_of_year,
COUNT(DISTINCT order_id) FROM pizzaSales
GROUP BY month_of_year;
			
-- % Sales by Pizza Category
SELECT pizza_category,
	CAST(
		ROUND(
			(SUM(total_price)*100/(SELECT SUM(total_price) FROM pizzaSales))::numeric, 2)
		as DOUBLE PRECISION) as percentage_sales_by_PizzaCategory
	FROM pizzaSales GROUP BY pizza_category;

-- % Sales by Pizza size
SELECT pizza_size, CAST(
		ROUND((SUM(total_price)*100/(SELECT SUM(total_price) FROM pizzaSales))::numeric,2) 
		AS DOUBLE PRECISION) as percentage_sales_by_PizzaSize
		FROM pizzaSales GROUP BY pizza_size;

select * from pizzaSales;
-- Total Pizzas sold by Pizza Category
SELECT pizza_category, SUM(quantity) as total_quantity 
FROM pizzaSales
GROUP BY pizza_category
ORDER BY total_quantity;
		
-- Top 5 Pizza name by revenue
SELECT pizza_name,
CAST(ROUND(sum(total_price)::numeric,2) AS double precision) AS top_5_pizza_by_revenue
from pizzaSales
GROUP BY pizza_name
ORDER BY top_5_pizza_by_revenue DESC
LIMIT 5;
		
-- Bottom 5 pizza name by revenue
SELECT pizza_name,
CAST(ROUND(SUM(total_price)::NUMERIC, 2) AS DOUBLE PRECISION) AS bottom_5_pizza_by_revenue
FROM pizzaSales
GROUP BY pizza_name
ORDER BY bottom_5_pizza_by_revenue ASC
LIMIT 5;

-- Top 5 pizza name by Quantity
SELECT pizza_name, SUM(quantity) AS top_5_pizza_by_quantity
FROM pizzaSales GROUP BY pizza_name
ORDER BY top_5_pizza_by_quantity DESC LIMIT 5;

-- Bottom 5 pizza name by Quantity
SELECT pizza_name, SUM(quantity) as bottom_5_pizza_by_quantity
FROM pizzaSales GROUP BY pizza_name
ORDER BY bottom_5_pizza_by_quantity LIMIT 5;

-- Top 5 Pizza name by total order
SELECT pizza_name, COUNT(DISTINCT order_id) as top_5_pizza_by_order
FROM pizzaSales
GROUP BY pizza_name
ORDER BY top_5_pizza_by_order DESC LIMIT 5 ;

-- Bottom 5 pizza name by total order
SELECT pizza_name, COUNT(DISTINCT order_id) AS bottom_5_pizza_by_order
FROM pizzaSales
GROUP BY pizza_name
ORDER BY bottom_5_pizza_by_order LIMIT 5;