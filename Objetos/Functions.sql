-- TRIGGER

-- NORMALIZAR NOME ARTISTA

CREATE OR REPLACE FUNCTION fn_trg_normaliza_artista()
RETURNS TRIGGER AS $$
BEGIN
    NEW.artist_name := lower(trim(NEW.artist_name));
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tg_normaliza_artista
BEFORE INSERT OR UPDATE ON artists
FOR EACH ROW
EXECUTE FUNCTION fn_trg_normaliza_artista();


-- IMPEDIR POPULARIDADE INVALIDA

CREATE OR REPLACE FUNCTION fn_trg_valida_popularidade()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.popularity < 0 OR NEW.popularity > 100 THEN
        RAISE EXCEPTION 'Popularidade inválida: %', NEW.popularity;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tg_valida_popularidade
BEFORE INSERT OR UPDATE ON tracks
FOR EACH ROW
EXECUTE FUNCTION fn_trg_valida_popularidade();


-- IMPEDIR TRACK SEM NOME

CREATE OR REPLACE FUNCTION fn_trg_nome_track_obrigatorio()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.name IS NULL OR trim(NEW.name) = '' THEN
        RAISE EXCEPTION 'Track sem nome não é permitida';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tg_nome_track_obrigatorio
BEFORE INSERT OR UPDATE ON tracks
FOR EACH ROW
EXECUTE FUNCTION fn_trg_nome_track_obrigatorio();