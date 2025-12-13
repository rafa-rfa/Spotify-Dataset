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

SELECT ano, nome_musica, energy
FROM (
    SELECT 
        dt.ano,
        dm.nome_musica,
        fm.energy,
        ROW_NUMBER() OVER (PARTITION BY dt.ano ORDER BY fm.energy DESC) AS posicao
    FROM fato_musica fm
    JOIN dim_musica dm ON dm.sk_musica = fm.sk_musica
    JOIN dim_tempo dt ON dt.sk_tempo = fm.sk_tempo
) AS ranking
WHERE posicao = 1
ORDER BY ano DESC;


