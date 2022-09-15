-- Persistencia dos dados

-- Inserindo dados nas tabelas e executando queries SELECT simples

-- Clientes e veículos
insert into cliente(nome_cliente, cpf_cnpj, endereço, telefone) values
	('João da Silva','12345678912','Rua X, 90, bairro x, CidadeABC-MG','31-99478-3088'),
    ('Mariana Santos','78945678945','Rua Y, 15, bairro y, CidadeABC-MG','31-99123-3088'),
    ('Carlos Oliveira','42845678939','Rua A, 05, bairro A, CidadeABC-MG','31-98478-3097'),
    ('Carla Santana','19745678948','Rua quatro, 37, bairro A, CidadeABC-MG','31-99967-3023'),
    ('Target Aluguel de Carros','27139027000116','Rua nove, 23, bairro x, CidadeABC-MG','31-98976-3018');
select * from cliente;

insert into veiculo(tipo, marca, placa, id_cliente) values
	('carro','celta-chevrolet','AUA9028',1),
    ('carro','gol-volkswagen','JNZ6119',2),
    ('furgão','fiorino-fiat','JIQ3540',3),
    ('picape','saveiro-volkswagen','AZB3181',4),
    ('carro','celta-chevrolet','IAO0602',5),
    ('carro','gol-volkswagen','NBH8664',5),
    ('carro','gol-volkswagen','MUB8021',5);

select * from veiculo;

-- equipes, equipe_ordem_de_serviço e mecânicos 
insert into equipe_revisão(nome, valor_hora) values
	('equipe_revisão',15.90);    
select * from equipe_revisão;

insert into equipe_conserto(nome, valor_hora) values
	('equipe_conserto',15.90);
update equipe_conserto set valor_hora = 20.90 where id_equipe_conserto=1;    
select * from equipe_conserto;

insert into equipe_ordem_de_serviço(id_equipe) values
	(1),
    (2);
select * from equipe_ordem_de_serviço;

insert into mecânico(nome, cpf, salario, carga_horaria, id_equipe) values
	('Mario de Carvalho','03369809060',1900.00,44.00,1),
    ('João Sá','83140980000',1900.00,44.00,1),
    ('Maria Silva','08972256005',1900.00,44.00,1),
    ('Carlos Freitas','71783055090',1900.00,44.00,1),
    ('Vinícios Santos','33093378044',2200.00,44.00,2),
    ('Joana Vieira','60305295012',2200.00,44.00,2),
    ('Eduardo Soares','29845099009',2200.00,44.00,2),
    ('Leandro Campos','73482077070',2200.00,44.00,2);	
select * from mecânico;

insert into peças(nome_peça, fabricante, quantidade, valor_peça) values
	('retrovisor','ZXY',20.00, 55.00),
    ('óleo de motor','Br petróleo',20.00, 15.00),
    ('Pneu','Firestone',20.00, 255.00),
    ('vidro_porta','AutoGlass',20.00, 102.90),
    ('carburador','autoPeças',20.00, 325.00);
delete from peças where id_peça >= 6;
select * from peças;
    
insert into peças_serviço(id_peça, quantidade_usada, id_ordem_de_serviço) values
	(1,1.00,1),
    (2,1.00,1),
    (3,1.00,2),
    (4,1.00,2),
    (5,1.00,3),
    (3,1.00,3),
    (2,1.00,4),
    (4,1.00,5),
    (1,1.00,6),
    (2,1.00,7),
    (3,1.00,8);
select * from peças_serviço;
    
insert into ordem_de_serviço(data_do_servico, horas_servico, id_veiculo, id_equipe_ordem_de_serviço) values
	('2022-01-15', 8.40, 1, 4),
    ('2022-01-20', 1.30, 2, 4),
    ('2022-01-22', 5.20, 3, 5),
    ('2022-01-27', 10.20, 4, 5),
    ('2022-02-05', 5.40, 5, 4),
    ('2022-02-12', 11.30, 6, 4),
    ('2022-02-17', 12.10, 7, 4),
    ('2022-03-05', 6.15, 8, 5);
select * from ordem_de_serviço;    

    
    
    