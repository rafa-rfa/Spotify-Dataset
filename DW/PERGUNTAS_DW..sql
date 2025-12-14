1ª pergunta: Qual é o Top 10 artistas com a maior discografia?

select count(track_id), artist_name from track_artists
JOIN artists on artists.artist_id = track_artists.artist_id
group by artist_name order by count(track_id) desc;


2ª pergunta:

Ano com maior quantidade de músicas lançadas e maior valor de danceabilidade agregado (Mais dançante)

select 
count(name) as Total_musicas, 
extract(year from release_date) as Ano, 
sum(danceability) as danciabilidade
from tracks
group by Ano
order by Total_musicas desc


3ª Pergunta:

Top 10 artistas mais populares na história da música medido pela 
maior quantidade de público nos show "liveness" de suas músicas

select 
count(track_artists.track_id) as Quantidade_musica, 
artist_name,
sum(liveness) as medida_popularidade
from track_artists
JOIN artists 
	on artists.artist_id = track_artists.artist_id
JOIN tracks on tracks.track_id = track_artists.track_id
group by artist_name 
order by medida_popularidade desc;

4ª pergunta 

-- A música com maior energia e intensidade por ano 

WITH RankedTracks AS (
    -- Seleciona as colunas relevantes da tabela 'tracks'
    SELECT
        year,             -- Ano de lançamento da música
        name AS nome_musica, -- Nome da música
        energy,           -- Valor de energia (0.0 a 1.0)
        -- Classifica as músicas dentro de cada 'year' pelo valor de 'energy' em ordem decrescente
        ROW_NUMBER() OVER (
            PARTITION BY year 
            ORDER BY energy DESC
        ) AS posicao_ranking
    FROM 
        tracks
    -- Filtra anos válidos (ignora NULL ou anos muito antigos/futuros se necessário, 
    -- mas aqui assumimos que 'year' já está limpo o suficiente)
    WHERE 
        year IS NOT NULL 
)
-- Seleciona apenas a primeira música de cada ano (a de maior energia)
SELECT
    year,
    nome_musica,
    energy
FROM
    RankedTracks
WHERE
    posicao_ranking = 1
ORDER BY 
    year DESC;

