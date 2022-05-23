/**
	Lojinha Fernando
	@author Fernando Miranda
    @version 1.0
*/

create database lojinhaFernando2;
use lojinhaFernando2;


-- timestamp default current_timestamp (data e hora automática)


create table produtos (
	id int primary key auto_increment,
    barcodemoto varchar(255), 
    nomemoto varchar(255) not null,
    descricao varchar(255) not null,
    fabricante varchar(255) not null,
    datacad timestamp default current_timestamp,
    -- dataval date,
    -- date (tipo de dados relacionados a data)
    quantidade int not null,
    estoque int not null,
    estoquemin int not null,
    unidade varchar(255) not null,
    localizacao varchar(255),
    custo decimal(10,2),
    lucro decimal(10,2),
    venda decimal(10,2)
    
);
describe produtos;

drop table produtos;

/************* CRUD *************/


insert into produtos(barcodemoto,nomemoto,descricao,fabricante,quantidade,estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
values ('1234567890','BMWG310','BIG TRAIL','BMW',1,20,10,'UNI','SALA 5',15000,100,30000);



select * from produtos;

select * from produtos where id=2;
select * from produtos where id=6;
select * from produtos where nome='Fernando Miranda';

select nome,moto from produtos;

select nome,moto from produtos order by nome;

select nome as NOME, moto as MOTO, valor as VALOR
from produtos order by nome;

update produtos set moto='CG160' where id=4;
update produtos set nome='Felipe' where id=4;
update produtos set nome='Robson Vaamonde',moto='BMW1200',valor='62.000' where id=4;

delete from produtos where id=6;

-- --------------------------------------- Criando parte de banco de dados de senha e login ------------------------------
-- unique (não permitir valores duplicados)

create table usuarios(
	idusu int primary key auto_increment,
    usuario varchar(255) not null,
    login varchar(255) not null unique,
    senha varchar(255) not null,
    perfil varchar(255) not null
);

describe usuarios;

-- para inserir uma senha com criptografia usamos md5()

insert into usuarios(usuario,login,senha,perfil)
values ('Administrador','admin',md5('admin'),'admin');

insert into usuarios(usuario,login,senha,perfil)
values('Fernando Miranda','miranda',md5('123456'),'fernando');

select * from usuarios;

-- Acessando o sistema pela tela de login
-- and (função lógica onde todas as condições devem ser verdadeiras)
select * from usuarios where login='admin' and senha=md5('admin');







