select * from sales;

select s.salesperson, s.product, SUM(s.sales_quantity) from sales s
group by s.salesperson, s.product;

select s.salesperson, s.product, SUM(s.sales_quantity) from sales s
group by rollup (s.salesperson, s.product);

select s.salesperson, SUM(s.sales_quantity) from sales s
group by cube (s.salesperson, s.product)

select p.* from salesperson p
left join sales s on s.salesperson = p.salesid
where s.salesperson is null;

select pr.description from sales s
join product pr on pr.productid = s.product
group by pr.description
having COUNT(s.salesperson) > 1;

select c.description from sales s
join colour c on c.colourcode = s.colour
group by c.description
order by COUNT(c.description) desc
limit 1;

select pr.description, s.sales_quantity, (pr.sellingprice * s.sales_quantity) as "profit" from sales s
join product pr on pr.productid = s.product;

