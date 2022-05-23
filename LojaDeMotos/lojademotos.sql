/**
	Lojinha Fernando
	@author Fernando Miranda
    @version 1.0
*/

create database lojinhaFernando2;
use lojinhaFernando2;
create table produtos (
	id int primary key auto_increment,
    nome varchar(255) not null,
    moto varchar(255) not null,
    quantidade int not null,
    valor decimal(10,3)
);
describe produtos;

drop table produtos;

/************* CRUD *************/


insert into produtos(nome,moto,quantidade,valor)
values ('Fernando Miranda','BMW310',1,32.000);

insert into produtos(nome,moto,quantidade,valor)
values ('Dimitri','HORNET600',1,39.000);

insert into produtos(nome,moto,quantidade,valor)
values ('Renan','XJ6',1,37.000);

insert into produtos(nome,moto,quantidade,valor)
values ('Gustavo','KAWASAKIZ900',1,47.000);

insert into produtos (nome,moto,quantidade,valor)
values ('Maria','XRE300',1,24.000);

insert into produtos(nome,moto,quantidade,valor)
values ('Ryck','XJ6',1,36.000);

insert into produtos(nome,moto,quantidade,valor)
values ('Tavinho','XRE300',1,23.000);


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







