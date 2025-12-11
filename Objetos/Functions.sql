-- FUNCTION

-- POPULARIDADE MEDIA POR ARTISTA

CREATE OR REPLACE FUNCTION fn_media_popularidade_artista(p_artist_id INT)
RETURNS NUMERIC AS $$
BEGIN
    RETURN (
        SELECT AVG(t.popularity)
        FROM tracks t
        JOIN track_artists ta ON ta.track_id = t.track_id
        WHERE ta.artist_id = p_artist_id
    );
END;
$$ LANGUAGE plpgsql;


-- TOTAL DE MUSICA POR ARTISTA

CREATE OR REPLACE FUNCTION fn_total_tracks_artista(p_artist_id INT)
RETURNS INT AS $$
BEGIN
    RETURN (
        SELECT COUNT(*)
        FROM track_artists
        WHERE artist_id = p_artist_id
    );
END;
$$ LANGUAGE plpgsql;


-- DURAÇAO MEDIA DE MUSICAS

CREATE OR REPLACE FUNCTION fn_duracao_media()
RETURNS NUMERIC AS $$
BEGIN
    RETURN (
        SELECT AVG(duration_ms)
        FROM tracks
    );
END;
$$ LANGUAGE plpgsql;
