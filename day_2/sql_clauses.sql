

create table  products(id serial,name varchar(20),price decimal, dom date, category varchar(20),doe date);

insert into products values(1001,'fan',2850.75,'2022-11-24','electronics','2024-11-24'),
							(1002,'chair',2450.75,'2023-07-24','furniture','2024-10-4'),
							(1003,'table',14450.75,'2022-05-24','furniture','2024-10-4'),
							(1004,'Head-First-Java',250.75,'2022-06-24','book','2026-11-24'),
							(1005,'Spring-in-Action',450.75,'2022-1-02','book','2025-12-24'),
							(1006,'phone',42450.75,'2002-10-22','electronics','2022-09-14');

select *from products;

select id,name,dom as date_of_manufacture,category from products where category='furniture';
select id,name,dom as date_of_manufacture,category from products where category='book';


--find out the total price of products of each category--

select category, sum(price) as total_price from products group by category;

--find out the product with max price in each category--

select category, max(price) as max_price from products group by category;


--find out the product with min price in each category--

select category, min(price) as min_price from products group by category;


--find out the product with max price in each category and that category must not be electornics--

select category, max(price) as max_product_price from products group by category having category not in('electronics');


--find out the total products price in each category--
select category, sum(price) as total_products_price from products group by category;


--find out the total products price in each category and that category total_price must be > 1000 --
select category, sum(price) as total_products_price from products group by category having sum(price) >20000;


--find the first 3 rows from products table--
select *from products;
select *from products limit 2 ;
select *from products offset 3;
select *from products order by id offset 2 limit 2;

--how to order the rows--

select id,name, price from products order by name;

select id,name, price from products order by name desc;

select id,name, price from products order by id asc;

select id,name, price from products order by price desc;















































