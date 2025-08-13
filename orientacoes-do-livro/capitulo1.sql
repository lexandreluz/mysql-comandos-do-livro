/*
O Capítulo 1 não contém exemplos de código SQL para manipulação de dados 
ou criação de objetos de banco de dados, mas sim comandos relacionados à 
instalação e acesso inicial ao MySQL. Os comandos SQL começam a ser detalhados 
a partir do Capítulo 2.
*/

/* Para instalação e configuração no Linux (Ubuntu): */

/* Atualizar o gerenciador de pacotes do Ubuntu */
-- $ sudo apt-get update
-- Propósito: Este comando sincroniza a lista de pacotes disponíveis com os repositórios.

/* Instalar o servidor MySQL */
-- $ sudo apt-get install mysql-server
-- Propósito: Baixar e instalar o servidor MySQL no Ubuntu.

/* Abrir o MySQL com usuário root */
-- $ sudo mysql -u root -p
-- Propósito: Inicia o cliente de linha de comando do MySQL e solicita a senha do root.

/* Para instalação e configuração no Mac-OS: */

/* Abrir o MySQL no Mac OS */
-- $ /usr/local/mysql/bin/mysql -u root -h localhost -p
-- Propósito: Acessa o terminal do MySQL especificando caminho do executável, usuário e host.  

/*
As fontes indicam que, a partir do ponto de instalação, os comandos para Windows, 
Linux e Mac OS serão os mesmos para interagir com o MySQL.
*/
