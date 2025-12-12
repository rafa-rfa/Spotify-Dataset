DROP TABLE IF EXISTS dim_artista CASCADE;
CREATE TABLE dim_artista (
    sk_artista      INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_artista_oltp INTEGER,
    nome_artista    VARCHAR(200) NOT NULL,
    UNIQUE (nome_artista)
);

DROP TABLE IF EXISTS dim_musica CASCADE;
CREATE TABLE dim_musica (
    sk_musica       INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_musica_oltp  TEXT,
    nome_musica     VARCHAR(300) NOT NULL,
    explicita       BOOLEAN,
    duracao_ms      INTEGER,
    popularidade    INTEGER
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
    sk_fato_musica INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    sk_musica      INTEGER NOT NULL,
    sk_artista     INTEGER NOT NULL,
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
    FOREIGN KEY (sk_musica)  REFERENCES dim_musica(sk_musica),
    FOREIGN KEY (sk_artista) REFERENCES dim_artista(sk_artista),
    FOREIGN KEY (sk_tempo)   REFERENCES dim_tempo(sk_tempo)
);
