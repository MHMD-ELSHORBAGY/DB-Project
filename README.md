## Bank Database

This database stores information about employees, customers, accounts, loans, and other relevant data for a bank. It allows users to perform various tasks such as managing customer accounts, processing loans, and tracking transactions.

### Requirements

- A database management system (such as MySQL, PostgreSQL, or SQL Server)
- The SQL script included in this repository to create the database and tables

### Installation

1. Install and set up a database management system.
2. Create a new database using the SQL script provided.
3. Run the script to create the tables and insert sample data.

### Usage

You can use SQL commands to query the database and retrieve information, or connect the database to a front-end application to allow users to interact with the data in a more user-friendly way.

### Note

The sample data included in this database is for demonstration purposes only. You can modify the data or add additional rows as needed.

### description
- **employee**: This table stores information about employees of the bank, including their SSN, name, phone number, start date, and the SSN of their manager (if applicable). The `ssn` column is the primary key of this table.
- **customar**: This table stores information about customers of the bank, including their SSN, name, address, and the SSN of the employee who is responsible for their account (if applicable). The `ssn` column is the primary key of this table.
- **dependent**: This table stores information about dependents of employees, including their name, age, and the SSN of the employee they are dependent on. The combination of `name` and `employee_ssn` is the primary key of this table.
- **account**: This table stores information about bank accounts, including their number, balance, and the SSN of the owner of the account. The `number` column is the primary key of this table.
- **saving_account**: This table stores information about saving accounts, including the account number and the interest rate. The `number` column is a foreign key that references the `number` column in the `account` table.
- **checking_account**: This table stores information about checking accounts, including the account number and the overdraft amount. The `number` column is a foreign key that references the `number` column in the `account` table.
- **branch**: This table stores information about branches of the bank, including their name, city, and the amount of cash available at the branch. The `name` column is the primary
