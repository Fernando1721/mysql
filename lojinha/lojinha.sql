/**
	Lojinha Fernando
    @author Fernando Miranda
*/

-- Criar um novo banco de dados
create database lojinhafernando;

use lojinhafernando;

create table produtos(
	id int primary key auto_increment,
    nomedoproduto varchar(255) not null,
    estoque varchar(255) not null,
    valor decimal(10,2) not null
);

show tables;

describe produtos;


