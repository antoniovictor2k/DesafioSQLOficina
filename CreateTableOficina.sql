create database if not exists Oficina;
use oficina;
show tables;


create table Oficina(
     idOficina int primary key auto_increment,
     RazaoSocial varchar(50) not null,
     CNPJ char(15) not null unique,
     Endereco varchar(40)
);

-- drop table Oficina;

create table Clientes(
    idCliente int primary key auto_increment,
    idOficina int,
    CPF char(11) not null unique,
    Endereco varchar(40),
    DataDeNascimento date not null,
    constraint Fk_id_Oficina_Clientes foreign key (idOficina) references oficina(idOficina)
);

-- drop table Clientes;

create table Funcionarios(
	idFuncionario int primary key auto_increment,
    idOficina int,
    Nome varchar(40) not null,
    CPF char(11) not null unique,
	Cargo enum('mecanico', 'atendente'),
    DataDeNascimento date not null,
	Salario float not null,
    Admissão date not null,
	Demissao date,
	constraint Fk_id_Oficina_Funcionarios foreign key (idOficina) references oficina(idOficina)
);
create table Veiculos(
    idVeiculo int primary key auto_increment,
    idCliente int,
	Marca varchar(20) not null,
    Modelo varchar(20) not null,
    Ano year(4),
    Defeito varchar(255) not null,
	DataDeEntrada date not null,
    DataDeSaida date,
    constraint Fk_id_Cliente_Veiculos foreign key (IdCliente) references clientes(IdCliente)
);
create table Reparos(
	idReparo int primary key auto_increment,
    IdCliente int,
    idVeiculo int,
    idFuncionario int,
    Tipo varchar(255) not null,
    Orcamento float not null,
    AprovacaoDoCliente boolean,
    constraint Fk_id_Cliente_Reparos foreign key (IdCliente) references clientes(IdCliente),
	constraint Fk_id_Veiculo_Reparos foreign key (idVeiculo) references veiculos(idVeiculo),
    constraint Fk_id_Funcionario_Reparos foreign key (idFuncionario) references funcionarios(idFuncionario)
    );
    
    show tables;

