DROP DATABASE estoque;
-- criando banco de dados
create database estoque;

-- visualizando o banco de dados
show databases;

-- acessando o banco de dados
use estoque;

create table tbCliente(
    cod_cli int AUTO_INCREMENT,         
    nome VARCHAR(50) not NULL,
    endereco VARCHAR(50) NULL,
    cidade varchar(30),
    cep char(9),
    uf CHAR(2),
    primary key(cod_cli)
);

create table tbProduto(
    cod_prod int not NULL AUTO_INCREMENT,
    unid_prod char(3) not NULL,
    descricao VARCHAR(30) not null,
    val_unit DECIMAL(9,3),
    primary key(cod_prod)
);

CREATE Table tbVendedor(
    cod_vend int not null AUTO_INCREMENT,
    nome VARCHAR(50)not null,
    sal_fixo DECIMAL(9,2),
    faixa_comiss CHAR(1),
    PRIMARY KEY (cod_vend)
);

create table tbPedido(
    num_pedido int not null AUTO_INCREMENT,
    prazo_ent int not NULL,
    cod_cli int,
    cod_vend int,
    PRIMARY KEY(num_pedido),
    foreign key(cod_cli) references tbCliente(cod_cli),
    foreign key(cod_vend) references tbVendedor(cod_vend)    
);

CREATE table tbItemPedido(
    qnt_pedido int not null,
    cod_prod int,
    num_pedido int,
    Foreign Key (cod_prod) REFERENCES tbProduto(cod_prod),
    Foreign Key (num_pedido) REFERENCES tbPedido(num_pedido)
);

show tables;
desc tbCliente;
desc tbProduto;
desc tbVendedor;
desc tbPedido;
desc tbItemPedido;

insert into tbCliente(nome,endereco,cidade,cep,uf)values("Joao Otavio","Rua Nelo Bertolacine","São Paulo",04841180,"SP");
insert into tbProduto(unid_prod,descricao,val_unit)values("Cx","Iphone","5000.00");

select * from tbCliente;
select * from tbProduto;
select * from tbVendedor;
select * from tbPedido;
select * from tbItemPedido;