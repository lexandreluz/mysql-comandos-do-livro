/*
Capítulo 4: Manipulando registros
Foco na manipulação de dados em tabelas, incluindo inserção, atualização e exclusão de registros.
*/

/* Inserindo dados na Tabela de clientes */
INSERT INTO comclien (
    n_numeclien, 
    c_codiclien, 
    c_nomeclien, 
    c_razaclien, 
    d_dataclien, 
    c_cnpjclien, 
    c_foneclien, 
    c_cidaclien, 
    c_estaclien)
VALUES (
    1, 
    '0001', 
    'AARONSON', 
    'AARONSON FURNITURE LTDA', 
    '2015-02-17', 
    '17.807.928/001-85', 
    '(21) 8167-6584)', 
    'QUEIMADOS', 
    'RJ');

/* Inserindo dados na Tabela de clientes com os campos omitidos*/
INSERT INTO comclien 
VALUES (
    1, 
    '0001', 
    'AARONSON', 
    'AARONSON FURNITURE LTDA', 
    '2015-02-17', 
    '17.807.928/001-85', 
    '(21) 8167-6584)', 
    'QUEIMADOS', 
    'RJ');

/* Alterando um registro inserido equivocadamente*/
UPDATE comclien
SET c_nomeclien =  'AARONSON FURNITURE'
WHERE n_numeclien = 1;

commit;

/* Atualizando mais de um campo por vez */
UPDATE comclien 
SET c_nomeclien = 'AARONSON FURNITURE', 
    c_cidaclien = 'LONDRINA',
    c_estaclien = 'PR'
WHERE n_numeclien = 1;

/* Apagando um resgistro da tabela */
DELETE FROM comclien
WHERE n_numeclien = 1;

/* Apagando todos os registros da tabela */
DELETE FROM comclien;

/* Deleção de dados permanentemente */
TRUNCATE TABLE comclien;