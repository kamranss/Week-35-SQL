CREATE DATABASE Imdb

USE Imdb;
USE master;
GO
ALTER DATABASE Imdb SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO

drop DATABASE Imdb

CREATE TABLE Directors(
 Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
[Name] NVARCHAR(30) NOT NULL);

CREATE TABLE Films(
 Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
[Name] NVARCHAR(30) NOT NULL,
ImdbPoint Decimal(2,1)  NOT NULL,
durationValue DECIMAL(5,2) NOT NULL,
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

 INSERT INTO Genre ([Name]) VALUES 
('Animation'),
('Biography'),
('Comedy'),
('Crime'),
('Drama'),
('Family'),
('Fantasy'),
('Film-Noir'),
('History'),
('Horror'),
('Music'),
('Musical'),
('Mystery'),
('Romance'),
('Sci-Fi'),
('Sport'),
('Thriller'),
('War'),
('Western');

INSERT INTO Films ([Name], ImdbPoint, durationValue, DirectorId) 
VALUES ('The Shawshank Redemption', 9.3, 142, 2);
INSERT INTO Films ([Name], ImdbPoint, durationValue, DirectorId) 
VALUES ('The Dark Knight', 9.0, 144, 1);
INSERT INTO Films ([Name], ImdbPoint, durationValue, DirectorId) 
VALUES ('The Lord of the Rings', 9.0, 201, 3);
INSERT INTO Films ([Name], ImdbPoint, durationValue, DirectorId) 
VALUES ('Fight Club', 8.8, 139, 5);



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



SELECT Films.Name AS FilmName, 
       STRING_AGG(Genre.Name, ', ') WITHIN GROUP (ORDER BY Genre.Name) AS GenreNames,
       Films.ImdbPoint
FROM Films
JOIN GenrePerFilm ON Films.Id = GenrePerFilm.FilmsId
JOIN Genre ON Genre.Id = GenrePerFilm.GenreId
WHERE Genre.Name LIKE '%a%'
GROUP BY Films.Name, Films.ImdbPoint;




SELECT Films.Name AS FilmName, Films.DurationValue, 
       STRING_AGG(Genre.Name, ', ') WITHIN GROUP (ORDER BY Genre.Name) AS GenreNames,
       Films.ImdbPoint
FROM Films
JOIN GenrePerFilm ON Films.Id = GenrePerFilm.FilmsId
JOIN Genre ON Genre.Id = GenrePerFilm.GenreId
WHERE LEN(Films.Name) > 10 AND RIGHT(Films.Name, 1) = 't'
GROUP BY Films.Name, Films.DurationValue, Films.ImdbPoint;


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












