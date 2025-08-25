/*
Capítulo 5: Temos registros: vamos consultar?
Ênfase na consulta de dados em tabelas, incluindo seleção, filtragem e ordenação de registros.
*/

/* Consultando dados em uma tabela, sintaxe básica*/
SELECT * FROM comclien;

/* Realizando consultas em colunas específicas */
SELECT n_numeclien, c_codiclien, c_razaclien
FROM comclien;

/* Realizando consultas em colunas específicas com ainda mais especificidades */
SELECT n_numeclien, c_codiclien, c_razaclien
FROM comclien
WHERE c_codiclien = '0001'; /* Clientes com código igual a 1 */

/* Realizando consultas em colunas específicas com ainda mais especificidades */
SELECT n_numeclien, c_codiclien, c_razaclien
FROM comclien
WHERE c_codiclien <> '0001'; /* Clientes com código diferente de 1 */

/* Realizando consultas em colunas específicas com ainda mais especificidades */
SELECT n_numeclien, c_codiclien, c_razaclien
FROM comclien
WHERE c_razaclien LIKE 'A%'; /* Clientes com razão social começando com 'A' */


/* Distinct()* | Consulta de todos os clientes que fizeram vendas */
SELECT n_numeclien from comvenda;

/* Distinct()* | Consulta de todos os clientes que fizeram vendas sem repetir o cliente */
SELECT DISTINCT n_numeclien
FROM comvenda;

/* Consulta para retornar simultaneamente os clientes que possuem n_numeclien igual a 1 e 2 */
SELECT c_codiclien, c_razaclien
FROM comclien
WHERE n_numeclien IN (1, 2);

/* Consulta para retornar simultaneamente os clientes que NÃO possuem n_numeclien igual a 1 e 2 */
SELECT c_codiclien, c_razaclien
FROM comclien
WHERE n_numeclien NOT IN (1, 2);

/* Realizando subconsultas para retornar razão social dos clientes que possuem registro na tabela comvenda*/
SELECT c_razaclien
FROM comclien
WHERE n_numeclien IN (
    SELECT n_numeclien
    FROM comvenda
    WHERE n_numeclien);

/* Realizando subconsultas para retornar razão social dos clientes que não possuem registro na tabela comvenda*/
SELECT c_razaclien
FROM comclien
WHERE n_numeclien NOT IN (
    SELECT n_numeclien
    FROM comvenda
    WHERE n_numeclien);

/* Consulta para retornar o código das vendas e a razção social dos respectivos clientes que as fizeram */
SELECT c_codivenda Cod_Venda,
(SELECT c_razaclien
FROM comclien
WHERE n_numeclien = comvenda.n_numeclien) Nome_Cliente 
FROM comvenda;

/* Criação de ALIAS (Apelidos das Tabelas) */
SELECT c_codiclien CODIGO, c_nomeclien Cliente
FROM comclien
WHERE n_numeclien NOT IN(1,2,3,4);

/* EXEMPLO DE COMO FICA A CONSULTA SEM ALIAS
Esta consulta seleciona o código da venda (c_codivenda) da tabela comvenda e, para cada venda, busca o nome/razão social do cliente (c_razaclien) correspondente na tabela comclien, utilizando o número do cliente (n_numeclien) como chave de ligação. */
SELECT c_codivenda,
(SELECT c_razaclien
FROM comclien
WHERE n_numeclien = comvenda.n_numeclien)
FROM comvenda;

/* Agora com ALIAS */
SELECT c_codivenda Cod_Venda,
(SELECT c_razaclien
FROM comclien
WHERE n_numeclien = comvenda.n_numeclien) Nome_Cliente
FROM comvenda;