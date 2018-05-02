-- RESPOSTA DO EXERCICIOS 6 --

select * from pedido_detalhe;
select * from pedido;
select preco from curso;

-- Selecione os nomes de todos os alunos que já fizeram alguma matrícula na Softblue, sem repetição --
select a.nome, count(p.idpedido) as pedidos from pedido as p
inner join aluno as a on a.idaluno = p.idaluno
group by a.nome;

-- Exiba o nome do aluno mais antigo da Softblue --
select a.nome, p.data, p.hora from pedido as p
inner join aluno as a on a.idaluno = p.idaluno
order by p.data, p.hora limit 3;

-- Exiba o nome do aluno mais recente da Softblue --
select a.nome, p.data, p.hora from pedido as p
inner join aluno as a on a.idaluno = p.idaluno
order by p.data desc, p.hora desc limit 1;

-- Exiba o nome do terceiro aluno mais antigo da Softblue --
select a.nome, p.data, p.hora from pedido as p
inner join aluno as a on a.idaluno = p.idaluno
group by a.nome
order by p.data , p.hora  limit 1 offset 2;

-- Exiba a quantidade de cursos que já foram vendidos pela Softblue --
select count(idcurso) as "TOTAL DE CURSOS VENDIDOS" from pedido_detalhe;

-- Exiba o valor total já arrecadado pelos cursos vendidos pela Softblue --
select sum(valor) as "VALOR TOTAL" from pedido_detalhe;

-- Exiba o valor médio cobrado por curso para o pedido cujo CODIGO é 2 --
select avg(valor) as MEDIA from pedido_detalhe
where idpedido = '2';

-- Exiba o valor do curso mais caro da Softblue --
select max(valor) as "MAIS CARO" from pedido_detalhe;

-- Exiba o valor do curso mais barato da Softblue --
select min(valor) as "MAIS BARATO" from pedido_detalhe;

-- Exiba o valor total de cada pedido realizado na Softblue --
select idpedido, sum(valor) as TOTAL from pedido_detalhe
group by idpedido; 

-- Exiba os nomes dos instrutores da Softblue e a quantidade de cursos que cada um tem sob sua responsabilidade --
select i.nome, count(i.idinstrutor) as RESPONSABILIDADE from curso as c
inner join instrutor as i on i.idinstrutor = c.idinstrutor
group by c.idinstrutor;

-- Exiba o número do pedido, nome do aluno e valor para todos os pedidos realizados na Softblue cujo valor total sejam maiores que 500 --

select p.idpedido, a.nome, sum(pd.valor) from pedido_detalhe as pd
inner join pedido as p on p.idpedido = pd.idpedido
inner join aluno as a on a.idaluno = p.idaluno
group by p.idpedido
having sum(pd.valor) > '500';

/* Exiba o número do pedido, nome do aluno e quantos cursos foram comprados no pedido 
para todos os pedidos realizados na Softblue que compraram dois ou mais cursos */
select p.idpedido, a.nome, count(p.idpedido) from pedido_detalhe as pd
inner join pedido as p on p.idpedido = pd.idpedido
inner join aluno as a on a.idaluno = p.idaluno
group by p.idpedido
having count(p.idpedido) > '1'; 

-- Exiba o nome e endereço de todos os alunos que morem em Avenidas (Av.)
select * from aluno
where endereco like 'Av%';

-- Exiba os nomes dos cursos de Java da Softblue --
select * from curso
where nome like '%Java%';

