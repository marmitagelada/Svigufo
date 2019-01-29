-- Cria um novo banco de dados
create database senai_svigufo_tarde;
use senai_svigufo_tarde;

/*
	cria uma nva tabela
	identify - auto-incremento
	primary key - define que o campo será uma chave primária
	not null - não aceita valores nulos
	unique - define que o campo terá um valor único, não pode ter valores repetidos
*/
create table tipos_eventos (
	ID int identity primary key
	, TITULO varchar(225) not null unique
);

create table instituicoes (
	ID int identity primary key
	,RAZAO_SOCIAL varchar(255) not null
	,NOME_FANTASIA varchar(255) null
	,CNPJ char(14) not null unique
	,LOGRADOURO varchar(255) not null
	,CEP char(8) not null 
	,UF char(2) not null
	,CIDADE varchar(255) not null
);

create table eventos (
	ID	int identity primary key
	,TITULO	varchar(255) not null
	,DESCRICAO text --para campos com grande quantidade de dados
	,DATA_EVENTO datetime not null -- campos do tipo data e hora
	,ACESSO_LIVRE bit default(1) -- 1=público 0=privado
	,ID_TIPO_EVENTO int 
	,ID_INSTITUICAO int 
	--cria uma chave estrangeira e define que o campo esta relacionado a tabela(campo)
	,foreign key (ID_TIPO_EVENTO) REFERENCES TIPOS_EVENTOS(ID)
	,foreign key (ID_INSTITUICAO) REFERENCES INSTITUICOES(ID)
);

create table usuarios(
	ID int identity primary key
	,NOME varchar(255) not null
	,EMAIL varchar(255) not null unique
	,SENHA varchar(100) not null
	,TIPO_USUARIO varchar(100) not null
);

create table convites(
	ID int identity primary key
	,ID_USUARIO int foreign key references usuarios (ID)
	,ID_EVENTO int foreign key references eventos (ID)
	,SITUACAO char(1)
);