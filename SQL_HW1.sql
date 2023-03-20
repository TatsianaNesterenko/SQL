--Таблица employees

--Создать таблицу employees
-- 1)- id. serial,  primary key,
-- - employee_name. Varchar(50), not null

CREATE TABLE employees(
	id serial PRIMARY KEY,
	employee_name VARCHAR (50) NOT NULL
);


select * from employees;

-- 2) Наполнить таблицу employee 70 строками.

INSERT INTO employees(employee_name)
	VALUES ('Alex'),
		   ('Maxim'),
		   ('Sergey'),
		   ('Vadim'),
		   ('Oleg'),
		   ('Vladimir'),
		   ('Serafim'),
		   ('Foma'),
		   ('Miroslav'),
		   ('Nikolay'),
		   ('Vitaliy'),
		   ('Mstislav'),
		   ('Konstantin'),
		   ('Svetlana'),
		   ('Maria'),
		   ('Katerina'),
		   ('Anastasia'),
		   ('Olga'),
		   ('Tatiana'),
		   ('Natalia'),
		   ('Marina'),
		   ('Milana'),
		   ('Vera'),
		   ('Sofia'),
		   ('Elena'),
		   ('Alina'),
		   ('Ania'),
		   ('Viktoria'),
		   ('Valentina'),
		   ('Zinaida'),
		   ('Diana'),
		   ('Dmitriy'),
		   ('David'),
		   ('Zinaida'),
		   ('Angelina'),
		   ('Dazdraperma'),
		   ('Sofia'),
		   ('Lida'),
		   ('Tisha'),
		   ('Feona'),
		   ('Bella'),
		   ('Miloslava'),
		   ('Nika'),
		   ('Nikita'),
		   ('Nadegda'),
		   ('Genia'),
		   ('Gena'),
		   ('Glasha'),
		   ('Yaropolk'),
		   ('Ismail'),
		   ('Kirill'),
		   ('Feodosiy'),
		   ('Feofilact'),
		   ('Emilian'),
		   ('Olga'),
		   ('Galia'),
		   ('Adel'),
		   ('Ekaterina'),
		   ('Yana'),
		   ('Lizaveta'),
		   ('Zhanna'),
		   ('Sofiya'),
		   ('Inna'),
		   ('Anzhelika'),
		   ('Matrona'),
		   ('Taisiya'),
		   ('Mayya'),
		   ('Regina'),
		   ('Saveliy'),
		   ('Noy');

-- Таблица salary

-- 3) Создать таблицу salary
-- - id. Serial  primary key,
-- - monthly_salary. Int, not null

CREATE TABLE salary(
	id serial PRIMARY KEY,
	monthly_salary INT NOT NULL
);

select * from salary;

-- 4) Наполнить таблицу salary 15 строками:
INSERT INTO salary(monthly_salary)
	VALUES (1000),
	       (1100),
	       (1200),
	       (1300),
	       (1400),
	       (1500),
	       (1600),
	       (1700),
	       (1800),
	       (1900),
	       (2000),
	       (2100),
	       (2200),
	       (2300),
	       (2400),
	       (2500);
	       

-- Таблица employee_salary

-- 5) Создать таблицу employee_salary
-- - id. Serial  primary key,
-- - employee_id. Int, not null, unique
-- - salary_id. Int, not null

CREATE TABLE employee_salary(
	id serial PRIMARY KEY,
	employee_id INT UNIQUE NOT null,
	salary_id INT NOT NULL
);

select * from employee_salary;

-- Наполнить таблицу employee_salary 40 строками:
-- - в 10 строк из 40 вставить несуществующие employee_id

INSERT INTO employee_salary(employee_id, salary_id)
VALUES (1, 1),
	   (2,1),
	   (3,2),
	   (4,2),
	   (5,3),
	   (6,3),
	   (7,4),
	   (8,4),
	   (9,5),
	   (10,5),
	   (11,6),
	   (12,6),
	   (13,7),
	   (14,7),
	   (15,8),
	   (16,8),
	   (17,9),
	   (18,9),
	   (19,10),
	   (20,10),
	   (21,10),
	   (22,11),
	   (23,12),
	   (24,12),
	   (25,13),
	   (26,14),
	   (27,15),
	   (28,16),
	   (29,15),
	   (30,16),
	   (71,1),
	   (72,2),
	   (73,3),
	   (74,4),
	   (75,5),
	   (76,6),
	   (77,7),
	   (78,8),
	   (79,9),
	   (80,10);
	   
	  select * from employee_salary;
	  
-- Таблица roles

-- 7) Создать таблицу roles
-- - id. Serial  primary key,
-- - role_name. int, not null, unique

	 CREATE TABLE roles(
		id serial PRIMARY KEY,
		role_name INT UNIQUE NOT NULL
);

select * from roles;

-- 8) Поменять тип столба role_name с int на varchar(30)
ALTER TABLE roles ALTER COLUMN role_name type varchar(30);

select * from roles;

-- 9) Наполнить таблицу roles 20 строками:
INSERT INTO roles(role_name)
	VALUES ('Junior Python developer'),
		   ('Middle Python developer'),
		   ('Senior Python developer'),
		   ('Junior Java developer'),
		   ('Middle Java developer'),
		   ('Senior Java developer'),
		   ('Junior JavaScript developer'),
		   ('Middle JavaScript developer'),
		   ('Senior JavaScript developer'),
		   ('Junior Manual QA engineer'),
		   ('Middle Manual QA engineer'),
		   ('Senior Manual QA engineer'),
		   ('Project Manager'),
		   ('Designer'),
		   ('HR'),
		   ('CEO'),
		   ('Sales manager'),
		   ('Junior Automation QA engineer'),
		   ('Middle Automation QA engineer'),
		   ('Senior Automation QA engineer');
		  
		  
-- Таблица roles_employee

--10) Создать таблицу roles_employee
-- - id. Serial  primary key,
-- - employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
-- - role_id. Int, not null (внешний ключ для таблицы roles, поле id)

		   
CREATE TABLE roles_employee(
	id serial PRIMARY KEY,
	employee_id INT NOT null UNIQUE,
	role_id INT NOT NULL,
	FOREIGN KEY (employee_id)
		REFERENCES employees (id),
	FOREIGN KEY (role_id)
		REFERENCES roles (id)
);
   

select * from roles_employee;

-- 11) Наполнить таблицу roles_employee 40 строками:

INSERT INTO roles_employee(employee_id, role_id)
VALUES (1, 1),
	   (2,1),
	   (3,2),
	   (4,2),
	   (5,3),
	   (6,3),
	   (7,4),
	   (8,4),
	   (9,5),
	   (10,5),
	   (11,6),
	   (12,6),
	   (13,7),
	   (14,7),
	   (15,8),
	   (16,8),
	   (17,9),
	   (18,9),
	   (19,10),
	   (20,10),
	   (21,11),
	   (22,11),
	   (23,12),
	   (24,12),
	   (25,13),
	   (26,13),
	   (27,14),
	   (28,14),
	   (29,15),
	   (30,15),
	   (31,16),
	   (32,16),
	   (33,17),
	   (34,17),
	   (35,18),
	   (36,18),
	   (37,19),
	   (38,19),
	   (39,20),
	   (40,20);
	   
select * from roles_employee;
select * from roles;
select * from employee_salary;
select * from salary;
select * from employees;
