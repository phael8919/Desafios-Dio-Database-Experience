-- Explorando queries --

use oficina_mecanica;

-- select simples:
select * from cliente;
select * from veiculo;
select * from cliente, veiculo;

select * from equipe_ordem_de_serviço;
select * from equipe_revisão;
select * from equipe_conserto;
select * from mecânico;

select * from peças;
select * from peças_serviço;
select * from ordem_de_serviço;

-- filtros com where statement:
-- Relação veículos por cliente
select distinct nome_cliente, tipo, marca, placa from cliente c, veiculo v
	where c.id_cliente = v.id_cliente;

-- Relação veículos por cliente onde o tipo é 'carro'    
select distinct nome_cliente, tipo, marca, placa from cliente c, veiculo v
	where tipo = 'carro' and c.id_cliente = v.id_cliente;
    
-- relação mecânico e equipe
select distinct m.nome, m.salario, m.carga_horaria, er.nome, es.nome
	from mecânico m, equipe_ordem_de_serviço eos, equipe_revisão er, equipe_conserto es
    where m.id_equipe = eos.id_equipe;

-- Expressões com atributos derivados:
select distinct m.nome, m.salario, m.carga_horaria, 
	round(m.salario / m.carga_horaria,2) as salario_hora, er.nome, es.nome
	from mecânico m, equipe_ordem_de_serviço eos, equipe_revisão er, equipe_conserto es
    where m.id_equipe = eos.id_equipe;

-- Filtros com order by:
select distinct nome_cliente, tipo, marca, placa from cliente c, veiculo v
	where c.id_cliente = v.id_cliente
    order by nome_cliente;

select distinct nome_cliente, tipo, marca, placa from cliente c, veiculo v
	where c.id_cliente = v.id_cliente
    order by marca;


-- filtros com having statement:
select distinct marca, count(*) from veiculo 	  
    having count(*) > 1
    order by marca;
    
select distinct tipo, marca, count(*) from veiculo 	  
    having count(tipo) > 1
    order by marca;
    
-- Queries mais complexas 
-- Exibindo ordem de serviço completa: 

-- Ordem de serviço de todos os cliente da revisão:
select distinct ods.data_do_servico, cl.nome_cliente, c.marca, c.placa, p.nome_peça, ps.quantidade_usada, 
round(ps.quantidade_usada * p.valor_peça,2) as total_peças, ods.horas_servico, eqr.valor_hora,
round(eqr.valor_hora * ods.horas_servico,2) as total_valor_serviço,
round(((eqr.valor_hora * ods.horas_servico)+(ps.quantidade_usada * p.valor_peça)),2) as total_os
from ordem_de_serviço ods
inner join peças_serviço ps on ods.id_ordem_de_serviço = ps.id_ordem_de_serviço
inner join peças p on p.id_peça = ps.id_peça
inner join veiculo c on c.id_veiculo = ods.id_veiculo
inner join cliente cl on cl.id_cliente = c.id_cliente
inner join equipe_ordem_de_serviço eqos on eqos.id_equipe_ordem_de_serviço = ods.id_equipe_ordem_de_serviço

inner join equipe_revisão eqr on eqr.id_equipe_revisao = eqos.id_equipe

group by ods.data_do_servico
order by ods.data_do_servico;

-- Ordem de serviço de todos os cliente do serviço conserto:
select distinct ods.data_do_servico, cl.nome_cliente, c.marca, c.placa, p.nome_peça, ps.quantidade_usada, 
round(ps.quantidade_usada * p.valor_peça,2) as total_peças, ods.horas_servico, eqr.valor_hora,
round(eqr.valor_hora * ods.horas_servico,2) as total_valor_serviço,
round(((eqr.valor_hora * ods.horas_servico)+(ps.quantidade_usada * p.valor_peça)),2) as total_os
from ordem_de_serviço ods
inner join peças_serviço ps on ods.id_ordem_de_serviço = ps.id_ordem_de_serviço
inner join peças p on p.id_peça = ps.id_peça
inner join veiculo c on c.id_veiculo = ods.id_veiculo
inner join cliente cl on cl.id_cliente = c.id_cliente
inner join equipe_ordem_de_serviço eqos on eqos.id_equipe_ordem_de_serviço = ods.id_equipe_ordem_de_serviço

inner join equipe_conserto eqr on eqr.id_equipe_conserto = eqos.id_equipe

group by ods.data_do_servico
order by ods.data_do_servico;

