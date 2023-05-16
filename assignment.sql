drop table fact_sales;
drop table customer;
drop table cinema;
drop table movie;
drop table category;
drop table promotion;
drop table seat;
drop table hall;
drop table screening;

/* Customer */
create table customer (
	customer_id serial primary key,
	name varchar(255) not null,
	email varchar(255) not null,
	contact varchar(50) not null,
	membership boolean not null
);

/* Cinema */
create table cinema (
	cinema_id serial primary key,
	name varchar(255),
	address varchar(255),
	city varchar(255) not null,
	state varchar(255) not null
);

/* Movie */
create table movie (
	movie_id serial primary key,
	name varchar(255) not null,
	release_date date not null,
	running_minutes decimal(10, 2) not null,
	genre varchar(50) not null,
	language varchar(50) not null,
	classification varchar(10) not null
);

/* Category */
create table category (
	category_id serial primary key,
	name varchar(255) not null,
	price decimal(10, 2) not null
);

/* Promotion */
create table promotion (
	promotion_id serial primary key,
	code varchar(255) not null,
	description varchar(255) not null,
	discount decimal(10, 2) not null,
	promo_start date not null,
	promo_end date not null
);

/* Hall */
create table hall (
	hall_id serial primary key,
	number integer not null,
	capacity integer not null
);

/* Seat */
create table seat (
	seat_id serial primary key,
	number varchar(10) not null,
	type varchar(50) not null,
	additional_charges decimal(10, 2) not null
);

/* Screening */
create table screening (
	screening_id serial primary key,
	date_time timestamp not null
);

/* Sales (Fact Table) */
create table fact_sales (
	customer_id integer not null,
	cinema_id integer not null,
	movie_id integer not null,
	category_id integer not null,
	screening_id integer not null,
	hall_id integer not null,
	seat_id integer not null,
	promotion_id integer not null,
	paid_total decimal(10, 2) not null,
	foreign key (customer_id) references customer(customer_id),
	foreign key (cinema_id) references cinema(cinema_id),
	foreign key (movie_id) references movie(movie_id),
	foreign key (category_id) references category(category_id),
	foreign key (screening_id) references screening(screening_id),
	foreign key (hall_id) references hall(hall_id),
	foreign key (seat_id) references seat(seat_id),
	foreign key (promotion_id) references promotion(promotion_id),
	primary key (customer_id, cinema_id, movie_id, category_id, screening_id, seat_id, promotion_id)
);




delete from fact_sales;
delete from customer;
delete from cinema;
delete from movie;
delete from category;
delete from promotion;
delete from seat;
delete from hall;
delete from screening;

ALTER SEQUENCE customer_customer_id_seq RESTART WITH 1;
ALTER SEQUENCE cinema_cinema_id_seq RESTART WITH 1;
ALTER SEQUENCE movie_movie_id_seq RESTART WITH 1;
ALTER SEQUENCE category_category_id_seq RESTART WITH 1;
ALTER SEQUENCE promotion_promotion_id_seq RESTART WITH 1;
ALTER SEQUENCE seat_seat_id_seq RESTART WITH 1;
ALTER SEQUENCE hall_hall_id_seq RESTART WITH 1;
ALTER SEQUENCE screening_screening_id_seq RESTART WITH 1;

/* Customer data */
insert into customer (name, email, contact, membership) values
	('Fong Zheng Wei','fongzw@gmail.com','0123229588',true),
	('Liew Jiann Shen','ljs0056@gmail.com','0165846148',true),
	('Nagaindran','naga@gmail.com','017565956',false),
	('Raven Lim','raven1010@gmail.com','0125668646',false),
	('Khye Neoh','ky@gmail.com','012656568',false),
	('Tee Wei How','twh0001@gmail.com','0164554458',false),
	('William Hii','william@gmail.com','0178565684',true),
	('David Hooi','david@gmail.com','017565956',false),
	('Muthyramy','muthu@gmail.com','0136985623',true),
	('Mohd Fariz','farez@gmail.com','0158765484',true);

/* Cinema data */
insert into cinema (name, address, city, state) values
	('SSC Cyberjaya','Jalan Teknokrat 1','Cyberjaya','Selangor'),
	('SSC Puchong','Jalan Besar 5','Puchong','Selangor'),
	('SSC Malacca City','Jalan Hang Tuah 2','Melaka City','Melaka'),
	('SSC Georgetown','Jalan Swenson 3','Georgetown','Penang'),
	('SSC Johor','Jalan Ismail 4','Johor Bahru','Johor'),
	('SSC Kuala Lumpur','Jalan Lumpur 6/9','Kuala Lumpur','Kuala Lumpur'),
	('SSC Kuantan','Jalan Timur 1/1','Kuantan','Pahang'),
	('SSC Ipoh','Jalan Sultan Idris 1','Ipoh','Perak'),
	('SSC Seremban','Jalan Timur 1/1','Kuantan','Pahang'),
	('SSC Ipoh','Jalan Melati 7','Seremban','Negeri Sembilan');

/* Movie data */
insert into movie (name, release_date, running_minutes, genre, language, classification) values
	('The Super Mario Bros Movie','2023-04-20',93,'Animation','English','P12'),
	('Guardian of the Galaxy','2023-05-05',150,'Action','English','P12'),
	('Ponniyin Selvan Part 2','2023-04-28',165,'Historical','Tamil','P12'),
	('VII XII','2023-05-04',86,'Action','Malay','13'),
	('Flashover','2023-04-28',75,'Action','Mandarin','P12'),
	('The Ghost Station','2023-05-04',71,'Horror','Korean','13'),
	('Beautiful Disaster','2023-05-04',95,'Romance','English','18'),
	('John Wick 4','2023-03-23',170,'Action','English','18'),
	('Suzume','2023-03-09',120,'Animation','Japanese','P12'),
	('The First Slam Dunk','2023-02-23',125,'Animation','Japanese','13');

/* Category data */
insert into category (name, price) values
	('2D',16.50),
	('3D',19.50),
	('MAXX',23.50),
	('DBOX',29.50),
	('4DX',33.50),
	('Atmos',23.50),
	('Gold Class',54.50),
	('Premier Class',30.50),
	('Big Screen',28.50),
	('Morning 2D',11.50);

/* Promotion data */
insert into promotion (code, description ,discount, promo_start, promo_end) values
	('','No promotion',0.00,'2000-01-01','2999-12-31'),
	('NEWSSC','Newcomer discount',10.00,'2023-05-11','2023-06-11'),
	('MAYBANK5','Maybank Promo',5.00,'2023-05-20','2023-05-31'),
	('MAY','Super Saver May ',5.50,'2023-05-01','2023-05-31'),
	('ALLIANZ','AllianzBank Promo ',8.00,'2023-05-25','2023-06-05'),
	('STUDENT','Student Price Promo',7.50,'2023-05-01','2023-07-31'),
	('JUNE6','June Fiesta',6.60,'2023-06-01','2023-06-30'),
	('SSCANNIVERSARY','SSC Anniversary',10.00,'2023-06-20','2023-06-25'),
	('ALLYEAR','All year discount',5.00,'2023-01-01','2023-12-31'),
	('HOLIDAY','Holiday Discount ',11.50,'2023-12-01','2023-12-15');

/* Hall data */
insert into hall (number, capacity) values
	('1',150),
	('2',120),
	('3',120),
	('4',100),
	('5',100),
	('6',80),
	('7',80),
	('8',60),
	('9',60),
	('10',60);
	
/* Seat data */
insert into seat (number, type, additional_charges) values
	('A1','Couple',5.00),
	('A2','Couple',5.00),
	('A3','Couple',5.00),
	('A4','Couple',5.00),
	('A5','Couple',5.00),
	('B1','Normal',0.00),
	('B2','Normal',0.00),
	('B3','Normal',0.00),
	('B4','Normal',0.00),
	('B5','Normal',0.00),
	('B6','Normal',0.00),
	('B7','Normal',0.00),
	('B8','Normal',0.00),
	('B9','Normal',0.00),
	('B10','Normal',0.00);

/* Screening data */
insert into screening (date_time) values
	('2023-05-10 10:30:00'),
	('2023-05-10 11:45:00'),
	('2023-05-10 13:15:00'),
	('2023-05-10 15:30:00'),
	('2023-05-10 18:10:00'),
	('2023-05-11 11:45:00'),
	('2023-05-11 14:20:00'),
	('2023-05-11 16:30:00'),
	('2023-05-11 19:35:00'),
	('2023-05-11 22:00:00');

/* Sales (Fact Table) data */
INSERT INTO fact_sales (customer_id, cinema_id, movie_id, category_id, screening_id, hall_id, seat_id, promotion_id, paid_total) VALUES
	(1, 1, 9, 5, 2, 1, 6, 2, 23.50),
	(1, 1, 9, 5, 2, 1, 7, 2, 23.50),
	(2, 2, 10, 1, 4, 2, 3, 1, 21.50),
	(3, 6, 2, 6, 9, 2, 11, 4, 18.00),
	(3, 6, 2, 6, 9, 2, 12, 4, 18.00),
	(3, 6, 5, 8, 7, 7, 11, 4, 25.00),
	(5, 4, 1, 10, 6, 5, 2, 1, 16.50),
	(5, 4, 1, 10, 6, 5, 3, 1, 16.50),
	(9, 8, 7, 1, 10, 9, 14, 9, 11.50),
	(9, 8, 7, 1, 10, 9, 15, 9, 11.50);

select * from fact_sales;
select * from customer;
select * from cinema;
select * from movie;
select * from category;
select * from promotion;
select * from hall;
select * from seat;
select * from screening;


/* 6a */
/* Increases the price of non 2D categories */
create or replace procedure increase_non_2D_category_prices(increase decimal)
language plpgsql
as $$
begin
	update category
	set price = price + increase
	where name not like '%2D%';
end; $$;

call increase_non_2d_category_prices(2.50);
select * from category;

/* 6b */
/* Automatically calculate the paid_total column in fact_sales */
create or replace function calculate_price() returns trigger
language plpgsql
as $$
declare
	_base_price decimal;
	_seat_price decimal;
	_promotion_discount decimal;
	_membership boolean;
	_membership_mlt decimal;
	_price decimal;
begin
	/* Get initial price */
	select price from category
	where category_id = new.category_id into _base_price;

	select additional_charges from seat
	where seat_id = new.seat_id into _seat_price;

	select discount from promotion
	where promotion_id = new.promotion_id into _promotion_discount;

	select membership from customer
	where customer_id = new.customer_id into _membership;

	 if _membership
	 then
	 	_membership_mlt = 0.8;
	 else
	 	_membership_mlt = 1;
	 end if;

	_price = (_base_price + _seat_price) * _membership_mlt - _promotion_discount;

	new.paid_total = _price;
	return new;
end; $$

create or replace trigger price_total_trigger
before insert or update
on fact_sales
for each row
execute procedure calculate_price();

/* 6c */
/* Retrieves a customer's purchase history */
drop function get_customer_purchase_history;
create or replace function get_customer_purchase_history(_customer_id integer)
returns table(
	customer_name varchar(255),
	cinema_name varchar(255),
	movie_name varchar(255),
	category varchar(255),
	hall_number integer,
	seat_number varchar(10),
	paid_amount decimal(10,2),
	date_time timestamp
)
language plpgsql
as $$
begin
	return QUERY
	select c.name, cin.name, m.name, cat.name, h.number, s.number, f.paid_total, sc.date_time from fact_sales f
	join customer c on c.customer_id = f.customer_id
	join cinema cin on cin.cinema_id = f.cinema_id
	join movie m on m.movie_id = f.movie_id
	join category cat on cat.category_id = f.category_id
	join seat s on s.seat_id = f.seat_id
	join hall h on h.hall_id = f.hall_id
	join screening sc on sc.screening_id = f.screening_id
	where f.customer_id = _customer_id
	order by sc.date_time;
end; $$;

select * from get_customer_purchase_history(3);




select * from fact_sales;
INSERT INTO fact_sales (customer_id, cinema_id, movie_id, category_id, screening_id, hall_id, seat_id, promotion_id, paid_total) VALUES
	(1, 1, 9, 5, 8, 5, 6, 4, 0.00);
delete from fact_sales
where paid_total = 23.3;
select c.membership, cat.price, s.additional_charges, p.discount, paid_total, ((cat.price + s.additional_charges) * 0.8 - p.discount) as "calculated_price" from fact_sales f
join customer c on f.customer_id = c.customer_id
join category cat on f.category_id = cat.category_id
join seat s on f.seat_id = s.seat_id
join promotion p on f.promotion_id = p.promotion_id;


/* Tickets Information */
select s.number as "Seat Number", h.number as "Hall Number", m.name as "Movie", c.name as "Cinema"
from fact_sales f
join seat s on (f.seat_id = s.seat_id)
join hall h on (f.hall_id = h.hall_id)
join movie m on (f.movie_id = m.movie_id)
join cinema c on (f.cinema_id = c.cinema_id);

/* ROLLUP of how much a customer (who has spent at least RM20 in total) spent in a movie */
select c.name as "Customer", m.name as "Movie", sum(paid_total) as "Paid Price"
from fact_sales f
join customer c on (f.customer_id = c.customer_id)
join movie m on (f.movie_id = m.movie_id)
group by rollup (c.name, m.name)
having sum(paid_total) > 20
order by c.name asc;

/* View of members */
create or replace view membership as
	select customer.name, customer.membership
	from customer
	where customer.membership;
select * from membership;
drop view membership;

/* Rank the movies that has generated from least to most money (ignores movie that has never been watched) */
select m.name as movie, sum(paid_total) as movie_total,
percent_rank() over (order by sum(paid_total))
from fact_sales f
join movie m on (f.movie_id = m.movie_id)
group by(m.name)

select * from fact_sales;

/* Shows the most a customer has spent on a ticket, sorted by the top spender on a single ticket */
select name, paid_total as "Paid Most" from (
	select c.name, f.paid_total, row_number() over(
		partition by(c.name) order by paid_total desc
	) as row_no
	from fact_sales f
	join customer c on c.customer_id = f.customer_id
) as purchases
where row_no = 1
order by paid_total desc;


