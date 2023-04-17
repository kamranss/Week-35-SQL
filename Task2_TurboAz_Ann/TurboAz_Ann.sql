CREATE DATABASE TurboAz

Drop DATABASE TurboAz
USE TurboAz;

CREATE TABLE BanType(
 Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
[Name] NVARCHAR(30));

CREATE TABLE ColorType(
 Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
[Name] NVARCHAR(30));

CREATE TABLE YurusType(
 Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
[Name] NVARCHAR(30));

CREATE TABLE [Ownership](
 Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
[Name] NVARCHAR(30));

CREATE TABLE FuelType(
 Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
[Name] NVARCHAR(30));

CREATE TABLE GearBoxType(
 Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
[Name] NVARCHAR(30));

CREATE TABLE OturucuType(
 Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
[Name] NVARCHAR(30));

CREATE TABLE CurrencyType(
 Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
[Name] NVARCHAR(30));

CREATE TABLE EngineSizeType(
 Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
[Name] NVARCHAR(30));

CREATE TABLE MarketType(
 Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
[Name] NVARCHAR(30));

CREATE TABLE SeatQuantity(
 Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
[Name] NVARCHAR(30));

CREATE TABLE Cities(
 Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
[Name] NVARCHAR(30));

CREATE TABLE Contacts(
 Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
[Name] NVARCHAR(30),
Email NVARCHAR(30),
CityId INT REFERENCES Cities(Id) 
);

CREATE TABLE Marks(
 Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
[Name] NVARCHAR(30));

CREATE TABLE Models(
 Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
[Name] NVARCHAR(30),
MarkId INT REFERENCES Marks(Id));

CREATE TABLE Announces(
 Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
 Yurus INT,
 Price INT,
 CurrencyTypeId INT REFERENCES CurrencyType(Id),
 BanTypeId INT REFERENCES BanType(Id),
 ColorId INT REFERENCES ColorType(Id),
 YurusTypeId INT REFERENCES YurusType(Id),
 OwnerShipId INT REFERENCES [OwnerShip](Id),
 FuelTypeId INT REFERENCES FuelType(Id),
 GearBoxTypeId INT REFERENCES GearBoxType(Id),
 OturucuTypeId INT REFERENCES OturucuType(Id),
 [Year] DECIMAL(4,0),
 EngineSizeId INT REFERENCES EngineSizeType(Id),
 MarketTypeId INT REFERENCES MarketType(Id),
 VinCode NVARCHAR(17),
 AdditionalInfo NVARCHAR(255),
 ModelTypeId INT REFERENCES Models(Id),
 ContactId INT REFERENCES Contacts(Id),
 HorsePower INT,
 SeatQuantityId INT REFERENCES SeatQuantity(Id)
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




