use oficina;
show tables;

-- clientes
-- funcionarios
-- oficina
-- reparos
-- veiculos

desc oficina;
insert into oficina values
(1,'Vtec Rep', 123456789123456,'Maceió-AL,Av Fernades Lima N4000, Farol');

select * from oficina;

alter table clientes auto_increment = 1000;
desc clientes;
alter table clientes add column Nome varchar(40);
insert into clientes (idOficina, CPF, Endereco, DataDeNascimento , Nome)values
(1,123456789,'Maceió-al, Rua A N32, Tabuleiro','1981-04-12','Julio Souza'),
(1,123456987,'Maceió-al, Rua B N12, Biu','1971-10-08','Antonio Carlos'),
(1,123456456,'Maceió-al, Rua C N65, Jacitinho','1999-01-01','João Santos'),
(1,123456654,'Capela-al, Rua D N100, Centro','1988-12-03','Matheus Silva'),
(1,123456123,'Pilar-al, Rua E N242, Chã','2000-03-25','Natalia Santos'),
(1,123456321,'Rio Largo-al, Rua F N51, Centro','2002-02-27','Henrique Silva'),
(1,123456234,'Atalaia-al, Rua G N22, Santos','2001-07-05','Marcos Lyra'),
(1,123456432,'Maceió-al, Rua I N98, Farol','1999-09-19','Gustavo Barros');

select * from clientes;


desc funcionarios;
alter table funcionarios auto_increment = 4000;
insert into funcionarios (idOficina, Nome, CPF, Cargo, DataDeNascimento, Salario, Admissão, Demissao) values
(1,'Ricardo Pereira',987987987,'mecanico','1980-01-20',7641.45,'2018-05-18', null),
(1,'Alex Alves',321321321,'mecanico','1999-04-23', 4571.21, '2021-01-12',  null),
(1,'Anthony Santos',654654654,'atendente','2003-06-12',2459.78 ,'2022-03-21', null);

insert into funcionarios (idOficina, Nome, CPF, Cargo, DataDeNascimento, Salario, Admissão, Demissao) values
(1,'Antonio Pereira',14714714714,'mecanico','1971-11-04',7641.45,'2014-05-18','2021-01-01'),
(1,'Andre Alves',25825825825,'atendente','1979-07-25', 3571.21, '2016-10-05',  '2022-03-03');

select * from funcionarios;

