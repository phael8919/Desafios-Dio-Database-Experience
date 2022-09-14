-- Criação do Schema e das tabelas do E-commerce

create schema e_commerce;
use e_commerce;

-- Clientes
create table cliente_pf(
	id_cliente_pf int not null auto_increment,
    nome_cliente_pf varchar(45) not null,
    cpf char(9) not null unique,
    endereço varchar(45),
    constraint pk_cliente_pf primary key(id_cliente_pf)
);
alter table cliente_pf modify column cpf varchar(45);

create table cliente_pj(
	id_cliente_pj int not null auto_increment,
    nome_cliente_pj varchar(45) not null,
    cnpj char(11) not null unique,
    endereço varchar(45),
    constraint pk_cliente_pj primary key(id_cliente_pj)
);
alter table cliente_pj modify column cnpj varchar(45);

create table cliente_pedido(
	id_cliente_pedido int not null auto_increment,
    id_cliente_pedido_pf int not null, 
	id_cliente_pedido_pj int not null, 
	constraint pk_cliente_pedido primary key(id_cliente_pedido),
    constraint fk_cliente_pf foreign key (id_cliente_pedido_pf) references cliente_pf (id_cliente_pf),
    constraint fk_cliente_pj foreign key (id_cliente_pedido_pj) references cliente_pj (id_cliente_pj)
);

alter table cliente_pedido modify column id_cliente_pedido_pf int;
alter table cliente_pedido modify column id_cliente_pedido_pj int;

-- Terceiro/Vendedor
create table terceiro_vendedor(
	id_terceiro int not null auto_increment,
    cnpj int not null unique,
    razao_social varchar(45) not null unique,
    endereco varchar(90) not null unique,
    constraint pk_terceiro_vendedor primary key(id_terceiro)
);
alter table terceiro_vendedor modify column cnpj varchar(45);

-- Fornecedor
create table fornecedor(
	id_fornecedor int not null auto_increment,
    cnpj int not null unique,
    razao_social varchar(45) not null unique,
    endereco varchar(90) not null unique,
    constraint pk_fornecedor primary key(id_fornecedor)
);
alter table fornecedor modify column cnpj varchar(45);

-- Estoque
create table estoque(
	id_estoque int not null auto_increment,
    local varchar(90) not null unique,
    constraint pk_estoque primary key(id_estoque)
);

-- Produto
create table produto(
	id_produto int not null auto_increment,
    categoria varchar(45) not null unique,
    descricao varchar(90) not null,
    valor decimal(18,2),
    constraint pk_produto primary key(id_produto)
);

-- Relações entre terceiro_vendedor, forncedor e estoque com a tabela produto
create table produtos_por_vendedor_terceiro(
	id_produtos_por_vendedor_terceiro int not null auto_increment,
	quantidade decimal(10,2),
    id_produto int not null,
    constraint pk_produtos_por_vendedor_terceiro primary key(id_produtos_por_vendedor_terceiro),
    constraint fk_produto foreign key (id_produto) references produto (id_produto)
); 

create table disponibilizando_um_produto(
	id_fornecedor int not null,
    id_produto int not null,
    primary key (id_fornecedor, id_produto),
    constraint fk_id_fornecedor foreign key (id_fornecedor) references fornecedor (id_fornecedor),
    constraint fk_id_produto foreign key (id_produto) references produto (id_produto)
);

create table produto_em_Estoque(
	id_produto int not null,
    id_estoque int not null,
    quantidade decimal(10,2) not null,
    observacao varchar(45),
    data_de_entrada_saida date not null,
    primary key (id_produto, id_estoque),
    constraint fk_id_produto_estoque foreign key (id_produto) references produto (id_produto),
    constraint fk_id_estoque_estoque foreign key (id_estoque) references estoque (id_estoque)
);

create table pedido_cliente(
	id_Pedido int not null auto_increment,
    descricao varchar(90) not null,
    id_produto_estoque int not null,    
    id_cliente_pedido int not null,
    id_forma_de_pagamento int not null,
    id_entrega int not null,
    constraint pk_id_pedido primary key (id_pedido),    
    constraint fk_id_produto_estoque_pedido_cliente foreign key (id_produto_estoque) references produto_em_Estoque (id_produto),    
    constraint fk_id_cliente_pedido_final_cliente foreign key (id_cliente_pedido) references cliente_pedido (id_cliente_pedido),
    constraint fk_id_forma_de_pagamento_cliente foreign key (id_forma_de_pagamento) references forma_de_pagamento (id_forma_de_pagamento),
    constraint fk_id_entrega_cliente foreign key (id_entrega) references entrega (id_entrega)
);

alter table pedido drop column id_produto_pedido;

create table relacao_de_produto_pedido(
	id_produto_relacao int not null,
    id_pedido_relacao int not null,
    quantidade decimal(10,2) not null,
    primary key (id_produto_relacao, id_pedido_relacao),
	constraint fk_id_produto_relacao foreign key (id_produto_relacao) references produto(id_produto)  
);

create table entrega(
	id_entrega int not null auto_increment,
    entregador varchar(45) not null, 
    status_da_entrega varchar(45) not null,
    codigo_de_rastreio int not null,
    frete decimal(10,2) not null,   
    constraint pk_entrega primary key(id_entrega)   
);


create table forma_de_pagamento(
	id_forma_de_pagamento int not null auto_increment,
    tipo_de_pagamento varchar(45) not null unique,    
    constraint pk_forma_de_pagamento primary key(id_forma_de_pagamento)   
);


-- lançar update em estoque quando exceutar a tabela pedido (dar baixa no estoque)