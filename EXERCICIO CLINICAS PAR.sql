use clinica;
----------------------------------------------
-- QUESTÂO 2
SELECT * 
FROM consultas
WHERE data >= '2006-06-14' and hora >= '12:00:00'
---------------------------------------------
-- QUESTÃO 4
SELECT hora
FROM consultas 
WHERE data <= '2006-06-14' and data >= '2006-06-20';
---------------------------------------------
-- QUESTÂO 6
SELECT DISTINCT cidade
FROM funcionarios;
---------------------------------------------
-- QUESTÂO 10
SELECT max(hora)
FROM consultas 
WHERE data = '2006-06-13';
---------------------------------------------
-- QUESTÂO 12
SELECT codf, nome, salario - (salario * 0.20)
FROM funcionarios;

---------------------------------------------
-- QUESTÂO 14
SELECT nome, CPF
FROM funcionarios
WHERE CPF not like '%00000%';
 ---------------------------------------------
 -- QUESTÃO 16
 SELECT codp, nome
 FROM pacientes
 WHERE idade >= '25' and doenca in ('tendinite','fratura','gripe','sarampo'); 