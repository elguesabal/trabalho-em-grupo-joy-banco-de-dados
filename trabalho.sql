-- Criação da tabela Doador
CREATE TABLE Doador (
    ID SERIAL PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    telefone VARCHAR(20) NOT NULL
);

-- Criação da tabela Equipamento com relacionamento com Doador
CREATE TABLE Equipamento (
    ID SERIAL PRIMARY KEY,
    Marca VARCHAR(255) NOT NULL,
    Condição VARCHAR(50) NOT NULL,
    Tipo VARCHAR(100) NOT NULL,
    Doador_ID INTEGER,
    FOREIGN KEY (Doador_ID) REFERENCES Doador (ID) ON DELETE SET NULL
);

-- Inserir dados na tabela Doador
INSERT INTO Doador (Nome, email, telefone) VALUES 
('João da Silva', 'jj@gmail.com', '(11)7777-7777'),
('Maria Souza', 'ms@gmail.com', '(21)9999-9999');

-- Inserir dados na tabela Equipamento
INSERT INTO Equipamento (Marca, Condição, Tipo, Doador_ID) VALUES 
('Dell', 'Funcionando', 'Notebook', 1),
('Samsung', 'Manutenção', 'Monitor', NULL),
('IBM', 'Funcionando', 'Teclado', 2),
('Microsoft', 'Funcionando', 'Mouse', NULL);

-- Consultar dados relacionados
SELECT e.ID AS Equipamento_ID, e.Marca, e.Condição, e.Tipo, d.Nome AS Doador_Nome, d.email, d.telefone
FROM Equipamento e
LEFT JOIN Doador d ON e.Doador_ID = d.ID;

-- Verificar se a tabela Equipamento foi criada
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
AND table_name = 'equipamento';