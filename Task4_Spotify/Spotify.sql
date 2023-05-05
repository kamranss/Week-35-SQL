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


CREATE TABLE Artists (
  Id INT NOT NULL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  dateOfBirth DATE NOT NULL,
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
  name VARCHAR(255) NOT NULL,
  surname VARCHAR(255) NOT NULL,
  dateOfBirth DATE NOT NULL,
  email VARCHAR(255) NOT NULL
);

CREATE TABLE LikedMusics (
  Id INT NOT NULL PRIMARY KEY,
  musicId INT NOT NULL,
  UserId INT NOT NULL,
  FOREIGN KEY (musicId) REFERENCES Music(Id),
  FOREIGN KEY (UserId) REFERENCES Users(Id)
);