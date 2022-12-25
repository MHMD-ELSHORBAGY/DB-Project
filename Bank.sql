create database Bank;

use Bank;

CREATE TABLE employee (
	ssn	CHAR(9) primary key,
	name VARCHAR(20)  NOT NULL,
	phone_num INT,
	start_date date NOT NULL,
	manager_ssn CHAR(9)
	)

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
	number int primary key,
	balance float ,
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
	number int primary key,
	amount float not null,
	customar_ssn char(9) foreign key references customar(ssn),
	branch_name varchar(10) foreign key references branch(name),
	borrow_date date
	)

create table payment(
	number int primary key, 
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