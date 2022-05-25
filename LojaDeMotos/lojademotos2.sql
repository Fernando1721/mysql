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
    anomodelo varchar(255) not null,
    descricao varchar(255) not null,
    fabricante varchar(255) not null,
    datacad timestamp default current_timestamp,
	capacete varchar(255),
	oleo varchar(255),
	dataval date,
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

update 


insert into produtos(barcodemoto,nomemoto,anomodelo,descricao,fabricante,capacete,oleo,dataval,quantidade,estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
values ('1234567890','BMWG310',2021,'BIG TRAIL','BMW','CAPACETE LS2','OLÉO HONDA',20220110,1,20,10,'UNI','SALA 5',32000,100,64000);

insert into produtos(barcodemoto,nomemoto,anomodelo,descricao,fabricante,capacete,oleo,dataval,quantidade,estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
values ('7894561230','CG160',2022,'CITY','HONDA','CAPACETE NORISK','OLÉO HONDA',20220220,1,17,10,'UNI','SALA 3',15000,100,30000);

insert into produtos(barcodemoto,nomemoto,anomodelo,descricao,fabricante,capacete,oleo,dataval,quantidade,estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
values ('94564156150','FAZER250',2022,'NAKED','YAMAHA','CAPACETE AGV BLADE','OLÉO YAMALUBE',20210315,1,15,10,'UNI','SALA 5',20000,100,40000);

 --  PARTE DE ESTOQUE 
 
insert into produtos(barcodemoto,nomemoto,anomodelo,descricao,fabricante,capacete,oleo,dataval,quantidade,estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
values ('8885852222','TIGER800',2018,'XCX','TRIUMP','CAPACETE AGV BLADE','OLÉO MOBIL',20220625,1,5,6,'UNI','SALA 4',42000,100,84000);

insert into produtos(barcodemoto,nomemoto,anomodelo,descricao,fabricante,capacete,oleo,dataval,quantidade,estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
values ('1231848411','HORNET600',2012,'NAKED','HONDA','CAPACETE AXXIX','OLÉO HONDA',20220715,1,15,20,'UNI','SALA 4',36000,100,72000);


insert into produtos(barcodemoto,nomemoto,anomodelo,descricao,fabricante,capacete,oleo,dataval,quantidade,estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
values ('45612312312','XRE300',2022,'TRAIL','HONDA','CAPACETE AGV BLADE','OLÉO HONDA',20220820,1,17,11,'UNI','SALA 3',22000,100,44000);

insert into produtos(barcodemoto,nomemoto,anomodelo,descricao,fabricante,capacete,oleo,dataval,quantidade,estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
values ('78945881230','BROS160',2022,'CITY','HONDA','CAPACETE NEW LIBERTY 3','OLÉO HONDA',20220720,1,18,12,'UNI','SALA 3',16000,100,32000);





select * from produtos;

/* Relatórios */


-- Inventário do estoque (patrimônio)
-- sum() função de soma no banco de dados
select sum(estoque * custo) as total from produtos;

/* Relatórios de reposição 1 */
select * from produtos where estoque < estoquemin;

/* Relatórios de reposição 2 */

 select id as ID,nomemoto,date_format(dataval,'%d/%m/%Y') as Data_Validade,estoque,estoquemin as Estoque_Mínimo from produtos where
 estoque < estoquemin;
 
 /* Relatório de validade de produto 1 */
 select id as Código,nomemoto,date_format(dataval,'%d/%m/%Y') as Data_Validade from produtos;
 
 /* Relatório de validade de produto 2 */
 -- datediff() calcular a diferença em quantos dias falta para vencer
 -- curdate() obtém a data atual
 select id as Código,nomemoto,date_format(dataval,'%d/%m/%Y') as Data_Validade,datediff(dataval,curdate()) as dias_restante from produtos;
 






select nome as NOME, moto as MOTO, valor as VALOR;


update produtos set barcodemoto='5251515415' where id=7;
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

create table clientes (
	idcli int primary key auto_increment,
    nome varchar(255) not null,
    fone varchar(255) not null,
    cpf varchar(255) unique,
    email varchar(255),
	marketing varchar(255) not null,
    cep varchar(255),
    endereco varchar(255),
    numero varchar(255),
    bairro varchar(255),
    cidade varchar(255),
    uf char(2)
    );
    
    describe clientes;
    
    alter table clientes add column nascimento date not null after nome;
    
    insert into clientes(nome,nascimento,fone,cpf,email,marketing,cep,endereco,numero,bairro,cidade,uf)
    values ('Fernando Miranda',20040216,1197584602,24859647697,'fernando@teste.com','SIM',08466780,'Rua feliciano de mendonça',78,'Vila Rosa','São Paulo','SP');  
    
     insert into clientes(nome,nascimento,fone,cpf,email,marketing,cep,endereco,numero,bairro,cidade,uf)
    values ('Dimitri',20031224,1198888888,24822263121,'dimitri@teste.com','NAO',0844222,'Rua da felicidade',85,'Vila matilde','São Paulo','SP');  
    
     insert into clientes(nome,nascimento,fone,cpf,email,marketing,cep,endereco,numero,bairro,cidade,uf)
    values ('Renan',20040731,1199999999,2481112234,'renan@teste.com','NAO',08222442,'Rua rs boca de medio',00,'medio grave','São Paulo','SP');  
    
     insert into clientes(nome,nascimento,fone,cpf,email,marketing,cep,endereco,numero,bairro,cidade,uf)
    values ('Guilherme',20040216,1188888888,241215153234,'guilherme@bol.com','SIM',07442122,'Rua guilhermefne',25,'bolll','São Paulo','SP');  
    
    insert into clientes(nome,nascimento,fone,cpf,email,marketing,cep,endereco,numero,bairro,cidade,uf)
    values ('José de Assis',19750524,1177777777,777777774,'josedeassis@teste.com','NAO',74122345,'Rua tatuape',48,'tatuape','São Paulo','SP');  
    
    insert into clientes(nome,nascimento,fone,cpf,email,marketing,cep,endereco,numero,bairro,cidade,uf)
    values ('Maria',20030422,91111111111,78456123123,'maria@teste.com','NAO',7845613213,'Rua maria boca de medio',84,'medio grave de 8','São Paulo','SP');  
    
    insert into clientes(nome,nascimento,fone,cpf,email,marketing,cep,endereco,numero,bairro,cidade,uf)
    values ('FILHADAMAE',20550284,2525252525,78456124521,'teste@teste.com','NAO',7845613213,'Rua maria boca de medio',84,'medio grave de 8','São Paulo','SP');  
    
    update clientes set fone='11975288916' where idcli=1;
    
    delete from clientes where idcli=8;
    
    select nome as Nome, fone as Telefone, email as EMAIL from clientes;
    
    select nome, date_format(nascimento, '%d/%m/%Y') as Aniversário from clientes;
    
    select email from clientes where marketing=('SIM');
    
    alter table produtos modify column barcodemoto varchar(255) unique;
    
    
    
    select * from clientes;
    



