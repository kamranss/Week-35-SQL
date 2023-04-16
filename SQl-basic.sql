CREATE DATABASE Course

USE Course;

CREATE TABLE Users (
Id int,
[Name] nvarchar(25),
Surname nvarchar(25),
Age int,
Email nvarchar(30),
[Address] nvarchar(50),
IsDeleted BIT NOT NULL,
)

DROP table Users
--CONSTRAINT user_isdeleted CHECK (IsDeleted IN (1,0))

CREATE TABLE Educations (
Id int,
[Name] nvarchar(25),
)


CREATE TABLE Teachers (
Id int,
FullName nvarchar(50),
Age int,
Email nvarchar(30),
[Address] nvarchar(50),
IsDeleted BIT NOT NULL,
)
DROP TABLE Teachers

SELECT * FROM Users

INSERT INTO Users 
VALUES 
(1, 'Ali', 'Aliyev', 23, 'ali@gmail.com', 'Puskin kucesi', 0),
(2, 'Akif', 'Aliyev', 22, 'ali@gmail.com', 'Iqbal kucesi', 0),
(3, 'Asim', 'Aliyev', 21, 'ali@gmail.com', 'Sahib kucesi', 0),
(4, 'Asif', 'Aliyev', 45, 'ali@gmail.com', 'Vali kucesi', 0),
(5, 'Alim', 'Aliyev', 24, 'ali@gmail.com', 'Axundov kucesi', 0),
(6, 'Alibey', 'Aliyev', 28, 'ali@gmail.com', 'Yaqubov kucesi', 0),
(7, 'Ali', 'Aliyev', 12, 'ali@gmail.com', 'Puskin kucesi', 0),
(8, 'Akif', 'Aliyev', 14, 'ali@gmail.com', 'Iqbal kucesi', 0),
(9, 'Asim', 'Aliyev', 18, 'ali@gmail.com', 'Sahib kucesi', 0)

INSERT INTO Teachers 
VALUES 
(1, 'Ali Aliyev', 23, 'ali@gmail.com', 'Puskin kucesi', 0),
(2, 'Akif Aliyev', 22, 'ali@gmail.com', 'Iqbal kucesi', 1),
(3, 'Asim Aliyev', 21, 'ali@gmail.com', 'Sahib kucesi', 0),
(4, 'Asif Aliyev', 45, 'ali@gmail.com', 'Vali kucesi', 1),
(5, 'Alim Aliyev', 24, 'ali@gmail.com', 'Axundov kucesi', 0),
(6, 'Alibey Aliyev', 28, 'ali@gmail.com', 'Yaqubov kucesi', 0)


SELECT * FROM Users
Where Age < 20;

SELECT COUNT(*) as Sum_Users FROM Users;

SELECT FullName, Age, [Address] FROM Teachers
Where IsDeleted = 1;

SELECT COUNT(*) AS Sum_Teachers FROM Teachers
Where Age >30;

