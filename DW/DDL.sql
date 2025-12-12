-- DDL
CREATE TABLE dim_artista (
    sk_artista      INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_artista_oltp INTEGER,           -- opcional: mantém a referência do banco original
    nome_artista    VARCHAR(200) NOT NULL
);

CREATE TABLE dim_tempo (
    sk_tempo    INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    dia         INTEGER NOT NULL,
    mes         INTEGER NOT NULL,
    ano         INTEGER NOT NULL,
    data_completa DATE NOT NULL UNIQUE
);

CREATE TABLE fato_musica (
    sk_fato_musica  INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    sk_artista      INTEGER NOT NULL,
    sk_tempo        INTEGER NOT NULL,
    -- Atributos/fatos da música
    nome_musica     VARCHAR(300) NOT NULL,
    danceability    NUMERIC(5,3),
    liveness        NUMERIC(5,3),
    -- Foreign Keys
    FOREIGN KEY (sk_artista) REFERENCES dim_artista(sk_artista),
    FOREIGN KEY (sk_tempo)   REFERENCES dim_tempo(sk_tempo)
);