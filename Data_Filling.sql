USE StaffAccounting;

DELETE FROM Adresses;
INSERT INTO Adresses (country, region, city, street, building, apt) VALUES
	('Ukraine', 'Lvivska', 'Lviv', 'Vidkryta', 1, 333),
	('Ukraine', 'Lvivska', 'Lviv', 'Ostrogratskykh', 5, 34),
	('Ukraine', 'Lvivska', 'Lviv', 'Sakharova', 43, 55),
	('Ukraine', 'Lvivska', 'Lviv', 'Demnyanska', 24, 20),
	('Ukraine', 'Lvivska', 'Lviv', 'Skoruny', 12, 27),
	('Ukraine', 'Lvivska', 'Lviv', 'Lazarenka', 40, 71),
	('Ukraine', 'Lvivska', 'Lviv', 'Horodotska', 150, 37),
	('Ukraine', 'Lvivska', 'Lviv', 'Naukova', 46, 337),
	('Ukraine', 'Lvivska', 'Lviv', 'Chornovola', 51, 69),
	('Ukraine', 'Lvivska', 'Lviv', 'Lukasha', 5, 87),
	('Ukraine', 'Lutska', 'Lutsk', 'Voli', 6, 37),
	('Ukraine', 'Lutska', 'Lutsk', 'Kravchuka', 48, 24),
	('Ukraine', 'Lutska', 'Lutsk', 'Sobornosti', 26, 72),
	('Ukraine', 'Lutska', 'Lutsk', 'Grushevskogo', 61, 7),
	('Ukraine', 'Lutska', 'Lutsk', 'Voli', 39, 49),
	('Ukraine', 'Kyivska', 'Kyiv', 'Nezalezhnosti', 26, 97),
	('Ukraine', 'Kyivska', 'Kyiv', 'Khreschatyk', 28, 17),
	('Ukraine', 'Kyivska', 'Kyiv', 'Grushevskogo', 29, 67),
	('Ukraine', 'Chernivetska', 'Chernivtsi', 'Grushevskogo', 9, 87),
	('Ukraine', 'Chernivetska', 'Chernivtsi', 'Voli', 39, 74);
	
DELETE FROM Passport_data;
INSERT INTO Passport_data (first_name, last_name, middle_name, birth_date, birth_place, living_place) VALUES 
	('Ivan', 'Petrenko', 'Petrovych', '1986-06-25', 10000, 10000),
	('Mykola', 'Koval', 'Leonidovych', '1987-03-02', 10001, 10001),
	('Maria', 'Petrenko', 'Ivanivna', '1989-12-22', 10002, 10002),
	('Tetyana', 'Semenyuk', 'Vasylivna', '1990-02-22', 10003, 10003),
	('Viktor', 'Gnatuyk', 'Pavlovych', '1980-05-19', 10004, 10004),
	('Petro', 'Zinchuk', 'Mykhailovych', '1978-11-10', 10005, 10005),
	('Iruna', 'Panasyuk', 'Mykhajlivna', '1993-09-23', 10006, 10006),
	('Valentyna', 'Kosar', 'Petrivna', '1985-06-30', 10007, 10007),
	('Viktoria', 'Moroz', 'Igorivna', '1977-10-19', 10008, 10008),
	('Valentyn', 'Kornijchuk', 'Ruslanovych', '1985-08-26', 10009, 10009),
	('Igor', 'Shevchuk', 'Ivanovych', '1990-09-17', 10010, 10010),
	('Pavlo', ' Grynyuk', 'Semenovych', '1988-07-16', 10011, 10011),
	('Olena', 'Bonyuk', 'Dmytrivna', '1975-04-18', 10012, 10012),
	('Dmytro', 'Levchuk', 'Andriyovych', '1983-05-14', 10013, 10013),
	('Cvitlana', 'Vaschuk', 'Vasylivna', '1988-06-06', 10014, 10014),
	('Ryslan', 'Mykytyuk', 'Olegovych', '1990-11-25', 10015, 10015),
	('Natalia', 'Paschuk', 'Fedorivna', '1983-02-15', 10016, 10016),
	('Ryslana', 'Vojtyuk', 'Vasylivna', '1993-08-26', 10017, 10017),
	('Semen', 'Bilous', 'Petrovych', '1978-12-06', 10018, 10018),
	('Oleg', 'Novosad', 'Oleksandrovych', '1992-10-31', 10019, 10019);
	
DELETE FROM Employee;
INSERT INTO Employee (id_employee) VALUES	
	(100000),
	(100001),
	(100002),
	(100003),
	(100004),
	(100005),
	(100006),
	(100007),
	(100008),
	(100009),
	(100010),
	(100011),
	(100012),
	(100013),
	(100014),
	(100015),
	(100016),
	(100017),
	(100018),
	(100019);
	
DELETE FROM Vacation_journal;
INSERT INTO Vacation_journal (employee, begin_date, end_date) VALUES	
	(100000, '2014-06-15', '2014-07-05'),
	(100002, '2014-09-20', '2014-10-20'),
	(100004, '2014-11-01', '2014-12-01'),
	(100011, '2014-11-10', '2014-12-05'),
	(100005, '2014-11-15', '2014-12-25'),
	(100006, '2014-12-25', '2015-01-15'),
	(100002, '2015-01-05', '2015-02-01'),
	(100007, '2015-01-03', '2015-02-05'),
	(100008, '2015-02-01', '2015-02-15'),
	(100012, '2015-02-05', '2015-02-25'),
	(100014, '2015-02-25', '2015-03-05'),
	(100017, '2015-03-07', '2015-04-04'),
	(100010, '2015-04-25', '2015-05-01'),
	(100000, '2015-04-26', '2015-05-02'),
	(100015, '2015-05-15', '2015-05-30'),
	(100013, '2015-06-15', '2015-07-10'),
	(100016, '2015-08-01', '2015-09-10'),
	(100000, '2015-09-05', '2015-09-25'),
	(100008, '2015-09-08', '2015-10-04'),
	(100003, '2015-09-10', '2015-10-03');
		
DELETE FROM Department;
INSERT INTO Department (name, abbreviation, staff_amount) VALUES	
	('viddil finansiv', 'fin', 3),
	('viddil kadriv', 'kadr', 5),
	('viddil jurydychnyj', 'jur', 3),
	('viddil administratyvno-gospodarskyj', 'adm', 6),
	('viddil rozrobok', 'roz', 3);

DELETE FROM Post;
INSERT INTO Post (name, salary) VALUES
	('kerivnyk viddilu', 3000),
	('zastupnyk', 2800),
	('menedzher', 2500),
	('bykhalter', 2500),
	('kasyr', 2300),
	('inzhener', 2300),  
	('it-rozrobnyk', 2500), 
	('spetsialist z personalu', 2500),
	('spetsialist z pidvyschennya kvalifikatsii', 2500), 
	('sekretar', 2000), 
	('spetsialist po vyrobnytstvu', 2300), 
	('konsultant', 1900),
	('fakhivets', 2000), 
	('juryst', 2700); 
	
	
DELETE FROM Post_journal;
INSERT INTO Post_journal (employee_id, post_id, department_id, begin_date, end_date) VALUES
	(100000, 101, 2, '2012-10-15', '2014-01-31'),
	(100001, 107, 2, '2012-11-01', NULL),
	(100002, 102, 4, '2012-10-14', NULL),
	(100003, 109, 3, '2012-11-03', NULL),
	(100004, 100, 1, '2012-11-05', NULL),
	(100005, 100, 3, '2012-11-01', NULL),
	(100006, 104, 1, '2013-11-04', '2014-09-24'),
	(100007, 110, 4, '2013-11-05', NULL),
	(100008, 100, 2, '2013-10-15', NULL),
	(100009, 111, 4, '2013-11-09', NULL),
	(100010, 102, 4, '2013-11-01', '2015-02-28'),
	(100011, 113, 3, '2013-11-05', NULL),
	(100012, 100, 5, '2013-10-15', NULL),
	(100013, 103, 1, '2013-11-06', '2014-11-12'),
	(100014, 106, 5, '2013-11-05', NULL),
	(100015, 112, 4, '2013-11-01', NULL),
	(100016, 101, 4, '2013-11-02', '2014-01-31'),
	(100017, 108, 2, '2013-11-05', NULL),
	(100018, 100, 4, '2013-10-14', NULL),
	(100019, 105, 5, '2013-11-05', NULL),
	(100016, 101, 2, '2014-02-01', NULL),
	(100000, 101, 4, '2014-02-01', NULL),
	(100006, 103, 1, '2014-09-25', NULL),
	(100013, 102, 4, '2014-11-13', NULL),
	(100010, 104, 1, '2015-03-01', NULL);
		