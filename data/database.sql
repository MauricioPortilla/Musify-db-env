CREATE DATABASE Musify;
\c Musify;

CREATE TABLE account (
    accountId SERIAL PRIMARY KEY NOT NULL,
    email varchar(255) NOT NULL,
    password varchar(255) NOT NULL,
    name varchar(50) NOT NULL,
    lastName varchar(50) NOT NULL,
    secondLastName varchar(50) NULL,
    creationDate date NOT NULL
);

CREATE TABLE account_song (
    accountSongId SERIAL PRIMARY KEY NOT NULL,
    accountId int NOT NULL,
    FOREIGN KEY (accountId) REFERENCES Account(accountId),
    title varchar(50) NOT NULL,
    songLocation varchar(255) NOT NULL,
    uploadDate date NOT NULL
);

CREATE TABLE playlist (
    playlistId SERIAL PRIMARY KEY NOT NULL,
    accountId int NOT NULL,
    FOREIGN KEY (accountId) REFERENCES Account(accountId),
    name varchar(20) NOT NULL
);

CREATE TABLE album (
    albumId SERIAL PRIMARY KEY NOT NULL,
    name varchar(25) NOT NULL,
    launchYear int NOT NULL,
    discography varchar(50) NOT NULL,
    imageLocation varchar(255) NOT NULL
);

CREATE TABLE genre (
    genreId SERIAL PRIMARY KEY NOT NULL,
    name varchar(15) NOT NULL
);

CREATE TABLE song (
    songId SERIAL PRIMARY KEY NOT NULL,
    albumId int NOT NULL,
    FOREIGN KEY (albumId) REFERENCES Album(albumId),
    genreId int NOT NULL,
    FOREIGN KEY (genreId) REFERENCES Genre(genreId),
    title varchar(30) NOT NULL
);

CREATE TABLE song_rate (
    songRateId SERIAL PRIMARY KEY NOT NULL,
    accountId int NOT NULL,
    FOREIGN KEY (accountId) REFERENCES Account(accountId),
    songId int NOT NULL,
    FOREIGN KEY (songId) REFERENCES Song(songId),
    rate int NOT NULL
);

CREATE TABLE artist (
    artistId SERIAL PRIMARY KEY NOT NULL,
    accountId int NOT NULL,
    FOREIGN KEY (accountId) REFERENCES Account(accountId),
    name varchar(50) NOT NULL,
    lastName varchar(50) NOT NULL,
    secondLastName varchar(50) NULL
);

CREATE TABLE playlist_song (
    playlistId int NOT NULL,
    FOREIGN KEY (playlistId) REFERENCES Playlist(playlistId),
    songId int NOT NULL,
    FOREIGN KEY (songId) REFERENCES Song(songId),
    PRIMARY KEY (playlistId, songId)
);

CREATE TABLE album_artist (
    albumId int NOT NULL,
    FOREIGN KEY (albumId) REFERENCES Album(albumId),
    artistId int NOT NULL,
    FOREIGN KEY (artistId) REFERENCES Artist(artistId),
    PRIMARY KEY (albumId, artistId)
);

CREATE TABLE song_artist (
    songId int NOT NULL,
    FOREIGN KEY (songId) REFERENCES Song(songId),
    artistId int NOT NULL,
    FOREIGN KEY (artistId) REFERENCES Artist(artistId),
    PRIMARY KEY (songId, artistId)
);

CREATE TABLE artist_genre (
    artistId int NOT NULL,
    FOREIGN KEY (artistId) REFERENCES Artist(artistId),
    genreId int NOT NULL,
    FOREIGN KEY (genreId) REFERENCES Genre(genreId),
    PRIMARY KEY (artistId, genreId)
);
