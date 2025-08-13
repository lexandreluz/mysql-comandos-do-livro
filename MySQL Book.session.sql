

/* Adicionar chave estrangeira de comvenda para comvende */
ALTER TABLE comvenda ADD CONSTRAINT fk_comprodu_comvende
FOREIGN KEY(n_numevende)
REFERENCES comvende(n_numevende)
ON DELETE NO ACTION
ON UPDATE NO ACTION;