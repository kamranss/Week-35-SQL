CREATE DATABASE Course

CREATE TABLE Teachers(
 Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
 [Name] NVARCHAR(17),
 Surname NVARCHAR(17),
 Email NVARCHAR(35)  NOT NULL DEFAULT 0,
 Age INT,
 Salary DECIMAL(10) 
);



INSERT INTO Teachers ('ALI', 'ALIYEV', 'ali@gmail.com', 15, '700');
INSERT INTO Teachers ('Arif', 'Arifli', 'arif@gmail.com', 18, '600');
INSERT INTO Teachers ('Akif', 'Amalov', 'ali@gmail.com', 15, '1200');
INSERT INTO Teachers ('Asim', 'Asimli', 'ali@gmail.com', 15, '1400');
INSERT INTO Teachers ('Ahmat', 'Ahmatli', 'ali@gmail.com', 15, '1050');
INSERT INTO Teachers ('Vahid', 'Vahidli', 'ali@gmail.com', 15, '3500');
INSERT INTO Teachers ('Saleh', 'Salehli', 'ali@gmail.com', 15, '2900');
INSERT INTO Teachers ('Yavuz', 'Yavuzlu', 'ali@gmail.com', 15, '5000');
INSERT INTO Teachers ('Ikram', 'Bayramov', 'ali@gmail.com', 15, '2350');
INSERT INTO Teachers ('Cavid', 'Bayramov', 'ali@gmail.com', 15, '4000');
INSERT INTO Teachers ('Coshqun', 'Haciyev', 'ali@gmail.com', 15, '1670');