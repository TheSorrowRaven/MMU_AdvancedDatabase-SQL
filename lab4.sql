
/* 1 */
create database lab4;

/* 2 */
create table sales
(
	salesperson varchar(20),
	product varchar(20),
	size varchar(5),
	colour varchar(15),
	sales_quantity int
);

drop table sales;

insert into sales
values
('Sandy', 'T-Shirt', 'L', 'Red', 100),
('Ally', 'Raincoat', 'M', 'Red', 20),
('Sandy', 'T-Shirt', 'L', 'Yellow', 50),
('William', 'Pants', 'XL', 'Beige', 15),
('William', 'Pants', 'L', 'Black', 40),
('Sandy', 'Pants', 'L', 'Black', 50),
('Ally', 'Raincoat', 'L', 'Pink', 60),
('William', 'Raincoat', 'S', 'Green', 50),
('Joshua', 'T-Shirt', 'L', 'Blue', 35),
('Joshua', 'Pants', 'M', 'Grey', 150);

select * from sales;

/* 3 */
SELECT Salesperson, Product,
SUM(Sales_Quantity) as "Sum_of_SP_Product"
FROM Sales
GROUP BY Salesperson, Product;

/* 4 */
SELECT Salesperson, Product,
SUM(Sales_Quantity) AS "Sum_ROLLUP_SP_Product"
FROM Sales
GROUP BY ROLLUP (Salesperson, Product)
ORDER BY SalesPerson, Product;

/* 5 */
SELECT Salesperson, Product,
SUM(Sales_Quantity) AS "Sum_ROLLUP_SP_Product"
FROM Sales
GROUP BY ROLLUP (Product, Salesperson)
ORDER BY SalesPerson, Product;

/* 6 */
SELECT Salesperson, Product,
SUM(Sales_Quantity) AS "Sum_CUBE_SP_Product"
FROM Sales
GROUP BY CUBE(Salesperson, Product)
ORDER BY SalesPerson, Product;
