


CREATE TABLE FOTOS (
pk_fto_id NUMERIC(6) PRIMARY KEY,
fto_extensao VARCHAR(4),
fto_caminho VARCHAR(255),
fto_nome VARCHAR(15),
fto_legenda VARCHAR(255),
pk_prd_id NUMERIC(6)
)

CREATE TABLE TELEFONES (
tel_ddd CHAR(2),
tel_descricao VARCHAR(30),
tel_numero CHAR(9),
tel_codoperadora CHAR(2),
pk_tel_id NUMERIC(6) PRIMARY KEY,
pk_cli_id NUMERIC(6)
)

CREATE TABLE ITENSPEDIDO (
ipd_quantidade NUMERIC(8),
pk_ipd_id NUMERIC(6) PRIMARY KEY,
pk_usu_id NUMERIC(6),
pk_prd_id NUMERIC(6),
pk_vnd_id NUMERIC(6)
)

CREATE TABLE USUARIOS+CLIENTES (
pk_cli_id NUMERIC(6) PRIMARY KEY,
usu_login VARCHAR(20),
usu_senha VARCHAR(20),
cli_cpf CHAR(11),
cli_nomemeio VARCHAR(30),
cli_email VARCHAR(10),
cli_primeironome VARCHAR(15),
cli_ultimonome VARCHAR(15)
)

CREATE TABLE COMENTARIOS (
com_descricao VARCHAR(255),
com_datacriacao DATETIME,
pk_com_id NUMERIC(6) PRIMARY KEY,
pk_prd_id NUMERIC(6),
pk_usu_id NUMERIC(6),
FOREIGN KEY(pk_usu_id) REFERENCES USUARIOS+CLIENTES (pk_cli_id)
)

CREATE TABLE DESCONTOS+PRODUTOS (
pk_prd_id NUMERIC(6) PRIMARY KEY,
dct_valor NUMERIC(8,2),
dct_porcentagem NUMERIC(4,2),
prd_preco NUMERIC(8,2),
prd_marca VARCHAR(30),
prd_descricao VARCHAR(255),
prd_nome VARCHAR(30),
prd_modelo VARCHAR(30),
prd_url VARCHAR(30)
)

CREATE TABLE ENDERECOS (
end_estado CHAR(2),
end_pais VARCHAR(15),
end_cidade VARCHAR(15),
end_logradouro VARCHAR(20),
end_cep CHAR(8),
end_bairro VARCHAR(15),
end_numero VARCHAR(5),
pk_end_id NUMERIC(6) PRIMARY KEY,
pk_cli_id NUMERIC(6),
FOREIGN KEY(pk_cli_id) REFERENCES USUARIOS+CLIENTES (pk_cli_id)
)

CREATE TABLE VENDAS (
vnd_total NUMERIC(8,2),
pk_vnd_id NUMERIC(6) PRIMARY KEY,
vnd_notafiscal VARCHAR(20),
vnd_formapagamento VARCHAR(20),
pk_end_id NUMERIC(6),
pk_usu_id NUMERIC(6),
pk_cli_id NUMERIC(6),
FOREIGN KEY(pk_end_id) REFERENCES ENDERECOS (pk_end_id),
FOREIGN KEY(pk_usu_id) REFERENCES USUARIOS+CLIENTES (pk_cli_id),
FOREIGN KEY(pk_cli_id) REFERENCES USUARIOS+CLIENTES (pk_cli_id)
)

CREATE TABLE CARTAOS (
crt_numero CHAR(16),
crt_bandeira VARCHAR(10),
pk_crt_id NUMERIC(6) PRIMARY KEY,
crt_codigoseguranca CHAR(3),
pk_cli_id NUMERIC(6),
FOREIGN KEY(pk_cli_id) REFERENCES USUARIOS+CLIENTES (pk_cli_id)
)

ALTER TABLE FOTOS ADD FOREIGN KEY(pk_prd_id) REFERENCES DESCONTOS+PRODUTOS (pk_prd_id)
ALTER TABLE TELEFONES ADD FOREIGN KEY(pk_cli_id) REFERENCES USUARIOS+CLIENTES (pk_cli_id)
ALTER TABLE ITENSPEDIDO ADD FOREIGN KEY(pk_usu_id) REFERENCES USUARIOS+CLIENTES (pk_cli_id)
ALTER TABLE ITENSPEDIDO ADD FOREIGN KEY(pk_prd_id) REFERENCES DESCONTOS+PRODUTOS (pk_prd_id)
ALTER TABLE ITENSPEDIDO ADD FOREIGN KEY(pk_vnd_id) REFERENCES VENDAS (pk_vnd_id)
ALTER TABLE COMENTARIOS ADD FOREIGN KEY(pk_prd_id) REFERENCES DESCONTOS+PRODUTOS (pk_prd_id)
