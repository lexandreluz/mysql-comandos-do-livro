/*
Capítulo 3: Mão na massa - criando nossos códigos
Foco na criação, alteração e exclusão de tabelas, e na integridade do banco de dados através de chaves primárias e estrangeiras.
*/

/* === Criação de Tabelas (Seção 3.1) === */

/* Tabela de clientes */
CREATE TABLE comclien(
    n_numeclien INT NOT NULL AUTO_INCREMENT,
    c_codiclien VARCHAR(10),
    c_nomeclien VARCHAR(100),
    c_razaclien VARCHAR(100),
    d_dataclien DATE,
    c_cnpjclien VARCHAR(20),
    c_foneclien VARCHAR(20),
    PRIMARY KEY (n_numeclien)
);

/* Descrever a estrutura da tabela comclien */
DESC comclien;

/* Ajustar valor inicial do auto_increment da tabela comclien */
ALTER TABLE comclien AUTO_INCREMENT=100;

/* Tabela de fornecedores */
CREATE TABLE comforne(
    n_numeforne INT NOT NULL AUTO_INCREMENT,
    c_codiforne VARCHAR(10),
    c_nomeforne VARCHAR(100),
    c_razaforne VARCHAR(100),
    c_foneforne VARCHAR(20),
    PRIMARY KEY(n_numeforne)
);

/* Tabela de vendedores */
CREATE TABLE comvende(
    n_numevende INT NOT NULL AUTO_INCREMENT,
    c_codivende VARCHAR(10),
    c_nomevende VARCHAR(100),
    c_razavende VARCHAR(100),
    c_fonevende VARCHAR(20),
    n_porcvende FLOAT(10,2),
    PRIMARY KEY(n_numevende) -- corrigido, o original tinha n_numeforne por engano
);

/* Tabela de produtos */
CREATE TABLE comprodu(
    n_numeprodu INT NOT NULL AUTO_INCREMENT,
    c_codiprodu VARCHAR(20),
    c_descprodu VARCHAR(100),
    n_valoprodu FLOAT(10,2),
    c_situprodu VARCHAR(1),
    n_numeforne INT,
    PRIMARY KEY(n_numeprodu)
);

/* Tabela de vendas */
CREATE TABLE comvenda(
    n_numevenda INT NOT NULL AUTO_INCREMENT,
    c_codivenda VARCHAR(10),
    n_numeclien INT NOT NULL,
    n_numeforne INT NOT NULL,
    n_numevende INT NOT NULL,
    n_valovenda FLOAT(10,2),
    n_descvenda FLOAT(10,2),
    n_totavenda FLOAT(10,2),
    d_datavenda DATE,
    PRIMARY KEY(n_numevenda)
);

/* Tabela criada por engano, idêntica à comvenda */
CREATE TABLE comvendas(
    n_numevenda INT NOT NULL AUTO_INCREMENT,
    c_codivenda VARCHAR(10),
    n_numeclien INT NOT NULL,
    n_numeforne INT NOT NULL,
    n_numevende INT NOT NULL,
    n_valovenda FLOAT(10,2),
    n_descvenda FLOAT(10,2),
    n_totavenda FLOAT(10,2),
    d_datavenda DATE,
    PRIMARY KEY(n_numevenda)
);

/* Tabela de itens da venda */
CREATE TABLE comivenda(
    n_numeivenda INT NOT NULL AUTO_INCREMENT,
    n_numevenda INT NOT NULL,
    n_numeprodu INT NOT NULL,
    n_valoivenda FLOAT(10,2),
    n_qtdeivenda INT,
    n_descivenda FLOAT(10,2),
    PRIMARY KEY(n_numeivenda)
);

/* === Integridade do Banco de Dados (Seção 3.2) === */

/* Adicionar chave estrangeira de comvenda para comforne */
ALTER TABLE comvenda ADD CONSTRAINT fk_comprodu_comforne
FOREIGN KEY(n_numeforne)
REFERENCES comforne(n_numeforne)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

/* Adicionar chave estrangeira de comvenda para comvende */
ALTER TABLE comvenda ADD CONSTRAINT fk_comprodu_comvende
FOREIGN KEY(n_numevende)
REFERENCES comvende(n_numevende)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

/* Adicionar chave estrangeira de comvenda para comclien */
ALTER TABLE comvenda ADD CONSTRAINT fk_comvenda_comclien
FOREIGN KEY(n_numeclien)
REFERENCES comclien(n_numeclien)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

/* Adicionar chave estrangeira de comivenda para comprodu */
ALTER TABLE comivenda ADD CONSTRAINT fk_comivenda_comprodu
FOREIGN KEY(n_numeprodu)
REFERENCES comprodu(n_numeprodu)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

/* Adicionar chave estrangeira de comivenda para comvenda */
ALTER TABLE comivenda ADD CONSTRAINT fk_comivenda_comvenda
FOREIGN KEY(n_numevenda)
REFERENCES comvenda(n_numevenda)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

/* Excluir chave estrangeira específica de comivenda */
ALTER TABLE comivenda DROP FOREIGN KEY fk_comivenda_comprodu;

/* === Alterando Tabelas (Seção 3.3) === */

/* Adicionar coluna cidade na tabela comclien */
ALTER TABLE comclien ADD COLUMN c_cidaclien VARCHAR(50);

/* Adicionar coluna estado na tabela comclien (criada fora do padrão) */
ALTER TABLE comclien ADD COLUMN c_estclien VARCHAR(50);

/* Remover coluna incorreta */
ALTER TABLE comclien DROP COLUMN c_estclien;

/* Adicionar coluna de estado corrigida */
ALTER TABLE comclien ADD COLUMN c_estaclien VARCHAR(50);

/* Modificar tipo da coluna c_estaclien para int */
ALTER TABLE comclien MODIFY COLUMN c_estaclien INT;

/* Modificar novamente a coluna c_estaclien para varchar(100) */
ALTER TABLE comclien MODIFY COLUMN c_estaclien VARCHAR(100);

/* === Excluindo Tabelas (Seção 3.4) === */

/* Excluir tabela criada por engano */
DROP TABLE comvendas;
