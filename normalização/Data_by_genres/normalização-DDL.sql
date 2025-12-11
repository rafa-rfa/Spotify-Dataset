/*Tabela de gênero sem contar todos os dados que se repetiam e
geravam redundância*/

CREATE TABLE genres (
    genre_id SERIAL PRIMARY KEY,
    genre_name TEXT UNIQUE NOT NULL
);


