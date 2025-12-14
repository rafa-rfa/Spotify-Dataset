/* ATENÇÃO: PARA NÃO CONFUNDIR, COLOQUEI AQUI O MESMO SCRIPT DO VÍDEO. 
ANTERIORMENTE, TINHA UMA DIFERENÇA DE QUE AQUI NO DW CADA DIMENSÃO TERIA
UMA SEGUNDA CHAVE QUE É PARA CONTROLE INTERNO DO PRÓPRIO DW E NÃO DEPENDÊNCIA
DA CHAVE DO BANCO RELACIONAL BASE. essa chave não é obrigatória, então só
tirei ela.
*/

/* Criar o banco com esse script abaixo >> conectar o banco ao 
pentaho/apachehop e utilizar o ETL já pronto da pasta ETL. as tabelas 
serão preenchidas automaticamente. tem que lembrar de conectar tbm o banco 
relacional base
*/

DROP TABLE IF EXISTS dim_artista CASCADE;
CREATE TABLE dim_artista (
    id_artista_oltp INTEGER PRIMARY KEY,
    nome_artista    TEXT NOT NULL,
    UNIQUE (nome_artista)
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
	sk_tempo serial PRIMARY KEY,
    dia           INTEGER,
    mes           INTEGER,
    ano           INTEGER,
    data_completa DATE
);

DROP TABLE IF EXISTS fato_analise_musical CASCADE;
CREATE TABLE fato_analise_musical (
    sk_musica      TEXT NOT NULL,
    sk_artista     INTEGER NOT NULL,
    sk_tempo       SERIAL NOT NULL,
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
    FOREIGN KEY (sk_artista) REFERENCES dim_artista(sk_artista),
    FOREIGN KEY (sk_tempo)   REFERENCES dim_tempo(sk_tempo)
);
