create database lesson_2_hw
use lesson_2_hw
go

--Task1;

create table test_identity
(
	id int identity(1,1) primary key,
	name varchar(100)
);
insert into test_identity (name) 
values ('A'), ('B'), ('C'), ('D'), ('E');

select * from test_identity

delete from test_identity

insert into test_identity (name) values ('F');

truncate table test_identity

insert into test_identity (name) values ('G');

drop table test_identity


--Task2;

create table data_types_demo
(
	id int primary key,
	name varchar(100),
	description text,
	created_at datetime,
	is_active bit,
	salary decimal(10,2),
	score float,
	birth_date date,
	profile_picture varbinary(max)
);
insert into  data_types_demo (id, name, description, created_at, is_active, salary, score, birth_date, profile_picture
)
values (
	1,
	'Akmal',
	'Junior devoloper in MAAB INNOVATION',
	GETDAte(),
	1,
	100000.25,
	95.5,
    '2004-10-26',
	convert(varbinary(max), 'SampleImageData') 
);

select * from data_types_demo

--Task3;
drop table if exists photos
create table photos
(
	id int primary key,
	image varbinary(max)
);
insert into photos
select 1,  BulkColumn from openrowset(
	bulk 'C:\Users\user\Desktop\IT darsliklar\Python\Sql_lessons\images\iphone.jfif', single_blob 
) as image_file


--Task4;

 create table student
(
	id int primary key,
	name varchar(100),
	classes int, 
	tuition_per_class decimal(10,2),
	total_tuition as (classes * tuition_per_class)
);

insert into student (id, name, classes, tuition_per_class)
values
(1, 'Ali', 5, 150.00),
(2, 'Bob', 3, 200.00),
(3, 'Josh', 4, 175.50);

select * from student

--Task5;


create table worker 
(
	id int primary key,
	name varchar(100)
);

bulk insert worker
from 'C:\Users\user\Desktop\IT darsliklar\Python\Sql_lessons\SQL\MyProject\MyProject\text.csv'
with (
    firstrow = 2,         
    fieldterminator = ',', 
    rowterminator  = '\n',
    codepage = '65001',   
    tablock
);

select * from worker

