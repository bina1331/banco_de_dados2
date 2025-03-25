
-- Liste todos os diretores e os filmes que eles dirigiram 
SELECT *
FROM directors as d  JOIN movies as m 
ON d.id = m.director_id;


-- Liste todos os filmes e seus tickets vendidos
SELECT *
FROM movies as m JOIN tickets as t
ON m.id = t.movie_id;

-- Liste todos os filmes, seus diretores e os tickets vendidos
SELECT *
FROM movies as m 
JOIN directors as d ON d.id = m.director_id
JOIN tickets as t ON m.id = t.movie_id;

-- Liste todos os diretores, incluindo aqueles que não dirigiram nenhum filme 
SELECT *
FROM movies as m 
   LEFT JOIN directors as d ON d.id = m.director_id;
   
-- Liste todos os filmes, incluindo aqueles que não têm um diretor associado
SELECT *
FROM movies as m 
   RIGHT JOIN directors as d ON d.id = m.director_id;
   
-- Liste todos os filmes que têm tickets e seus diretores, incluindo os filmes sem tickets
SELECT *
FROM movies as m
  LEFT JOIN tickets as t ON m.id = t.movie_id
    JOIN directors as d ON d.id = m.director_id;
   
-- Liste todos os filmes que têm tickets e seus diretores, incluindo os diretores sem filmes
SELECT *
FROM movies as m
    JOIN tickets as t ON m.id = t.movie_id
       LEFT JOIN directors as d ON d.id = m.director_id;
       
-- Liste todos os filmes que não têm tickets e seus diretores
SELECT *
FROM movies as m 
   JOIN tickets as t
       JOIN directors as d




