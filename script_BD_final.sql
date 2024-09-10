-- -----------------------------------------------------
-- Banco de Dados Plataforma de vendas de jogos online
-- -----------------------------------------------------
 CREATE DATABASE Plataforma_de_vendas_de_jogos_online;
 USE Plataforma_de_vendas_de_jogos_online;

-- -----------------------------------------------------
-- Tabela Jogo
-- -----------------------------------------------------
CREATE TABLE Jogo (

  idJogo INT NOT NULL,
  Descrição VARCHAR(45) NOT NULL,
  Titulo VARCHAR(45) NOT NULL,
  Categoria VARCHAR(45) NOT NULL,
  Data_Lancamento DATE NOT NULL,
  Capa BLOB NULL,
  Processador VARCHAR(45) NOT NULL,
  Memoria_RAM VARCHAR(45) NOT NULL,
  Placa_de_Vídeo VARCHAR(45) NOT NULL,
  Armazenamento VARCHAR(45) NOT NULL,
  PRIMARY KEY (idJogo)
);


-- -----------------------------------------------------
-- Tabela Biblioteca_de_Jogos
-- -----------------------------------------------------
CREATE TABLE Biblioteca_de_Jogos (

  idBiblioteca_de_Jogos INT NOT NULL,
  Status_Instalação INT NOT NULL,
  Data_de_Adição DATE NOT NULL,
  PRIMARY KEY (idBiblioteca_de_Jogos)
);

-- -----------------------------------------------------
-- Tabela Perfil_Usuário
-- -----------------------------------------------------
CREATE TABLE Perfil_Usuário (

  idPerfil_Usuário INT NOT NULL,
  Foto_perfil BLOB NULL,
  Biografia VARCHAR(45) NOT NULL,
  Localização VARCHAR(45) NOT NULL,
  PRIMARY KEY (idPerfil_Usuário)
);


-- -----------------------------------------------------
-- Tabela Loja
-- -----------------------------------------------------
CREATE TABLE Loja (

  idLoja INT NOT NULL,
  Preço VARCHAR(45) NOT NULL,
  ID_Jogo INT NOT NULL,
  PRIMARY KEY (idLoja),
  
  CONSTRAINT Chave_Estrangeira_Loja_Jogo
    FOREIGN KEY (ID_Jogo)
    REFERENCES Jogo (idJogo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);


-- -----------------------------------------------------
-- Tabela Carrinho_de_Compras
-- -----------------------------------------------------
CREATE TABLE Carrinho_de_Compras (

  idCarrinho_de_Compras INT NOT NULL,
  Data_de_Adição DATE NOT NULL,
  Quantidade INT NOT NULL,
  ID_Loja INT NOT NULL,
  PRIMARY KEY (idCarrinho_de_Compras),
  
  CONSTRAINT Chave_Estrangeira_Carrinho_de_Compras_Loja
    FOREIGN KEY (ID_Loja)
    REFERENCES Loja (idLoja)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);


-- -----------------------------------------------------
-- Tabela Usuário
-- -----------------------------------------------------
CREATE TABLE Usuário (

  idUsuario INT NOT NULL,
  Data_Nascimento DATE NOT NULL,
  Nome VARCHAR(45) NOT NULL,
  Data_Cadastro VARCHAR(45) NOT NULL,
  Email VARCHAR(45) NOT NULL,
  Telefone VARCHAR(20) NULL,
  ID_Biblioteca INT NOT NULL,
  ID_Perfil_Usuário INT NOT NULL,
  ID_Carrinho_de_Compras INT NOT NULL,
  PRIMARY KEY (idUsuario),

  CONSTRAINT Chave_Estrangeira_Usuario_Biblioteca_de_Jogos
    FOREIGN KEY (ID_Biblioteca)
    REFERENCES Biblioteca_de_Jogos (idBiblioteca_de_Jogos)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT Chave_Estrangeira_Perfil_Usuário
    FOREIGN KEY (ID_Perfil_Usuário)
    REFERENCES Perfil_Usuário (idPerfil_Usuário)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT Chave_Estrangeira_Usuário_CaDC
    FOREIGN KEY (ID_Carrinho_de_Compras)
    REFERENCES Carrinho_de_Compras (idCarrinho_de_Compras)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    );


-- -----------------------------------------------------
-- Tabela Usuário_possui_Jogo
-- -----------------------------------------------------
CREATE TABLE Usuário_possui_Jogo (

  ID_Usuário INT NOT NULL,
  ID_Jogo INT NOT NULL,
  PRIMARY KEY (ID_Usuário, ID_Jogo),

  CONSTRAINT Chave_Estrangeira_Usuario_possui_Jogo_Tabela_U
    FOREIGN KEY (ID_Usuário )
    REFERENCES Usuário (idUsuario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT Chave_Estrangeira_Usuário_possui_Jogo_Tabela_J
    FOREIGN KEY (ID_Jogo)
    REFERENCES Jogo (idJogo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);


-- -----------------------------------------------------
-- Tabela Biblioteca_de_Jogos_possui_Jogo
-- -----------------------------------------------------
CREATE TABLE Biblioteca_de_Jogos_possui_Jogo (

  ID_Biblioteca INT NOT NULL,
  ID_Jogo INT NOT NULL,
  PRIMARY KEY (ID_Biblioteca, ID_Jogo),

  CONSTRAINT Chave_Estrangeira_Biblioteca_de_Jogos_possui_Jogo_Tabela_Bi
    FOREIGN KEY (ID_Biblioteca)
    REFERENCES Biblioteca_de_Jogos (idBiblioteca_de_Jogos)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT Chave_Estrangeira_Biblioteca_de_Jogos_possui_Jogo_Tabela_J
    FOREIGN KEY (ID_Jogo)
    REFERENCES Jogo (idJogo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);


-- -----------------------------------------------------
-- Tabela Avaliação
-- -----------------------------------------------------
CREATE TABLE Avaliação (

  idAvaliação INT NOT NULL,
  Nota INT NOT NULL,
  Comentário VARCHAR(45) NOT NULL,
  PRIMARY KEY (idAvaliação)
);


-- -----------------------------------------------------
-- Tabela Jogo_possui_Avaliação
-- -----------------------------------------------------
CREATE TABLE Jogo_possui_Avaliação (

  ID_Jogo INT NOT NULL,
  ID_Avaliação INT NOT NULL,
  PRIMARY KEY (ID_Jogo, ID_Avaliação),

  CONSTRAINT Chave_Estrangeira_Jogo_possui_Avaliação_Tabela_J
    FOREIGN KEY (ID_Jogo)
    REFERENCES Jogo (idJogo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT Chave_Estrangeira_Jogo_possui_Avaliação_Tabela_A
    FOREIGN KEY (ID_Avaliação)
    REFERENCES Avaliação (idAvaliação)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);


-- -----------------------------------------------------
-- Tabela Desenvolvedor
-- -----------------------------------------------------
CREATE TABLE Desenvolvedor (

  idDesenvolvedor INT NOT NULL,
  Nome VARCHAR(45) NOT NULL,
  Telefone VARCHAR(20) NOT NULL,
  Email VARCHAR(45) NOT NULL,
  ID_Perfil_Usuário INT NOT NULL,
  PRIMARY KEY (idDesenvolvedor),

  CONSTRAINT Chave_Estrangeira_Deselvolvedor_Perfil_U
    FOREIGN KEY (ID_Perfil_Usuário)
    REFERENCES Perfil_Usuário (idPerfil_Usuário)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);


-- -----------------------------------------------------
-- Tabela Deselvolvedor_possui_Jogo
-- -----------------------------------------------------
CREATE TABLE Deselvolvedor_possui_Jogo (

  ID_Desenvolvedor INT NOT NULL,
  ID_Jogo INT NOT NULL,
  PRIMARY KEY (ID_Desenvolvedor, ID_Jogo),

  CONSTRAINT Chave_Estrangeira_Deselvolvedor_possui_Jogo_Tabela_D
    FOREIGN KEY (ID_Desenvolvedor)
    REFERENCES Desenvolvedor (idDesenvolvedor)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT Chave_Estrangeira_Deselvolvedor_possui_Jogo_Tabela_J
    FOREIGN KEY (ID_Jogo)
    REFERENCES Jogo (idJogo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);


-- -----------------------------------------------------
-- Tabela Suporte
-- -----------------------------------------------------
CREATE TABLE Suporte (

  Protocolo INT NOT NULL,
  Problema VARCHAR(45) NOT NULL,
  Data_Solicitação DATE NOT NULL,
  Resposta VARCHAR(20) NOT NULL,
  PRIMARY KEY (Protocolo)
);


-- -----------------------------------------------------
-- Tabela Usuário_solicita_Suporte
-- -----------------------------------------------------
CREATE TABLE Usuário_solicita_Suporte (

  ID_Usuário INT NOT NULL,
  ID_Suporte INT NOT NULL,
  PRIMARY KEY (ID_Usuário, ID_Suporte),

  CONSTRAINT Chave_Estrangeira_Usuário_solicita_Suporte_Tabela_U
    FOREIGN KEY (ID_Usuário)
    REFERENCES Usuário (idUsuario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT Chave_Estrangeira_Usuário_solicita_Suporte_Tabela_S
    FOREIGN KEY (ID_Suporte)
    REFERENCES Suporte (Protocolo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);


-- -----------------------------------------------------
-- Tabela Sistema_Operacional
-- -----------------------------------------------------
CREATE TABLE Sistema_Operacional (
  
  IP VARCHAR(45) NOT NULL,
  Nome VARCHAR(45) NOT NULL,
  Versão VARCHAR(45) NOT NULL,
  Fabricante VARCHAR(45) NOT NULL,
  Data_Lançamento DATE NOT NULL,
  PRIMARY KEY (IP)
);


-- -----------------------------------------------------
-- Tabela Usuário_possui_Sistema_Operacional
-- -----------------------------------------------------
CREATE TABLE Usuário_possui_Sistema_Operacional (

  ID_Usuário INT NOT NULL,
  ID_Sistema_Operacional VARCHAR(45) NOT NULL,
  PRIMARY KEY (ID_Usuário, ID_Sistema_Operacional),

  CONSTRAINT Chave_Estrangeira_Usuário_possui_Sistema_Operacional_Tabela_U
    FOREIGN KEY (ID_Usuário)
    REFERENCES Usuário (idUsuario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT Chave_Estrangeira_Usuário_possui_Sistema_Operacional_Tabela_SO
    FOREIGN KEY (ID_Sistema_Operacional)
    REFERENCES Sistema_Operacional (IP)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Tabela Pagamento
-- -----------------------------------------------------
CREATE TABLE Pagamento (

  idPagamento INT NOT NULL,
  Tipo_Pagamento VARCHAR(45) NOT NULL,
  Status_Pagamento VARCHAR(20) NOT NULL,
  Data_Pagamento DATE NOT NULL,
  ID_Carrinhos_de_Compras INT NOT NULL,
  PRIMARY KEY (idPagamento),

  CONSTRAINT Chave_Estrangeira_Pagamento_Carrinho_de_Compras
    FOREIGN KEY (ID_Carrinhos_de_Compras)
    REFERENCES Carrinho_de_Compras (idCarrinho_de_Compras)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);


-- -----------------------------------------------------
-- Inserts
      
-- -----------------------------------------------------
-- Insert Tabela Jogo
-- -----------------------------------------------------

INSERT INTO Jogo (idJogo, Descrição, Titulo, Categoria, Data_Lancamento, Capa, Processador, Memoria_RAM, Placa_de_Vídeo, Armazenamento)
VALUES 
(1, 'Simulador de futebol', 'Bomba Patch', 'Esporte', '2021-10-01', null, 'Intel Core i3-6100', '8GB', 'Intel Core i3-6100', '50GB'),
(2, 'Jogo de tiro em primeira pessoa', 'Call of Duty', 'Ação', '2019-10-25', null, 'Intel i7', '16GB', 'NVIDIA RTX 2080', '175GB'),
(3, 'RPG de mundo aberto', 'The Witcher 3', 'Aventura', '2015-05-19', null, 'Intel i5', '8GB', 'NVIDIA GTX 970', '50GB'),
(4, 'Jogo de construção e exploração', 'Minecraft', 'Sandbox', '2011-11-18', null, 'Intel Celeron J4105', '4GB', 'Intel HD Graphics 4000', '1GB'),
(5, 'Jogo narrativo com escolhas', 'Life is Strange', 'Aventura', '2015-01-30', null, 'Intel Core i3-2100', '4GB', 'Nvidia GeForce GTX 650', '40GB'),
(6, 'Jogo de aventura épica', 'Zelda', 'Aventura', '2022-01-01', null, 'Intel i7', '16GB', 'NVIDIA GTX 1660', '50GB'),
(7, 'Jogo de corrida emocionante', 'Need for Speed: Most Wanted', 'Corrida', '2023-03-15', null, 'AMD Ryzen 5', '8GB', 'NVIDIA GTX 1050', '30GB'),
(8, 'Jogo de estratégia e tática', 'Pummel Party', 'Estratégia', '2021-11-20', null, 'Intel i5', '8GB', 'NVIDIA GTX 960', '20GB'),
(9, 'Jogo de simulação de vida', 'Farm Simulator', 'Simulação', '2020-07-10', null, 'AMD Ryzen 7', '16GB', 'AMD Radeon RX 580', '60GB'),
(10, 'Jogo de terror e sobrevivência', 'Outlast', 'Terror', '2024-06-25', null, 'Intel i9', '32GB', 'NVIDIA RTX 3080', '80GB')
;

-- -----------------------------------------------------
-- Insert Tabela Biblioteca_de_Jogos
-- -----------------------------------------------------

INSERT INTO Biblioteca_de_Jogos (idBiblioteca_de_Jogos, Status_Instalação, Data_de_Adição)
VALUES 
(1, 1, '2024-09-01'),
(2, 1, '2024-09-02'),
(3, 0, '2024-09-03'),
(4, 0, '2024-09-04'),
(5, 1, '2024-09-05');


-- -----------------------------------------------------
-- Insert Tabela Perfil_Usuário
-- -----------------------------------------------------

INSERT INTO Perfil_Usuário (idPerfil_Usuário, Foto_perfil, Biografia, Localização)
VALUES 
(1, null, 'Gamer entusiasta', 'São Paulo, Brasil'),
(2, null, 'Aficionado por jogos de corrida', 'Rio de Janeiro, Brasil'),
(3, null, 'Especialista em estratégia', 'Curitiba, Brasil'),
(4, null, 'Aventureiro virtual', 'Salvador, Brasil'),
(5, null, 'Amante de simulações', 'Porto Alegre, Brasil'),
(6, null, 'Uma das maiores editoras de jogos do mundo', 'Mazóvia, Polônia'),
(7, null, 'Especializados em jogos FPS', 'Redwood City, Califórnia'),
(8, null, 'Famosa pelo pelo jogo de cartas GWENT', 'Woodland Hills, Califórnia'),
(9, null, 'Criou o fenômeno mundial Minecraft', 'Estocolmo, Suécia'),
(10, null, 'Conhecida por jogos narrativos', 'Paris, França')
;

-- -----------------------------------------------------
-- Insert Tabela Loja
-- -----------------------------------------------------

INSERT INTO Loja (idLoja, Preço, ID_Jogo)
VALUES 
(1, 'R$1000', 1),
(2, 'R$339', 2),
(3, 'R$129', 3),
(4, 'R$120', 4),
(5, 'R$199', 5)
;

-- -----------------------------------------------------
-- Insert Tabela Carrinho_de_Compras
-- -----------------------------------------------------

INSERT INTO Carrinho_de_Compras (idCarrinho_de_Compras, Data_de_Adição, Quantidade, ID_Loja)
VALUES 
(1, '2024-09-01', 1, 1),
(2, '2024-09-02', 2, 2),
(3, '2024-09-03', 3, 3),
(4, '2024-09-04', 4, 4),
(5, '2024-09-05', 5, 5)
;

-- -----------------------------------------------------
-- Insert Usuário
-- -----------------------------------------------------

INSERT INTO Usuário (idUsuario, Data_Nascimento, Nome, Data_Cadastro, Email, Telefone, ID_Biblioteca, ID_Perfil_Usuário, ID_Carrinho_de_Compras)
VALUES 
(1, '1990-05-10', 'João Silva', '2024-08-01', 'joao@example.com', '11999999999', 1, 1, 1),
(2, '1992-07-15', 'Maria Santos', '2024-08-02', 'maria@example.com', '21988888888', 2, 2, 2),
(3, '1988-09-20', 'Carlos Oliveira', '2024-08-03', 'carlos@example.com', '31977777777', 3, 3, 3),
(4, '1995-11-25', 'Ana Souza', '2024-08-04', 'ana@example.com', '41966666666', 4, 4, 4),
(5, '1993-12-30', 'Paulo Lima', '2024-08-05', 'paulo@example.com', '51955555555', 5, 5, 5)
;

-- -----------------------------------------------------
-- Insert Tabela Usuário_possui_Jogo
-- -----------------------------------------------------

INSERT INTO Usuário_possui_Jogo (ID_Usuário, ID_Jogo)
VALUES
(1, 1),
(1, 3),
(2, 5),
(3, 3),
(3, 2),
(3, 1),
(4, 5),
(4, 4),
(5, 1),
(5, 3),
(5, 4);

-- -----------------------------------------------------
-- Insert Tabela Biblioteca_de_Jogos_possui_Jogo
-- -----------------------------------------------------

INSERT INTO Biblioteca_de_Jogos_possui_Jogo (ID_Biblioteca, ID_Jogo)
VALUES
(1, 1),
(1, 3),
(2, 5),
(3, 3),
(3, 2),
(3, 1),
(4, 5),
(4, 4),
(5, 1),
(5, 3),
(5, 4);

-- -----------------------------------------------------
-- Insert Tabela Avaliação
-- -----------------------------------------------------

INSERT INTO Avaliação (idAvaliação, Nota, Comentário)
VALUES 
(1, 8, 'Bom jogo, mas poderia ser melhor.'),
(2, 9, 'Excelente jogabilidade e gráficos!'),
(3, 7, 'Divertido, mas com alguns bugs.'),
(4, 6, 'Esperava mais do enredo!'),
(5, 10, 'Perfeito, sem defeitos!');

-- -----------------------------------------------------
-- Insert Tabela Jogo_possui_Avaliação
-- -----------------------------------------------------

INSERT INTO Jogo_possui_Avaliação (ID_Jogo, ID_Avaliação)
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- -----------------------------------------------------
-- Insert Tabela Deselvolvedor
-- -----------------------------------------------------

INSERT INTO Desenvolvedor (idDesenvolvedor, Nome, Telefone, Email, ID_Perfil_Usuário)
VALUES 
(1, 'Electronic Arts (EA Sports)', '21988888888', 'support@easports.com', 6),
(2, 'Infinity Ward', '31977777777', 'info@infinityward.com', 7),
(3, 'CD Projekt Red', '41966666666', 'help@cdprojektred.com', 8),
(4, 'Mojang', '51955555555', 'contact@mojang.com', 9),
(5, 'Dontnod Entertainment', '+33 1 23 45 67 89', 'contact@dontnod.com', 10);

-- -----------------------------------------------------
-- Insert Tabela Deselvolvedor_possui_Jogo
-- -----------------------------------------------------

INSERT INTO Deselvolvedor_possui_Jogo (ID_Desenvolvedor, ID_Jogo)
VALUES 
(1, 6),
(2, 7),
(3, 8),
(4, 9),
(5, 10);

-- -----------------------------------------------------
-- Insert Tabela Suporte
-- -----------------------------------------------------

INSERT INTO Suporte (Protocolo, Problema, Data_Solicitação, Resposta)
VALUES 
(1, 'Erro de pagamento', '2024-08-05', 'Resolvido'),
(2, 'Problema de login', '2024-08-06', 'Em andamento'),
(3, 'Jogo travando', '2024-08-07', 'Resolvido'),
(4, 'Problema com DLC', '2024-08-08', 'Pendente'),
(5, 'Erro na instalação', '2024-08-09', 'Resolvido');

-- -----------------------------------------------------
-- Insert Tabela Usuário_solicita_Suporte
-- -----------------------------------------------------

INSERT INTO Usuário_solicita_Suporte (ID_Usuário, ID_Suporte)
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- -----------------------------------------------------
-- Insert Tabela Sistema_Operacional
-- -----------------------------------------------------

INSERT INTO Sistema_Operacional (IP, Nome, Versão, Fabricante, Data_Lançamento)
VALUES 
('192.168.0.1', 'Windows 10', '2004', 'Microsoft', '2015-07-29'),
('192.168.0.2', 'Ubuntu', '20.04', 'Canonical', '2020-04-23'),
('192.168.0.3', 'macOS', 'Big Sur', 'Apple', '2020-11-12'),
('192.168.0.4', 'Fedora', '34', 'Fedora Project', '2021-04-27'),
('192.168.0.5', 'Arch Linux', 'Rolling Release', 'Arch', '2021-09-01')
;

-- -----------------------------------------------------
-- Insert Tabela Usuário_possui_Sistema_Operacional
-- -----------------------------------------------------

INSERT INTO Usuário_possui_Sistema_Operacional (ID_Usuário, ID_Sistema_Operacional)
VALUES 
(1, '192.168.0.1'),
(2, '192.168.0.2'),
(3, '192.168.0.3'),
(4, '192.168.0.4'),
(5, '192.168.0.5');

-- -----------------------------------------------------
-- Insert Tabela Pagamento
-- -----------------------------------------------------

INSERT INTO Pagamento (idPagamento, Tipo_Pagamento, Status_Pagamento, Data_Pagamento, ID_Carrinhos_de_Compras)
VALUES 
(1, 'Cartão de Crédito', 'Aprovado', '2024-08-05', 1),
(2, 'Boleto', 'Pendente', '2024-08-06', 2),
(3, 'Pix', 'Aprovado', '2024-08-07', 3),
(4, 'Pix', 'Cancelado', '2024-08-08', 4),
(5, 'Cartão de Débito', 'Aprovado', '2024-08-09', 5);

-- -----------------------------------------------------


-- -----------------------------------------------------
-- Views

-- -----------------------------------------------------
-- View Relatório_do_Usuário
-- -----------------------------------------------------

CREATE VIEW Relatório_do_Usuário AS
SELECT usu.Nome, usu.Email, usu.Telefone, usu.Data_Cadastro,
       jo.Titulo AS Jogo_do_Usuário, ava.Nota AS Avaliacao, ava.Comentário AS Comentario_Avaliacao,
       pag.Tipo_Pagamento, pag.Status_Pagamento, pag.Data_Pagamento
FROM Usuário usu
JOIN Usuário_possui_Jogo upj ON usu.idUsuario = upj.ID_Usuário
JOIN Jogo jo ON upj.ID_Jogo = jo.idJogo
JOIN Jogo_possui_Avaliação jpa ON jo.idJogo = jpa.ID_Jogo
JOIN Avaliação ava ON jpa.ID_Avaliação = ava.idAvaliação
JOIN Pagamento pag ON usu.ID_Carrinho_de_Compras = pag.ID_Carrinhos_de_Compras
WHERE pag.Status_Pagamento = 'Aprovado';
;

-- -----------------------------------------------------
-- View Desempenho_de_Instalação_dos_Sistema_Operacionais
-- -----------------------------------------------------

CREATE VIEW Desempenho_de_Instalação_dos_Sistema_Operacionais AS
SELECT siop.Nome, COUNT(bijo.ID_Jogo) AS Total_Jogos_Instalados,
       ROUND(COUNT(bijo.ID_Jogo) * 100.0 / (SELECT COUNT(*) FROM Biblioteca_de_Jogos_possui_Jogo), 2) AS Percentual_Instalações
FROM Sistema_Operacional siop
JOIN Usuário_possui_Sistema_Operacional upso ON siop.IP = upso.ID_Sistema_Operacional
JOIN Usuário usu ON upso.ID_Usuário = usu.idUsuario
JOIN Biblioteca_de_Jogos bi ON usu.ID_Biblioteca = bi.idBiblioteca_de_Jogos
JOIN Biblioteca_de_Jogos_possui_Jogo bijo ON bi.idBiblioteca_de_Jogos = bijo.ID_Biblioteca
GROUP BY siop.Nome;

-- -----------------------------------------------------
-- View Relatório_Tempo_Resposta_Suporte
-- -----------------------------------------------------

CREATE VIEW Relatorio_Tempo_Resposta_Suporte AS
SELECT usu.Nome, sup.Problema, sup.Data_Solicitação, sup.Resposta,
       DATEDIFF(CURDATE(), sup.Data_Solicitação) AS Dias_Abertos,
       (SELECT AVG(DATEDIFF(CURDATE(), suporte_sub.Data_Solicitação))
        FROM Suporte suporte_sub WHERE suporte_sub.Resposta IS NOT NULL) AS Media_Tempo_Resposta
FROM Usuário usu
JOIN Usuário_solicita_Suporte uss ON usu.idUsuario = uss.ID_Usuário
JOIN Suporte sup ON uss.ID_Suporte = sup.Protocolo;

-- -----------------------------------------------------

-- -----------------------------------------------------
-- Stored Procedures

-- -----------------------------------------------------
-- Gerenciamento de carrinho de compras
-- -----------------------------------------------------

DELIMITER $$

CREATE PROCEDURE gerenciar_carrinho(
    IN p_id_usuario INT,
    IN p_id_jogo INT,
    IN p_quantidade INT,
    IN p_acao VARCHAR(10)
)
BEGIN
    DECLARE v_id_carrinho INT;

    -- Obtém o ID do carrinho de compras do usuário
    SELECT ID_Carrinho_de_Compras
    INTO v_id_carrinho
    FROM Usuário
    WHERE idUsuario = p_id_usuario;

    -- Verifica a ação a ser realizada
    IF p_acao = 'adicionar' THEN
        -- Verifica se o jogo já está no carrinho
        IF EXISTS (SELECT 1 FROM Carrinho_de_Compras WHERE idCarrinho_de_Compras = v_id_carrinho AND ID_Loja = p_id_jogo) THEN
            -- Atualiza a quantidade do jogo no carrinho
            UPDATE Carrinho_de_Compras
            SET Quantidade = Quantidade + p_quantidade
            WHERE idCarrinho_de_Compras = v_id_carrinho;
        ELSE
            -- Insere o jogo no carrinho com a quantidade especificada
            INSERT INTO Carrinho_de_Compras (idCarrinho_de_Compras, Data_de_Adição, Quantidade, ID_Loja)
            VALUES (v_id_carrinho, CURDATE(), p_quantidade, p_id_jogo);
        END IF;

    ELSEIF p_acao = 'remover' THEN
        -- Remove o jogo do carrinho
        DELETE FROM Carrinho_de_Compras
        WHERE idCarrinho_de_Compras = v_id_carrinho AND ID_Loja = p_id_jogo;

    ELSEIF p_acao = 'atualizar' THEN
        -- Atualiza a quantidade do jogo no carrinho
        UPDATE Carrinho_de_Compras
        SET Quantidade = p_quantidade
        WHERE idCarrinho_de_Compras = v_id_carrinho AND ID_Loja = p_id_jogo;
    END IF;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- Sistema de Avaliação de jogos
-- -----------------------------------------------------


DELIMITER $$

CREATE PROCEDURE avaliar_jogo(
    IN p_id_usuario INT,
    IN p_id_jogo INT,
    IN p_nota INT,
    IN p_comentario VARCHAR(255)
)
BEGIN
    DECLARE v_id_avaliacao INT;

    -- Insere a avaliação na tabela Avaliação
    INSERT INTO Avaliação (Nota, Comentário)
    VALUES (p_nota, p_comentario);
    
    -- Obtém o ID da avaliação recém-criada
    SET v_id_avaliacao = LAST_INSERT_ID();

    -- Relaciona a avaliação com o jogo na tabela Jogo_possui_Avaliação
    INSERT INTO Jogo_possui_Avaliação (ID_Jogo, ID_Avaliação)
    VALUES (p_id_jogo, v_id_avaliacao);

    -- Relaciona o usuário com a avaliação (opcional)
    INSERT INTO Usuário_possui_Jogo (ID_Usuário, ID_Biblioteca_de_Jogos, ID_Jogo)
    SELECT p_id_usuario, ID_Biblioteca_de_Jogos, p_id_jogo
    FROM Usuário
    WHERE idUsuario = p_id_usuario;

    -- Exibe uma mensagem de confirmação de avaliação registrada
    SELECT 'Avaliação registrada com sucesso!' AS Mensagem;
END$$

DELIMITER ;

-- -----------------------------------------------------