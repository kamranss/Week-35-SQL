-- View -Db

CREATE VIEW FilmsData AS
SELECT f.Id, f.Name AS FilmName, f.ImdbPoint, f.durationValue, d.Name AS DirectorName, a.Name AS ActorName, g.Name AS GenreName
FROM Films f
INNER JOIN Directors d ON f.DirectorId = d.Id
LEFT JOIN ActorsPerFilm apf ON apf.FilmsId = f.Id
LEFT JOIN Actors a ON a.Id = apf.ActorsId
LEFT JOIN GenrePerFilm gpf ON gpf.FilmsId = f.Id
LEFT JOIN Genre g ON g.Id = gpf.GenreId;


-- Procedures -DB
USE Imdb

CREATE PROCEDURE getFilmById @id int
as 
SELECT * FROM Films Where Id = @id;

exec dbo.getFilmById 13;

CREATE PROCEDURE getFilmByName @firstLetter char
as 
SELECT * FROM Films Where [Name] like @firstLetter +'%';

exec dbo.getFilmByName 'F';

-- Function -Db

CREATE FUNCTION GetFilmCount
(@point DECIMAL(2,1)) -- parameter type
RETURNS INT -- return type
AS
BEGIN
    DECLARE @Count INT; -- variable to hold the count
    SELECT @Count = COUNT(*) FROM Films WHERE ImdbPoint > @point;
    RETURN @Count; -- return the count
END;

exec dbo.GetFilmCount 5;
select dbo.GetFilmCount (5);

-- Trigger -- belogs to table 

Create Trigger SelectAllDataAfterDelete
On Films
After Delete, Update
As
Begin
	Select* From Films
End


Use Imdb

Update Films
Set ImdbPoint = 7.0
Where Id = 14