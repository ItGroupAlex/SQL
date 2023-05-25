SQL HomeWork 2. Joins

Подключится к 
Host: 159.69.151.133
Port: 5056
DB: подключение к той таблице где делали DDL операции
User: подключение к тем пользователем каким делали DDL операции
Pass: 123

Если для какого-то кейса надо сделать дополнительную таблицу, наполнить её данными, то делайте )


 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.

SELECT employees.employee_name, salary.monthly_salary
FROM employee_salary
JOIN employees ON employees.id=employee_salary.employee_id
JOIN salary ON salary.id=employee_salary.salary_id
  
 
 2. Вывести всех работников у которых ЗП меньше 2000.
 
SELECT employees.employee_name, salary.monthly_salary
FROM employee_salary
JOIN employees ON employees.id=employee_salary.employee_id 
JOIN salary ON salary.id=employee_salary.salary_id
where salary.monthly_salary < 2000
 
  
 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
 
 SELECT employee_salary.employee_id, employees.employee_name, employee_salary.salary_id, salary.monthly_salary   
FROM employee_salary
left JOIN employees ON employees.id=employee_salary.employee_id 
left JOIN salary ON salary.id=employee_salary.salary_id
where not employee_salary.employee_id in (SELECT id FROM employees)
order by employee_salary.employee_id;

 

 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
 
  SELECT employee_salary.employee_id, employees.employee_name, employee_salary.salary_id, salary.monthly_salary  
FROM employee_salary
left JOIN employees ON employees.id=employee_salary.employee_id 
left JOIN salary ON salary.id=employee_salary.salary_id
where not employee_salary.employee_id in (SELECT id FROM employees) and salary.monthly_salary < 2000
order by employee_salary.employee_id;
 
 
 5. Найти всех работников кому не начислена ЗП.
 
   SELECT employees.id, employees.employee_name, employee_salary.salary_id  
FROM employee_salary
Full JOIN employees ON employees.id=employee_salary.employee_id 
full JOIN salary ON salary.id=employee_salary.salary_id
where not employees.id in (SELECT employee_id FROM employee_salary)   
order by employees.id;
 
 
 6. Вывести всех работников с названиями их должности.
 
 SELECT employees.employee_name, roles.role_name
FROM roles_employee
full JOIN employees ON employees.id=roles_employee.employee_id
left JOIN roles ON roles.id=roles_employee.role_id
 
  
 7. Вывести имена и должность только Java разработчиков.
 
  SELECT employees.employee_name, roles.role_name
FROM roles_employee
JOIN employees ON employees.id=roles_employee.employee_id
JOIN roles ON roles.id=roles_employee.role_id
where roles.role_name like '%Java %'
 
 
 8. Вывести имена и должность только Python разработчиков.
 
   SELECT employees.employee_name, roles.role_name
FROM roles_employee
JOIN employees ON employees.id=roles_employee.employee_id
JOIN roles ON roles.id=roles_employee.role_id
where roles.role_name like '%Python %' 


 9. Вывести имена и должность всех QA инженеров.
 
    SELECT employees.employee_name, roles.role_name
FROM roles_employee
JOIN employees ON employees.id=roles_employee.employee_id
JOIN roles ON roles.id=roles_employee.role_id
where roles.role_name like '% QA %' 
 
  
 10. Вывести имена и должность ручных QA инженеров.
 
 
    SELECT employees.employee_name, roles.role_name
FROM roles_employee
JOIN employees ON employees.id=roles_employee.employee_id
JOIN roles ON roles.id=roles_employee.role_id
where roles.role_name like '%Manual QA%' 
 
 
 11. Вывести имена и должность автоматизаторов QA
 
 SELECT employees.employee_name, roles.role_name
FROM roles_employee
JOIN employees ON employees.id=roles_employee.employee_id
JOIN roles ON roles.id=roles_employee.role_id
where roles.role_name like '%Automation QA%'



 12. Вывести имена и зарплаты Junior специалистов
 
 
 CREATE TABLE roles_employees_used as  
 SELECT employees.id, employees.employee_name, roles.role_name
	FROM roles_employee
	left JOIN employees ON employees.id=roles_employee.employee_id
	left JOIN roles ON roles.id=roles_employee.role_id;

 SELECT roles_employees_used.id, roles_employees_used.employee_name, roles_employees_used.role_name, salary.monthly_salary
	FROM employee_salary
	right JOIN roles_employees_used ON roles_employees_used.id=employee_salary.employee_id
	full JOIN salary ON salary.id=employee_salary.salary_id
	where role_name like '%Junior %';

****drop table roles_employees_used
   
   
 
 13. Вывести имена и зарплаты Middle специалистов
 
  SELECT roles_employees_used.id, roles_employees_used.employee_name, roles_employees_used.role_name, salary.monthly_salary
	FROM employee_salary
	right JOIN roles_employees_used ON roles_employees_used.id=employee_salary.employee_id
	full JOIN salary ON salary.id=employee_salary.salary_id
	where role_name like '%Middle %';
 
 14. Вывести имена и зарплаты Senior специалистов
 
   SELECT roles_employees_used.id, roles_employees_used.employee_name, roles_employees_used.role_name, salary.monthly_salary
	FROM employee_salary
	right JOIN roles_employees_used ON roles_employees_used.id=employee_salary.employee_id
	full JOIN salary ON salary.id=employee_salary.salary_id
	where role_name like '%Senior %';

 15. Вывести зарплаты Java разработчиков
 
    SELECT roles_employees_used.id, roles_employees_used.employee_name, roles_employees_used.role_name, salary.monthly_salary
	FROM employee_salary
	right JOIN roles_employees_used ON roles_employees_used.id=employee_salary.employee_id
	full JOIN salary ON salary.id=employee_salary.salary_id
	where role_name like '%Java %';
 
 16. Вывести зарплаты Python разработчиков
 
    SELECT salary.monthly_salary
	FROM employee_salary
	right JOIN roles_employees_used ON roles_employees_used.id=employee_salary.employee_id
	JOIN salary ON salary.id=employee_salary.salary_id
	where role_name like '%Python %';
 
 
 17. Вывести имена и зарплаты Junior Python разработчиков
 
    SELECT roles_employees_used.id, roles_employees_used.employee_name, roles_employees_used.role_name, salary.monthly_salary
	FROM employee_salary
	right JOIN roles_employees_used ON roles_employees_used.id=employee_salary.employee_id
	full JOIN salary ON salary.id=employee_salary.salary_id
	where role_name like '%Junior Python %';
 
 
 18. Вывести имена и зарплаты Middle JS разработчиков
 
    SELECT roles_employees_used.id, roles_employees_used.employee_name, roles_employees_used.role_name, salary.monthly_salary
	FROM employee_salary
	right JOIN roles_employees_used ON roles_employees_used.id=employee_salary.employee_id
	full JOIN salary ON salary.id=employee_salary.salary_id
	where role_name like '%Middle JavaScript %';
 
 19. Вывести имена и зарплаты Senior Java разработчиков
 
  	SELECT roles_employees_used.id, roles_employees_used.employee_name, roles_employees_used.role_name, salary.monthly_salary
	FROM employee_salary
	right JOIN roles_employees_used ON roles_employees_used.id=employee_salary.employee_id
	full JOIN salary ON salary.id=employee_salary.salary_id
	where role_name like '%Senior Java %';
 
 20. Вывести зарплаты Junior QA инженеров
 
 SELECT roles_employees_used.id, roles_employees_used.employee_name, roles_employees_used.role_name, salary.monthly_salary
	FROM employee_salary
	right JOIN roles_employees_used ON roles_employees_used.id=employee_salary.employee_id
	full JOIN salary ON salary.id=employee_salary.salary_id
	where role_name like '%Junior % %QA %';
 
 
 21. Вывести среднюю зарплату всех Junior специалистов
 
  SELECT AVG(salary.monthly_salary)
	FROM employee_salary
	right JOIN roles_employees_used ON roles_employees_used.id=employee_salary.employee_id
	JOIN salary ON salary.id=employee_salary.salary_id
	where role_name like '%Junior %';
 
 
 22. Вывести сумму зарплат JS разработчиков
 
   SELECT Sum(salary.monthly_salary)
	FROM employee_salary
	right JOIN roles_employees_used ON roles_employees_used.id=employee_salary.employee_id
	JOIN salary ON salary.id=employee_salary.salary_id
	where role_name like '%JavaScript %';
 
 23. Вывести минимальную ЗП QA инженеров
 
    SELECT MIN(salary.monthly_salary)
	FROM employee_salary
	right JOIN roles_employees_used ON roles_employees_used.id=employee_salary.employee_id
	JOIN salary ON salary.id=employee_salary.salary_id
	where role_name like '%QA %';
 
 24. Вывести максимальную ЗП QA инженеров
 
  SELECT MAX(salary.monthly_salary)
	FROM employee_salary
	right JOIN roles_employees_used ON roles_employees_used.id=employee_salary.employee_id
	JOIN salary ON salary.id=employee_salary.salary_id
	where role_name like '%QA %';
 
 
 25. Вывести количество QA инженеров
 
   SELECT count(roles_employees_used.id) 
	FROM employee_salary
	right JOIN roles_employees_used ON roles_employees_used.id=employee_salary.employee_id
	JOIN salary ON salary.id=employee_salary.salary_id
	where role_name like '%QA %';
 
 26. Вывести количество Middle специалистов.
 
   SELECT count(roles_employees_used.id) 
	FROM employee_salary
	right JOIN roles_employees_used ON roles_employees_used.id=employee_salary.employee_id
	JOIN salary ON salary.id=employee_salary.salary_id
	where role_name like '%Middle %';
 
 27. Вывести количество разработчиков
 
    SELECT count(roles_employees_used.id) 
	FROM employee_salary
	right JOIN roles_employees_used ON roles_employees_used.id=employee_salary.employee_id
	JOIN salary ON salary.id=employee_salary.salary_id
	where role_name like '%developer%';
 
 28. Вывести фонд (сумму) зарплаты разработчиков.
 
    SELECT sum(salary.monthly_salary) 
	FROM employee_salary
	right JOIN roles_employees_used ON roles_employees_used.id=employee_salary.employee_id
	JOIN salary ON salary.id=employee_salary.salary_id
	
 
 29. Вывести имена, должности и ЗП всех специалистов по возрастанию
 
 SELECT roles_employees_used.id, roles_employees_used.employee_name, roles_employees_used.role_name, salary.monthly_salary
	FROM employee_salary
	JOIN roles_employees_used ON roles_employees_used.id=employee_salary.employee_id
	JOIN salary ON salary.id=employee_salary.salary_id
	order by monthly_salary
	
 
 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
 
  SELECT roles_employees_used.id, roles_employees_used.employee_name, roles_employees_used.role_name, salary.monthly_salary
	FROM employee_salary
	JOIN roles_employees_used ON roles_employees_used.id=employee_salary.employee_id
	JOIN salary ON salary.id=employee_salary.salary_id
	where salary.monthly_salary > 1700 and salary.monthly_salary < 2300
	order by monthly_salary
 
 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
 
   SELECT roles_employees_used.id, roles_employees_used.employee_name, roles_employees_used.role_name, salary.monthly_salary
	FROM employee_salary
	JOIN roles_employees_used ON roles_employees_used.id=employee_salary.employee_id
	JOIN salary ON salary.id=employee_salary.salary_id
	where salary.monthly_salary < 2300
	order by monthly_salary
 
 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
 
    SELECT roles_employees_used.id, roles_employees_used.employee_name, roles_employees_used.role_name, salary.monthly_salary
	FROM employee_salary
	JOIN roles_employees_used ON roles_employees_used.id=employee_salary.employee_id
	JOIN salary ON salary.id=employee_salary.salary_id
	where salary.monthly_salary in (1100, 1500, 2000)
	order by monthly_salary
