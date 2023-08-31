use oficina;
show tables;

-- select padrão de todas as tabelas

select * from oficina;
select * from clientes;
select * from funcionarios;
select * from veiculos;
select * from reparos;


-- Todos os Clientes que são de maceió
select idCliente, Nome, CPF, Endereco, DataDeNascimento from clientes
where Endereco like '%Maceió%'
order by Nome
;

-- Todos os funcionários que foram demitidos.
select idFuncionario, Nome, CPF, Cargo, Salario, Admissão, Demissao  from funcionarios
where Demissao is not null;

-- Todos os funcionários que foram demitidos e suas contas.
select idFuncionario, Nome, CPF, Cargo, Salario, Admissão, Demissao, round(Salario*5.5,2) Acordo_trabalhista,
case 
when year(demissao) > 2021 then round( (Salario*5.5) + (salario*2.15),2)
when year(demissao) > 2020 then round( (Salario*5.5) + (salario*1.7),2)
when year(demissao) > 2019 then round( (Salario*5.5) + (salario*1.45),2)
when year(demissao) > 2018 then round( (Salario*5.5) + (salario*1.25),2)
else salario*1.1
end Rescisão
from funcionarios
where Demissao is not null
order by nome;

-- selecionar todos os veiculos que ano maior ou igual a 2014
select idVeiculo, Marca, Modelo, Ano from veiculos
where Ano >= 2014;

-- selecionar todos os veiculos que ano entre 2017 a 2022.
select idVeiculo, Marca, Modelo, Ano 
from veiculos
where ( Ano between 2017 and 2022 );

-- quantidade de veiculos por marca e ordenar pela maior quantidade.

SELECT Marca, COUNT(idVeiculo) AS QuantidadeDeVeiculos
FROM veiculos
GROUP BY Marca
order by COUNT(idVeiculo) desc;




-- mostrar funcionários que estão no cargo de mecanico e não foram demitidos.

SELECT idfuncionario, nome, demissao 
FROM funcionarios 
WHERE cargo = 'mecanico' AND demissao IS NULL
order by nome;


select * from reparos;

-- juntar as tabelas

SELECT *
FROM reparos
INNER JOIN clientes
ON reparos.IdCliente = clientes.idCliente
inner join funcionarios 
on reparos.idFuncionario = funcionarios.idFuncionario
inner join veiculos
on reparos.idVeiculo = veiculos.idVeiculo
;

-- juntar as tabelas e mostrar somente dados que seja interessantes + bônus de 3% sobre o orçamento para o funcionário e ordenar pelo nome do cliente.

select * from reparos;
select * from clientes;
select * from veiculos;
select * from funcionarios;

SELECT reparos.idReparo iD_Reparo, clientes.Nome Nome_Cliente, clientes.CPF CPF_Cliente, 
veiculos.Marca, veiculos.Modelo, veiculos.Defeito Defeito_do_Veiculo, 
funcionarios.Nome Nome_do_Funcionário, funcionarios.CPF CPF_do_Funcionário ,round(reparos.Orcamento*0.03,2) Bônus_pelo_serviço_para_o_funcionário, 
reparos.Orcamento Orçamento
FROM reparos
INNER JOIN clientes
ON reparos.IdCliente = clientes.idCliente
inner join funcionarios 
on reparos.idFuncionario = funcionarios.idFuncionario
inner join veiculos
on reparos.idVeiculo = veiculos.idVeiculo
where AprovacaoDoCliente is true
order by clientes.Nome;

