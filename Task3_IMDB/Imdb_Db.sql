CREATE DATABASE Imdb

USE Imdb;

CREATE TABLE Directors(
 Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
[Name] NVARCHAR(30) NOT NULL);

CREATE TABLE Films(
 Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
[Name] NVARCHAR(30) NOT NULL,
ImdbPoint Decimal(2,1)  NOT NULL,
DurationValue TIME NOT NULL,
DirectorId INT REFERENCES Directors(Id));

CREATE TABLE Actors(
 Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
[Name] NVARCHAR(30) NOT NULL);

CREATE TABLE Genre(
 Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
[Name] NVARCHAR(30) NOT NULL);

CREATE TABLE ActorsPerFilm(
 Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
 ActorsId INT REFERENCES Actors(Id),
 FilmsId INT REFERENCES Films(Id));

CREATE TABLE GenrePerFilm(
 Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
 GenreId INT REFERENCES Genre(Id),
 FilmsId INT REFERENCES Films(Id));

SELECT Films.Name AS FilmName, Films.ImdbPoint, Genre.Name AS GenreName, Directors.Name AS DirectorName, 
       STRING_AGG(Actors.Name, ', ') WITHIN GROUP (ORDER BY Actors.Name) AS ActorNames
FROM Films
JOIN GenrePerFilm ON Films.Id = GenrePerFilm.FilmsId
JOIN Genre ON Genre.Id = GenrePerFilm.GenreId
JOIN Directors ON Films.DirectorId = Directors.Id
JOIN ActorsPerFilm ON Films.Id = ActorsPerFilm.FilmsId
JOIN Actors ON Actors.Id = ActorsPerFilm.ActorsId
WHERE Films.ImdbPoint > 6
GROUP BY Films.Name, Films.ImdbPoint, Genre.Name, Directors.Name;


 SELECT Films.Name AS FilmName, Genre.Name AS GenreName, Films.ImdbPoint
FROM Films
JOIN GenrePerFilm ON Films.Id = GenrePerFilm.FilmsId
JOIN Genre ON Genre.Id = GenrePerFilm.GenreId
WHERE Genre.Name LIKE '%a%'


 SELECT Films.Name AS FilmName, Films.DurationValue, Genre.Name AS GenreName, Films.ImdbPoint
FROM Films
JOIN GenrePerFilm ON Films.Id = GenrePerFilm.FilmsId
JOIN Genre ON Genre.Id = GenrePerFilm.GenreId
WHERE LEN(Films.Name) > 10 AND RIGHT(Films.Name,1) = 't';


SELECT Films.Name AS FilmName, Genre.Name AS GenreName, Directors.Name AS DirectorName, Films.ImdbPoint, 
       STRING_AGG(Actors.Name, ', ') WITHIN GROUP (ORDER BY Actors.Name) AS ActorNames
FROM Films
JOIN GenrePerFilm ON Films.Id = GenrePerFilm.FilmsId
JOIN Genre ON Genre.Id = GenrePerFilm.GenreId
JOIN Directors ON Films.DirectorId = Directors.Id
JOIN ActorsPerFilm ON Films.Id = ActorsPerFilm.FilmsId
JOIN Actors ON Actors.Id = ActorsPerFilm.ActorsId
WHERE Films.ImdbPoint > (SELECT AVG(ImdbPoint) FROM Films)
GROUP BY Films.Name, Genre.Name, Directors.Name, Films.ImdbPoint
ORDER BY Films.ImdbPoint DESC;












DELETE FROM Announcements;
DBCC CHECKIDENT ('Announcements', RESEED, 0);


INSERT INTO Marks ([Name])
VALUES
  ('Audi'),
  ('BMW'),
  ('Fiat'),
  ('Honda'),
  ('Lexus'),
  ('Mercedes');

INSERT INTO Models ([Name], MakeId)
VALUES
	('A5', 1),
	('A7', 1),
	('Q2', 1),
	('Q2', 1),
	('Q5', 1),
	('Q7', 1),
	('RS4', 1),
	('114', 2),
	('214', 2),
	('315', 2),
	('630', 2),
	('X5', 2),
	('Z3', 2),
	('Z8', 2),
	('131', 3),
	('500C', 3),
	('Bravo', 3),
	('Croma', 3),
	('Punto', 3),
	('Siena', 3),
	('Uno', 3),
	('Accord', 4),
	('Civic', 4),
	('Fit', 4),
	('CBF 500', 4),
	('Giorno', 4),
	('Jazz', 4),
	('Legend', 4),
	('ES 200', 5),
	('ES 330', 5),
	('GS 200t', 5),
	('IS 200', 5),
	('NX 200', 5),
	('RX 270', 5),
	('Ux 300e', 5),
	('A 140', 6),
	('A 210', 6),
	('C 160', 6),
	('CLS 320', 6),
	('0303', 6),
	('GLC 250', 6),
	('S 550', 6);

INSERT INTO VehicleTypes ([Name])
VALUES
	('Avtobus'),	
	('Minivan'),	
	('Pikap'),	
	('Sedan'),	
	('Universal');

INSERT INTO OwnerOrdinals ([Name])
VALUES
	('Birinci'),	
	('Ikinci'),	
	('Ucuncu'),	
	('Dorduncu ve ya daha cox');

INSERT INTO FuelTypes ([Name])
VALUES
	('Benzin'),
	('Dizel'),
	('Qaz'),
	('Elektro'),
	('Hibrid'),
	('Plug-in Hibrid');

INSERT INTO DriveTrains ([Name])
VALUES
	('Arxa'),	
	('On'),	
	('Tam');

INSERT INTO Colors ([Name])	
VALUES
	('Qara'),
	('Boz'),
	('Ag'),
	('Narinci'),
	('Sari');

INSERT INTO MileageMeasurementUnits ([Name])
VALUES
	('km'),	
	('mi');

INSERT INTO Currencies ([Name])
VALUES
	('AZN'),
	('USD'),
	('EUR');

INSERT INTO Transmissions ([Name])
VALUES
	('Mexaniki'),
	('Avtomat'),
	('Robotlasdirilmis'),
	('Variator');

INSERT INTO TargetMarkets ([Name])
VALUES
	('Amerika'),	
	('Avropa'),
	('Diger'),
	('Dubay'),
	('Koreya'),
	('Rusiya'),
	('Yaponiya');

INSERT INTO SeatCapacities ([Name])
VALUES
	('1'),
	('2'),
	('3'),
	('4'),
	('5'),
	('6'),
	('7'),
	('8+');

INSERT INTO Announcements 
(Mileage, Price, [Year], EngineDisplacement_cm3, 
EnginePower_hp, VinCode, AdditionalInfo, ModelId,
VehicleTypeId, ColorId, MileageMeasurementUnitId,
CurrencyId, OwnerOrdinalId, FuelTypeId, DrivetrainId,
TransmissionId, TargetMarketId, SeatCapacityId)
VALUES
	(1000, 2400, 2001, 500, 200, 'AZ222414242344354', 'Remark1', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
	(2300, 45000, 2015, 800, 500, 'AZ332414342344388', 'Remark2', 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2),
	(6500, 18000, 2010, 670, 230, 'AZ755414342897399', 'Remark3', 3, 2, 1, 2, 1, 2, 1, 2, 1, 2, 4);

INSERT INTO VehicleConditions (IsDamaged, IsRepainted, IsRepairNeeded, IsFinanced, IsBarterPossible, AnnouncementId)
VALUES
	(1, 1, 1, 1, 1, 1),
	(0, 0, 0, 0, 0, 2),
	(1, 0, 1, 0, 1, 3);

INSERT INTO VehicleEquipmentUnits 
(Yungul_lehimli_diskler, Merkezi_qapanma, Deri_salon, Oturacaqlarin_ventilyasiyasi,
[ABS], Park_radari, Ksenon_lampalar, Lyuk, Kondisioner, Arxa_goruntu_kamerasi,
Yagish_sensoru, Oturacaqlarin_isidilmesi, Yan_perdeler, AnnouncementId)
VALUES
	(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
	(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2),
	(0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 3);

INSERT INTO Cities ([Name])
VALUES
	('Agdam'),
	('Astara'),
	('Baki'),
	('Barda'),
	('Cabrayil'),
	('Kurdamir'),
	('Gence'),
	('Lerik'),
	('Sumgayit');

INSERT INTO Contacts ([Name], Email, PhoneNumber, CityId, AnnouncementId)
VALUES
	('Zakariyya', 'zvakilov@gmail.com', '+994504455342', 3, 1),
	('Nazrin', 'ngasimova@mail.ru', '+994555346687', 5, 2),
	('Galib', 'gbagirov@gmail.com', '+994552348767', 6, 3);

SELECT ANN.Price, ANN.DrivetrainId, MDL.[Name] AS ModelName, MAK.[Name] AS MakeName 
FROM Announcements as ANN
JOIN Models as MDL
ON ANN.ModelId = MDL.Id
JOIN Makes as MAK
ON MDL.MakeId = MAK.Id;

