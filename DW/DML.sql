-- DML

INSERT INTO dim_artista (id_artista_oltp, nome_artista)
VALUES
(1001, 'Coldplay'),
(1002, 'Adele'),
(1003, 'Drake');

INSERT INTO dim_tempo (dia, mes, ano, data_completa)
VALUES
(21, 11, 2020, '2020-11-21'),
(12, 05, 2019, '2019-05-12'),
(03, 08, 2018, '2018-08-03');

INSERT INTO fato_musica (sk_artista, sk_tempo, nome_musica, danceability, liveness)
VALUES
(1, 1, 'Adventure of a Lifetime', 0.65, 0.35),
(1, 2, 'Hymn for the Weekend', 0.70, 0.40),
(2, 2, 'Hello', 0.25, 0.12),
(3, 3, 'God''s Plan', 0.85, 0.55);
