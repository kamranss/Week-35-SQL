Create Database Spotify


Use Database Spotify

CREATE TABLE Music (
  Id INT NOT NULL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  duration TIME NOT NULL,
  viewCount INT NOT NULL,
  releasedYear INT NOT NULL
);

CREATE TABLE Albums (
  Id INT NOT NULL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  duration TIME NOT NULL,
  releasedYear INT NOT NULL
);

CREATE TABLE Album_Music (
  id INT NOT NULL PRIMARY KEY,
  AlbumId INT NOT NULL,
  MusicId INT NOT NULL,
  FOREIGN KEY (AlbumId) REFERENCES Albums(Id),
  FOREIGN KEY (MusicId) REFERENCES Music(Id)
);