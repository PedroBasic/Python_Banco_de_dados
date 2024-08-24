create table if not exists tb_itens(
	id int primary key auto_increment,
    nome varchar(50) not null,
    valor_unidade double not null
);

insert into tb_itens (nome, valor_unidade) values 
('Mochila Sasuke', 98.90),
('Mouse ReDragon', 350.91),
('Fone de Ouvido Logitech', 500.88),
('Monitor Asus 144hz', 2589.00),
('Calça rasgada', 69.90);

create table if not exists tb_pedidos(
	id int primary key auto_increment,
    data_hora_pedido datetime not null,
    descricao varchar(200) null
);

insert into tb_pedidos (data_hora_pedido, descricao) values
('2024-08-22 12:45:55', null),
('2024-07-25 11:50:10', null),
('2024-06-02 08:30:00', null),
('2024-12-25 13:50:55', 'Presente especial'),
('2024-01-01 00:05:00', 'Que esse ano seja incrível');

create table if not exists tb_pedidos_itens(
	id_pedidos int,
    id_itens int,
    quantidade int not null,
    subtotal double not null,
    primary key(id_pedidos, id_itens),
    foreign key (id_pedidos) references tb_pedidos(id),
    foreign key (id_itens) references tb_itens(id)
);

insert into tb_pedidos_itens (id_pedidos, id_itens, quantidade, subtotal) values
(4, 4, 2, 5178.00),
(5, 5, 2, 139.20),
(1, 3, 2, 1000.16),
(2, 1, 2, 197.8),
(3, 2, 2, 701.82), 
(4, 3, 2, 1000.16);

-- tb_itens ti
-- tb_produtos tp
-- tb_pedidos_itens tpi

select 
ti.nome,
ti.valor_unidade,
tpi.quantidade,
(ti.valor_unidade * tpi.quantidade) as 'subtotal', -- Aqui estamos realizando a soma da unidade do produto com sua quantidade e fazendo com que o total seja armazenado no 'subtotal'
tp.data_hora_pedido from tb_itens ti
inner join tb_pedidos_itens tpi
on tpi.id_itens = ti.id
inner join tb_pedidos tp
on tpi.id_pedidos = tp.id;
