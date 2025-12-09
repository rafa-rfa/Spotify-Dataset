/*Banco não normalizado */


CREATE TABLE spotify_tracks (
  id TEXT PRIMARY KEY,
  name TEXT,
  artists TEXT,
  year INTEGER,
  release_date DATE,
  duration_ms INTEGER,
  popularity SMALLINT,
  explicit BOOLEAN,
  key SMALLINT,
  mode SMALLINT,
  time_signature SMALLINT,
  acousticness REAL,
  danceability REAL,
  energy REAL,
  instrumentalness REAL,
  liveness REAL,
  loudness REAL,
  speechiness REAL,
  tempo REAL,
  valence REAL
);

-- Tabela agregada por gênero+artista
CREATE TABLE data_w_genres (
  genres TEXT,
  artists TEXT,
  acousticness REAL,
  danceability REAL,
  duration_ms REAL,
  energy REAL,
  instrumentalness REAL,
  liveness REAL,
  loudness REAL,
  speechiness REAL,
  tempo REAL,
  valence REAL,
  popularity REAL,
  key SMALLINT,
  mode SMALLINT,
  count INTEGER,
  PRIMARY KEY (genres, artists)
);

-- Tabela agregada por ano
CREATE TABLE data_by_year (
  year INTEGER PRIMARY KEY,
  mode SMALLINT,
  acousticness REAL,
  danceability REAL,
  duration_ms REAL,
  energy REAL,
  instrumentalness REAL,
  liveness REAL,
  loudness REAL,
  speechiness REAL,
  tempo REAL,
  valence REAL,
  popularity REAL,
  key SMALLINT
);

-- Tabela agregada por gênero
CREATE TABLE data_by_genres (
  genres TEXT PRIMARY KEY,
  mode SMALLINT,
  acousticness REAL,
  danceability REAL,
  duration_ms REAL,
  energy REAL,
  instrumentalness REAL,
  liveness REAL,
  loudness REAL,
  speechiness REAL,
  tempo REAL,
  valence REAL,
  popularity REAL,
  key SMALLINT
);

-- Tabela agregada por artista
CREATE TABLE data_by_artist (
  artists TEXT PRIMARY KEY,
  mode SMALLINT,
  count INTEGER,
  acousticness REAL,
  danceability REAL,
  duration_ms REAL,
  energy REAL,
  instrumentalness REAL,
  liveness REAL,
  loudness REAL,
  speechiness REAL,
  tempo REAL,
  valence REAL,
  popularity REAL,
  key SMALLINT
);