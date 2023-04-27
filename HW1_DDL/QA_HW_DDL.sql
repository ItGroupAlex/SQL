1 table
_____________________________________________

create table employees (
id serial primary key, 
employee_name Varchar(50) not null);

select * from employees;

----/filling by python/---

drop table employees;
_____________________________________________



2 table
_____________________________________________

create table salary (
id serial primary key, 
monthly_salary int not null);

select * from salary;

INSERT into salary (monthly_salary) values (1000),(1100),(1200),(1300),(1400),(1500),(1600),(1700),(1800),(1900),(2000),(2100),(2200),(2300),(2400),(2500);

drop table salary;
_____________________________________________



3 table
_____________________________________________

create table employee_salary (
id serial primary key, 
employee_id int NOT null unique,
salary_id int not null
);

select * from employee_salary;

----/filling by python/---

drop table employee_salary;
_____________________________________________



4 table
_____________________________________________


create table roles (
id serial primary key, 
role_name Varchar NOT null unique
);

select * from roles;

INSERT into roles (role_name) values ('Junior Python developer'),('Middle Python developer'),('Senior Python developer'),('Junior Java developer'),('Middle Java developer'),('Senior Java developer'),('Junior JavaScript developer'),('Middle JavaScript developer'),('Senior JavaScript developer'),('Junior Manual QA engineer'),('Middle Manual QA engineer'),('Senior Manual QA engineer'),('Project Manager'),('Designer'),('HR'),('CEO'),('Sales manager'),('Junior Automation QA engineer'),('Middle Automation QA engineer'),('Senior Automation QA engineer');

drop table roles;
_____________________________________________



5 table
_____________________________________________

create table roles_employee (
id serial primary key, 
employee_id int NOT null unique,
FOREIGN KEY (employee_id)  REFERENCES employees (id),
role_id int not null,
FOREIGN KEY (role_id)  REFERENCES roles (id)
);

select * from roles_employee;

----/filling by python/---

*SELECT * FROM roles_employee ORDER BY role_id;

*SELECT * FROM roles_employee ORDER BY id;

drop table roles_employee;
_____________________________________________
