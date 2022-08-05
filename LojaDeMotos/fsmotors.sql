/**
	Loja de Moto
    @author Fernando Miranda
    @version 1.2
*/

create database FsMotors;
use FsMotors;

create table produtos (
	id int primary key auto_increment,
    nomemoto varchar(50) not null,
    anomodelo varchar(20) not null,
    descricao varchar(100) not null,
    fabricante varchar(30) not null,
    datacad timestamp default current_timestamp,
	capacete varchar(30),
	oleo varchar(30),
	dataval date,
    -- date (tipo de dados relacionados a data)
    quantidade int not null,
    estoque int not null,
    estoquemin int not null,
    localizacao varchar(30),
    custo decimal(10,2),
    lucro decimal(10,2),
    venda decimal(10,2),
    idfor int not null,
    foreign key(idfor) references fornecedores (idfor)
);

alter table produtos drop column dataval; 

drop table produtos;



insert into produtos(nomemoto,anomodelo,descricao,fabricante,capacete,oleo,quantidade,estoque,estoquemin,localizacao,custo,lucro,venda,idfor)
values ('BMWG310',2021,'BIG TRAIL','BMW','CAPACETE LS2','OLÉO HONDA',1,20,10,'SALA 5',32000,100,64000,1);

insert into produtos(nomemoto,anomodelo,descricao,fabricante,capacete,oleo,quantidade,estoque,estoquemin,localizacao,custo,lucro,venda,idfor)
values ('CG160',2022,'CITY','HONDA','CAPACETE NORISK','OLÉO HONDA',1,17,10,'SALA 3',15000,100,30000,1);

insert into produtos(nomemoto,anomodelo,descricao,fabricante,capacete,oleo,quantidade,estoque,estoquemin,localizacao,custo,lucro,venda,idfor)
values ('FAZER250',2022,'NAKED','YAMAHA','CAPACETE AGV BLADE','OLÉO YAMALUBE',1,15,10,'SALA 5',20000,100,40000,1);

insert into produtos(nomemoto,anomodelo,descricao,fabricante,capacete,oleo,quantidade,estoque,estoquemin,localizacao,custo,lucro,venda,idfor)
values ('TIGER800',2018,'XCX','TRIUMP','CAPACETE AGV BLADE','OLÉO MOBIL',1,3,6,'SALA 4',42000,100,84000,1);

insert into produtos(nomemoto,anomodelo,descricao,fabricante,capacete,oleo,quantidade,estoque,estoquemin,localizacao,custo,lucro,venda,idfor)
values ('HORNET600',2012,'NAKED','HONDA','CAPACETE AXXIX','OLÉO HONDA',1,15,20,'SALA 4',36000,100,72000,1);

describe produtos;
select * from produtos;

 select id as ID,nomemoto,estoque,estoquemin as Estoque_Mínimo from produtos where
 estoque < estoquemin;

create table clientes (
	idcli int primary key auto_increment,
    nome varchar(50) not null,
    nascimento date not null,
    fone varchar(20) not null,
    cpf varchar(17) unique,
    email varchar(50),
	marketing varchar(3) not null,
    cep varchar(13),
    endereco varchar(50),
    numero varchar(10),
    bairro varchar(20),
    cidade varchar(30),
    uf char(2)
    );
    
     insert into clientes(nome,nascimento,fone,cpf,email,marketing,cep,endereco,numero,bairro,cidade,uf)
    values ('Fernando Miranda',20040216,1197584602,24859647697,'fernando@teste.com','SIM',08466780,'Rua feliciano de mendonça',78,'Vila Rosa','São Paulo','SP');  
    
     insert into clientes(nome,nascimento,fone,cpf,email,marketing,cep,endereco,numero,bairro,cidade,uf)
    values ('Dimitri',20031224,1198888888,24822263121,'dimitri@teste.com','NAO',0844222,'Rua da felicidade',85,'Vila matilde','São Paulo','SP');  
    
     select email from clientes where marketing=('SIM');
    
    select * from clientes;

create table usuarios(
	idusu int primary key auto_increment,
    usuario varchar(40) not null,
    login varchar(40) not null unique,
    senha varchar(255) not null,
    perfil varchar(40) not null
);

describe usuarios;

insert into usuarios(usuario,login,senha,perfil)
values ('Administrador','admin',md5('admin'),'admin');

insert into usuarios(usuario,login,senha,perfil)
values('Fernando Miranda','miranda',md5('123456'),'user');

update usuarios set perfil='user' where idusu=2;

select * from usuarios;
select * from usuarios where idusu = 1;

create table fornecedores(
idfor int primary key auto_increment,
cnpj varchar (40)  unique not null,
ie varchar(20) unique,
im varchar(20) unique, 
razao varchar(40) not null,
fantasia varchar(30) not null,
site varchar(40),
fone varchar(20) not null,
contato varchar (40),
email varchar(30),
cep varchar(20) not null,
endereco varchar(50) not null,
complemento varchar(30),
bairro varchar(30) not null,
cidade varchar(40) not null,
uf char(2) not null
);

drop table fornecedores;

insert into fornecedores(cnpj,ie,im,razao,fantasia,site,fone,contato,email,cep,endereco,complemento,bairro,cidade,uf)
values (2167289158234,32445688,52447399,'Honda Automóveis do Brasil Ltda','Honda','honda.com',2563772,'Fernando','honda@honda.com.br','03326738','Rua Coronel Xavier de Toledo 23','Loja 43','Centro Historico','São Paulo','SP');

insert into fornecedores(cnpj,ie,im,razao,fantasia,site,fone,contato,email,cep,endereco,complemento,bairro,cidade,uf)
values (2167245158234,32441288,20447399,'Yamaha Automóveis do Brasil Ltda','Yamaha','yamaha.com',256377256,'Dimitri','yamaha@yamaha.com.br','0332675538','Rua Coronel Xavier de Morais 48','Loja 2','Centro','São Paulo','SP');

select * from fornecedores;

create table pedidos (
pedido int primary key auto_increment,
dataped timestamp default current_timestamp,
total decimal(10,2),
idcli int not null,
foreign key (idcli) references clientes(idcli)
);

insert into pedidos(idcli) values(1);
insert into pedidos(idcli) values(2);

select *  from pedidos;


create table carrinho (
	pedido int not null,
    id int not null,
    quantidade int not null,
    foreign key(pedido) references pedidos(pedido),
    foreign key(id) references produtos(id)
);   

insert into carrinho values (1,1,3);
insert into carrinho values (2,2,3); 

select pedidos.pedido, 
carrinho.id as código,
produtos.id,
carrinho.quantidade,
produtos.venda,
produtos.venda * carrinho.quantidade as subtotal
from(carrinho inner join pedidos on carrinho.pedido =
pedidos.pedido)
inner join  produtos on carrinho.id = produtos.id;

select sum(produtos.venda * carrinho.quantidade) as total
from carrinho inner join produtos
on carrinho.id = produtos.id;

update carrinho
inner join produtos
on carrinho.id = produtos.id
set produtos.estoque = produtos.estoque - carrinho.quantidade
where carrinho.quantidade > 0;

select *  from carrinho;




