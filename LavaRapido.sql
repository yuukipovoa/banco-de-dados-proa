CREATE DATABASE LavaRapido;

CREATE TABLE Funcionario (
idFuncionario INT NOT NULL AUTO_INCREMENT,
nomeFuncionario VARCHAR(80) NOT NULL,
sexoFuncionario CHAR(1) NOT NULL,
PRIMARY KEY (idFuncionario),
idServiço INT
);

CREATE TABLE endereçoFuncionario (
endereçoFuncionario_PK INT NOT NULL,
logradouro VARCHAR(30) NOT NULL,
numero INT NOT NULL,
cidade VARCHAR(15) NOT NULL,
cep VARCHAR(8) NOT NULL,
complemento VARCHAR(10) NOT NULL,
bairro VARCHAR(20) NOT NULL,
idFuncionario_FK INT NOT NULL,
PRIMARY KEY (endereçoFuncionario_PK),
FOREIGN KEY(idFuncionario_FK) REFERENCES Funcionario (idFuncionario)
);

CREATE TABLE tipoServiço (
tipoServiço_PK INT NOT NULL,
tipoServiço VARCHAR(50) NOT NULL,
PRIMARY KEY (tipoServiço_PK)
);

CREATE TABLE ProdutoUtilizado (
ProdutoUtilizado_PK INT NOT NULL,
ProdutoUtilizado VARCHAR(50) NOT NULL,
PRIMARY KEY (ProdutoUtilizado_PK),
idServiço_FK INT
);

CREATE TABLE Venda (
idPagamento INT NOT NULL AUTO_INCREMENT,
formaPagamento VARCHAR(10),
PRIMARY KEY (idPagamento),
idServiço INT
);

CREATE TABLE telefone (
telefone_PK INT NOT NULL,
telefone CHAR(11) NOT NULL,
PRIMARY KEY (telefone_PK)
);

CREATE TABLE notaFiscal (
notaFiscal_PK INT NOT NULL,
dataEmissão DATETIME NOT NULL,
metodoPagamento VARCHAR(10),
nomeServiço VARCHAR(20),
valor DECIMAL(4,2) NOT NULL,
tempoServiço TIME NOT NULL,
cnpjEstabelecimento VARCHAR(13) NOT NULL,
PRIMARY KEY (notaFiscal_PK),
idPagamento_FK INT,
FOREIGN KEY(idPagamento_FK) REFERENCES Venda (idPagamento)
);

CREATE TABLE Fornecedor (
idFornecedor INT NOT NULL AUTO_INCREMENT,
nomeFantasia VARCHAR(30) NOT NULL,
cnpjFornecedor VARCHAR(13) NOT NULL,
PRIMARY KEY (idFornecedor),
idProduto INT
);

CREATE TABLE Produto (
idProduto INT NOT NULL AUTO_INCREMENT,
quantidade INT NOT NULL,
validade DATE NOT NULL,
Utilidade VARCHAR(20) NOT NULL,
nomeProduto VARCHAR(20) NOT NULL,
tipoProduto VARCHAR(20) NOT NULL,
PRIMARY KEY (idProduto),
idFornecedor INT,
idServiço INT,
FOREIGN KEY(idFornecedor) REFERENCES Fornecedor (idFornecedor)
);

CREATE TABLE Serviço (
idServiço INT NOT NULL AUTO_INCREMENT,
tipoVeiculo VARCHAR(20) NOT NULL,
valorServiço DECIMAL(4,2) NOT NULL,
PRIMARY KEY (idServiço),
idProduto INT,
idFuncionario INT,
idPagamento INT,
FOREIGN KEY(idProduto) REFERENCES Produto (idProduto),
FOREIGN KEY(idFuncionario) REFERENCES Funcionario (idFuncionario),
FOREIGN KEY(idPagamento) REFERENCES Venda (idPagamento)
);

ALTER TABLE Funcionario ADD FOREIGN KEY(idServiço) REFERENCES Serviço (idServiço);
ALTER TABLE ProdutoUtilizado ADD FOREIGN KEY(idServiço_FK) REFERENCES Serviço (idServiço);
ALTER TABLE Venda ADD FOREIGN KEY(idServiço) REFERENCES Serviço (idServiço);
ALTER TABLE Fornecedor ADD FOREIGN KEY(idProduto) REFERENCES Produto (idProduto);
ALTER TABLE Produto ADD FOREIGN KEY(idServiço) REFERENCES Serviço (idServiço);