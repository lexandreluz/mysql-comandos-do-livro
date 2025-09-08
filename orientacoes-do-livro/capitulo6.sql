/*
Capítulo 6: Consultas com Funções
Foco no uso de funções agregadas e consultas avançadas de agrupamento no MySQL,
para análise de dados no projeto de vendas.
*/

/* FUNÇÕES DE AGREGAÇÃO */

/* Selecionar o código e a razão social de todos os clientes que possuem registros de vendas */
SELECT c_codiclien, c_razaclien
FROM comvenda, comclien
WHERE comvenda.n_numeclien = comclien.n_numeclien
ORDER BY c_razaclien;

/* Agora, vamos contar quantos clientes agrupando apenas um registro dos clientes com venda */

SELECT c_codiclien, c_razaclien
FROM comclien, comvenda    
WHERE comvenda.n_numeclien = comclien.n_numeclien
GROUP BY c_codiclien, c_razaclien
ORDER BY c_razaclien;

/* Contar a quantidade de vendas realizadas por cada cliente */
SELECT c_codiclien, c_razaclien, COUNT(n_numevenda) Quant
FROM comclien, comvenda
WHERE comvenda.n_numeclien = comclien.n_numeclien
GROUP BY c_codiclien, c_razaclien
ORDER BY c_razaclien;

/* O COUNT() pode ser usado apenas para contar a quantidade de registros em uma tabela */
SELECT COUNT(*) FROM comclien;


/* Contar clientes que tiveram mais de duas vendas */
SELECT c_razaclien, COUNT(n_numevenda)
FROM comclien, comvenda
WHERE comvenda.n_numeclien = comclien.n_numeclien
GROUP BY c_razaclien
HAVING COUNT(n_numevenda) > 2;

/* Usando o MAX() e MIN() para encontrar os valores máximo e mínimo de um campo */
SELECT MAX(n_totavenda) maior_venda
FROM comvenda;

SELECT MIN(n_totavenda) menor_venda
FROM comvenda;

SELECT MIN(n_totavenda) menor_venda, MAX(n_totavenda) maior_venda
FROM comvenda;

/* Usando SUM() para somar os valores indivuduais das colunas: n_valovenda, n_descvenda e n_totavenda no intervalo de 01/01/2015 a 31/01/2015 */
SELECT SUM(n_valovenda) valor_vendas, SUM(n_descvenda) descontos, SUM(n_totavenda) total_vendas
FROM comvenda
WHERE d_datavenda BETWEEN '2015-01-01' AND '2015-01-31';

/* Usando AVG() para calcular a média dos valores das vendas*/
SELECT FORMAT(AVG(n_totavenda), 2)
FROM comvenda;

/* FUNÇÕES DE STRING */
