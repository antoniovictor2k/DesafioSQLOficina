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
-- delete from funcionarios where idOficina = 1;

desc veiculos;
alter table veiculos auto_increment = 10;
select idCliente id, Nome Nome_Completo from clientes;

insert into veiculos(idCliente, Marca,  Modelo, Ano, Defeito, DataDeEntrada, DataDeSaida) values
(1000,'Fiat','Uno Miller',2007,'Suspeção com problema', '2023-04-10', null),
(1004,'VW','GOL',2015,'Caixa de Marcha com problema', '2023-02-14', null),
(1002,'VW','Polo',2010,'Nível do óleo ficando baixo', '2023-05-10', null),
(1003,'Chevrolet','Celta',2003,'Fazer Motor', '2023-01-05', null),
(1001,'Honda','Civic',2018,'Instalar Jogo de rodas aro 17', '2023-06-20', null),
(1006,'Toyota','Corola',2022,'Revisão', '2023-07-11', null),
(1006,'Toyota','SW4',2016,'ar condicionado com Defeito', '2023-03-09', null),

(1007,'Fiat','Argo',2023,'Troca de Óleo', '2023-07-20', '2023-07-21'),
(1005,'peugeot','207',2007,'Carro não esta ligando', '2020-02-27', '2023-08-31');


-- delete from veiculos;
select * from veiculos;

desc reparos;
select idveiculo, idCliente, modelo, defeito From veiculos;
select idfuncionario, nome, demissao From funcionarios where cargo = 'mecanico';

-- select idfuncionario, nome, demissao idveiculo, idCliente, modelo, defeito From funcionarios, veiculos;
select idfuncionario, nome, demissao From funcionarios where cargo = 'mecanico' and demissao = null;

alter table reparos auto_increment = 200;
insert into reparos (IdCliente, idVeiculo, idFuncionario, Tipo, Orcamento, AprovacaoDoCliente) values
(1000,10,4000,'substituição por um par de suspensão novo',1600.00,false),
(1005,18,4000,'Fazer Motor e parte eletrica do carro',9754.02,false),
(1004,11,4001,'Colocar uma caixa de marchar nova',6000.00,false),

(1003,13,4000,'Fazer motor',3200.00,true),
(1007,17,4001,'Óleo do motor',450.00,true);

select * from reparos;




