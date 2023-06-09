CREATE DATABASE TurboAzz

USE TurboAzz;

CREATE TABLE BanTypes(
 Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
[Name] NVARCHAR(30) NOT NULL);

CREATE TABLE ColorTypes(
 Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
[Name] NVARCHAR(30) NOT NULL);

CREATE TABLE UnitofMeasurement(
 Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
[Name] NVARCHAR(30) NOT NULL);

CREATE TABLE [Ownership](
 Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
[Name] NVARCHAR(30) NOT NULL);

CREATE TABLE FuelTypes(
 Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
[Name] NVARCHAR(30) NOT NULL);

CREATE TABLE GearBoxTypes(
 Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
[Name] NVARCHAR(30) NOT NULL);

CREATE TABLE WheelDriveSystem(
 Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
[Name] NVARCHAR(30) NOT NULL);

CREATE TABLE CurrencyType(
 Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
[Name] NVARCHAR(30) NOT NULL);

CREATE TABLE EngineSizeType(
 Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
[Name] NVARCHAR(30) NOT NULL);

CREATE TABLE MarketType(
 Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
[Name] NVARCHAR(30) NOT NULL);

CREATE TABLE SeatQuantities(
 Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
[Name] NVARCHAR(30) NOT NULL);

CREATE TABLE Cities(
 Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
[Name] NVARCHAR(30) NOT NULL);


CREATE TABLE Marks(
 Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
[Name] NVARCHAR(30) NOT NULL);

CREATE TABLE Models(
 Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
[Name] NVARCHAR(30 ) NOT NULL,
MarkId INT REFERENCES Marks(Id));

CREATE TABLE Announces(
 Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
 Yurus INT NOT NULL,
 Price INT NOT NULL,
 CurrencyTypeId INT REFERENCES CurrencyType(Id),
 BanTypeId INT REFERENCES BanTypes(Id),
 ColorId INT REFERENCES ColorTypes(Id),
 YurusTypeId INT REFERENCES UnitofMeasurement(Id),
 OwnerShipId INT REFERENCES [OwnerShip](Id),
 FuelTypeId INT REFERENCES FuelTypes(Id),
 GearBoxTypeId INT REFERENCES GearBoxTypes(Id),
 OturucuTypeId INT REFERENCES WheelDriveSystem(Id),
 [Year] DECIMAL(4,0),
 EngineSizeId INT REFERENCES EngineSizeType(Id),
 MarketTypeId INT REFERENCES MarketType(Id),
 VinCode NVARCHAR(17),
 AdditionalInfo NVARCHAR(255),
 ModelTypeId INT REFERENCES Models(Id),
 HorsePower INT,
 SeatQuantityId INT REFERENCES SeatQuantities(Id)
);

CREATE TABLE Contacts(
 Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
[Name] NVARCHAR(30) NOT NULL,
Email NVARCHAR(30) NOT NULL,
AnnId INT REFERENCES Announces(Id),
CityId INT NOT NULL REFERENCES Cities(Id), 
AnnounceId INT REFERENCES Announces(Id),
);


CREATE TABLE VehicleCondition(
 Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
 IsDamaged  BIT DEFAULT 0,
 IsColorChanged  BIT DEFAULT 0,
 IsNeedRepair  BIT DEFAULT 0,
 IsCredit  BIT DEFAULT 0,
 IsBarter  BIT DEFAULT 0,
 AnnouncementId INT REFERENCES Announces(Id)
 );

 CREATE TABLE FactoryFunctions(
 Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
 YungulLehimliDiskler  BIT DEFAULT 0,
 MerkeziQapanma  BIT DEFAULT 0,
 DeriSalon  BIT DEFAULT 0,
 OturacaqlarinVentilyasiyasi  BIT DEFAULT 0,
 [Abs]  BIT DEFAULT 0,
 ParkRadar BIT DEFAULT 0,
 KsenonLampalar BIT DEFAULT 0,
 Lyuk BIT DEFAULT 0,
 Kondisoner BIT DEFAULT 0,
 ArxaGoruntuKamerasi BIT DEFAULT 0,
 YagisSensoru BIT DEFAULT 0,
 OturacaqlarinIsidilmesi BIT DEFAULT 0,
 YanPerdeler BIT DEFAULT 0,
 AnnouncementId INT REFERENCES Announces(Id)
 );


 SELECT * FROM Announces 
JOIN BanTypes ON Announces.BanTypeId = BanTypes.Id 
JOIN ColorTypes ON Announces.ColorId = ColorTypes.Id 
JOIN UnitofMeasurement ON Announces.YurusTypeId = UnitofMeasurement.Id 
JOIN [OwnerShip] ON Announces.OwnerShipId = [OwnerShip].Id 
JOIN FuelTypes ON Announces.FuelTypeId = FuelTypes.Id 
JOIN GearBoxTypes ON Announces.GearBoxTypeId = GearBoxTypes.Id 
JOIN WheelDriveSystem ON Announces.OturucuTypeId = WheelDriveSystem.Id 
JOIN CurrencyType ON Announces.CurrencyTypeId = CurrencyType.Id 
JOIN EngineSizeType ON Announces.EngineSizeId = EngineSizeType.Id 
JOIN MarketType ON Announces.MarketTypeId = MarketType.Id 
JOIN SeatQuantities ON Announces.SeatQuantityId = SeatQuantities.Id 
JOIN Models ON Announces.ModelTypeId = Models.Id 
JOIN Contacts ON Announces.Id = Contacts.AnnounceId 
JOIN Cities ON Contacts.CityId = Cities.Id 
JOIN VehicleCondition ON Announces.Id = VehicleCondition.AnnouncementId 
JOIN FactoryFunctions ON Announces.Id = FactoryFunctions.AnnouncementId 
WHERE Announces.Id = [2];



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

