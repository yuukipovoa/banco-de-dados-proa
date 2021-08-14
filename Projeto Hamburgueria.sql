
create database Projeto_Hamburgueria;
use Projeto_Hamburgueria;

CREATE TABLE mercadoria_produto (
mercadoria_produto INTEGER not null,
Nome_mercadoria_produto VARCHAR(50 )not null
);

CREATE TABLE funcionario (
numero_id_funcionario INTEGER PRIMARY KEY not null,
cpf_funcionario VARCHAR(11)not null,
nome_funcionario VARCHAR(30) not null,
idade_funcionario INTEGER not null,
genero_funcionario VARCHAR(25) not null,
numero INTEGER not null,
logradouro VARCHAR(30) not null,
estado CHAR(2)not null,
cidade VARCHAR(30)not null,
complemento VARCHAR(25) not null,
setor_funcionario VARCHAR(25)not null,
cep numeric(8) not null
);

CREATE TABLE fornecedor (
numero_fornecedor INTEGER PRIMARY KEY,
cnpj VARCHAR(13) not null,
nome_fantasia VARCHAR(30) not null
);

CREATE TABLE faturamento (
quantidade_vendas INTEGER not null,
valor_vendas DECIMAL(5,2) not null
);

CREATE TABLE tipo_conta (
tipo_conta_PK INTEGER PRIMARY KEY not null,
tipo_conta VARCHAR(25) not null,
numero_conta_FK INTEGER not null
);

CREATE TABLE produção (
numero_producao INTEGER PRIMARY KEY not null,
quant_producao INTEGER not null,
tempo_producao INTEGER not null,
setores_producao VARCHAR(25) not null,
mercadoria_estoque_FK VARCHAR(50)not null
);

CREATE TABLE lanche (
tipo_lanche VARCHAR(25)not null,
calorias_lanche INTEGER
);

CREATE TABLE bebida (
tipo_bebida VARCHAR(25) not null,
calorias_bebida INTEGER
);

CREATE TABLE petiscos (
tipo_petisco VARCHAR(25) not null,
caloria_petisco INTEGER
);

CREATE TABLE mercadoria (
numero_mercadoria INTEGER PRIMARY KEY not null,
validade_mercadoria DATETIME not null,
tipo_mercadoria VARCHAR(30) not null,
preco_mercadoria DECIMAL(4,2) not null,
mercadoria_fornecida VARCHAR(50) not null,
FOREIGN KEY(numero_mercadoria) REFERENCES fornecedor (numero_fornecedor)
);

CREATE TABLE estoque (
quantidade_produto VARCHAR(10) not null,
estoque_mercadoria INTEGER not null,
numero_produto VARCHAR(10) PRIMARY KEY not null,
FOREIGN KEY(estoque_mercadoria) REFERENCES mercadoria (numero_mercadoria)
);

CREATE TABLE caixa (
codigo_venda INTEGER PRIMARY KEY,
valor_caixa DECIMAL(10) not null,
venda_produto int not null
);

CREATE TABLE produto (
data_validade DATETIME,
produção_dos_produtos_fk INTEGER,
numero_produto int PRIMARY KEY not null,
FOREIGN KEY(produção_dos_produtos_fk) REFERENCES produção (numero_producao)
);

CREATE TABLE relatorio (
nota_fiscal INTEGER not null,
numero_relatorio INTEGER PRIMARY KEY not null,
data_producao DATETIME,
relario_contabilidade int not null
);

CREATE TABLE telefone_fornecedor (
Telefone_fornecedor_FK int,
DDD NUMERIC( 2)not null,
Campo1 NUMERIC(9 )not null,
FOREIGN KEY(Telefone_fornecedor_FK) REFERENCES fornecedor (numero_fornecedor)
);

CREATE TABLE telefone_funcionario (
telefone_funcionario int,
DDD NUMERIC(2) not null,
numero_funcionario NUMERIC(9 )not null,
FOREIGN KEY(telefone_funcionario) REFERENCES funcionario (numero_id_funcionario)
);

CREATE TABLE endereco_fornecedor (
endereco_fornecedor_FK int not null,
cidade VARCHAR(30) not null,
estado CHAR(10)not null,
cep numeric (8)not null,
numero numeric (5) not null,
logradouro VARCHAR(30) not null,
complemento VARCHAR(25) not null,
FOREIGN KEY(endereco_fornecedor_FK) REFERENCES fornecedor (numero_fornecedor)
);

CREATE TABLE Pcp (
Numero_controle INTEGER PRIMARY KEY,
Controle_estoque_fk VARCHAR(50) not null,
relatorio_contas_fk VARCHAR(50) not null,
FOREIGN KEY(Controle_estoque_fk) REFERENCES estoque (numero_produto),
FOREIGN KEY(relatorio_contas_fk) REFERENCES estoque (numero_produto)
);

CREATE TABLE contrato (
numero_contrato INTEGER PRIMARY KEY not null,
valor_amortizacao DECIMAL(5,2) not null,
valor_juros DECIMAL(4,2) not null,
taxa_prestacao INTEGER not null,
valor_contrato DECIMAL(6,2) not null,
data_limite DATETIME,
tipo_contrato VARCHAR(100) not null
);

CREATE TABLE contabilidade (
custo_producao DECIMAL(6,2) not null,
lucro_relatorio DECIMAL(6,2) not null,
contabilizacao_total int PRIMARY KEY not null,
vendas_produtos_fk INTEGER not null,
contabilizaçao_contas INTEGER not null,
Contas_FK INTEGER not null,
contrato_FK INTEGER not null,
FOREIGN KEY(vendas_produtos_fk) REFERENCES caixa (codigo_venda),
FOREIGN KEY(contrato_FK) REFERENCES contrato (numero_contrato)
);

CREATE TABLE email_funcionario (
email_funcionario_fk INTEGER not null,
email_funcionario VARCHAR(35) not null,
FOREIGN KEY(email_funcionario_fk) REFERENCES funcionario (numero_id_funcionario)
);

CREATE TABLE contas (
numero_conta INTEGER PRIMARY KEY not null,
valor_conta DECIMAL(6,2) not null
);

CREATE TABLE email_fornecedor (
email INTEGER,
Campo2 VARCHAR(35 ),
FOREIGN KEY(email) REFERENCES fornecedor (numero_fornecedor)
);

ALTER TABLE mercadoria_produto ADD FOREIGN KEY(mercadoria_produto) REFERENCES fornecedor (numero_fornecedor);
ALTER TABLE tipo_conta ADD FOREIGN KEY(numero_conta_FK) REFERENCES contas (numero_conta);
ALTER TABLE produção ADD FOREIGN KEY(mercadoria_estoque_FK) REFERENCES estoque (numero_produto);
ALTER TABLE caixa ADD FOREIGN KEY(venda_produto) REFERENCES produto (numero_produto);
ALTER TABLE relatorio ADD FOREIGN KEY(relario_contabilidade) REFERENCES contabilidade (contabilizacao_total);
ALTER TABLE contabilidade ADD FOREIGN KEY(contabilizaçao_contas) REFERENCES contas (numero_conta);
ALTER TABLE contabilidade ADD FOREIGN KEY(Contas_FK) REFERENCES contas (numero_conta);
