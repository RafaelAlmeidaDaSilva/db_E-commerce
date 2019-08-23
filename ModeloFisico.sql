CREATE TABLE FOTOS (
fto_legenda varchar2(10),
fto_extensao varchar2(10),
fto_nome varchar2(10),
fto_caminho varchar2(10),
pk_fto_id varchar2(10),
fk_fto_prd number(6)
)

CREATE TABLE PRODUTOS (
prd_nome varchar2(10),
prd_url varchar2(10),
prd_marca varchar2(10),
prd_descricao varchar2(10),
prd_modelo varchar2(10),
prd_preco varchar2(10),
pk_prd_id varchar2(10)
)

CREATE TABLE DESCONTOS (
dct_porcentagem varchar2(10),
dct_valor varchar2(10),
pk_dct_id varchar2(10),
fk_dct_prd number(6)
)

CREATE TABLE COMENTARIOS (
com_descricao varchar2(10),
com_datacriacao varchar2(10),
pk_com_id varchar2(10),
fk_com_prd varchar2(10)
)

CREATE TABLE ITENSPEDIDO (
ipd_quantidade varchar2(10),
pk_ipd_id varchar2(10),
fk_ipd_prd varchar2(10),
fk_ipd_car number(6)
)

CREATE TABLE CARTAOS (
crt_numero varchar2(10),
crt_bandeira varchar2(10),
crt_codigoseguranca varchar2(10),
pk_crt_id varchar2(10),
fk_crt_usu number(6)
)

CREATE TABLE USUARIOS (
usu_login varchar2(10),
usu_senha varchar2(10),
pk_usu_id varchar2(10),
fk_usu_cli number(6)
)

CREATE TABLE CARRINHOS (
pk_car_id number(6),
fk_car_usu number(6)
)

CREATE TABLE CLIENTES (
pk_cli_id number(6),
cli_primeironome number(6),
cli_nomemeio number(6),
cli_ultimonome number(6),
cli_email number(6),
cli_cpf number(6)
)

CREATE TABLE ENDERECOS (
pk_end_id number(6),
fk_end_cli number(6),
end_logradouro number(6),
end_numero number(6),
end_bairro number(6),
end_cidade number(6),
end_estado number(6),
end_pais number(6),
end_cep number(6)
)

CREATE TABLE TELEFONES (
tel_codoperadora varchar2(10),
tel_ddd varchar2(10),
tel_numero varchar2(10),
tel_descricao varchar2(10),
pk_tel_id varchar2(10),
fk_tel_cli varchar2(10)
)

CREATE TABLE VENDAS (
vnd_notafiscal varchar2(10),
vnd_formapagamento varchar2(10),
vnd_total varchar2(10),
pk_vnd_id number(6),
fk_vnd_car number(6)
)

