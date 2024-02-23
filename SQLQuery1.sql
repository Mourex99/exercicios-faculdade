--Criando o Banco

CREATE DATABASE RH_UPPER;

--Colocar o banco em uso

USE RH_UPPER;

--Criar a tabela para o cadastro de Funcionários

CREATE TABLE Funcionarios (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    RG VARCHAR(15) NOT NULL,
    CPF VARCHAR(14) NOT NULL,
    Salario DECIMAL(10, 2) NOT NULL,
    Sexo CHAR(1) NOT NULL,
    Endereco VARCHAR(200) NOT NULL,
    Telefone VARCHAR(15) NOT NULL,
    DataNascimento DATE NOT NULL
);

--Inserir funcionários

INSERT INTO Funcionarios (Nome, RG, CPF, Salario, Sexo, Endereco, Telefone, DataNascimento)
VALUES
    ('Neymar JR', '1234567', '123.456.789-00', 5000.00, 'M', 'Rua Santos, Nº 123', '(11) 1234-5678', '1992-02-05'),
    ('Ayrton Senna', '9876543', '987.654.321-00', 5500.00, 'M', 'Rua Imola, Nº 456', '(11) 9876-5432', '1960-03-21'),
    ('Michael Jackson', '4567890', '456.789.123-00', 4800.00, 'M', 'Rua Gary Indiana, Nº 789', '(11) 4567-8901', '1958-08-29'),
    ('Daiane dos Santos', '6543210', '654.321.987-00', 6000.00, 'F', 'Rio de Janeiro, Nº 101', '(11) 6543-2109', '1983-02-10'),
    ('Rubinho Barrichelo', '7890123', '789.012.345-00', 5200.00, 'M', 'Interlagos, Nº 234', '(11) 7890-1234', '1972-05-23');

--Pesquisar a Quantidade de Funcionários, Total da Folha de Pagamento, Menor e Maior Salário e Média Salarial:

-- Quantidade de funcionários
SELECT COUNT(*) AS QuantidadeFuncionarios FROM Funcionarios;

-- Total da folha de pagamento
SELECT SUM(Salario) AS TotalFolhaPagamento FROM Funcionarios;

-- Menor salário
SELECT MIN(Salario) AS MenorSalario FROM Funcionarios;

-- Maior salário
SELECT MAX(Salario) AS MaiorSalario FROM Funcionarios;

-- Média salarial
SELECT AVG(Salario) AS MediaSalarial FROM Funcionarios;

--Pesquise a quantidade de dias vividos por cada funcionário:
SELECT Nome, DATEDIFF(DAY, DataNascimento, GETDATE()) AS DiasVividos FROM Funcionarios;

--Exiba o ANO, MÊS e DIA separadamente das datas de nascimento:
SELECT 
    Nome, 
    YEAR(DataNascimento) AS AnoNascimento, 
    MONTH(DataNascimento) AS MesNascimento, 
    DAY(DataNascimento) AS DiaNascimento 
FROM Funcionarios;

--Liste o nome do mês da data de nascimento dos funcionários com salário maior que 5000.00:
SELECT 
    Nome, 
    DATENAME(MONTH, DataNascimento) AS MesNascimento 
FROM Funcionarios 
WHERE Salario > 5000.00;

--Qual a quantidade de mulheres cadastradas:
SELECT COUNT(*) AS QuantidadeMulheres FROM Funcionarios WHERE Sexo = 'F';

--Resolução da Equação do Segundo Grau x² - 2x + 1 = 0:
DECLARE @solucao FLOAT;

SET @solucao = 1;

SELECT @solucao AS Solucao;

--Altere o Modelo Conceitual e coloque um atributo derivado, chamado Idade, gere novo modelo Lógico e Físico:
ALTER TABLE Funcionarios
ADD Idade AS (DATEDIFF(YEAR, DataNascimento, GETDATE()))

--Altere os dados de idade de cada um dos funcionários cadastrados:
UPDATE Funcionarios
SET DataNascimento = DATEADD(YEAR, -25, GETDATE())
WHERE ID = 6; 

UPDATE Funcionarios
SET DataNascimento = DATEADD(YEAR, -33, GETDATE())
WHERE ID = 7; 

UPDATE Funcionarios
SET DataNascimento = DATEADD(YEAR, -40, GETDATE())
WHERE ID = 8; 

UPDATE Funcionarios
SET DataNascimento = DATEADD(YEAR, -34, GETDATE())
WHERE ID = 9; 

UPDATE Funcionarios
SET DataNascimento = DATEADD(YEAR, -22, GETDATE())
WHERE ID = 10; 

--Foi dado um bônus de 800,00 para os funcionários que foram admitidos antes do ano de 2000:
UPDATE Funcionarios
SET Salario = Salario + 800.00
WHERE YEAR(DataNascimento) <2000;

--Exiba os CPFs com a máscara:
SELECT 
    Nome, 
REPLACE(REPLACE	(CPF, '.', ''),'-','') AS CPFnovo
    
FROM Funcionarios;

-- Quem são funcionários que têm mais de 30 letras em seu nome
SELECT Nome

From Funcionarios

WHERE LEN(Nome) > 30

--Pesquisa com dados das mulheres primeiro, depois dos homens e em ordem alfabética:
SELECT * FROM Funcionarios ORDER BY Sexo ASC, Nome ASC

--Exibir os dados dos nomes dos funcionarios com letras minusculas
SELECT Nome,LOWER (Nome) AS NomeMinusculo
FROM Funcionarios

--Maiores salários dentre os funcionários cadastrados:
SELECT Nome, Salario FROM Funcionarios ORDER BY Salario DESC 

--Novo gasto com a folha de pagamento após um Dissídio de 5%:
SELECT SUM(Salario) AS AtualFolhaPagamento, SUM((Salario * 0.05)+ Salario) AS NovaFolhaPagamento FROM Funcionarios

-- Para eliminar a coluna NM_MES da tabela: 
ALTER TABLE Funcionarios
DROP NM_MES;


