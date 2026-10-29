-- create database dbjogos; script para criar database

 -- criando segunda tabela
create table dbjogos.atleta(
 id int not null auto_increment,
 nome varchar (60) not null,
 email varchar (60) not null,
 sexo char(1) not null,
 constraint pk_manual primary key(id),
 constraint uk_atleta_nome unique(nome),
 constraint valida1 check(sexo('m', 'f'))
 );
 
 -- drop table dbjogos.atleta; deletar tabela
 
create table dbjogos.equipe(
id int not null auto_increment,
nome varchar(60) not null,
composicao Enum ('masculino','feminino','misto') not null, 
data_criacao date not null,
data_inativacao date,
constraint pk_manual primary key(id),
constraint uk_equipe_nome unique(nome),
constraint fk_equipe_modalidade foreign key (modalidade_id) 
references dbjogos.modalidade(id)
);

-- criando primeira tabela
create table dbjogos.modalidade(
id int not null auto_increment primary key,
nome varchar (60) not null unique
);

create table dbjogos.equipe_atleta(
id int not null auto_increment primary key,
id_equipe int not null,
id_atleta int not null,
constraint uk_equipe_atleta unique(id_equipe, id_atleta)
);
--  column
-- id_modalidade int not null

 ALTER TABLE dbjogos.equipe add
constraint fk_equide_modalidade
	foreign key(id_modalidade)
    references modalidade(id);
    
ALTER TABLE dbjogos.equipe_atleta add
constraint fk_atleta
	foreign key(id_atleta)
    references atleta(id);
    
create table dbjogos.campeonato(
id int not null auto_increment primary key,
nome varchar (60) not null,
data_inicio date not null,
data_termino date,
id_modalidade int not null,
foreign key(id_modalidade)
references dbjogos.modalidade(id)
);

create table dbjogos.partida(
id int not null auto_increment primary key,
placar varchar (60) not null,
data_partida date not null,
hora_inicio time not null,
hora_termino time,
local varchar(60) not null,
id_equipe1 int not null,
id_equipe2 int not null,
id_campeonato int not null,
foreign key(id_campeonato)
references dbjogos.campeonato(id),
foreign key(id_equipe1)
references dbjogos.equipe(id),
foreign key(id_equipe2)
references dbjogos.equipe(id)
);

create table dbjogos.campeonato_equipe(
id int not null auto_increment primary key,
id_equipe int not null,
id_campeonato int not null,
constraint uk_idequipe_idcampeonato unique  (id_equipe,id_campeonato),
constraint fk_campeonatoequipe_equipe foreign key  (id_equipe) 
references dbjogos.equipe(id),
constraint fk_campeonatoequipe_camp foreign key  (id_campeonato) 
references dbjogos.campeonato(id)
);

insert into dbjogos.atleta(nome, email, sexo)
values ('ana','ana@gmail.com','f');
insert into dbjogos.atleta(nome, email, sexo)
values ('lucia','lucia@gmail.com','f');
insert into dbjogos.atleta(nome, email, sexo)
values ('marcos','marcos@gmail.com','m');
insert into dbjogos.atleta(nome, email, sexo)
values ('josé','jose@gmail.com','m');
insert into dbjogos.atleta(nome, email, sexo)
values ('steve','steve@gmail.com','m');
insert into dbjogos.atleta(nome, email, sexo)
values ('lucas','lucas@gmail.com','m');
insert into dbjogos.atleta(nome, email, sexo)
values ('leticia','leticia@gmail.com','f');
insert into dbjogos.atleta(nome, email, sexo)
values ('vanessa','vanessa@gmail.com','f');


insert into dbjogos.modalidade(nome)
values('handebol');
insert into dbjogos.modalidade(nome)
values('basquete');


insert into dbjogos.equipe(nome, data_criacao, id_modalidade)
values('ls','2024-12-03',1);
insert into dbjogos.equipe(nome, data_criacao, id_modalidade)
values('doubles','2023-06-04',2);
insert into dbjogos.equipe(nome, data_criacao, id_modalidade)
values('patricinhas','2025-11-08',1);
insert into dbjogos.equipe(nome, data_criacao, id_modalidade)
values('armario','2026-05-01',2);

insert into dbjogos.equipe_atleta(id_equipe,id_atleta)
values(1,2);
insert into dbjogos.equipe_atleta(id_equipe,id_atleta)
values(1,7);
insert into dbjogos.equipe_atleta(id_equipe,id_atleta)
values(2,3);
insert into dbjogos.equipe_atleta(id_equipe,id_atleta)
values(2,5);
insert into dbjogos.equipe_atleta(id_equipe,id_atleta)
values(3,1);
insert into dbjogos.equipe_atleta(id_equipe,id_atleta)
values(3,8);
insert into dbjogos.equipe_atleta(id_equipe,id_atleta)
values(4,4);
insert into dbjogos.equipe_atleta(id_equipe,id_atleta)
values(4,6);

insert into dbjogos.campeonato(nome, data_inicio, id_modalidade)
values('hand meninas', '2027-05-01', 1);
insert into dbjogos.campeonato(nome, data_inicio, id_modalidade)
values('basquete shows', '2026-12-01', 2);

insert into dbjogos.campeonato_equipe(id_equipe, id_campeonato)
values(1,1);
insert into dbjogos.campeonato_equipe(id_equipe, id_campeonato)
values(2,2);
insert into dbjogos.campeonato_equipe(id_equipe, id_campeonato)
values(3,1);
insert into dbjogos.campeonato_equipe(id_equipe, id_campeonato)
values(4,2);

insert into dbjogos.partida(placar, data_partida, hora_inicio, local, id_equipe1, id_equipe2, id_campeonato)
values('5-3', '2027-05-01', '14:00:00', 'blumenau', '1', '3', 1);
insert into dbjogos.partida(placar, data_partida, hora_inicio, local, id_equipe1, id_equipe2, id_campeonato)
values('5-3', '2026-12-01', '10:00:00', 'gaspar', '2', '4', 2);

select * from equipe;

INSERT INTO `dbjogos`.`atleta` (`NOME`, `EMAIL`, `SEXO`) VALUES ('Carlos Silva', 'costa_gal@gmail.com', 'M');
INSERT INTO `dbjogos`.`atleta` (`NOME`, `EMAIL`, `SEXO`) VALUES ('Salvio Santos', 'costaal@gmail.com', 'M');
INSERT INTO `dbjogos`.`atleta` (`NOME`, `EMAIL`, `SEXO`) VALUES ('Felipe Lima', 'mercury@gmail.com', 'M');
INSERT INTO `dbjogos`.`atleta` (`NOME`, `EMAIL`, `SEXO`) VALUES ('Célio', 'sapo@gmail.com', 'M');
INSERT INTO `dbjogos`.`atleta` (`NOME`, `EMAIL`, `SEXO`) VALUES ('Ana Lima', 'sapo@gmail.com', 'F');
INSERT INTO `dbjogos`.`atleta` (`NOME`, `EMAIL`, `SEXO`) VALUES ('Silvia Silva', 'tinha@bol.com.br', 'F');
INSERT INTO `dbjogos`.`atleta` (`NOME`, `EMAIL`, `SEXO`) VALUES ('Karine Salgadoi', 'tinha@bol.com.br', 'F');
INSERT INTO `dbjogos`.`atleta` (`NOME`, `EMAIL`, `SEXO`) VALUES ('Pedro Salgfado', 'tinha2@bol.com.br', 'M');
INSERT INTO `dbjogos`.`atleta` (`NOME`, `EMAIL`, `SEXO`) VALUES ('Carla Luz', 'tinha3@bol.com.br', 'F');
INSERT INTO `dbjogos`.`atleta` (`NOME`, `EMAIL`, `SEXO`) VALUES ('Andreza', 'pelican@bol.com.br', 'F');
INSERT INTO `dbjogos`.`atleta` (`NOME`, `EMAIL`, `SEXO`) VALUES ('Salvio Salvatori', 'sasa@terra.com.br', 'M');
INSERT INTO `dbjogos`.`atleta` (`NOME`, `EMAIL`, `SEXO`) VALUES ('Ana Salvatori', 'ana@terra.com.br', 'F');

select * from dbjogos.atleta
where sexo = 'M'
and id>= 12;

select * from dbjogos.atleta atl
where atl.email like '%@gmail.com'; 
-- like = como 
-- % anula/ignora informações de antes ou depois para filtrar informações especificas

select * from dbjogos.atleta atl
where atl.id between 5 and 15; -- between trabalha apenas com numeros

select * from dbjogos.atleta atl
order by atl.nome desc;
-- desc = descrecente, sem o desc fica crescente

select atl.email from dbjogos.atleta atl
group by atl.email; -- agrupa informações iguais

select count(*) from dbjogos.atleta atl; -- contar informações na tabela

select max(id) from dbjogos.atleta atl; -- maior valor do id, min() para menor

select avg(id) from dbjogos.atleta atl; -- media da tabela

select sum(id) from dbjogos.atleta atl; -- soma dos valores do id

select sum(id)/count(id) from dbjogos.atleta atl; -- soma dos valores do id

select avg(id) as 'media de valor', -- as nomeia alguma parte especifica que você quiser
sum(id)/count(id) as 'media manual',
max(id) as 'valor maximo',
min(id) as 'valor minimo',
count(id) as qtd_de_registro -- recomenado nomeação assim
from dbjogos.atleta atl;

select atl.sexo, count(atl.sexo)as quantidade from dbjogos.atleta atl
group by atl.sexo; -- filtrar quantidade de pessoas por sexo



select count(sexo) from dbjogos.atleta atl
where sexo = 'f';

-- 22/09 -- aprendendo sobre: inner join
select e.nome, e.modalidade_id from dbjogos.equipe e;

select e.nome, m.nome
from equipe e, modalidade m
where e.id_modalidade = m.id;
 
-- ou

select e.nome, m.nome
from equipe e inner join modalidade m
on e.id_modalidade = m.id;

-- 
select 
	e.nome as nome_equipe,
	m.nome as nome_modalidade, 
	a.nome as nome_atleta, 
    -- if(a.sexo = 'F', 'Feminino', 'Masculino') as sexo, -- condicional
	case -- condicional
		when a.sexo = 'F' then 'Feminino'
		when a.sexo = 'M' then 'Masculino'
		else a.sexo
	end as sexo,
	a.email
from equipe e
inner join modalidade m on e.id_modalidade = m.id
inner join equipe_atleta ea on e.id = ea.id_equipe
inner join atleta a on ea.id_atleta = a.id;

SELECT 
    c.nome AS campeonato,
    p.data_partida AS data,
    CONCAT(e1.nome, ' x ', e2.nome) AS jogo, -- junta informação de duas tabelas
    CONCAT('Placar: ', placar) AS resultado
FROM partida p
JOIN campeonato c ON p.id_campeonato = c.id
JOIN equipe e1 ON p.id_equipe1 = e1.id
JOIN equipe e2 ON p.id_equipe2 = e2.id
WHERE DATE(p.data_partida) = '2026-12-01'; -- filtra data



-- 29/09
insert into dbjogos.modalidade (nome) values ('beach tennis');
insert into campeonato (nome, data_inicio, id_modalidade) values ('1° campeonato de beach tennis bnu 2026', '2026-10-20', 3);

select * from equipe;
select * from campeonato;
select * from PARTIDA;

insert into equipe(nome, data_criacao,id_modalidade) values ('água verde', '2025-10-02',3);
insert into equipe(nome, data_criacao,id_modalidade) values ('asilo',  '2024-10-29',3);
insert into equipe(nome, data_criacao,id_modalidade) values ('velha',  '2025-06-14',3);
insert into equipe(nome, data_criacao,id_modalidade) values ('garcia',  '2025-02-07',3);
insert into equipe(nome, data_criacao,id_modalidade) values ('badenfurt', '2025-07-17', 3);
insert into equipe(nome, data_criacao,id_modalidade) values ('vila it.', '2025-08-01', 3);

insert into partida(id_campeonato, id_equipe1, id_equipe2,data_partida)
values(3, 5,9, '2026-10-20');
insert into partida(id_campeonato, id_equipe1, id_equipe2,data_partida)
values(3, 6,8, '2026-10-20');
insert into partida(id_campeonato, id_equipe1, id_equipe2,data_partida)
values(3, 7,10, '2026-10-20');
insert into partida(id_campeonato, id_equipe1, id_equipe2,data_partida)
values(3, 5,6, '2026-10-21');
insert into partida(id_campeonato, id_equipe1, id_equipe2,data_partida)
values(3, 8,10, '2026-10-21');
insert into partida(id_campeonato, id_equipe1, id_equipe2,data_partida)
values(3, 5,7, '2026-10-21');
insert into partida(id_campeonato, id_equipe1, id_equipe2,data_partida)
values(3, 6,9, '2026-10-22');
insert into partida(id_campeonato, id_equipe1, id_equipe2,data_partida)
values(3, 5,8, '2026-10-22');
insert into partida(id_campeonato, id_equipe1, id_equipe2,data_partida)
values(3, 7,9, '2026-10-23');
insert into partida(id_campeonato, id_equipe1, id_equipe2,data_partida)
values(3, 5,10, '2026-10-23');
insert into partida(id_campeonato, id_equipe1, id_equipe2,data_partida)
values(3, 9,8, '2026-10-24');
insert into partida(id_campeonato, id_equipe1, id_equipe2,data_partida)
values(3, 6,7, '2026-10-24');
insert into partida(id_campeonato, id_equipe1, id_equipe2,data_partida)
values(3, 6,10, '2026-10-25');
insert into partida(id_campeonato, id_equipe1, id_equipe2,data_partida)
values(3, 7,8, '2026-10-25');
insert into partida(id_campeonato, id_equipe1, id_equipe2,data_partida)
values(3, 8,10, '2026-10-26');


create or replace view vwjogos as -- tabelas de leituras (da para fazer ligação de joins com o view)
select 
	c.id,
    c.nome nome_campeonato,
	p.id as Jogo,
    DATE_FORMAT(p.data_partida,'%d/%m/%y') as 'Data',
    e1.nome as 'Time 1',
    e2.nome as 'Time 2'
from partida p
join campeonato c on p.id_campeonato = c.id 
join equipe e1 on p.id_equipe1= e1.id
join equipe e2 on p.id_equipe2= e2.id
-- where c.id_modalidade = 3
order by p.id asc;

select * from vwjogos where id = 3;

INSERT INTO atleta (nome, sexo, email) VALUES
('Carlos Silva', 'M', 'carlos@email.com'),
('Lucas Pereira', 'M', 'lucas@email.com'),
('Rafael Alves', 'M', 'rafael@email.com'),
('Gabriel Rocha', 'M', 'gabriel@email.com'),
('Bruno Santos', 'M', 'bruno@email.com'),
('Diego Ferreira', 'M', 'diego@email.com'),
('Matheus Oliveira', 'M', 'matheus@email.com'),
('Thiago Souza', 'M', 'thiago@email.com'),
('Bruno Lima', 'M', 'bruno@email.com'),
('Diego Ferre', 'M', 'diego@email.com'),
('Matheus Olive', 'M', 'matheus@email.com'),
('Thiago SANTOS', 'M', 'thiago@email.com');


INSERT INTO equipe_atleta (id_equipe, id_atleta) VALUES
(5, 9),
(5, 10),

(6, 11),
(6, 12),

(7, 16),
(7, 19),

(8, 22),
(8, 23),

(9, 24),
(9, 25),

(10, 26),
(10, 28);

SELECT 
    a.nome AS nome_atleta,
	case -- condicional
		when e.nome IS null then 'sem equipe'
        else e.nome
	end as nome_equipe
FROM atleta a
JOIN equipe_atleta ea ON a.id = ea.id_atleta
JOIN equipe e ON e.id = ea.id_equipe;

SELECT 
    a.nome AS nome_atleta,
    IFNULL(e.nome, 'Sem Equipe') AS nome_equipe
FROM atleta a
LEFT JOIN equipe_atleta ea ON a.id = ea.id_atleta
LEFT JOIN equipe e ON e.id = ea.id_equipe;


SELECT nome, 'Atleta' AS informacao FROM atleta
UNION ALL
SELECT nome, 'Equipe' AS loucura FROM equipe
order by 1 asc;
 
-- ATIVIDADE 20/10

select verificar_nome('Seu Nome');
select verificar_nome('Carlos');

SELECT inserir_equipe('Os Vingadores', 'Mista', 'Futebol');


-- atividade 27/10
SELECT eh_primo(7);  -- Retorna: É primoverificar_modalidade
SELECT eh_primo(10); -- Retorna: Não é primo

-- Se o Vôlei estiver cadastrado, vai retornar o ID (ex: '1')
SELECT verificar_modalidade('basquete');

-- Se não estiver cadastrado, vai retornar a mensagem de aviso
SELECT verificar_modalidade('Xadrez');

-- Soma os pares até 6 (2 + 4 + 6 = 12)
SELECT soma_pares_ate(6);

-- Soma os pares até 10 (2 + 4 + 6 + 8 + 10 = 30)
SELECT soma_pares_ate(10);

-- Testando a formatação
SELECT formatar_cpf_cnpj('12345678901');   -- Retorna: 123.456.789-01
SELECT formatar_cpf_cnpj('12345678000195'); -- Retorna: 12.345.678/0001-95

-- Testando a desformatação
SELECT desformatar_cpf_cnpj('123.456.789-01');   -- Retorna: 12345678901
SELECT desformatar_cpf_cnpj('12.345.678/0001-95'); -- Retorna: 12345678000195

SELECT gerar_matricula();

SELECT validar_documento('123.456.789-09');