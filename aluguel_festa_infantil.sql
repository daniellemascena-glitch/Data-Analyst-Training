/Projeto 02: FESTAS INFANTIS
Rafaela possui vários temas de festas infantis para aluguel.
Ela precisa controlar os aluguéis e para isso quer uma aplicação que permita cadastrar: o
nome e o telefone do cliente, o endereço completo da festa, o tema escolhido, a data dafesta,
a hora de início e término da festa.
Além disso, para alguns clientes antigos, Rafaela oferece descontos. Sendo assim, é
preciso saber o valor realmente cobrado num determinado aluguel.
Para cada tema, é preciso controlar: a lista de itens que compõem o tema (ex: castelo,
boneca da Cinderela, bruxa etc.), o valor do aluguel e a cor da toalha da mesa que deveser 
usada com o tema./
---------------------------------------------------------------------------------------

CREATE TABLE Cliente (
    id SERIAL PRIMARY KEY,
    nome TEXT,
    telefone VARCHAR(12),
	data_cadastro DATE DEFAULT CURRENT_DATE,
    cliente_antigo BOOLEAN DEFAULT FALSE 
	);

/p.s: a coluna cliente_antigo é para parametrizar possiveis descontos por fidelidade do cliente/


CREATE TABLE Tema (
    id SERIAL PRIMARY KEY,          
    nome TEXT NOT NULL,          
    valor_aluguel DECIMAL(18,2) NOT NULL,
    cor_toalha TEXT              
);

/nesta tabela registraremos os temas das festas infantis (Cinderela, Batman, ursos etc )
e valor de cada tema/


CREATE TABLE Item_Tema (
    id SERIAL PRIMARY KEY,          
    descricao TEXT NOT NULL,     
    id_tema INTEGER,               
    FOREIGN KEY (id_tema) REFERENCES Tema(id)
);

/aqui listamos os itens de cada tema, relacionando com a tabela Tema através da chave primária (id_tema)/


CREATE TABLE Aluguel (
    id SERIAL PRIMARY KEY,      
    id_cliente INTEGER NOT NULL,           
    id_tema INTEGER NOT NULL,               
    endereco TEXT NOT NULL,      
    data_festa DATE NOT NULL,            
    hora_inicio TIME NOT NULL,          
    hora_fim TIME NOT NULL,             
    valor_cobrado DECIMAL(18,2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id),
    FOREIGN KEY (id_tema) REFERENCES Tema(id)
);

/a tabela aluguel registra os alugueis de cada cliente, relacionando com as chaves primárias das tabelas clientes e temas/

--------------------------
Isenrindo dados dos clientes

INSERT INTO Cliente (nome, telefone, data_cadastro, cliente_antigo) VALUES
('Ana Lima', '85999990001','2025-04-08', 'FALSE'),
('Fernanda Liz', '85999990002', '2021-10-15', 'TRUE'),
('Carlos Silva', '85999990003', '2024-12-20', 'FALSE'),
('Marcos Antonio', '85999990004', '2022-02-12', 'TRUE'),
('Lucia Tavares', '85999990005', '2023-01-25', 'TRUE');


Isenrindo dados dos temas das festas

INSERT INTO tema (nome, valor_aluguel, cor_toalha) VALUES
('Cinderela', '800.00', 'rosa'),
('Homem aranha', '700.00', 'vermelha'),
('Minions', '850.00', 'amarela'),
('Batman', '750.00', 'preta'),
('BTS', '900.00', 'colorida');


Inserindo os itens de cada tema de festa

INSERT INTO item_tema (descricao, id_tema) VALUES
('castelo cinderela', '1'),
('painel cinderela', '1'),
('carruagem cinderela', '1'),
('cilindro homem aranha', '2'),
('teia homem aranha', '2'),
('painel homem aranha', '2'),
('painel minions', '3'),
('cilindro minions', '3'),
('baloes minions', '3'),
('painel batman', '4'),
('batmovel', '4'),
('mascaras batman', '4'),
('painel foto BTS', '5'),
('arco baloes coloridos', '5'),
('cilindro BTS', '5');


Inserindo dados dos alugueis.

INSERT INTO Aluguel (id_cliente, id_tema, endereco, data_festa, hora_inicio, hora_fim, valor_cobrado) VALUES
('1', '5', 'Av Palmares, 20 - Passare / Fortaleza', '2025.02.10','19:00', '23:00','900.00'),
('2', '4', 'Av WS, 1500 - Ed Queiroz / Fortaleza', '2025.05.30', '16:00', '20:00', '750.00'),
('3', '3', 'Av Frei Cirilo, 4001 - Messejana / Fortaleza', '2025.07.01', '18:00', '22:00', '850.00'),
('4', '2', 'Av das Flores, 351 - Arvoredo / Fortaleza', '2025.07.21', '17:00', '21:00', '700.00'),
('5', '1', 'Av Satos Dumont, 2741, ap 1001 - Aldeota / Fortaleza', '2025.08.16', '16:00', '20:00','800.00' );
