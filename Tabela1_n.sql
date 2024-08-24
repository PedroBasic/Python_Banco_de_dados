create table if not exists tb_usuario(
	id int primary key auto_increment,
    email varchar(200) not null,
    senha varchar(200) not null
);

create table if not exists tb_perfil(
	id int primary key,
    nome varchar(50) not null,
    idade int not null,
    genero varchar(20) not null,
    data_nascimento date not null,
    foreign key (id) references tb_usuario(id)
);

insert into tb_usuario(email, senha) values
('pedro@email.com.br', '123456'),
('maria@email.com.br', '123321'),
('lucas@email.com.br', '234561');

insert into tb_perfil(id, nome, idade, genero, data_nascimento) values 
(1, 'Pedro Henrique Manuel de Souza', 20, 'Masculino', '2004-04-22'),
(2, 'Maria Lauren Silva de Lima', 20, 'Feminina', '2004-06-19'),
(3, 'Lucas Rangel da Silva', 34, 'Bissexual', '1990-02-20');


create table if not exists tb_postagens(
	id int primary key auto_increment,
    perfil_id int not null,
    titulo_postagem varchar(200) not null,
    texto text not null,
    data_hora datetime not null,
    foreign key (perfil_id) references tb_perfil(id)
);

insert into tb_postagens (perfil_id, titulo_postagem, texto, data_hora) values
(1, 'Apredendo python com banco de dados', 'Python e uma linguagem muito boa para dados', '2024-08-24 13:00:00'),
(2, 'Apredendo marketing Digital', 'O marketing Digital e o futuro do mercado', '2024-08-24 12:01:00'),
(3, 'Apredendo java orientação de objeto', 'jav e uma linguagem muito boa para Web', '2024-08-24 08:30:20');

-- tb_usuario tu
-- tb_perfil tp
-- tb_postagem tpo

select  tpo.perfil_id, tu.email, tp.nome, tp.idade, tpo.titulo_postagem, tpo.texto  from tb_usuario tu
inner join tb_perfil tp
on tp.id = tu.id
inner join tb_postagens tpo
on tpo.perfil_id = tp.id;
