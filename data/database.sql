CREATE USER musify_user WITH PASSWORD 'Musify_0903';
CREATE DATABASE musify OWNER musify_user;
GRANT ALL PRIVILEGES ON DATABASE musify TO musify_user;
\c musify musify_user;

CREATE TABLE account (
    account_id SERIAL PRIMARY KEY NOT NULL,
    email varchar(255) UNIQUE NOT NULL,
    password varchar(255) NOT NULL,
    name varchar(50) NOT NULL,
    last_name varchar(50) NOT NULL,
    creation_date date NOT NULL
);

CREATE TABLE subscription (
    subscription_id SERIAL PRIMARY KEY NOT NULL,
    account_id int NOT NULL,
    FOREIGN KEY (account_id) REFERENCES account(account_id),
    cost float NOT NULL,
    startDate date NOT NULL,
    endDate date NOT NULL
);

CREATE TABLE account_song (
    account_song_id SERIAL PRIMARY KEY NOT NULL,
    account_id int NOT NULL,
    FOREIGN KEY (account_id) REFERENCES account(account_id),
    title varchar(255) NOT NULL,
    duration varchar(10) NOT NULL,
    song_location varchar(255) NOT NULL,
    upload_date date NOT NULL
);

CREATE TABLE playlist (
    playlist_id SERIAL PRIMARY KEY NOT NULL,
    account_id int NOT NULL,
    FOREIGN KEY (account_id) REFERENCES account(account_id),
    name varchar(20) NOT NULL
);

CREATE TABLE album (
    album_id SERIAL PRIMARY KEY NOT NULL,
    type varchar(15) NOT NULL,
    name varchar(25) NOT NULL,
    launch_year int NOT NULL,
    discography varchar(50) NOT NULL,
    image_location varchar(255) NOT NULL
);

CREATE TABLE genre (
    genre_id SERIAL PRIMARY KEY NOT NULL,
    name varchar(15) NOT NULL
);

CREATE TABLE song (
    song_id SERIAL PRIMARY KEY NOT NULL,
    album_id int NOT NULL,
    FOREIGN KEY (album_id) REFERENCES album(album_id),
    genre_id int NOT NULL,
    FOREIGN KEY (genre_id) REFERENCES genre(genre_id),
    title varchar(30) NOT NULL,
    duration varchar(10) NOT NULL,
    song_location varchar(255) NOT NULL,
    status varchar(20) NOT NULL
);

CREATE TABLE song_like (
    account_id int NOT NULL,
    FOREIGN KEY (account_id) REFERENCES account(account_id),
    song_id int NOT NULL,
    FOREIGN KEY (song_id) REFERENCES song(song_id),
    PRIMARY KEY (account_id, song_id)
);

CREATE TABLE song_dislike (
    account_id int NOT NULL,
    FOREIGN KEY (account_id) REFERENCES account(account_id),
    song_id int NOT NULL,
    FOREIGN KEY (song_id) REFERENCES song(song_id),
    PRIMARY KEY (account_id, song_id)
);

CREATE TABLE artist (
    artist_id SERIAL PRIMARY KEY NOT NULL,
    account_id int NOT NULL,
    FOREIGN KEY (account_id) REFERENCES account(account_id),
    artistic_name varchar(50) NOT NULL
);

CREATE TABLE playlist_song (
    playlist_id int NOT NULL,
    FOREIGN KEY (playlist_id) REFERENCES playlist(playlist_id),
    song_id int NOT NULL,
    FOREIGN KEY (song_id) REFERENCES song(song_id),
    PRIMARY KEY (playlist_id, song_id)
);

CREATE TABLE album_artist (
    album_id int NOT NULL,
    FOREIGN KEY (album_id) REFERENCES album(album_id),
    artist_id int NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES artist(artist_id),
    PRIMARY KEY (album_id, artist_id)
);

CREATE TABLE song_artist (
    song_id int NOT NULL,
    FOREIGN KEY (song_id) REFERENCES song(song_id),
    artist_id int NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES artist(artist_id),
    PRIMARY KEY (song_id, artist_id)
);

CREATE TABLE artist_genre (
    artist_id int NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES artist(artist_id),
    genre_id int NOT NULL,
    FOREIGN KEY (genre_id) REFERENCES genre(genre_id),
    PRIMARY KEY (artist_id, genre_id)
);
