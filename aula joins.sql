SELECT count(*)
FROM movies; 
-- = 5

SELECT count(*)
FROM directors; 
-- = 5

-- Produto cartesiano (Cross Join)
SELECT * 
FROM movies as m, directors as d
WHERE d.id = m.director_id;

-- Junção natural
SELECT * 
FROM movies as m, directors as d
WHERE d.id = m.director_id
     AND m.director_id = 1;

-- Uso do JOIN e ON
SELECT *
FROM movies as m JOIN directors as d 
  ON d.id = m.director_id;
  
-- LEFT JOIN
SELECT *
FROM movies as m 
   LEFT JOIN directors as d ON d.id = m.director_id;
   
-- RIGHT JOIN
SELECT *
FROM movies as m 
   RIGHT JOIN directors as d ON d.id = m.director_id;