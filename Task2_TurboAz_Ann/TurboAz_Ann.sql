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
WHERE Announces.Id = [ID of the announce you want to display];

