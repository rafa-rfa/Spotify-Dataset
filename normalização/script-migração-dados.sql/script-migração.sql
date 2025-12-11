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



Preenchimento da tabela genres:

WITH exploded AS (
    SELECT trim(unnest(string_to_array(genres, ','))) AS genre_name
    FROM data_w_genres
    WHERE genres IS NOT NULL AND genres <> ''
)
INSERT INTO genres (genre_name)
SELECT DISTINCT genre_name
FROM exploded
ON CONFLICT (genre_name) DO NOTHING;


WITH cleaned AS (
    SELECT
        d.id AS track_id,
        regexp_replace(wg.genres, '[''\\[\\]\\'']', '', 'g') AS clean_genres
    FROM data_w_genres wg
    JOIN data d
        ON wg.artists = d.artists
       AND wg.acousticness = d.acousticness
       AND wg.danceability = d.danceability
       AND wg.energy = d.energy
       AND wg.instrumentalness = d.instrumentalness
       AND wg.liveness = d.liveness
       AND wg.valence = d.valence
       AND wg.duration_ms = d.duration_ms
    WHERE wg.genres IS NOT NULL AND wg.genres <> ''
),
exploded AS (
    SELECT
        track_id,
        trim(unnest(string_to_array(clean_genres, ','))) AS genre_name
    FROM cleaned
)
INSERT INTO track_genres (track_id, genre_id)
SELECT
    e.track_id,
    g.genre_id
FROM exploded e
JOIN genres g ON g.genre_name = e.genre_name
WHERE e.genre_name <> ''
ON CONFLICT DO NOTHING;