/*
Capítulo 2: Iniciando o projeto
Foco na criação e manipulação inicial de um banco de dados e usuários no MySQL para o projeto de vendas.
*/

/* === Criação e Manipulação de Usuários (Seção 2.2) === */

/* Criar um novo usuário 'usermysql' com senha 'cursomysql', acesso de qualquer host */
CREATE USER 'usermysql'@'%' IDENTIFIED BY 'cursomysql';

/* Conceder todos os privilégios ao usuário 'usermysql' em todos os bancos e tabelas, com opção de conceder privilégios a outros */
GRANT ALL PRIVILEGES ON *.* TO 'usermysql'@'%' WITH GRANT OPTION;

/* Revogar todos os privilégios do usuário 'usermysql' em todos os bancos e tabelas */
REVOKE ALL ON *.* FROM 'usermysql'@'%';

/* Conceder todos os privilégios globais ao usuário 'usermysql' conectando-se via localhost */
GRANT ALL ON *.* TO 'usermysql'@'localhost';

/* Revogar todos os privilégios globais do usuário 'usermysql' */
REVOKE ALL ON *.* FROM 'usermysql'@'localhost';

/* Conceder todos os privilégios do banco 'comercial' para o usuário 'usermysql' conectado via localhost */
GRANT ALL ON comercial.* TO 'usermysql'@'localhost';

/* Revogar todos os privilégios do usuário no banco 'comercial' */
REVOKE ALL ON comercial.* FROM 'usermysql'@'localhost';

/* Conceder todos os privilégios de uma tabela específica 'nome_tabela' no banco 'comercial' */
GRANT ALL ON comercial.nome_tabela TO 'usermysql'@'localhost';

/* Revogar todos os privilégios de uma tabela específica 'nome_tabela' no banco 'comercial' */
REVOKE ALL ON comercial.nome_tabela FROM 'usermysql'@'localhost';

/* Conceder privilégios específicos (SELECT, INSERT, UPDATE) em uma coluna específica de uma tabela */
GRANT SELECT(nomecoluna1), INSERT(nomecoluna1), UPDATE(nomecoluna1)
ON comercial.nome_tabela TO 'usermysql'@'localhost' IDENTIFIED BY 'senha';

/* Conceder privilégios de rotina (stored procedures e functions) no banco 'comercial' */
GRANT ROUTINE ON comercial.* TO 'usermysql'@'localhost';

/* Conceder permissão de execução de uma procedure específica */
GRANT EXECUTE ON PROCEDURE comercial.nomeprocedure TO 'usermysql'@'localhost';

/* Permitir que um usuário externo atue como proxy para 'usermysql' */
GRANT PROXY ON 'usermysql'@'localhost' TO 'usuarioexterno'@'hostexterno';

/* Comando de conexão via linha de comando do Windows (não SQL) */
-- c:\mysql --user=root -psenha

/* === Criação do Banco de Dados (Seção 2.3) === */

/* Criar o banco de dados 'comercial' */
CREATE DATABASE comercial;

/* Listar todos os bancos de dados existentes no servidor */
SHOW DATABASES;

/* Selecionar e usar o banco de dados 'comercial' */
USE comercial;
