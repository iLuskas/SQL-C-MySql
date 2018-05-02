-- Buscando registros utilizando o inner join --

select c.nome, t.nome from curso as c
inner join tipo as t
on c.idtipo = t.idtipo
order by c.nome;

select c.nome as TIPO, t.nome as CURSO, i.nome AS INSTRUTOR, i.telefone from curso as c
inner join tipo as t on c.idtipo = t.idtipo
inner join instrutor as i on c.idinstrutor = i.idinstrutor
order by i.nome;

select p.idpedido, p.data, p.hora, pd.idcurso from pedido as p
inner join pedido_detalhe as pd on p.idpedido = pd.idpedido;

select p.idpedido, p.data, p.hora, c.nome from pedido as p
inner join pedido_detalhe as pd on pd.idpedido = p.idpedido
inner join curso as c on c.idcurso = pd.idcurso;

select p.idpedido, p.data, p.hora, a.nome as aluno, c.nome as curso from pedido as p
inner join aluno as a on a.idaluno = p.idaluno
inner join pedido_detalhe as pd on pd.idpedido = p.idpedido
inner join curso as c on c.idcurso = pd.idcurso
order by p.idpedido;

-- Criando visões --

/*Visões são padrões que o proprio programador utilizar para fazer buscas mais rapidas, serve para encurta o codigo.*/

create view cursos_programacao 
as select c.nome, c.preco from curso as c
inner join tipo as  t on t.idtipo = c.idtipo
where t.nome = 'Programação';

create view curso_instrutor as
select c.nome as curso, t.nome as tipo, i.nome as instrutor from curso as c
inner join tipo as t on t.idtipo = c.idtipo
inner join instrutor as i on i.idinstrutor = c.idinstrutor;

create view all_pedidos as
select p.idpedido, p.data, a.nome as aluno from pedido as p
inner join aluno as a on a.idaluno = p.idaluno;
