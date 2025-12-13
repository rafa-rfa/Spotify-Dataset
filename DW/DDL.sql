DROP TABLE IF EXISTS dim_musica CASCADE;
CREATE TABLE dim_musica (
    id_musica_oltp  INTEGER primary key,
    nome_musica     VARCHAR(300) NOT NULL,
    explicita       BOOLEAN,
    duracao_ms      INTEGER,
    popularidade    INTEGER
);

DROP TABLE IF EXISTS dim_artista CASCADE;
CREATE TABLE dim_artista (
    id_artista_oltp INTEGER PRIMARY KEY,
    nome_artista    VARCHAR(200) NOT NULL,
);

DROP TABLE IF EXISTS dim_tempo CASCADE;
CREATE TABLE dim_tempo (
    sk_tempo      INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    dia           INTEGER NOT NULL,
    mes           INTEGER NOT NULL,
    ano           INTEGER NOT NULL,
    data_completa DATE NOT NULL UNIQUE
);


DROP TABLE IF EXISTS fato_analise_musical CASCADE;
CREATE TABLE fato_analise_musical (
    id_musica_oltp  INTEGER NOT NULL,
    id_artista_oltp INTEGER NOT NULL,
    sk_tempo       INTEGER NOT NULL,
    -- Fatos medidos
    energy         NUMERIC(6,4),
    danceability   NUMERIC(6,4),
    liveness       NUMERIC(6,4),
    valence        NUMERIC(6,4),
    acousticness   NUMERIC(6,4),
    instrumentalness NUMERIC(6,4),
    loudness       NUMERIC(6,4),
    speechiness    NUMERIC(6,4),
    tempo          NUMERIC(8,3),
    -- Foreign Keys
    FOREIGN KEY (id_musica_oltp)  REFERENCES dim_musica(id_musica_oltp),
    FOREIGN KEY (id_artista_oltp) REFERENCES dim_artista(id_artista_oltp),
    FOREIGN KEY (sk_tempo)   REFERENCES dim_tempo(sk_tempo)
);