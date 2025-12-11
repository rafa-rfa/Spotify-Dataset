-- Tabela normalizada de música 

CREATE TABLE tracks (
    track_id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    release_date DATE,
    year INT,
    explicit BOOLEAN,
    duration_ms INT,
    valence NUMERIC(10,4),
    acousticness NUMERIC(10,4),
    danceability NUMERIC(10,4),
    energy NUMERIC(10,4),
    instrumentalness NUMERIC(12,6),
    liveness NUMERIC(10,4),
    loudness NUMERIC(10,4),
    speechiness NUMERIC(10,4),
    tempo NUMERIC(10,4),
    popularity SMALLINT,
    key SMALLINT,
    mode SMALLINT
);