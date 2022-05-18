/**
	Agenda de contatos
    @author Fernando Miranda
*/

-- Verificar banco de dados    
show databases;

-- Criar um novo banco de dados
create database teste;
create database agendafernando;

-- Excluir um banco de dados
drop database teste;

-- Selecionar o banco de dados
use agendafernando;


-- Criando uma tabela
-- int -> (tipo de dados - números inteiros)
-- decimal(10,2) -> tipo de dados - números não inteiros
-- (10,2) 10 dígitos com duas casas decimais
-- primary key (transforma o campo em chave primária)
-- auto_increment (numeração automática ex: 1,2,3... e assim por diante)
-- varchar(255) -> tipo de dados (String com variação -> aceita qualquer caractér)
-- char(255) -> tipo de String (sem variação)
-- (255) -> máximo de caractér que pode ser digitado
-- not null (obrigário o preenchimento)


create table contatos(
	id int primary key auto_increment,
    nome varchar(255) not null,
    fone varchar(255) not null,
    email varchar(255)
);

-- Verificar tabelas do banco
show tables;

-- Descrever a tabela
describe contatos;

-- Adicionando uma coluna (campo) a tabela
alter table contatos add column obs varchar(255);

alter table contatos add column fone2 varchar(255);

-- Adicionando uma coluna (campo) a tabela após um campo (na ordem que eu quiser)
alter table contatos add column cel varchar(255) after fone;

-- Modificando uma propriedade da tabela
alter table contatos modify column cel varchar(255) not null;

-- Excluir uma coluna (campo) da tabela
alter table contatos drop column obs;

-- excluir a tabela
drop table contatos;



