-- Persistencia dos dados

use e_commerce;

-- Persistindo as tabelas cadastráveis
-- + Recuperações simples com SELECT Statement
insert into cliente_pf(nome_cliente_pf,cpf,endereço) values
	('Eduardo Silva','03243378912','Rua x, Bairro Y, Cidade abc-MG'),
    ('Mariana Gouveia','12378945612','Rua x, Bairro Z, Cidade abc-ES'),
    ('João Carlos Masdeira','78943378912','Rua 9, Bairro ca, Cidade cdc-SP'),
    ('Eduarda Moreira','48943378989','Rua x, Bairro S, Cidade abc-MG'),
    ('Marcos Santos','98743378912','Rua Z, Bairro Y, Cidade ghtc-RJ');

select * from cliente_pf;

insert into cliente_pj(nome_cliente_pj,cnpj,endereço) values
	('Loja ABCD','62765530000188','Rua Z, Bairro Y, Cidade ghtc-RJ'),
    ('Loja Nova','34082643000143','Rua 10, Bairro Y, Cidade adfc-RS'),
    ('SJ distribuidora','90591207000170','Rua 20, Bairro B, Cidade abc-MG');
    
select * from cliente_pj;

insert into terceiro_vendedor(cnpj, razao_social, endereco) values
	('62765530000188','ABCD distribuidora','Rua 9, Bairro ca, Cidade cdc-SP'),
    ('12778064000105','Nova distribuidora','Rua 10, Bairro novo, Cidade abc-MG'),
    ('74280000000129','ZYZ distribuidora','Rua 20, Bairro novo, Cidade Nova-MG');
    
select * from terceiro_vendedor;

insert into fornecedor(cnpj, razao_social, endereco) values 
	('12438558000132','ABCD distribuidora','Rua A, Bairro ca, Cidade cdc-SP'),
    ('78587869000171','Nova distribuidora','Rua 10, Bairro novo, Cidade abc-MG'),
    ('37300884000100','Galo distribuidora','Rua 9, Bairro ca, Cidade cdc-SP'),
    ('83821210000178','Cidade distribuidora','Rua C, Bairro novo, Cidade abc-MG'),
    ('43076129000196','e-lojas distribuidora','Rua J, Bairro novo, Cidade Nova-MG');
    
select * from fornecedor;

insert into produto(categoria, descricao, valor) values
	('Vestuario 1','Produto VA',60.50),
    ('Vestuario 2','Produto VB',56.30),
    ('Vestuario 3','Produto VC',70.00),
    ('Calçados 1','Produto CA',180.00),
    ('Calçados 2','Produto CB',130.00),
    ('Do lar','Produto DLA',20.90),
    ('Eletronicos 1','Produto EA',1800.00),
    ('Eletronicos 2','Produto EB',3600.00);
    
 select * from produto;  
 
 insert into estoque(local) values
	('Galpão A'),
    ('Galpão B');
    
select * from estoque;
 
 insert into forma_de_pagamento(tipo_de_pagamento) values
	('boleto'),
    ('pix'),
    ('cartão de crédito'),
    ('cartão de débito');

select * from forma_de_pagamento;

-- Persistindo as primeiras relações

insert into produtos_por_vendedor_terceiro(quantidade, id_produto) values
	(20.0,9),
    (30.0,10),
    (40.0,11),
    (59.0,12),
    (70.0,13),
    (36.0,14),
    (25.0,15),
    (10.0,16);
    
select * from produtos_por_vendedor_terceiro;
    
-- Relação do forncedor com o produto forncido
insert into disponibilizando_um_produto(id_fornecedor, id_produto) values
	(9,6),
    (10,7),
    (11,8),
    (12,9),
    (13,10),
    (14,6),
    (15,9),
    (16,8);
    
 select * from disponibilizando_um_produto;  
 
 insert into produto_em_Estoque(id_produto, id_estoque, quantidade, observacao, data_de_entrada_saida) values 
	(10,1,20.0,'obs.','2020-01-10'),
    (11,1,20.0,'obs.','2020-01-10'),
    (12,1,20.0,'obs.','2020-01-10'),
    (13,2,20.0,'obs.','2020-01-10'),
    (14,2,20.0,'obs.','2020-01-10'),
    (15,2,20.0,'obs.','2020-01-10'),
    (16,2,20.0,'obs.','2020-01-10');
    
select * from produto_em_Estoque;

select * from produto;
insert into produtos_por_vendedor_terceiro(quantidade,id_produto) values
	(20.00,10),
    (20.00,11),
    (20.00,12),
    (20.00,13),
    (20.00,14),
    (20.00,15),
    (20.00,16);
    
select * from produtos_por_vendedor_terceiro;

-- relações diretas com a tabela pedido
-- inserindo cliente pf
insert into cliente_pedido(id_cliente_pedido_pf) values
	(1),
    (2),
    (3),
    (4),
    (5);
 
-- inserindo cliente pj
insert into cliente_pedido(id_cliente_pedido_pj) values
	(1),
    (2),
    (3);
    
select * from cliente_pedido;

-- Inserindo os fretistas e status

insert into entrega(entregador, status_da_entrega, codigo_de_rastreio, frete) values 
	('Fretista A','Andamento-entregue',123,28.85),
    ('Fretista B','Andamento-entregue',456,31.05),
    ('Fretista C','Andamento-entregue',789,21.05);

select * from entrega;

select * from produto_em_Estoque; -- 9 a 10
select * from cliente_pedido; -- 1 a 5 pf; 6 a 8 pj
select * from entrega;

-- Tabela pedido
insert into pedido_cliente(descricao,id_produto_estoque,id_cliente_pedido,id_forma_de_pagamento,id_entrega) values
	('Pedido 2',10,2,1,1),
    ('Pedido 3',11,3,2,2),
    ('Pedido 4',12,4,1,1),
    ('Pedido 5',13,5,3,3),
    ('Pedido 6',14,6,1,2),
    ('Pedido 7',15,7,4,3),
    ('Pedido 8',16,8,1,1),
    ('Pedido 9',9,2,2,2),
    ('Pedido 10',10,3,2,3),
    ('Pedido 11',9,4,1,1),
    ('Pedido 12',11,5,4,3),
    ('Pedido 13',9,6,3,2),
    ('Pedido 14',12,7,1,1);
    
select * from pedido_cliente;