-- VIEWS

-- TRACKS COM ARTISTAS

CREATE OR REPLACE VIEW vw_tracks_artists AS
SELECT
    t.track_id,
    t.name AS track_name,
    a.artist_name
FROM tracks t
JOIN track_artists ta ON ta.track_id = t.track_id
JOIN artists a ON a.artist_id = ta.artist_id;


-- METRICAS POR ARTISTA

CREATE OR REPLACE VIEW vw_metricas_por_artista AS
SELECT
    a.artist_id,
    a.artist_name,
    COUNT(t.track_id) AS total_tracks,
    AVG(t.popularity) AS popularidade_media
FROM artists a
LEFT JOIN track_artists ta ON ta.artist_id = a.artist_id
LEFT JOIN tracks t ON t.track_id = ta.track_id
GROUP BY a.artist_id, a.artist_name;


-- TRACKS MAIS POPULARES

CREATE OR REPLACE VIEW vw_top_tracks AS
SELECT
    track_id,
    name,
    popularity
FROM tracks
WHERE popularity >= 80;