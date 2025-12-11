DROP TABLE IF EXISTS data CASCADE;
CREATE TABLE data (
    id TEXT,
    name TEXT,
    artists TEXT,
    year INTEGER,
    acousticness NUMERIC,
    danceability NUMERIC,
    duration_ms INTEGER,
    energy NUMERIC,
    explicit BOOLEAN,
    instrumentalness NUMERIC,
    liveness NUMERIC,
    loudness NUMERIC,
    speechiness NUMERIC,
    tempo NUMERIC,
    valence NUMERIC,
    popularity INTEGER,
    key INTEGER,
    mode INTEGER
);

DROP TABLE IF EXISTS data_w_genres CASCADE;
CREATE TABLE data_w_genres (
    genres TEXT,
    artists TEXT,
    acousticness NUMERIC,
    danceability NUMERIC,
    duration_ms INTEGER,
    energy NUMERIC,
    instrumentalness NUMERIC,
    liveness NUMERIC,
    loudness NUMERIC,
    speechiness NUMERIC,
    tempo NUMERIC,
    valence NUMERIC,
    popularity INTEGER,
    key INTEGER,
    mode INTEGER,
    count INTEGER
);

DROP TABLE IF EXISTS data_by_year CASCADE;
CREATE TABLE data_by_year (
    mode INTEGER,
    year INTEGER,
    acousticness NUMERIC,
    danceability NUMERIC,
    duration_ms INTEGER,
    energy NUMERIC,
    instrumentalness NUMERIC,
    liveness NUMERIC,
    loudness NUMERIC,
    speechiness NUMERIC,
    tempo NUMERIC,
    valence NUMERIC,
    popularity NUMERIC,
    key INTEGER
);

DROP TABLE IF EXISTS data_by_genres CASCADE;
CREATE TABLE data_by_genres (
    mode INTEGER,
    genres TEXT,
    acousticness NUMERIC,
    danceability NUMERIC,
    duration_ms INTEGER,
    energy NUMERIC,
    instrumentalness NUMERIC,
    liveness NUMERIC,
    loudness NUMERIC,
    speechiness NUMERIC,
    tempo NUMERIC,
    valence NUMERIC,
    popularity NUMERIC,
    key INTEGER
);

DROP TABLE IF EXISTS data_by_artist CASCADE;
CREATE TABLE data_by_artist (
    mode INTEGER,
    count INTEGER,
    acousticness NUMERIC,
    artists TEXT,
    danceability NUMERIC,
    duration_ms INTEGER,
    energy NUMERIC,
    instrumentalness NUMERIC,
    liveness NUMERIC,
    loudness NUMERIC,
    speechiness NUMERIC,
    tempo NUMERIC,
    valence NUMERIC,
    popularity NUMERIC,
    key INTEGER
);

