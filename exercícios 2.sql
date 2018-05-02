-- Exibindo informações --

select * from aluno;
select * from curso;

select nome,preco from curso;

select nome,preco from curso
where preco between '200' AND '300';

select * from pedido
where data between '2010-04-15' AND '2010-04-18';

select * from pedido
where data = '2010-04-15';

-- Alterando Registros --

update aluno
set endereco = 'Av. Brasil 778'
where idaluno = '1';

update aluno
set email = 'cristiano@softblue.com.br'
where idaluno = '4';

update curso
set preco = preco * 1.1
where preco < '300';

update curso
set nome = 'Php Fundamentos'
where idcurso = '4';

