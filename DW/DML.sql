INSERT INTO dim_artista (id_artista_oltp, nome_artista)
SELECT 
    artist_id,
    artist_name
FROM artists
ORDER BY artist_name
ON CONFLICT (nome_artista) DO NOTHING;


INSERT INTO dim_musica (id_musica_oltp, nome_musica, explicita, duracao_ms, popularidade)
SELECT 
    track_id,
    name,
    explicit,
    duration_ms,
    popularity
FROM tracks;


INSERT INTO dim_tempo (dia, mes, ano, data_completa)
SELECT
    EXTRACT(DAY FROM release_date)::int,
    EXTRACT(MONTH FROM release_date)::int,
    EXTRACT(YEAR FROM release_date)::int,
    release_date
FROM tracks
WHERE release_date IS NOT NULL
ON CONFLICT (data_completa) DO NOTHING;

INSERT INTO fato_analise_musical (
    sk_musica,
    sk_artista,
    sk_tempo,
    energy,
    danceability,
    liveness,
    valence,
    acousticness,
    instrumentalness,
    loudness,
    speechiness,
    tempo
)
SELECT
    dm.sk_musica,
    da.sk_artista,
    dt.sk_tempo,
    t.energy,
    t.danceability,
    t.liveness,
    t.valence,
    t.acousticness,
    t.instrumentalness,
    t.loudness,
    t.speechiness,
    t.tempo
FROM tracks t
JOIN dim_musica dm ON dm.id_musica_oltp = t.track_id
JOIN track_artists ta ON ta.track_id = t.track_id
JOIN dim_artista da ON da.id_artista_oltp = ta.artist_id
JOIN dim_tempo dt ON dt.data_completa = t.release_date;
