--Criando o Banco com o nome Cinema
CREATE DATABASE Cinema;
 
-- Abrir o banco cinema
use Cinema;
 
--Criando a tabela sala
 CREATE TABLE Sala (
    ID_Sala int identity,
    Qtd_cadeira int NOT NULL,
    NumSala int NOT NULL,
    PRIMARY KEY (ID_Sala) --Definição de PK
 );
 


  CREATE TABLE Genero (
    ID_Genero int identity,
    Genero varchar (30),
    PRIMARY KEY (ID_Genero) --Definição de PK
 );
 
  CREATE TABLE Filme(
    ID_Filme int identity,
    Titulo varchar (30) NOT NULL,
    Tempo_Filme time,
    ID_Genero int,
    PRIMARY KEY (ID_Filme),--Definição de PK
    foreign key (ID_Genero) references Genero --Definição de FK
 );
 
 CREATE TABLE Sessao (
    ID_Sessao int identity,
    ID_Sala int,
    ID_Filme int,
    PRIMARY KEY (ID_Sessao),
    foreign key(ID_Sala) references Sala, --Definição de FK
    foreign key(ID_Filme) references Filme
 );
 
 CREATE TABLE Cliente (
    ID_Cliente int identity,
    Nome varchar (30) NOT NULL,
    CPF varchar (20) NOT NULL,
    Dt_Nasc date,
    PRIMARY KEY (ID_Cliente)
 );
 
 
 
 CREATE TABLE Funcionario(
    ID_Funcio int identity,
    Nome varchar (30) NOT NULL,
    Email varchar (30) NOT NULL,
    Dt_Nasc date NOT NULL,
    CPF varchar (20)NOT NULL,
    PRIMARY KEY (ID_Funcio)
 );
 

 CREATE TABLE Nota_Fiscal ( 
        ID_Fiscal int identity,
        ID_Funcio int,
		ID_Cliente int,
		Valor int,
        PRIMARY KEY (ID_Fiscal),
		foreign key (ID_Funcio) references Funcionario,
		foreign key (ID_Cliente) references Cliente
 );
 

 CREATE TABLE Ingresso (
    ID_Ingres int identity,
    ID_Sessao int,
    ID_Fiscal int,
    Inico time,
    Fim time,
	NumSala int,
	NUmCadeira int,
    PRIMARY KEY (ID_Ingres), --Definição de PK
    --Definições de FK
    foreign key (ID_Sessao) references Sessao,
    foreign key (ID_Fiscal) references Nota_FIscal,

 );
 
 
 CREATE TABLE Papel (
    ID_Papel int identity ,
    Descr_Papel varchar(200) NOT NULL,
    PRIMARY KEY (ID_Papel)
 );
 
 
 CREATE TABLE Ator (
    ID_Ator int identity,
    Nome varchar (30) NOT NULL,
    Sexo varchar (20) NOT NULL,
    Dt_Nasc date NOT NULL,
    PRIMARY KEY (ID_Ator)
 );
 
 CREATE TABLE Elenco (
    ID_Elenco int identity,
    ID_Ator int,
    ID_Filme int,
    ID_Papel int,
    PRIMARY KEY (ID_Elenco), --Definição de PK
    foreign key (ID_Ator) references Ator,
    foreign key (ID_Filme) references Filme,
    foreign key (ID_Papel) references Papel
 );
 