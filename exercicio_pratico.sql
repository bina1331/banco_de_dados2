use loja;

-- Questões 

--  Contar o número total de clientes
SELECT count(*) AS Total_Clientes
FROM clientes;

-- Contar o número total de pedidos
SELECT count(*) AS Total_Pedidos
FROM pedidos;

--  Calcular o valor total de todos os pedidos
SELECT sum(pe.quantidade * pr.preco) AS Valor_Total_Pedidos
FROM pedidos as pe JOIN produtos as pr ON pr.id = pe.produto_id;

--  Calcular a média de preço dos produtos
SELECT avg(pr.preco) AS Media_Precos
FROM produtos as pr;

--  Listar todos os clientes e seus pedidos
SELECT *
FROM clientes as c JOIN pedidos as p ON c.id = p.cliente_id;

--  Listar todos os pedidos e seus produtos, incluindo pedidos sem produtos
SELECT *
FROM pedidos as pe LEFT JOIN produtos as pr ON pr.id = pe.produto_id;

--  Listar os produtos mais caros primeiro
SELECT * 
FROM produtos as pr
ORDER BY pr.preco DESC;

--  Listar os produtos com menor estoque
SELECT *
FROM produtos as pr
ORDER BY pr.estoque ASC;

--  Contar quantos pedidos foram feitos por cliente
SELECT c.nome AS Nome_Clientes, count(p.id) AS Pedidos_Clientes
FROM pedidos AS p JOIN clientes AS c ON c.id = p.cliente_id
GROUP BY c.nome;

--  Contar quantos produtos diferentes foram vendidos
SELECT pr.nome AS Nome_Produtos, count(DISTINCT pe.produto_id) AS Produtos_Diferentes_Vendidos
FROM pedidos AS pe JOIN produtos AS pr on pr.id = pe.produto_id
GROUP BY pr.nome;

--  Mostrar os clientes que não realizaram pedidos
SELECT *
FROM clientes AS c LEFT JOIN pedidos as p ON c.id = p.cliente_id
WHERE p.cliente_id IS NULL;

--  Mostrar os produtos que nunca foram vendidos
SELECT *
FROM produtos as pr LEFT JOIN pedidos as pe ON pr.id = pe.produto_id
WHERE pe.produto_id IS NULL;

--  Contar o número de pedidos feitos por dia
SELECT pr.nome AS Nome_Produto, count(pe.id) AS Pedidos_Por_Dia, pe.data_pedido AS Data_Pedido
FROM produtos AS pr JOIN pedidos AS pe ON pr.id = pe.produto_id
GROUP BY pr.nome, pe.data_pedido;

--  Listar os produtos mais vendidos
SELECT pr.nome AS Nome_Produto, count(pe.produto_id) AS Produtos_Mais_Vendidos
FROM produtos as pr JOIN pedidos as pe ON pr.id = pe.produto_id
GROUP BY pr.nome
ORDER BY Produtos_Mais_Vendidos;

--  Encontrar o cliente que mais fez pedidos
 SELECT c.nome AS Nome_Cliente, COUNT(p.id) AS Total_Pedidos
FROM clientes AS c JOIN pedidos AS p ON c.id = p.cliente_id
GROUP BY c.nome
ORDER BY Total_Pedidos DESC
LIMIT 1;


--  Listar os pedidos e os clientes que os fizeram, incluindo pedidos sem clientes
SELECT *
FROM clientes AS c RIGHT JOIN pedidos AS pe ON c.id = pe.cliente_id;

--  Listar os produtos e o total de vendas por produto
SELECT pr.nome AS Nome_Produto, SUM(pe.quantidade) AS Total_Vendas
FROM produtos AS pr JOIN pedidos AS pe ON pr.id = pe.produto_id
GROUP BY pr.nome
ORDER BY Total_Vendas DESC;

--  Calcular a média de quantidade de produtos por pedido
SELECT pr.nome AS Nome_Produtos, avg(pe.quantidade) AS Media_QTD_Pedidos
FROM produtos AS pr JOIN pedidos AS pe  ON pr.id = pe.produto_id
GROUP BY pr.nome
ORDER BY Media_QTD_Pedidos;

--  Listar os pedidos ordenados por data (mais recentes primeiro)
SELECT pr.nome AS Nome_Pedido,data_pedido AS Data_Venda
FROM pedidos AS pe JOIN produtos as pr ON pr.id = pe.produto_id
ORDER BY Data_Venda Desc;

--  Contar quantos clientes possuem telefone cadastrado
SELECT count(*)
FROM clientes AS c
WHERE c.telefone IS NOT NULL;

--  Encontrar o cliente que gastou mais dinheiro em pedidos.
SELECT c.nome AS Nome_Cliente, sum(pe.quantidade * pr.preco) AS Total_Gasto
FROM clientes AS c 
   JOIN pedidos AS pe ON c.id = pe.cliente_id
   JOIN produtos AS pr ON pr.id = pe.produto_id
   GROUP BY c.nome
   ORDER BY Total_Gasto DESC
   LIMIT 1;

-- Listar os 5 produtos mais vendidos.
SELECT pr.nome AS Nome_Produto, sum(pe.quantidade) AS Mais_Vendidos
FROM produtos AS pr JOIN pedidos AS pe ON pr.id = pe.produto_id
GROUP BY pr.nome
ORDER BY Mais_Vendidos DESC
 LIMIT 5;

-- Listar os clientes que já fizeram pedidos e o número de pedidos de cada um.
SELECT c.nome AS Nome_Cliente, sum(pe.id) AS Numero_Pedidos
FROM clientes as c JOIN pedidos AS pe ON c.id = pe.cliente_id
GROUP BY c.nome
ORDER BY Numero_pedidos DESC;

-- Encontrar a data com mais pedidos realizados
SELECT p.data_pedido AS Data_Com_Mais_Pedidos, COUNT(p.id) AS Total_Pedidos
FROM pedidos AS p
GROUP BY p.data_pedido
ORDER BY Total_Pedidos DESC
LIMIT 1;


-- Calcular a média de valor gasto por pedido
SELECT avg(pr.preco * pe.quantidade) AS Media_Valor_Pedidos
FROM produtos AS pr JOIN pedidos AS pe ON pr.id = pe.produto_id;

