create database lesson_1_hw;
use lesson_1_hw
go

--Task1;
drop table if exists student;
create table student
(
	id int,
	name varchar(100),
	age int
);

alter table student
alter column id int not null;

select * from student

--Task2;
drop table if exists product;
create table product
(
	product_id int constraint uq_product_id unique,
	product_name varchar(100),
	price decimal(10, 2)
);

alter table product
drop constraint uq_product_id

ALTER TABLE product
ADD CONSTRAINT product_id_name_unique UNIQUE (product_id, product_name);


select * from product 

--Task3;
drop table if exists orders
create table orders (
    order_id int primary key,
    customer_name varchar(255),
    order_date date
);

alter table orders
drop constraint orders_pkey;

alter table orders
add constraint orders_pkey primary key (order_id);

select * from orders

--Task4;

drop table if exists category
create table category (
    category_id int primary key,
    category_name varchar(255)
);

drop table if exists item
create table item (
    item_id int primary key,
    item_name varchar(255),
    category_id int,
    constraint fk_category foreign key (category_id) references category(category_id)
);

alter table item drop constraint fk_category

alter table item
add constraint fk_category foreign key (category_id) references category(category_id);

--Task5;
create table account
(
	account_id int primary key,
	balance decimal(10, 2) check (balance >= 0),
    account_type varchar(100) check (account_type in ('Saving', 'Checking'))
);

alter table account drop constraint chk_balance_non_negative;
alter table account drop constraint chk_account_type;

alter table account
add constraint chk_balance_non_negative check (balance >= 0);

alter table account
add constraint chk_account_type check (account_type in ('Saving', 'Checking'));


--Task6;

create table customer 
(    
	customer_id int primary key,
    name varchar(255),
    city varchar(100) default 'Unknown' for city
);

alter table customer drop constraint df_city_default_unknown;

alter table customer
add constraint df_city_default_unknown default 'Unknown' for city;

--Task7;

create table invoice
(
	invoice_id int identity(1,1) primary key,
	amount decimal(10,2)
);
insert into invoice (amount) values (100.00);
insert into invoice (amount) values (200.50);
insert into invoice (amount) values (300.00);
insert into invoice (amount) values (150.25);
insert into invoice (amount) values (400.00);

set identity_insert invoice on;
insert into invoice (invoice_id, amount) values (100, 999.99);
set identity_insert invoice off;

select * from invoice

--Task8;

create table books
(
	book_id int identity(1,1) primary key,
	title varchar(255) not null check (len(title) > 0),
	price decimal(10,2) check (price > 0),
	genre varchar(100) default 'Unknown'
);

insert into books (title, price, genre) values ('Book One', 25.99, 'Fiction');
insert into books (title, price) values ('Book Two', 15.00);

select * from books

--Task9;

create table Book 
(
    book_id int primary key,
    title text not null,
    author text not null,
    published_year int
);

create table member  
(
    member_id int primary key,
    name text not null,
    email text,
    phone_number text
);

create table Loan 
(
    loan_id int primary key,
    book_id int,
    member_id int,
    loan_date date not null,
    return_date date,
    foreign key (book_id) references Book(book_id),
    foreign key (member_id) references member(member_id)
);
