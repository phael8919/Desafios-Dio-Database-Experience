use e_commerce;

-- filtros com where statement --
select * from produto
	where valor < 100;
    
select * from produto
	where valor > 100;
    
select * from cliente_pf
	where endereço like '%MG%';

select * from cliente_pj
	where endereço like '%MG%';

select categoria, p.descricao, valor, e.quantidade, round(valor * quantidade,2) as valor_total
	from produto p, produto_em_Estoque e 
	where p.id_produto = e.id_produto;
    
-- expressões com atributos derivados --
select id_produto, concat(categoria," - " ,descricao) as categora_produto, valor
	from produto
    group by id_produto;
    
select id_produto, descricao, valor, 
round(valor * 0.2,2) as desconto
	from produto
    group by id_produto
    order by desconto;

select categoria, p.descricao, valor, e.quantidade, round(valor * quantidade,2) as valor_total
	from produto p, produto_em_Estoque e 
	where p.id_produto = e.id_produto;
    
-- ordenaçãoes com order by --
select id_produto, concat(categoria," - " ,descricao) as categora_produto, valor
	from produto
    order by valor;

select id_produto, concat(categoria," - " ,descricao) as categora_produto, valor
	from produto
    order by valor desc;

-- Filtros com having statement --    
select categoria, p.descricao, valor, e.quantidade, round(valor * quantidade,2) as valor_total
	from produto p, produto_em_Estoque e 
	where p.id_produto = e.id_produto  
    having count(*) >0;
    
-- Junções de tabelas --
select categoria, p.descricao, valor, e.quantidade, round(valor * quantidade,2) as valor_total
	from produto p
    inner join produto_em_Estoque e 
	where p.id_produto = e.id_produto
    order by categoria;      


  -- relação pedido mais tipo de pagamento 
select distinct pc.descricao, po.descricao, fp.tipo_de_pagamento from pedido_cliente as pc
inner join produto_em_Estoque pe on pc.id_produto_estoque = pe.id_produto
inner join cliente_pedido cp on cp.id_cliente_pedido = pc.id_cliente_pedido
inner join produto po on po.id_produto = pe.id_produto
inner join forma_de_pagamento fp on fp.id_forma_de_pagamento = pc.id_forma_de_pagamento
order by fp.tipo_de_pagamento;

-- Tipos de pagamentos mais utilizados
select distinct fp.tipo_de_pagamento, count(fp.tipo_de_pagamento) as quant from pedido_cliente as pc
inner join produto_em_Estoque pe on pc.id_produto_estoque = pe.id_produto
inner join cliente_pedido cp on cp.id_cliente_pedido = pc.id_cliente_pedido
inner join produto po on po.id_produto = pe.id_produto
inner join forma_de_pagamento fp on fp.id_forma_de_pagamento = pc.id_forma_de_pagamento
group by fp.tipo_de_pagamento;

    
