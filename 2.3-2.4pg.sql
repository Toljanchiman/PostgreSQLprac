--CREATE database ZAFDB;
--USE ZAFDB;

/*ID, ФИО, дата рождения, дата начала работы, должность, 
уровень сотрудника (jun, middle, senior, lead), уровень зарплаты, 
идентификатор отдела, наличие/отсутствие прав(True/False).
Добавить 5 сотрудников, которые работают как минимум в 2-х разных отделах.*/

--drop TABLE employees;
--drop TABLE departments;
--drop TABLE ratings;

CREATE TABLE employees (
ID bigserial primary key,
fullname varchar(200),
databd date,
datast date,
jobname varchar(70),
level varchar(70),
salary money,
iddep bigint,
rights boolean
);

/* идентификатор для каждого отдела, название отдела (например. Бухгалтерский или IT отдел),
ФИО руководителя и количество сотрудников. Добавить 2 разных отдела!.*/

CREATE TABLE departments (
ID bigserial primary key,
name varchar(70),
supervisor varchar(70),
empcount bigint
);

/* таблицу, в которой для каждого сотрудника будут его оценки за каждый квартал.
Диапазон оценок от A – самая высокая, до E – самая низкая.*/

CREATE TABLE ratings (
ID bigserial primary key,
quartal bigint,
rating varchar(70),
idemp bigint
);


--Добавление данных в таблицу Сотрудников
INSERT INTO employees (fullname, databd, datast, jobname, level, salary, iddep, rights) 
VALUES ('Abatnin A.S.', '1996.02.20', '2022.11.06', 'programmer', 'senior', 45000.00, 2, true);
INSERT INTO employees (fullname, databd, datast, jobname, level, salary, iddep, rights) 
VALUES ('Zligostev V.A.', '1997.02.20', '2022.11.06', 'programmer', 'middle', 30000.00, 2, false);
INSERT INTO employees (fullname, databd, datast, jobname, level, salary, iddep, rights) 
VALUES ('Khaludorov P.B.', '1995.07.20', '2022.11.06', 'programmer', 'jun', 20000.00, 2, false);
INSERT INTO employees (fullname, databd, datast, jobname, level, salary, iddep, rights) 
VALUES ('Boiko D.V.', '1996.03.15', '2022.11.06', 'manager', 'jun', 20000.00, 1, true);
INSERT INTO employees (fullname, databd, datast, jobname, level, salary, iddep, rights) 
VALUES ('Zaytsev A.F.', '1991.03.25', '2022.11.06', 'manager', 'lead', 125000.00, 1, true);


--Добавление данных в таблицу Отделов
INSERT INTO departments (name, supervisor, empcount) 
VALUES ('Management', 'Zaytsev A.F.', 2);
INSERT INTO departments (name, supervisor, empcount) 
VALUES ('IT', 'Abatnin A.S.', 3);


--Добавление данных в таблицу Рейтингов премий
INSERT INTO ratings (quartal, rating, idemp) 
VALUES (1, 'A', 1);
INSERT INTO ratings (quartal, rating, idemp) 
VALUES (2, 'B', 1);
INSERT INTO ratings (quartal, rating, idemp) 
VALUES (3, 'C', 1);
INSERT INTO ratings (quartal, rating, idemp) 
VALUES (4, 'D', 1);
INSERT INTO ratings (quartal, rating, idemp) 
VALUES (1, 'A', 2);
INSERT INTO ratings (quartal, rating, idemp) 
VALUES (2, 'B', 2);
INSERT INTO ratings (quartal, rating, idemp) 
VALUES (3, 'B', 2);
INSERT INTO ratings (quartal, rating, idemp) 
VALUES (4, 'C', 2);
INSERT INTO ratings (quartal, rating, idemp) 
VALUES (1, 'A', 3);
INSERT INTO ratings (quartal, rating, idemp) 
VALUES (2, 'A', 3);
INSERT INTO ratings (quartal, rating, idemp) 
VALUES (3, 'B', 3);
INSERT INTO ratings (quartal, rating, idemp) 
VALUES (4, 'B', 3);
INSERT INTO ratings (quartal, rating, idemp) 
VALUES (1, 'A', 4);
INSERT INTO ratings (quartal, rating, idemp) 
VALUES (2, 'A', 4);
INSERT INTO ratings (quartal, rating, idemp) 
VALUES (3, 'C', 4);
INSERT INTO ratings (quartal, rating, idemp) 
VALUES (4, 'E', 4);
INSERT INTO ratings (quartal, rating, idemp) 
VALUES (1, 'A', 5);
INSERT INTO ratings (quartal, rating, idemp) 
VALUES (2, 'A', 5);
INSERT INTO ratings (quartal, rating, idemp) 
VALUES (3, 'A', 5);
INSERT INTO ratings (quartal, rating, idemp) 
VALUES (4, 'B', 5);


-- Добавление отдела Интеллектуального анализа данных
-- одного руководителя отдела и двух сотрудников
INSERT INTO departments (name, supervisor, empcount) 
VALUES ('DataAnalisys', 'Shirapov D.Sh.', 3);
INSERT INTO employees (fullname, databd, datast, jobname, level, salary, iddep, rights) 
VALUES ('Shirapov D.Sh.', '1981.01.25', '2022.11.06', 'data scientist', 'lead', 120000.00, 3, true);
INSERT INTO employees (fullname, databd, datast, jobname, level, salary, iddep, rights) 
VALUES ('Kuriganov J.M.', '1997.12.18', '2022.11.06', 'data engineer', 'middle', 60000.00, 3, false);
INSERT INTO employees (fullname, databd, datast, jobname, level, salary, iddep, rights) 
VALUES ('Chelmoddeva A.S.', '1996.10.03', '2022.11.06', 'data engineer', 'jun', 30000.00, 3, false);


--Уникальный номер сотрудника, его ФИО и стаж работы – для всех сотрудников компании
SELECT id, fullname, date_part('day', '2022.11.08'::date) - date_part('day', datast::date) as expdays FROM employees; --CURRENT_DATE::date


--Уникальный номер сотрудника, его ФИО и стаж работы – только первых 3-х сотрудников
SELECT id, fullname, date_part('day', '2022.11.08'::date) - date_part('day', datast::date) as expdays FROM employees LIMIT 3;


--Уникальный номер сотрудников - водителей (У меня 0 водителей!)
SELECT id, jobname FROM employees WHERE jobname = 'driver';


--Выведите номера сотрудников, которые хотя бы за 1 квартал получили оценку D или E
SELECT idemp FROM ratings WHERE rating = 'D' or rating = 'E';


--Выведите самую высокую зарплату в компании.
SELECT MAX(salary) as maxsalary FROM employees;



--Задания 2.4
--Вывести именно фамилию сотрудника с самой высокой зарплатой.
SELECT fullname FROM employees WHERE salary = (SELECT MAX(salary) FROM employees);


--Попробуйте вывести фамилии сотрудников в алфавитном порядке
SELECT fullname FROM employees order by fullname asc; 


--Рассчитайте средний стаж для каждого уровня сотрудников
SELECT level, AVG(date_part('day', '2022.11.08'::date) - date_part('day', datast::date)) as avgexp FROM employees group by level;


--Выведите фамилию сотрудника и название отдела, в котором он работает
SELECT fullname, name FROM employees AS emp INNER JOIN departments AS dp ON emp.iddep = dp.id;


--Выведите название отдела и фамилию сотрудника с самой высокой зарплатой в данном отделе и саму зарплату также.
SELECT department, fullname, maxsalary FROM 
(SELECT name as department, MAX(salary) as maxsalary FROM employees AS emp INNER JOIN departments AS dp ON emp.iddep = dp.id
group by name) AS tmptbl INNER JOIN employees AS emp2 ON tmptbl.maxsalary = emp2.salary


