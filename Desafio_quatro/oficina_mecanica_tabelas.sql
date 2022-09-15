-- Criação do Schema e das tabelas da oficina mecânica

create schema oficina_mecanica;

use oficina_mecanica;

create table cliente(
	id_cliente int not null auto_increment,
    nome_cliente varchar(45) not null,
    cpf_cnpj varchar(45) not null,
    endereço varchar(45) not null,
    telefone varchar(45) not null,
    constraint pk_id_cliente primary key(id_cliente)
);

create table veiculo(
	id_veiculo int not null auto_increment,
    tipo varchar(45) not null,
    marca varchar(45) not null,
    placa varchar(45) not null,
    id_cliente int not null,
    constraint pk_id_veiculo primary key(id_veiculo),
    constraint fk_id_cliente foreign key (id_cliente) references cliente (id_cliente)
);

create table equipe_revisão(
	id_equipe_revisao int not null auto_increment,
    nome varchar(45) not null, -- só escrever equipe_revisão
    valor_hora decimal (10,2) not null,
    constraint pk_id_equipe_revisao primary key(id_equipe_revisao)
);

create table equipe_conserto(
	id_equipe_conserto int not null auto_increment,
    nome varchar(45) not null, -- só escrever equipe_conserto
    valor_hora decimal (10,2) not null,
    constraint pk_id_equipe_conserto primary key(id_equipe_conserto)
);

create table equipe_ordem_de_serviço(
	id_equipe_ordem_de_serviço int not null auto_increment,
    id_equipe int not null,
	constraint pk_id_equipe_ordem_de_serviço primary key(id_equipe_ordem_de_serviço),
    constraint fk_id_equipe_revisao foreign key (id_equipe) references equipe_revisão (id_equipe_revisao),
    constraint fk_id_equipe_conserto foreign key (id_equipe) references equipe_conserto (id_equipe_conserto)    
);

create table mecânico(
	id_mecânico int not null auto_increment,
    nome varchar(45) not null,
    cpf varchar(45) not null,
	salario decimal(10,2) not null,
    carga_horaria decimal(10,2) not null,
    id_equipe int not null,
    constraint pk_id_mecânico primary key(id_mecânico),
    constraint fk_id_equipe foreign key (id_equipe) references equipe_ordem_de_serviço (id_equipe)
);

create table peças(
	id_peça int not null auto_increment,
    nome_peça varchar(45) not null,
    fabricante varchar(45) not null,
    quantidade decimal(10,2) not null,
    constraint pk_id_peça primary key (id_peça)
);
alter table peças add column valor_peça decimal (10,2);

-- Recebe o id_ordem_de_serviço com chave estrangeira
create table peças_serviço(
	id_peça_serviço int not null auto_increment,
    id_peça int,
    quantidade_usada decimal(10,2) not null,
    id_ordem_de_serviço int not null,
    constraint pk_id_peça_serviço primary key (id_peça_serviço),
    constraint fk_id_ordem_de_serviço foreign key (id_ordem_de_serviço) references ordem_de_serviço (id_ordem_de_serviço)
);

create table ordem_de_serviço(
	id_ordem_de_serviço int not null auto_increment,
    data_do_servico date not null,
    horas_servico decimal(10,2) not null,
    id_veiculo int not null,
    id_equipe_ordem_de_serviço int not null,
    constraint pk_id_ordem_de_serviço primary key(id_ordem_de_serviço),
    constraint fk_id_veiculo foreign key (id_veiculo) references veiculo (id_veiculo),
    constraint fk_id_equipe_ordem_de_serviço foreign key (id_equipe_ordem_de_serviço) references equipe_ordem_de_serviço (id_equipe_ordem_de_serviço)
);

