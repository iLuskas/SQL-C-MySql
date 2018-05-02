create database if not exists bd_cursos
default character set utf8
default collate utf8_general_ci;

-- Criando tabelas --

-- Tipo --
create table if not exists tipo(
idtipo int not null auto_increment,
nome varchar(50) not null,
primary key (idtipo)
)default charset utf8;

-- Curso --
create table if not exists curso(
idcurso int not null auto_increment,
nome varchar(50) not null,
preco float not null,
primary key(idcurso)
)default charset utf8;


-- Instrutor --
create table if not exists instrutor(
idinstrutor int not null auto_increment,
nome varchar(150) not null,
telefone varchar(13) not null,
primary key(idinstrutor)
)default charset utf8;

-- Aluno --
create table if not exists aluno (
idaluno int not null auto_increment,
nome varchar(150) not null,
endereco varchar(45) not null,
email varchar(150) not null,
primary key(idaluno)
)default charset utf8;

-- Pedido --
create table if not exists pedido(
idpedido int not null auto_increment,
data date not null,
hora time not null,
primary key(idpedido)

)default charset utf8;

-- Pedido Detalhe -- 
create table if not exists pedido_detalhe(
idpedido int,
idcurso int,
valor float not null,
foreign key(idpedido) references pedido(idpedido),
foreign key(idcurso) references curso(idcurso)
)default charset utf8;

-- Alterando tabelas --

alter table aluno 
add column data_nascimento varchar(10) after nome;

alter table aluno
change column data_nascimento nascimento date not null;

alter table instrutor
add column email varchar(150) not null;

alter table aluno
drop column nascimento;

alter table curso
add column preco float not null;

alter table curso
add column idinstrutor int after idtipo;


alter table curso
add constraint idtipo
foreign key (idtipo) references tipo(idtipo);

alter table curso
add constraint idinstrutor 
foreign key (idinstrutor) references instrutor(idinstrutor);

alter table pedido
add column idaluno int after idpedido;

alter table pedido 
add constraint idaluno
foreign key(idaluno) references aluno(idaluno);

-- inserindo registros --

insert into tipo values
(default , 'Banco de dados'),
(default, 'Programação'),
(default,'Modelagem de dados');

insert into instrutor values
(default, 'André Milani', '1111-1111'),
(default, 'Carlos Tosin', '2222-2222');

insert into curso values
(default, 'Java Fundamentos', '2', '2', '270'),
(default, 'Java Avançado', '2', '2', '330'),
(default, 'SQL Completo', '1', '1', '170'),
(default, 'Php Básico', '2', '1', '270');

insert into aluno values
(default,'José', 'Rua XV de Novembro 72', 'jose@softblue.com.br'),
(default,'Wagner', 'Av. Paulista', 'wagner@softblue.com.br'),
(default,'Emilio', 'Rua Lajes 103, ap: 701', 'emilio@softblue.com.br'),
(default,'Cris', 'Rua Tauney 22', 'cris@softblue.com'),
(default,'Regina', 'Rua Salles 305', 'regina@softblue.com.br'),
(default,'Fernando', 'Av. Central 30', 'fernando@softblue.com.br');

insert into pedido values
(default, '2', '2010-04-15', '11:23:32'), 
(default, '2', '2010-04-15', '14:36:21'), 
(default, '3', '2010-04-16', '11:17:45'), 
(default, '4', '2010-04-17', '14:27:22'),
(default, '5', '2010-04-18', '11:18:19'), 
(default, '6', '2010-04-19', '13:47:35'),
(default, '6', '2010-04-20', '18:13:44');

insert into pedido_detalhe values
('1','1','270'),
('1','2','330'),
('2','1','270'),
('2','2','330'),
('2','3','170'),
('3','4','270'),
('4','2','330'),
('4','4','270'),
('5','3','170'),
('6','3','170'),
('7','4','270');
