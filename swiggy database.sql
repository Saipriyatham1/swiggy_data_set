CREATE TABLE goldusers_signup(userid integer,gold_signup_date date); 

INSERT INTO goldusers_signup(userid,gold_signup_date) 
 VALUES (1,'09-22-2017'),
(3,'04-21-2017');

 CREATE TABLE users(userid integer,signup_date date); 

INSERT INTO users(userid,signup_date) 
 VALUES (1,'09-02-2014'),
(2,'01-15-2015'),
(3,'04-11-2014');

 CREATE TABLE sales(userid integer,created_date date,product_id integer); 

INSERT INTO sales(userid,created_date,product_id) 
 VALUES (1,'04-19-2017',2),
(3,'12-18-2019',1),
(2,'07-20-2020',3),
(1,'10-23-2019',2),
(1,'03-19-2018',3),
(3,'12-20-2016',2),
(1,'11-09-2016',1),
(1,'05-20-2016',3),
(2,'09-24-2017',1),
(1,'03-11-2017',2),
(1,'03-11-2016',1),
(3,'11-10-2016',1),
(3,'12-07-2017',2),
(3,'12-15-2016',2),
(2,'11-08-2017',2),
(2,'09-10-2018',3);

CREATE TABLE products(product_id integer,product_name text,price integer); 

INSERT INTO products(product_id,product_name,price) 
 VALUES
(1,'p1',980),
(2,'p2',870),
(3,'p3',330);
select * from goldusers_signup;
select *from users;
select *from sales;
select *from products;


 select a.userid ,a.created_date, a.product_id,b.product_name, b.price from sales as a inner join products as b on a.product_id= b.product_id

 select * from sales as a left join products as b on a.product_id= b.product_id 
 
 select * from users as a left join goldusers_signup as b on a.userid= b.userid

 select * from users as a full outer join goldusers_signup as b on a.userid= b.userid

  ##1. what is the total amount each coustmer spent on zomato

select a.userid ,sum(b.price)total_amount_spent from sales as a inner join products as b on a.product_id= b.product_id
group by userid;

  ##2. how many days has each constumer visited zomato?

 select userid,count(distinct created_date)no_of_visiting_days from sales group by userid;

 ##3 what was the first product purchased by each constumer?
 select *from
(select *,rank() over(partition by userid order by created_date)rnkings from sales)a where rnkings=1

 ##4. what was the most purchased item on the menu and how many times it was purchased by costumers?

 select product_id, count(product_id)times_of_purchased from sales group by product_id 
 order by count(product_id)desc

 ##5. which item is the most popular for each costumer?







