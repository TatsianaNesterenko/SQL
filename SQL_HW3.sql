select * from salary;
select * from employees;
select * from employee_salary;
select * from roles;
select * from roles_employee;
 
-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.

select employee_name, salary.monthly_salary  from employees
	join employee_salary
		on employees.id = employee_salary.employee_id
	join salary 
		on salary.id = employee_salary.salary_id;
 
 -- 2. Вывести всех работников у которых ЗП меньше 2000.
 
select employee_name, salary.monthly_salary  from employees
	join employee_salary
		on employees.id = employee_salary.employee_id
	join salary 
		on salary.id = employee_salary.salary_id
			where salary.monthly_salary < 2000;
 
 -- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
		
 INSERT INTO salary(monthly_salary)
		VALUES (3000);
 
-- Вариант без JOIN
	
 select monthly_salary  
   	from salary 
   		where id not in (select salary_id from employee_salary);
  
-- Вариант с JOIN
  
  select distinct salary.monthly_salary 
   	from salary 
   		inner join employee_salary 
   			on salary.id not in (
   				select employee_salary.salary_id 
   					from employee_salary
   				);
   	
   -- !!!!!!!!!!!!!!!!!!!!!!!!!Проверить работу (работает не так)
   	
   	 select salary.monthly_salary	
  	from salary
  		left join employee_salary
  			on salary.id = employee_salary.salary_id 
  		left join employees
  			on employees.id = employee_salary.employee_id 
  				where employee_name is null;
 
 -- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
 
 INSERT INTO salary(monthly_salary)
		VALUES (500);
 
	-- Вариант без JOIN
	
	select monthly_salary  
   	from salary 
   		where monthly_salary < 2000 and id not in (select salary_id from employee_salary);
   	
   	-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Вариант с JOIN (работает не так)
   	
   	select employee_name, salary.monthly_salary from salary
	left join employee_salary
	on salary.id = employee_salary.salary_id
	left join employees
	on employees.id = employee_salary.employee_id
		where salary.monthly_salary<2000 and employee_name is null;
 
	
 -- 5. Найти всех работников кому не начислена ЗП.
 
   select role_name from roles;
   select * from employees;
   
   INSERT INTO roles(role_name)
		VALUES ('System Administrator');
	
	INSERT INTO roles_employee(employee_id, role_id)
		VALUES (70,21);
	
	-- вариант без JOIN
	
 	select * from employees
		where employees.id not in (select employee_id from employee_salary) 
	order by employees.id;
	
	-- вариант с JOIN
	
	select employee_name, salary.monthly_salary from employees
		left join employee_salary
			on employees.id = employee_salary.employee_id
		left join salary
			on salary.id = employee_salary.salary_id
				where salary.monthly_salary is null
	order by employees.id;

 -- 6. Вывести всех работников с названиями их должности.
 
	select employees.employee_name, roles.role_name from employees
		inner join roles_employee
			on employees.id = roles_employee.employee_id
		inner join roles 
			on roles.id = roles_employee.role_id;
 
 -- 7. Вывести имена и должность только Java разработчиков.
 
 	select employees.employee_name, roles.role_name from employees
		inner join roles_employee
			on employees.id = roles_employee.employee_id
		inner join roles 
			on roles.id = roles_employee.role_id
				where roles.role_name like '%Java%';
 
 -- 8. Вывести имена и должность только Python разработчиков.
 
 	select employees.employee_name, roles.role_name from employees
		inner join roles_employee
			on employees.id = roles_employee.employee_id
		inner join roles 
			on roles.id = roles_employee.role_id
				where roles.role_name like '%Python%';
 
 -- 9. Вывести имена и должность всех QA инженеров.
 
 	select employees.employee_name, roles.role_name from employees
		inner join roles_employee
			on employees.id = roles_employee.employee_id
		inner join roles 
			on roles.id = roles_employee.role_id
				where roles.role_name like '%QA%';
 
 -- 10. Вывести имена и должность ручных QA инженеров.
 
  	select employees.employee_name, roles.role_name from employees
		inner join roles_employee
			on employees.id = roles_employee.employee_id
		inner join roles 
			on roles.id = roles_employee.role_id
				where roles.role_name like '%Manual QA%';	
 
 -- 11. Вывести имена и должность автоматизаторов QA
 
   	select employees.employee_name, roles.role_name from employees
		inner join roles_employee
			on employees.id = roles_employee.employee_id
		inner join roles 
			on roles.id = roles_employee.role_id
				where roles.role_name like '%Automation QA%';
 
 -- 12. Вывести имена и зарплаты Junior специалистов ????????????????????? выводить всех или только тех у кого назначены зп
 
 	select employee_name, salary.monthly_salary, role_name from employees
		left join employee_salary
			on employees.id = employee_salary.employee_id 
		left join salary
			on salary.id = employee_salary.salary_id
		left join roles_employee
			on roles_employee.employee_id = employees.id
		left join roles
			on roles.id = roles_employee.role_id 
				where role_name like '%Junior%';
 		
 
 -- 13. Вывести имена и зарплаты Middle специалистов
 
 	 select employee_name, salary.monthly_salary, role_name from employees
		left join employee_salary
			on employees.id = employee_salary.employee_id 
		left join salary
			on salary.id = employee_salary.salary_id
		left join roles_employee
			on roles_employee.employee_id = employees.id
		left join roles
			on roles.id = roles_employee.role_id 
				where role_name like '%Middle%';
 
 -- 14. Вывести имена и зарплаты Senior специалистов
 
 	select employee_name, salary.monthly_salary, role_name from employees
		left join employee_salary
			on employees.id = employee_salary.employee_id 
		left join salary
			on salary.id = employee_salary.salary_id
		left join roles_employee
			on roles_employee.employee_id = employees.id
		left join roles
			on roles.id = roles_employee.role_id 
				where role_name like '%Senior%';
 
 -- 15. Вывести зарплаты Java разработчиков
 
 	select role_name, salary.monthly_salary from employees
		left join employee_salary
			on employees.id = employee_salary.employee_id 
		left join salary
			on salary.id = employee_salary.salary_id
		left join roles_employee
			on roles_employee.employee_id = employees.id
		left join roles
			on roles.id = roles_employee.role_id 
				where role_name like '%Java%';
 
 -- 16. Вывести зарплаты Python разработчиков
 
 	select role_name, salary.monthly_salary from employees
		left join employee_salary
			on employees.id = employee_salary.employee_id 
		left join salary
			on salary.id = employee_salary.salary_id
		left join roles_employee
			on roles_employee.employee_id = employees.id
		left join roles
			on roles.id = roles_employee.role_id 
				where role_name like '%Python%';
 
 -- 17. Вывести имена и зарплаты Junior Python разработчиков
 
 	 select employee_name, salary.monthly_salary, role_name from employees
		left join employee_salary
			on employees.id = employee_salary.employee_id 
		left join salary
			on salary.id = employee_salary.salary_id
		left join roles_employee
			on roles_employee.employee_id = employees.id
		left join roles
			on roles.id = roles_employee.role_id 
				where role_name like '%Junior Python%';
 
 -- 18. Вывести имена и зарплаты Middle JS разработчиков
 
 	select employee_name, salary.monthly_salary, role_name from employees
		left join employee_salary
			on employees.id = employee_salary.employee_id 
		left join salary
			on salary.id = employee_salary.salary_id
		left join roles_employee
			on roles_employee.employee_id = employees.id
		left join roles
			on roles.id = roles_employee.role_id 
				where role_name like '%Junior Python%';
 
 -- 19. Вывести имена и зарплаты Senior Java разработчиков
 
 	select employee_name, salary.monthly_salary, role_name from employees
		left join employee_salary
			on employees.id = employee_salary.employee_id 
		left join salary
			on salary.id = employee_salary.salary_id
		left join roles_employee
			on roles_employee.employee_id = employees.id
		left join roles
			on roles.id = roles_employee.role_id 
				where role_name like '%Senior Java%';
 
 -- 20. Вывести зарплаты Junior QA инженеров
 
 	select role_name, salary.monthly_salary from employees
		left join employee_salary
			on employees.id = employee_salary.employee_id 
		left join salary
			on salary.id = employee_salary.salary_id
		left join roles_employee
			on roles_employee.employee_id = employees.id
		left join roles
			on roles.id = roles_employee.role_id 
				where role_name like '%Junior%' and role_name like '%QA%';
 
 -- 21. Вывести среднюю зарплату всех Junior специалистов
 
 	select avg(salary.monthly_salary) from employees
 		inner join employee_salary 
 			on employees.id = employee_salary.employee_id 
 		inner join salary
 			on salary.id = employee_salary.salary_id
 		inner join roles_employee
			on roles_employee.employee_id = employees.id
		inner join roles
			on roles.id = roles_employee.role_id 
 				where role_name like '%Junior%';
 
 -- 22. Вывести сумму зарплат JS разработчиков
 
	 select sum(salary.monthly_salary) from salary
 		inner join employee_salary 
 			on salary.id = employee_salary.employee_id 
 		inner join employees
 			on salary.id = employee_salary.salary_id
 		inner join roles_employee
 			on employees.id = roles_employee.employee_id 
 		inner join roles
 			on roles_employee.role_ID = roles.id
 				where role_name like '%JavaScript%';
 
 -- 23. Вывести минимальную ЗП QA инженеров
 
 	select max(salary.monthly_salary) from salary
 		inner join employee_salary
 			on salary.id = employee_salary.salary_id 
 		inner join employees
 			on employees.id = employee_salary.employee_id 
 		inner join roles_employee
 			on employees.id = roles_employee.employee_id 
 		inner join roles
 			on roles.id = roles_employee.role_id 
 				where role_name like '%QA%';
 
 -- 24. Вывести максимальную ЗП QA инженеров
 
 	 select max(salary.monthly_salary) from salary
 		inner join employee_salary
 			on salary.id = employee_salary.salary_id 
 		inner join employees
 			on employees.id = employee_salary.employee_id 
 		inner join roles_employee
 			on employees.id = roles_employee.employee_id 
 		inner join roles
 			on roles.id = roles_employee.role_id 
 				where role_name like '%QA%';
 
 -- 25. Вывести количество QA инженеров
 
 	select count(role_name) from roles
 		inner join roles_employee
 			on roles.id = roles_employee.role_id 
 			where role_name like '%QA%';
 
 -- 26. Вывести количество Middle специалистов.
 
 	select count(role_name) from roles
 		inner join roles_employee
 			on roles.id = roles_employee.role_id
 				where role_name like '%Middle%';
 			
  -- 27. Вывести количество разработчиков
 
 	 select count(role_name) from roles
 		inner join roles_employee
 			on roles.id = roles_employee.role_id
 				where role_name like '%developer%';
 			
 -- 28. Вывести фонд (сумму) зарплаты разработчиков.
 
 	select sum(monthly_salary) from salary
 		inner join employee_salary
 			on salary.id = employee_salary.salary_id 
 		inner join roles_employee
 			on employee_salary.employee_id = roles_employee.employee_id
 		inner join roles
 			on roles.id = roles_employee.role_id 
 				where role_name like '%developer%';
 			 
 -- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию
 
 	select employees.employee_name, roles.role_name, salary.monthly_salary from salary
 		inner join employee_salary
 			on salary.id = employee_salary.salary_id 
 		inner join employees
 			on employees.id = employee_salary.employee_id 
 		inner join roles_employee
 			on employees.id = roles_employee.employee_id 
 		inner join roles
 			on roles.id = roles_employee.role_id 
 		order by salary.monthly_salary asc;
 
 -- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
 
 	select employees.employee_name, roles.role_name, salary.monthly_salary from salary
 		inner join employee_salary
 			on salary.id = employee_salary.salary_id 
 		inner join employees
 			on employees.id = employee_salary.employee_id 
 		inner join roles_employee
 			on employees.id = roles_employee.employee_id 
 		inner join roles
 			on roles.id = roles_employee.role_id 
 				where salary.monthly_salary between 1700 and 2300
 		order by salary.monthly_salary asc;
 
 -- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
 
 	select employees.employee_name, roles.role_name, salary.monthly_salary from salary
 		inner join employee_salary
 			on salary.id = employee_salary.salary_id 
 		inner join employees
 			on employees.id = employee_salary.employee_id 
 		inner join roles_employee
 			on employees.id = roles_employee.employee_id 
 		inner join roles
 			on roles.id = roles_employee.role_id 
 				where salary.monthly_salary < 2300
 		order by salary.monthly_salary asc;
 
 -- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
 
 	select employees.employee_name, roles.role_name, salary.monthly_salary from salary
 		inner join employee_salary
 			on salary.id = employee_salary.salary_id 
 		inner join employees
 			on employees.id = employee_salary.employee_id 
 		inner join roles_employee
 			on employees.id = roles_employee.employee_id 
 		inner join roles
 			on roles.id = roles_employee.role_id 
 				where salary.monthly_salary in (1100, 1500, 2000)
 		order by salary.monthly_salary asc;
 
 	
