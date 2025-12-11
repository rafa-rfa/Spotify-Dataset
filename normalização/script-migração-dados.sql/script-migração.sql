INSERT INTO tracks (
    track_id,
    name,
    release_date,
    year,
    explicit,
    duration_ms,
    valence,
    acousticness,
    danceability,
    energy,
    instrumentalness,
    liveness,
    loudness,
    speechiness,
    tempo,
    popularity,
    key,
    mode
)
SELECT
    id,
    name,
    CASE
        WHEN release_date ~ '^\d{4}-\d{2}-\d{2}$' THEN release_date::DATE
        WHEN release_date ~ '^\d{4}$' THEN (release_date || '-01-01')::DATE
        ELSE NULL
    END AS release_date,
    year,
    (explicit = 1) AS explicit,
    duration_ms,
    valence,
    acousticness,
    danceability,
    energy,
    instrumentalness,
    liveness,
    loudness,
    speechiness,
    tempo,
    popularity,
    key,
    mode
FROM data;

--MIGRAÇÃO DOS ARTISTAS

WITH exploded AS (
    SELECT
        id AS track_id,
        trim(unnest(string_to_array(artists, ','))) AS artist_name
    FROM data
    WHERE artists IS NOT NULL AND artists <> ''
)
INSERT INTO artists (artist_name)
SELECT DISTINCT artist_name
FROM exploded
ON CONFLICT (artist_name) DO NOTHING;

WITH exploded AS (
    SELECT
        id AS track_id,
        trim(unnest(string_to_array(artists, ','))) AS artist_name
    FROM data
    WHERE artists IS NOT NULL AND artists <> ''
)
INSERT INTO track_artists (track_id, artist_id)
SELECT
    e.track_id,
    a.artist_id
FROM exploded e
JOIN artists a ON a.artist_name = e.artist_name
ON CONFLICT DO NOTHING;