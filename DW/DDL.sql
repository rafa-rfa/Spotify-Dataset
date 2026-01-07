DROP TABLE IF EXISTS dim_artista CASCADE;
CREATE TABLE dim_artista (
    id_artista_oltp INTEGER PRIMARY KEY,
    nome_artista    TEXT
);

DROP TABLE IF EXISTS dim_musica CASCADE;
CREATE TABLE dim_musica (
    id_musica_oltp  TEXT PRIMARY KEY,
    nome_musica     VARCHAR(300) NOT NULL,
    explicita       BOOLEAN,
    duracao_ms      INTEGER,
    popularidade    INTEGER
);


DROP TABLE IF EXISTS dim_tempo CASCADE;
CREATE TABLE dim_tempo (
    sk_tempo serial primary key,
    dia           INTEGER,
    mes           INTEGER,
    ano           INTEGER,
    data_completa DATE
);

DROP TABLE IF EXISTS fato_analise_musical CASCADE;
CREATE TABLE fato_analise_musical (
    sk_musica      TEXT,
    sk_artista     INTEGER,
    sk_tempo       INTEGER,
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
    FOREIGN KEY (sk_musica)  REFERENCES dim_musica(id_musica_oltp),
    FOREIGN KEY (sk_artista) REFERENCES dim_artista(id_artista_oltp),
    FOREIGN KEY (sk_tempo)   REFERENCES dim_tempo(sk_tempo)
);