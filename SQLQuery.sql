
create database ESR
go 
use ESR
go


create table adminRegistration(
adminId int Identity(1,1) primary key,
adminName nvarchar(30),
adminEmail nvarchar(30),
adminPassword nvarchar(30)

);

create table Owner(
	id int IDENTITY(1,1) Primary key,
	name nvarchar(50),
	email nvarchar(30),
	password nvarchar(30)
);


create table Customer(
	id int IDENTITY(1,1) primary key,
	name nvarchar(255),
	email nvarchar(255),
	password varchar(50),
);

use ESR
drop table Customer

create table Restaurant(
	id int IDENTITY(1,1) Primary key,
	name nvarchar(200),
	description nvarchar(500),
	address nvarchar(200),
	contact nvarchar(100),
	discount nvarchar(200),
	img nvarchar(300),
	ownerID int foreign key references Owner(id)
	on delete cascade
	on update cascade
);

select * from food

drop table Restaurant

CREATE TABLE staff (
    id int IDENTITY(1,1) Primary key,
    name nvarchar(255),
    email nvarchar(255),
    password nvarchar(255),
	ownerID int foreign key references Owner(id)
	on delete cascade
	on update cascade
);

use ESR
drop table staff
select * from owner


select * from staff

CREATE TABLE food (
	id int IDENTITY(1,1) primary key,
    name varchar(255),
	type varchar(100),
    description varchar(500),
    price int,
	restaurantID int foreign key references Restaurant(id)
	on delete cascade
	on update cascade
);

use ESR
drop table food

use ESR


select * from Restaurant

create table feedback(
	id int IDENTITY(1,1) primary key,
	review	nvarchar(500),
	rating float,
	restaurantId int foreign key references Restaurant(id),
	customerId int foreign key references Customer(id)
	on delete cascade
	on update cascade
);

drop table feedback

select * from feedback


select * from feedback

select *from adminRegistration
select *from Owner
select * from Restaurant
select * from staff
select * from food
select * from Customer

use ESR
drop table owner
drop table Restaurant
drop table Owner
drop table fooduser
drop table Customer

drop table food
