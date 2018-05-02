select c.nome, (select min(valor) from pedido_detalhe as pd where pd.idcurso = c.idcurso) as MENOR_VALOR from curso as c;

select c.nome from curso as c
where c.idtipo in (select idtipo from tipo where nome = 'Programação');

select c.nome from curso as c
where exists (select idtipo from tipo where nome = 'Programação' AND c.idtipo = tipo.idtipo);

select i.nome, (select sum(pd.valor) from pedido_detalhe as pd inner join curso as c on c.idcurso = pd.idcurso where c.idinstrutor = i.idinstrutor ) as ACUMULADO from instrutor as i;

select a.nome, (select sum(pd.valor) from pedido_detalhe as pd inner join pedido as p on p.idpedido = pd.idpedido where p.idaluno = a.idaluno) as "Valor total de compras"  from aluno as a;

create view aluno_compras as
select a.nome, (select sum(pd.valor) from pedido_detalhe as pd inner join pedido as p on p.idpedido = pd.idpedido where p.idaluno = a.idaluno) as "Valor total de compras"  from aluno as a;
