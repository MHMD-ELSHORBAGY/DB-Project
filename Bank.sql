create database MyBank
go

use MyBank;

CREATE TABLE employee (
	ssn	CHAR(9) primary key,
	name VARCHAR(20)  NOT NULL,
	phone_num INT,
	start_date date NOT NULL,
	manager_ssn CHAR(9)
	)
	
/*  modifing unique value constraint */
alter table employee add unique (phone_num)

/* add manager id as foreign key */
ALTER TABLE employee
ADD FOREIGN KEY (manager_ssn) REFERENCES employee(ssn);

create table customar(
	ssn char(9) primary key,
	name varchar(20) not null,
	address varchar(30),
	employee_ssn char(9) foreign key references employee(ssn)
	)


create table dependent(
	name varchar(20) ,
	age int,
	employee_ssn char(9) foreign key references employee(ssn),
	primary key(name,employee_ssn)
	)

create table account(
	number int primary key identity(1,1),
	balance float default 0,
	owner_ssn char(9) foreign key references customar(ssn)
	)


create table saving_account(
	number int foreign key references account(number),
	interest_rate float 
	)

create table checking_account(
	number int foreign key references account(number),
	overdraft_amount float default 500
	)

create table branch(
	name varchar(10) primary key,
	city varchar(10),
	available_cash float
	)

create table loan(
	number int primary key identity(1,1),
	amount float not null,
	customar_ssn char(9) foreign key references customar(ssn),
	branch_name varchar(10) foreign key references branch(name),
	borrow_date date
	)

create table payment(
	number int primary key identity(1,1), 
	loan_no int not null foreign key references loan(number),
	amount float not null,
	date date
	)

create table trans(
	customar_ssn char(9) not null foreign key references customar(ssn),
	account_no int not null foreign key references account(number),
	date date,
	type char not null,
	amount float not null
	)



/* Insert employees data */
insert into employee 
values (780924598, 'Saad Eldaly', 01111111111, '2001-02-13', null),
	(193702892, 'Johnny depp', 01000000000, '2002-02-12', 780924598),
	(11111111, 'Adel Shakal', 01113111111, '2010-12-13', 193702892),
	(222222222, 'Johnny depp', 01040500000, '2002-02-12', 780924598),
	(333333333, 'Soaad Hosny', 01040000000, '2015-03-01', 780924598)

/* create trigger to make account for the new customars */
create trigger new_account
on customar after insert
as
	begin
		declare @ssn char(9);
		select @ssn = e.ssn from inserted e;
		insert into account(owner_ssn) values (@ssn)
	end

drop trigger new_account
delete customar
delete account
select * from account

/* insert customars with new accounts */
insert into customar
values (444444444, 'Mohamed Abohend', 'Gharbia', 780924598);
insert into customar
values(555555555, 'Mohamed Elshorbagy', 'Menofia', 193702892);
insert into customar
values(666666666, 'Ebrahim', 'Alexandria', 193702892);
insert into customar
values(999999999, 'Mohamed Elsha7at', 'Marsa Matro7', 222222222);
insert into customar
values(123456789, 'Mohamed Konsowa', 'El3lmeen', 333333333);


/* create accounts as saving accounts or checking accounts */
insert into saving_account
values


create trigger deposite
	on account after insert
	as
	begin
		/* if the account is saving account */
		/* insert into the interest account upon on saving account */
		/* else (the account is checking account */
		/* deal with it */
	end