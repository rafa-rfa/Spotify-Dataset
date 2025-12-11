-- PROCEDURES

-- INSERIR ARTISTA COM SEGURANÇA

CREATE OR REPLACE PROCEDURE sp_insere_artista(p_nome TEXT)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO artists (artist_name)
    VALUES (lower(trim(p_nome)))
    ON CONFLICT DO NOTHING;
END;
$$;


-- ASSOCIAR ARTISTA A TRACK

CREATE OR REPLACE PROCEDURE sp_associa_artista_track(
    p_track_id TEXT,
    p_artist_name TEXT
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_artist_id INT;
BEGIN
    SELECT artist_id INTO v_artist_id
    FROM artists
    WHERE artist_name = lower(trim(p_artist_name));

    IF v_artist_id IS NULL THEN
        RAISE EXCEPTION 'Artista não encontrado';
    END IF;

    INSERT INTO track_artists (track_id, artist_id)
    VALUES (p_track_id, v_artist_id)
    ON CONFLICT DO NOTHING;
END;
$$;


-- ATUALIZAR A POPULARIDADE DE UMA TRACK

CREATE OR REPLACE PROCEDURE sp_atualiza_popularidade_int(
    p_track_id TEXT,
    p_popularity INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN
    CALL sp_atualiza_popularidade(p_track_id, p_popularity::smallint);
END;
$$;
