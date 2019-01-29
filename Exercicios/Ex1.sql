create database senai_bugmusic;

use senai_bugmusic;

create table musicas(
	ID int identity primary key
	,NOME varchar(100) not null
	,ID_ALBUM int foreign key references albuns(ID)
);

create table albuns(
	ID int identity primary key
	,NOME varchar(100) not null
	,ID_BANDA int foreign key references bandas(ID)
);

create table bandas(
	ID int identity primary key
	,NOME varchar(100) not null
	,ID_GENERO int foreign key references generos(ID)
);

create table generos(
	ID int identity primary key
	,NOME varchar(100) not null
);

create table cantores(
	ID int identity primary key
	,NOME varchar(100) not null
);

create table bandas_cantores(
	ID_CANTOR int foreign key references cantores(ID)
	,ID_BANDA int foreign key references bandas(ID)
);