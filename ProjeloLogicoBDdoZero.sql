-- criação de um banco de dados cenário serviço streaming
create database idiomasfluente;

use idiomasfluente;

create table cursos(
	id_curso int not null,
    nome_curso varchar(50) not null,
    valor_curso decimal(10, 2) not null
);
select * from cursos;

create table alunos(
	id_aluno int not null,
    nome_aluno varchar(50) not null,
    email varchar(50)
);
select * from alunos;

create table vendas(
	id_venda int not null,
    data_venda date not null,
    id_curso int not null,
    id_aluno int not null
);
select * from vendas;

insert into cursos(id_curso, nome_curso, valor_curso)
values
	(1, 'Inglês', 1200),
    (2, 'Espanhol', 1000),
    (3, 'Francês', 900);

select * from cursos;

insert into alunos (id_aluno, nome_aluno, email)
values
	(1,'Marcos','marcos@gmail.com'),
    (2,'João','joao@gmail.com'),
    (3,'Pedro','pedro@gmail.com');
    
select * from alunos;

insert into vendas
values
	(1,'2023-01-03',1,2),
    (2,'2023-03-05',2,3),
    (3,'2023-04-03',3,2),
    (4,'2023-01-06',4,2),
    (5,'2023-02-03',1,1),
    (6,'2023-07-03',3,2);

select * from vendas;