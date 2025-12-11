/* Agora temos uma tabela contendo só os dados essenciais 
com chave composta que relaciona música e gênero */

CREATE TABLE track_genres (
    track_id TEXT REFERENCES tracks(track_id),
    genre_id INT REFERENCES genres(genre_id),
    PRIMARY KEY(track_id, genre_id)
);


-- Tabela que relaciona gênero e artista

CREATE TABLE track_artists (
    track_id TEXT REFERENCES tracks(track_id),
    artist_id INT REFERENCES artists(artist_id),
    PRIMARY KEY(track_id, artist_id)
);
