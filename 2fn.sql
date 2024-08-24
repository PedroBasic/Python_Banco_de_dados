create table if not exists tb_cursos(
	id int primary key auto_increment,
    nome varchar(100) not null,
    carga_horaria int not null
);

insert into tb_cursos (nome, carga_horaria) values
('Fundamentos em Python', 40),
('Java Avançado', 50),
('Análise de dados', 40);

create table if not exists tb_instrutores(
	id int primary key auto_increment,
    nome varchar(50) not null,
    email varchar(100) not null
);

insert into tb_instrutores (nome, email) values
('Alessandro Bispo', 'bispo2024@gmail.com'),
('Mayara Fernandes', 'may2024@gmail.com'),
('Paulo Carvalho', 'paulo2024@gmail.com');

select * from tb_instrutores;

create table tb_cursos_instrutores(
	id_instrutor int not null,
    id_cursos int not null,
    primary key (id_instrutor, id_cursos),
    foreign key (id_instrutor) references tb_instrutores(id),
    foreign key (id_cursos) references tb_cursos(id)
);

insert into tb_cursos_instrutores values
(1, 1),
(2, 3),
(3, 2),
(1, 3),
(2, 2),
(3, 1);

select tci.id_cursos, tc.nome, tci.id_instrutor, ti.nome from tb_cursos tc
inner join tb_cursos_instrutores tci
on tc.id = tci.id_cursos 
inner join tb_instrutores ti
on tci.id_instrutor = ti.id;