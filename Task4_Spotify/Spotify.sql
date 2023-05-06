Create Database Spotify


Use  Spotify


CREATE TABLE Music (
  Id INT NOT NULL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  duration INT NOT NULL,
  viewCount INT NOT NULL,
  releasedYear INT NOT NULL
);

CREATE TABLE Albums (
  Id INT NOT NULL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  duration INT NOT NULL,
  releasedYear CHAR(4) NOT NULL
);

CREATE TABLE Album_Music (
  id INT NOT NULL PRIMARY KEY,
  AlbumId INT NOT NULL,
  MusicId INT NOT NULL,
  FOREIGN KEY (AlbumId) REFERENCES Albums(Id),
  FOREIGN KEY (MusicId) REFERENCES Music(Id)
);


CREATE TABLE Artists (
  Id INT NOT NULL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  musicGenre VARCHAR(255) NOT NULL
);

CREATE TABLE Artists_albums (
  id INT NOT NULL PRIMARY KEY,
  ArtistId INT NOT NULL,
  AlbumId INT NOT NULL,
  FOREIGN KEY (ArtistId) REFERENCES Artists(Id),
  FOREIGN KEY (AlbumId) REFERENCES Albums(Id)
);


CREATE TABLE Users (
  Id INT NOT NULL PRIMARY KEY,
  name VARCHAR(40) NOT NULL,
  surname VARCHAR(40) NOT NULL,
  dateOfBirth DATE,
  email VARCHAR(255) 
);

CREATE TABLE LikedMusics (
  Id INT NOT NULL PRIMARY KEY,
  musicId INT NOT NULL,
  UserId INT NOT NULL,
  FOREIGN KEY (musicId) REFERENCES Music(Id),
  FOREIGN KEY (UserId) REFERENCES Users(Id)
);




SELECT m.name AS music_name, m.duration, a.name AS artist_name, al.name AS album_name
FROM Music m
INNER JOIN Album_Music am ON m.Id = am.MusicId
INNER JOIN Albums al ON am.AlbumId = al.Id
INNER JOIN Artists_albums aa ON al.Id = aa.AlbumId
INNER JOIN Artists a ON aa.ArtistId = a.Id;


-- Creation MusicDetailed view
CREATE VIEW MusicDetails AS
SELECT m.name AS music_name, m.duration, a.name AS artist_name, al.name AS album_name
FROM Music m
INNER JOIN Album_Music am ON m.Id = am.MusicId
INNER JOIN Albums al ON am.AlbumId = al.Id
INNER JOIN Artists_albums aa ON al.Id = aa.AlbumId
INNER JOIN Artists a ON aa.ArtistId = a.Id;


CREATE VIEW AlbumDetails AS
SELECT al.Id, al.name AS album_name, COUNT(am.MusicId) AS num_songs
FROM Albums al
INNER JOIN Album_Music am ON al.Id = am.AlbumId
GROUP BY al.Id, al.name;


CREATE PROCEDURE GetPopularMusicFromAlbum
  @viewCount INT,
  @album_name VARCHAR(255)
AS
BEGIN
  SELECT al.name AS album_name, m.name AS music_name, m.viewCount
  FROM Music m
  INNER JOIN Album_Music am ON m.Id = am.MusicId
  INNER JOIN Albums al ON am.AlbumId = al.Id
  WHERE al.name = @album_name AND m.viewCount > @viewCount
  ORDER BY m.viewCount DESC;
END;