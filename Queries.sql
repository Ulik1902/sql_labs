USE StaffAccounting;

-- 1.1.Список працюючих відділу (відділ – параметр).
SELECT Passport_data.last_name, Passport_data.first_name, Passport_data.middle_name 
FROM Department JOIN Post_journal ON Department.department_id=Post_journal.department_id JOIN Employee ON Post_journal.employee_id=Employee.id_employee JOIN Passport_data ON Employee.id_employee=Passport_data.passport_id
WHERE Department.name='viddil finansiv' AND Post_journal.end_date IS NULL


--1.2.Список працівників з вказанням періодів використаних відпусток з підсумком днів проведених в відпустках для кожного працівника. 
--2.2.SELECT з виводом обчислюваних полів (виразів) в колонках результату.
--2.3.SELECT на базі кількох таблиць з використанням сортування, накладенням умов зі зв’язками OR та AND.
--2.6.SELECT з використанням підсумовування та групування. Підрахунок кількості посад для конкретного працівника
SELECT Vacation_journal.employee, Vacation_journal.begin_date, Vacation_journal.end_date, DATEDIFF(day, begin_date, end_date) AS [Total Days]
FROM Vacation_journal
ORDER BY employee ASC

--1.3.Довідка працівника з вказанням посади та окладу.
--2.3.SELECT на базі кількох таблиць з використанням сортування, накладенням умов зі зв’язками OR та AND.
SELECT Employee.id_employee, Post.name, Post.salary
FROM Post_journal JOIN Post ON Post_journal.post_id=Post.post_id JOIN Employee ON Post_journal.employee_id=Employee.id_employee
WHERE Post_journal.end_date IS NULL
ORDER BY id_employee ASC

--1.4.Список відділів з вказанням керівника та кількості працюючих. 
--2.3.SELECT на базі кількох таблиць з використанням сортування, накладенням умов зі зв’язками OR та AND.
--2.6.SELECT з використанням підсумовування та групування. 
SELECT Department.department_id, PJ.employee_id AS ['kerivnyk'], COUNT(*) AS [ staff_amount] 
FROM Department LEFT JOIN Post_journal ON Department.department_id=Post_journal.department_id JOIN Post_journal AS PJ ON Department.department_id=PJ.department_id
WHERE Post_journal.end_date IS NULL AND PJ.post_id = 100
GROUP BY Department.department_id, PJ.employee_id

-- 2.1.SELECT на базі однієї таблиці з використанням сортування, накладенням умов зі зв’язками OR та AND.
-- Список посад, оклад яких >=2700 або <=2400
SELECT Post. name, Post.salary
FROM Post
WHERE Post.salary>=2750 OR Post.salary<=2300
ORDER BY Post.salary DESC

--2.4.SELECT на базі кількох таблиць з типом поєднання Outer Join.
-- Cписок періодів відпустки для кожного з працівників 
SELECT Employee.id_employee, Vacation_journal.begin_date, Vacation_journal.end_date
FROM Employee LEFT JOIN Vacation_journal ON Employee.id_employee=Vacation_journal.employee
ORDER BY Employee.id_employee ASC

--2.5.SELECT з використанням операторів Like, Between, In, Exists, All, Any.
--2.7.SELECT з використанням під-запитів в частині Where.
-- Список працівників, які народились в період від 01.05.1980 до 01.12.1990.
SELECT Passport_data.last_name, Passport_data.first_name, Passport_data.birth_date
FROM Passport_data
WHERE Passport_data.birth_date BETWEEN '1980-05-01'AND '1990-01-01'

--Список працівників, прізвище яких закінчується на "нюк"
SELECT Passport_data.last_name, Passport_data.first_name
FROM Passport_data
WHERE Passport_data.last_name LIKE '%nyuk'

--Список працівників , які працюють у відділах з абревіатурою 'fin', 'roz' та початок їх роботи в цих відділах
SELECT DISTINCT Post_journal.employee_id, Post_journal.department_id, Post_journal.begin_date
FROM Department LEFT JOIN Post_journal ON Department.department_id=Post_journal.department_id
WHERE Department.abbreviation IN ('fin', 'roz') AND Post_journal.end_date IS NULL

--Список посад, оклади яких більші, ніж хоча б на одній посаді відділу фінансів або менші, ніж на всіх посадах юридичного відділу 
SELECT Post.name, Post.salary
FROM Post 
WHERE Post.salary > ANY (
		SELECT Post.salary
		FROM Department LEFT JOIN Post_journal ON Department.department_id=Post_journal.department_id JOIN Post ON Post_journal.post_id=Post.post_id
		WHERE Department.name = 'viddil finansiv')
	OR Post.salary < ALL (
		SELECT Post.salary
		FROM Department LEFT JOIN Post_journal ON Department.department_id=Post_journal.department_id JOIN Post ON Post_journal.post_id=Post.post_id
		WHERE Department.name = 'viddil jurydychnyj')

--Cписок працівників, які ніеоли не працювали в адміністративно-господарському відділі
SELECT id_employee, first_name, last_name 
FROM Employee JOIN Passport_data ON Employee.id_employee = Passport_data.passport_id
WHERE NOT EXISTS (
		SELECT Post_journal.employee_id
		FROM Department JOIN Post_journal ON Department.department_id=Post_journal.department_id
		WHERE Department.name='viddil administratyvno-gospodarskyj' AND Post_journal.employee_id = Employee.id_employee
	);

--2.8.SELECT з використанням під-запитів в частині From.
--Список актуальних посад працівників
SELECT *
FROM (SELECT *
	FROM Passport_data JOIN Post_journal ON Post_journal.employee_id=Passport_data.passport_id
	WHERE Post_journal.end_date IS NULL) as [Actual_post]


--2.09.SELECT запит типу CrossTab.
-- Кількість працівників, усіх відділів за час існування віддділу
SELECT*
FROM(
	SELECT Department.name, Post_journal.employee_id
	FROM Post_journal JOIN Department ON Post_journal.department_id=Department.department_id
	) AS source_table
	PIVOT
	( COUNT(employee_id)
	FOR name IN ([viddil finansiv], [viddil kadriv] ,[viddil jurydychnyj], [viddil administratyvno-gospodarskyj], [viddil rozrobok])
	) AS pivotTable

--2.10.UPDATE на базі однієї таблиці.
UPDATE Post
SET salary=2600
WHERE name='menedzher' OR salary=2700

--2.12.Append (INSERT) для додавання записів з явно вказаними значеннями.
-- Додати нову адресу проживання 
INSERT INTO Adresses (country, region, city, street, building, apt) 
VALUES ('Ukraine', 'Kharkivska', 'Kharkiv', 'Vidkryta', 25, 12)

--2.13.Append (INSERT) для додавання записів з інших таблиць.
-- 
INSERT INTO Passport_data(first_name, last_name, middle_name, birth_date, birth_place, living_place)
SELECT 'Oleg', last_name, middle_name, '1986-01-10', birth_place, living_place
FROM Passport_data
WHERE last_name = 'Koval'

--2.14.DELETE для видалення всіх даних з таблиці.
--DELETE 
--FROM Employee

--2.15.DELETE для видалення вибраних записів таблиці.
--DELETE 
--FROM Post_journal
--WHERE end_date IS NOT NULL



