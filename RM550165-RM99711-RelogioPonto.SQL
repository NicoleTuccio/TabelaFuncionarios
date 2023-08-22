CREATE TABLE tbl_departamentos(
    id_departamento INTEGER NOT NULL,
    nome VARCHAR(30)NOT NULL
);
ALTER TABLE tbl_departamentos ADD CONSTRAINT tbl_departamentos_PK PRIMARY KEY (id_departamento);



CREATE TABLE tbl_funcoes(
    id_funcao INTEGER NOT NULL,
    descricao VARCHAR(20) NOT NULL
);
ALTER TABLE tbl_funcoes ADD CONSTRAINT tbl_funcao_PK PRIMARY KEY (id_funcao);



CREATE TABLE tbl_tipo_relogio(
    id_tipo_relogio INTEGER NOT NULL,
    descricao VARCHAR(10) NOT NULL
);
ALTER TABLE tbl_tipo_relogio ADD CONSTRAINT tbl_tipo_relogio_PK PRIMARY KEY (id_tipo_relogio);



CREATE TABLE tbl_feriados(
    dt_feriado DATE NOT NULL,
    comemoracao VARCHAR(30) NOT NULL
);
ALTER TABLE tbl_feriados ADD CONSTRAINT tbl_feriados_PK PRIMARY KEY (dt_feriado);



CREATE TABLE tbl_motivo_folga(
    id_motivo_folga INTEGER NOT NULL,
    descricao VARCHAR(30) NOT NULL
);
ALTER TABLE tbl_motivo_folga ADD CONSTRAINT tbl_motivo_folga_PK PRIMARY KEY (id_motivo_folga);



CREATE TABLE tbl_funcionarios(
    id_funcionario INTEGER NOT NULL,
    nome VARCHAR (30) NOT NULL,
    endereco VARCHAR(50) NOT NULL,
    numero VARCHAR(30) NOT NULL,
    bairro VARCHAR(40) NOT NULL,
    complemento VARCHAR(30),
    cidade VARCHAR(30) NOT NULL,
    estado VARCHAR(2) NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    id_encarregado INTEGER NOT NULL,
    id_funcao INTEGER NOT NULL,
    id_departamento INTEGER NOT NULL,
    salario NUMBER(10,2) NOT NULL,
    numero_documento INTEGER
);
ALTER TABLE tbl_funcionarios ADD CONSTRAINT tbl_funcionarios_PK PRIMARY KEY (id_funcionario);

ALTER TABLE tbl_funcionarios ADD CONSTRAINT tbl_funcionarios_tbl_funcioanrios_FK FOREIGN KEY (id_encarregado) REFERENCES tbl_funcionarios(id_funcionario);
ALTER TABLE tbl_funcionarios ADD CONSTRAINT tbl_funcionarios_tbl_funcoes_FK FOREIGN KEY (id_funcao) REFERENCES tbl_funcoes(id_funcao);
ALTER TABLE tbl_funcionarios ADD CONSTRAINT tbl_funcionarios_tbl_departamento_FK FOREIGN KEY (id_departamento) REFERENCES tbl_departamentos(id_departamento);

SELECT * FROM tbl_funcionarios;

CREATE TABLE tbl_telefones(
    id_telefone INTEGER NOT NULL,
    numero_telefone VARCHAR(20) NOT NULL,
    observacao VARCHAR(30),
    id_funcionario INTEGER NOT NULL
);
ALTER TABLE tbl_telefones ADD CONSTRAINT tbl_telefones_PK PRIMARY KEY (id_telefone);
ALTER TABLE tbl_telefones ADD CONSTRAINT tbl_telefones_tbl_funcionarios_FK FOREIGN KEY (id_funcionario) REFERENCES tbl_funcionarios(id_funcionario);



CREATE TABLE tbl_folgas(
    id_folga INTEGER,
    data_saida DATE NOT NULL,
    data_retorno DATE NOT NULL,
    id_funcionario INTEGER NOT NULL,
    id_motivo_folga INTEGER NOT NULL,
    id_encarregado INTEGER NOT NULL,
    data_aprovacao DATE
);

ALTER TABLE tbl_folgas ADD CONSTRAINT tbl_folgas_tbl_motivo_folga_FK FOREIGN KEY (id_motivo_folga) REFERENCES tbl_motivo_folga(id_motivo_folga);
ALTER TABLE tbl_folgas ADD CONSTRAINT tbl_folgas_tbl_funcionarios_FK FOREIGN KEY (id_funcionario) REFERENCES tbl_funcionarios(id_funcionario);
ALTER TABLE tbl_folgas ADD CONSTRAINT tbl_folgas_tbl_funcionarios_FKv2 FOREIGN KEY (id_encarregado) REFERENCES tbl_funcionarios(id_funcionario);




CREATE TABLE tbl_relogios_pontos(
    id_relogio INTEGER NOT NULL,
    descricao VARCHAR(30)NOT NULL,
    id_tipo_relogio INTEGER NOT NULL
);
ALTER TABLE tbl_relogios_pontos ADD CONSTRAINT tbl_relogios_pontos_PK PRIMARY KEY(id_relogio);
ALTER TABLE tbl_relogios_pontos ADD CONSTRAINT tbl_relogios_pontos_tbl_tipo_relogio_FK FOREIGN KEY (id_tipo_relogio) REFERENCES tbl_tipo_relogio(id_tipo_relogio);



CREATE TABLE tbl_registro_ponto(
    id_registro_ponto INTEGER NOT NULL,
    data_registro DATE NOT NULL,
    id_funcionario INTEGER NOT NULL,
    id_relogio INTEGER NOT NULL,
    dt_feriado DATE NOT NULL
);
ALTER TABLE tbl_registro_ponto ADD CONSTRAINT tbl_registro_ponto_PK PRIMARY KEY (id_registro_ponto);

ALTER TABLE tbl_registro_ponto ADD CONSTRAINT tbl_registro_ponto_tbl_funcionarios_FK FOREIGN KEY (id_funcionario) REFERENCES tbl_funcionarios(id_funcionario);
ALTER TABLE tbl_registro_ponto ADD CONSTRAINT tbl_registro_ponto_tbl_relogios_pontos_FK FOREIGN KEY (id_relogio) REFERENCES tbl_relogios_pontos(id_relogio);
ALTER TABLE tbl_registro_ponto ADD CONSTRAINT tbl_registro_ponto_tbl_feriados_FK FOREIGN KEY (dt_feriado) REFERENCES tbl_feriados(dt_feriado);



INSERT ALL
    INTO tbl_departamentos VALUES (1, 'Recursos Humanos')
    INTO tbl_departamentos VALUES (2, 'Financeiro')
    INTO tbl_departamentos VALUES (3, 'Vendas')
    INTO tbl_departamentos VALUES (4, 'Marketing')
    INTO tbl_departamentos VALUES (5, 'Tecnologia')
SELECT 1 FROM DUAL;
SELECT * FROM tbl_departamentos;



INSERT ALL
    INTO tbl_funcoes VALUES (1, 'Gerente')
    INTO tbl_funcoes VALUES (2, 'Analista')
    INTO tbl_funcoes VALUES (3, 'Coordenador')
    INTO tbl_funcoes VALUES (4, 'Desenvolvedor')
    INTO tbl_funcoes VALUES (5, 'Vendedor')
    INTO tbl_funcoes VALUES (6, 'Designer')
SELECT 1 FROM DUAL;
SELECT * FROM tbl_funcoes;


INSERT ALL
    INTO tbl_tipo_relogio VALUES (1, 'Anal�gico') 
    INTO tbl_tipo_relogio VALUES (2, 'Digital') 
    INTO tbl_tipo_relogio VALUES (3, 'Smartwatch') 
SELECT 1 FROM DUAL;
SELECT * FROM tbl_tipo_relogio;
    
    
INSERT ALL
    INTO tbl_feriados VALUES (DATE '2023-09-07', 'Independ�ncia do Brasil') 
    INTO tbl_feriados VALUES (DATE '2023-11-02', 'Dia dos Finados') 
    INTO tbl_feriados VALUES (DATE '2023-12-25', 'Natal') 
SELECT 1 FROM DUAL;
SELECT * FROM tbl_feriados;


INSERT ALL
    INTO tbl_motivo_folga VALUES (1, 'Feriado') 
    INTO tbl_motivo_folga VALUES (2,'F�rias') 
    INTO tbl_motivo_folga VALUES (3,'Licen�a M�dica') 
    INTO tbl_motivo_folga VALUES (4,'Licen�a Parental')
    INTO tbl_motivo_folga VALUES (5,'Luto')
SELECT 1 FROM DUAL;
SELECT * FROM tbl_motivo_folga;
    

INSERT ALL
    INTO tbl_funcionarios VALUES (1, 'Pedro Oliveira', 'Rua dos Pinheiros','789','Pinheiros', NULL, 'S�o Paulo', 'SP', '11 7654-3210', 1, 1, 2, 12000, 85314731545)
    INTO tbl_funcionarios VALUES (2, 'Maria Santos', 'Avenida das Palmeiras','456','Jardins', NULL, 'Rio de Janeiro', 'RJ', '21 9876-5432', 1, 3, 5, 8000, 23556953814)
    INTO tbl_funcionarios VALUES (3, 'Jo�o Silva', 'Rua das Flores','123','Centro','Apt. 4A', 'S�o Paulo', 'SP', '11 1234-5678', 2, 4, 5, 5000, 46137241041)
    INTO tbl_funcionarios VALUES (4, 'Ana Pereira', 'Pra�a da Liberdade','101', 'Liberdade', NULL, 'Belo Horizonte', 'MG', '31 2345-6789', 2, 4, 3, 3500, 03809460095)
SELECT 1 FROM DUAL;
SELECT * FROM tbl_funcionarios;


INSERT ALL
    INTO tbl_telefones VALUES (1, '11 7654-3210', 'Celular', 1)
    INTO tbl_telefones VALUES (2, '21 9876-5432', 'Residencial', 2)
    INTO tbl_telefones VALUES (3, '11 91234-5678', 'Principal', 3)
SELECT 1 FROM DUAL;
SELECT * FROM tbl_telefones;


INSERT ALL
    INTO tbl_folgas VALUES(1, DATE'2023-08-05', DATE '2023-08-10', 1, 2, 1, DATE '2023-07-20')
    INTO tbl_folgas VALUES(1, DATE'2023-09-07', DATE '2023-09-11', 2, 1, 1, DATE '2023-08-11')
    INTO tbl_folgas VALUES(1, DATE'2023-10-20', DATE '2023-10-23', 3, 3, 2, DATE '2023-08-21')
SELECT 1 FROM DUAL;
SELECT * FROM tbl_folgas;   


INSERT ALL
    INTO tbl_relogios_pontos VALUES (1, 'Rel�gio de Entrada', 2)
    INTO tbl_relogios_pontos VALUES (2, 'Rel�gio de Sa�da', 2)
    INTO tbl_relogios_pontos VALUES (3, 'Rel�gio de Ponto', 1)
SELECT 1 FROM DUAL;
SELECT * FROM tbl_relogios_pontos;   


INSERT ALL 
    INTO tbl_registro_ponto VALUES (1, DATE '2023-11-02', 1, 1, DATE '2023-11-02')
    INTO tbl_registro_ponto VALUES (2, DATE '2023-11-02', 1, 2, DATE '2023-11-02')
    INTO tbl_registro_ponto VALUES (3, DATE '2023-11-02', 1, 3, DATE '2023-11-02')
SELECT 1 FROM DUAL;
SELECT * FROM tbl_registro_ponto;  

DROP TABLE tbl_registro_ponto;
DROP TABLE tbl_relogios_pontos;
DROP TABLE tbl_folgas;
DROP TABLE tbl_telefones;
DROP TABLE tbl_funcionarios;
DROP TABLE tbl_motivo_folga;
DROP TABLE tbl_feriados;
DROP TABLE tbl_tipo_relogio;
DROP TABLE tbl_funcoes;
DROP TABLE tbl_departamentos;
