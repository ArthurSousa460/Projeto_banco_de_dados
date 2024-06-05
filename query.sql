CREATE DATABASE recursos_humanos;
USE recursos_humanos;

CREATE TABLE departamento(
	cod_departamento INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(50)
);

CREATE TABLE empregado(
	cod_empregado INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	cod_departamento INT,
    nome VARCHAR(50),
    salario DECIMAL(10,2),
    rua VARCHAR(30),
    numero 	VARCHAR(5),
    complemento VARCHAR(30),
    CONSTRAINT FOREIGN KEY (cod_departamento) REFERENCES departamento(cod_departamento)
    );

CREATE TABLE projeto(
    cod_projeto INT PRIMARY KEY AUTO_INCREMENT,
    nome  VARCHAR(50)
);


CREATE TABLE telefone(
    cod_empregado INT,
    telefone VARCHAR(15) PRIMARY KEY NOT NULL UNIQUE,
    CONSTRAINT FOREIGN KEY(cod_empregado) REFERENCES empregado(cod_empregado)
);


CREATE TABLE empregado_projeto(
	cod_empregado INT,
    cod_projeto INT,
    PRIMARY KEY (cod_empregado, cod_projeto),
    CONSTRAINT FOREIGN KEY (cod_empregado) REFERENCES empregado(cod_empregado),
    CONSTRAINT FOREIGN KEY (cod_projeto) REFERENCES projeto(cod_projeto)

);


INSERT INTO departamento(nome) VALUES("TI");
INSERT INTO departemento(nome) VALUES("Marketing");
INSERT INTO departemento(nome) VALUES("Financeiro");
INSERT INTO departamento(nome) VALUES("Vendas")


INSERT INTO empregado(cod_departamento, nome, salario, rua, numero, complemento) 
VALUE("1", "Arthur Sousa", "500", "25", "19", "Perto de lugar nenhum" );

INSERT INTO empregado(cod_departamento, nome, salario, rua, numero, complemento)
VALUES ("2", "Julia Ribeiro", "1300", "12", "1", "Perto de algum lugar");

INSERT INTO empregado(cod_departamento, nome, salario, rua, numero, complemento)
VALUES("3", "Olvia Oliveira", "3000", "Oliviana", "10", "Perto das oliveiras");

INSERT INTO empregado(cod_departamento, nome, salario, rua, numero, complemento)
VALUES("4", "Henrique Augusto", "3200", "Rua histórica", "60", "Perto do asilo")

INSERT INTO empregado(cod_departamento, nome, salario, rua, numero, complemento)
VALUES("1", "Carlos Antonio Mello Junior", "3500", "Rua longe", "+ infinito", "Depois do fim do mundo");

INSERT INTO empregado(cod_departamento, nome, salario, rua, numero, complemento)
VALUES("1", "Pedro Aguiar", "2000", "Aqui é BodyBud", "100", "Dentro da academia");

INSERT INTO empregado(cod_departamento, nome, salario, rua, numero, complemento)
VALUES("1", "Sherek Nunes", "4000", "Rua Pântano", "1", "Bem ali");

INSERT INTO empregado(cod_departamento, nome, rua, numero, complemento)
VALUES("3", "Valdemar da Costa", "Cesariana", "2", "É pertinho da li" );

INSERT INTO empregado(cod_departamento, nome, rua, numero, complemento)
VALUES("4", "Paulo Henrique Ganso", "Palácio Ganso", "6", "algum lugar ai");


INSERT INTO projeto(nome) VALUES("Explainify");
INSERT INTO projeto(nome) VALUES("Smart Fit");
INSERT INTO projeto(nome) VALUES("Uber");
INSERT INTO projeto(nome) VALUES("Férias");
INSERT INTO projeto(nome) VALUES("Front End")

INSERT INTO telefone(cod_empregado, telefone) VALUES("1", "40028922")
INSERT INTO telefone(cod_empregado, telefone) VALUES("1", "123456")
INSERT INTO telefone(cod_empregado, telefone) VALUES("2", "54585256")
INSERT INTO telefone(cod_empregado, telefone) VALUES("2", "69657520")
INSERT INTO telefone(cod_empregado, telefone) VALUES("3", "41785256")
INSERT INTO telefone(cod_empregado, telefone) VALUES("3", "417565256")
INSERT INTO telefone(cod_empregado, telefone) VALUES("4", "415155256")
INSERT INTO telefone(cod_empregado, telefone) VALUES("5", "417486256")
INSERT INTO telefone(cod_empregado, telefone) VALUES("9", "54649256")
INSERT INTO telefone(cod_empregado, telefone) VALUES("8", "74695256")


-------------------------------------------------------------------------------------------------------------------------------


INSERT INTO empregado(cod_departamento, nome, salario, rua, numero, complemento) 
VALUE("1", "Arthur Sousa", "500", "25", "19", "Próximo a praça" );

INSERT INTO projeto(nome) VALUES("Explainify")

SELECT * FROM empregados;

SELECT nome, cod_departamento
FROM empregado
WHERE cod_departamento = "1"
ORDER BY nome ASC;

SELECT nome, salario
FROM empregado
WHERE salario > 1000
ORDER BY salario DESC;

SELECT cod_projeto, nome 
FROM projeto 
WHERE nome = "Explanify"

SELECT cod_departamento, nome, COUNT(*) AS qtd_empregado
FROM empregado
GROUP BY cod_departamento
ORDER BY nome ASC;

UPDATE projeto
SET  nome = "Back end"
WHERE nome =  "Front end";

UPDATE empregado
SET departamento = "2"
WHERE cod_empregado = "4";

DELETE FROM empregado
WHERE cod_empregado = "5";
