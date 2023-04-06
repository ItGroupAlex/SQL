create table employees (
id serial primary key, 
employee_name Varchar(50) not null);

select * from employees;

***/filling by python/

drop table employees


create table salary (
id serial primary key, 
monthly_salary int not null);

select * from salary;

INSERT into salary (monthly_salary) values (1000),(1100),(1200),(1300),(1400),(1500),(1600),(1700),(1800),(1900),(2000),(2100),(2200),(2300),(2400),(2500);

drop table salary


create table employee_salary (
id serial primary key, 
employee_id int NOT null unique,
salary_id int not null
);

select * from employee_salary;

***/filling by python/

drop table employee_salary