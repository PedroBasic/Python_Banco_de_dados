create table tb_clientes(
	id int,
    nome varchar(200),
    endereco varchar(200),
    telefone varchar(50) not null
);

 table tb_clientes to tb_clientes_pre_1fn;

create table if not exists tb_clientes(
	id int primary key auto_increment,
    nome varchar(200) not null,
    sobrenome varchar(20) not null,
    tipo_logradoro varchar(20) not null,
    logradoro varchar(100) not null,
    numero varchar(10) not null,
    bairro varchar(50) not null,
    cidade varchar(50) not null,
    estado char(2) not null
);

create table if not exists tb_telefones(
	id_telefone int primary key auto_increment,
    cliente_id int not null,
    telefone varchar(20) not null,
    foreign key (cliente_id) references tb_clientes(id)
);

-- Abaixo estamos inserindo os dados na tabela 'tb_clientes'.
insert into tb_clientes (nome, sobrenome, tipo_logradoro, logradoro, numero, bairro, cidade, estado) values 
('João', 'Bento', 'Rua', 'Max Aldemann', 125, 'Fortaleza', 'Blumenau', 'SC'),
('Pedro', 'Henrique Manuel', 'Rua', 'Max Aldemann', 125, 'Fortaleza', 'Blumenau', 'SC'),
('Maria', 'Lauren Silva', 'Rua', 'Max Aldemann', 125, 'Fortaleza', 'Blumenau', 'SC'),
('Carlos', 'Francisco Souza', 'Rua', 'Nereu Ramos', 71, 'Centro', 'Blumenau', 'SC');

-- Abaixo inserindo os dados na tabela 'tb_telefones'.
insert into tb_telefones (cliente_id, telefone) values
(1, '31995494483'),
(2, '13997240436'),
(3, '47999410352'),
(2, '31995478863');

-- Abaixo consultamos quais clientes possui telefones cadastrados usando o parametro 'Join e On'.
select tc.id, tc.nome, tt.cliente_id, tt.telefone from tb_clientes tc 
join tb_telefones tt
on tt.cliente_id = tc.id;
