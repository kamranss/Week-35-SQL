
CREATE DATABASE Coursee;

USE Coursee

CREATE TABLE Teachers(
 Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
 [Name] NVARCHAR(17),
 Surname NVARCHAR(17),
 Email NVARCHAR(35) NOT NULL DEFAULT '',
 Age INT,
 Salary DECIMAL(10, 2)
);

INSERT INTO Teachers ([Name], Surname, Email, Age, Salary) VALUES 
('ALI', 'ALIYEV', 'ali@gmail.com', 30, 700),
('Arif', 'Arifli', 'arif@gmail.com', 18, 600),
('Akif', 'Amalov', 'ali@gmail.com', 26, 1200),
('Asim', 'Asimli', 'ali@gmail.com', 33, 1400),
('Ahmat', 'Ahmatli', 'ali@gmail.com', 34, 1050),
('Vahid', 'Vahidli', 'ali@gmail.com', 42, 3500),
('Saleh', 'Salehli', 'ali@mail.ru', 50, 2900),
('Yavuz', 'Yavuzlu', 'ali@gmail.com', 31, 5000),
('Ikram', 'Bayramov', 'ali@mail.ru', 23, 2350),
('Cavid', 'Bayramov', 'ali@gmail.com', 28, 4000),
('Coshqun', 'Haciyev', 'ali@mail.ru', 20, 1670);





SELECT [Name], Surname, Age 
FROM Teachers
WHERE Age > (SELECT AVG(Age) FROM Teachers);


SELECT [Name], Surname, Salary 
FROM Teachers
WHERE Salary BETWEEN 1000 AND 3000;


SELECT [Name], Surname 
FROM Teachers
WHERE Email LIKE '%mail.ru';


SELECT [Name], Surname 
FROM Teachers
WHERE [Name] LIKE 'C%' AND Surname LIKE 'C%';
