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

/* Utilizando JOINS */
SELECT c_codiclien, c_razaclien, c_codivenda Cod_Venda
FROM comvenda, comclien
WHERE comvenda.n_numeclien = comclien.n_numeclien
ORDER BY c_razaclien;

/* A mesma consulta de cima, só que mais complexa */
SELECT c_codiclien, c_razaclien, c_codivenda Cod_Venda
FROM comvenda
JOIN comclien ON comvenda.n_numeclien = comclien.n_numeclien
ORDER BY c_razaclien;

-- Criando Tabelas por meio de SELECT
-- Cria uma tabela de backup 'comclien_bkp' apenas com os clientes do estado de São Paulo (c_estaclien = 'SP')
CREATE TABLE comclien_bkp as(
    SELECT *
    FROM comclien
    WHERE c_estaclien = 'SP'
);

-- Inserindo registros por meio de SELECT
-- Antes, criando a tabela:
CREATE TABLE comcontato(
    n_numecontato INT NOT NULL AUTO_INCREMENT,
    c_nomecontato VARCHAR(200),
    c_fonecontato VARCHAR(30),
    c_cidacontato VARCHAR(200),
    c_estacontato VARCHAR(2),
    n_numeclien INT,
    PRIMARY KEY(n_numecontato)
);

SELECT * FROM comcontato; /* Verificando que a tabela está vazia */

-- Agora, populando as colunas da tabela 'comcontato' com as informações que temos na tabela 'comclien'
INSERT INTO comcontato(
SELECT n_numeclien,
c_nomeclien,
c_foneclien,
c_cidaclien,
c_estaclien,
n_numeclien
FROM comclien);

-- Alterando registros por meio de um SELECT
-- Alteração de registros na tabela comcontato com base em dados de outra tabela, a comclien_bkp
UPDATE comcontato SET c_cidacontato  =  'LONDRINA', c_estacontato = 'PR'
WHERE n_numeclien IN (
    SELECT n_numeclien 
    FROM comclien_bkp);

-- Deletando registros por meio de SELECT
-- Excluindo registros da tabela comcontato (contatos) que não estão relacionados a nenhuma venda na tabela comvenda.
DELETE FROM comcontato
WHERE n_numeclien NOT IN (
    SELECT n_numeclien
    FROM comvenda);