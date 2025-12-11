-- Criação da nova tabela de dados por artista

CREATE TABLE artists (
    artist_id SERIAL PRIMARY KEY,
    artist_name TEXT UNIQUE NOT NULL
);

