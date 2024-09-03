-- -----------------------------------------------------
-- Banco de Dados Plataforma de vendas de jogos online
-- -----------------------------------------------------
 CREATE DATABASE Plataforma_de_vendas_de_jogos_online;
 USE Plataforma_de_vendas_de_jogos_online;


-- -----------------------------------------------------
-- Tabela Usuário
-- -----------------------------------------------------
CREATE TABLE Usuário (

  idUsuario INT NOT NULL,
  Data_Nascimento DATE NOT NULL,
  Nome VARCHAR(45) NOT NULL,
  Data_Cadastro VARCHAR(45) NOT NULL,
  Email VARCHAR(45) NOT NULL,
  Telefone VARCHAR(45) NULL,
  ID_Biblioteca INT NOT NULL,
  Usuário_Amigo INT NOT NULL,
  Usuário_ID_Biblioteca INT NOT NULL,
  Perfil_Usuario_idPerfil_Usuario INT NOT NULL,
  Carrinho_de_Compras_idCarrinho_de_Compras INT NOT NULL,
  PRIMARY KEY (idUsuario, ID_Biblioteca, Usuário_Amigo, Usuário_ID_Biblioteca, Perfil_Usuario_idPerfil_Usuario, Carrinho_de_Compras_idCarrinho_de_Compras),

  CONSTRAINT `fk_Usuario_Biblioteca_de_Jogos`
    FOREIGN KEY (ID_Biblioteca)
    REFERENCES Biblioteca_de_Jogos (idBiblioteca_de_Jogos)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuário_Amigo`
    FOREIGN KEY (Usuário_Amigo , Usuário_ID_Biblioteca)
    REFERENCES Usuário (idUsuario , ID_Biblioteca)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuário_Perfil`
    FOREIGN KEY (Perfil_Usuario_idPerfil_Usuario)
    REFERENCES Perfil_Usuario (ID_Perfil)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuário_Carrinho_de_Compras1`
    FOREIGN KEY (Carrinho_de_Compras_idCarrinho_de_Compras)
    REFERENCES Carrinho_de_Compras (idCarrinho_de_Compras)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


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
-- Tabela Jogo
-- -----------------------------------------------------
CREATE TABLE Jogo (

  idJogo INT NOT NULL,
  Descrição VARCHAR(45) NOT NULL,
  Titulo VARCHAR(45) NOT NULL,
  Categoria VARCHAR(45) NOT NULL,
  Data_Lancamento DATE NOT NULL,
  PRIMARY KEY (idJogo)
);


-- -----------------------------------------------------
-- Tabela Usuário_possui_Jogo
-- -----------------------------------------------------
CREATE TABLE Usuário_possui_Jogo (

  ID_Usuário INT NOT NULL,
  ID_Biblioteca_de_Jogos INT NOT NULL,
  ID_Jogo INT NOT NULL,
  PRIMARY KEY (ID_Usuário, ID_Biblioteca_de_Jogos, ID_Jogo),

  CONSTRAINT `fk_Usuario_possui_Jogo_Usuario1`
    FOREIGN KEY (ID_Usuário , ID_Biblioteca_de_Jogos)
    REFERENCES Usuário (idUsuario , ID_Biblioteca)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_has_Jogo_Jogo1`
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
  Comentario VARCHAR(45) NOT NULL,
  PRIMARY KEY (idAvaliação)
);


-- -----------------------------------------------------
-- Tabela Biblioteca_de_Jogos_possui_Jogo
-- -----------------------------------------------------
CREATE TABLE Biblioteca_de_Jogos_possui_Jogo (

  ID_Biblioteca INT NOT NULL,
  ID_Jogo INT NOT NULL,
  PRIMARY KEY (ID_Biblioteca, ID_Jogo),

  CONSTRAINT `fk_Biblioteca_de_Jogos_has_Jogo_Biblioteca_de_Jogos1`
    FOREIGN KEY (ID_Biblioteca)
    REFERENCES Biblioteca_de_Jogos (idBiblioteca_de_Jogos)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Biblioteca_de_Jogos_has_Jogo_Jogo1`
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
  Comentario VARCHAR(45) NOT NULL,
  PRIMARY KEY (idAvaliação)
);


-- -----------------------------------------------------
-- Tabela Jogo_has_Avaliação
-- -----------------------------------------------------
CREATE TABLE Jogo_has_Avaliação (

  ID_Jogo INT NOT NULL,
  ID_Avaliação INT NOT NULL,
  PRIMARY KEY (ID_Jogo, ID_Avaliação),

  CONSTRAINT `fk_Jogo_has_Avaliação_Jogo1`
    FOREIGN KEY (ID_Jogo)
    REFERENCES Jogo (idJogo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Jogo_has_Avaliação_Avaliação1`
    FOREIGN KEY (ID_Avaliação)
    REFERENCES Avaliação (idAvaliação)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);


-- -----------------------------------------------------
-- Tabela Deselvolvedor
-- -----------------------------------------------------
CREATE TABLE Deselvolvedor (

  idDeselvolvedor INT NOT NULL,
  Nome VARCHAR(45) NOT NULL,
  Telefone VARCHAR(45) NOT NULL,
  Email VARCHAR(45) NOT NULL,
  Site VARCHAR(45) NOT NULL,
  PRIMARY KEY (idDeselvolvedor)
);


-- -----------------------------------------------------
-- Tabela Deselvolvedor_possui_Jogo
-- -----------------------------------------------------
CREATE TABLE Deselvolvedor_possui_Jogo (

  ID_Desenvolvedor INT NOT NULL,
  ID_Jogo INT NOT NULL,
  PRIMARY KEY (ID_Desenvolvedor, ID_Jogo),

  CONSTRAINT `fk_Deselvolvedor_has_Jogo_Deselvolvedor1`
    FOREIGN KEY (ID_Desenvolvedor)
    REFERENCES Deselvolvedor (idDeselvolvedor)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Deselvolvedor_has_Jogo_Jogo1`
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
  Data_Solicitação VARCHAR(45) NOT NULL,
  Status VARCHAR(45) NOT NULL,
  PRIMARY KEY (Protocolo)
);


-- -----------------------------------------------------
-- Tabela Usuário_has_Suporte
-- -----------------------------------------------------
CREATE TABLE Usuário_has_Suporte (

  ID_Usuário INT NOT NULL,
  Usuário_ID_Biblioteca INT NOT NULL,
  ID_Suporte INT NOT NULL,
  PRIMARY KEY (ID_Usuário, Usuário_ID_Biblioteca, ID_Suporte),

  CONSTRAINT `fk_Usuário_has_Suporte_Usuário1`
    FOREIGN KEY (ID_Usuário , Usuário_ID_Biblioteca)
    REFERENCES Usuário (idUsuario , ID_Biblioteca)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuário_has_Suporte_Suporte1`
    FOREIGN KEY (ID_Suporte)
    REFERENCES Suporte (Protocolo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);


-- ----------------------------------------------------
-- Tabela Requisitos_Sistema
-- ----------------------------------------------------
CREATE TABLE Requisitos_Sistema (

  Chave INT NOT NULL PRIMARY KEY,
  Processador varchar(45),
  Memoria_RAM VARCHAR(45),
  PLACA_DE_VIDEO varchar(45),
  ID_JOGO int not null,
  ID_PLATAFORMA int not null,
    
  FOREIGN KEY(ID_JOGO)
  references JOGO(idJogo),
    
  Foreign key(ID_PLATAFORMA)
  REFERENCES PLATAFORMA(IP)
);    

-- -----------------------------------------------------
-- Tabela Perfil_Usuario
-- -----------------------------------------------------
CREATE TABLE Perfil_Usuario (

  ID_Perfil INT NOT NULL,
  Foto_perfil BLOB NOT NULL,
  Biografia VARCHAR(45) NOT NULL,
  Localização VARCHAR(45) NOT NULL,
  PRIMARY KEY (ID_Perfil)
);


-- -----------------------------------------------------
-- Tabela Perfil_Usuario_has_Deselvolvedor
-- -----------------------------------------------------
CREATE TABLE Perfil_Usuario_has_Deselvolvedor (

  ID_Perfil_Usuário INT NOT NULL,
  ID_Deselvolvedor INT NOT NULL,
  PRIMARY KEY (ID_Perfil_Usuário, ID_Deselvolvedor),

  CONSTRAINT `fk_Perfil_Usuario_has_Deselvolvedor_Perfil_Usuario1`
    FOREIGN KEY (ID_Perfil_Usuário)
    REFERENCES Perfil_Usuario (ID_Perfil)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Perfil_Usuario_has_Deselvolvedor_Deselvolvedor1`
    FOREIGN KEY (ID_Deselvolvedor)
    REFERENCES Deselvolvedor (idDeselvolvedor)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);


-- -----------------------------------------------------
-- Tabela Plataforma
-- -----------------------------------------------------
CREATE TABLE Plataforma (

  IP INT NOT NULL,
  Nome VARCHAR(45) NOT NULL,
  Versão VARCHAR(45) NOT NULL,
  Fabricante VARCHAR(45) NOT NULL,
  Data_Lançamento DATE NOT NULL,
  PRIMARY KEY (IP)
);


-- -----------------------------------------------------
-- Tabela Plataforma_has_Usuário
-- -----------------------------------------------------
CREATE TABLE Plataforma_has_Usuário (

  Plataforma_IP INT NOT NULL,
  Usuário_idUsuario INT NOT NULL,
  Usuário_ID_Biblioteca INT NOT NULL,
  Usuário_Usuário_Amigo INT NOT NULL,
  Usuário_Usuário_ID_Biblioteca INT NOT NULL,
  PRIMARY KEY (Plataforma_IP, Usuário_idUsuario, Usuário_ID_Biblioteca, Usuário_Usuário_Amigo, Usuário_Usuário_ID_Biblioteca),

  CONSTRAINT `fk_Plataforma_has_Usuário_Plataforma1`
    FOREIGN KEY (Plataforma_IP)
    REFERENCES Plataforma (IP)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Plataforma_has_Usuário_Usuário1`
    FOREIGN KEY (Usuário_idUsuario , Usuário_ID_Biblioteca , Usuário_Usuário_Amigo , Usuário_Usuário_ID_Biblioteca)
    REFERENCES Usuário (idUsuario , ID_Biblioteca , Usuário_Amigo , Usuário_ID_Biblioteca)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);


-- -----------------------------------------------------
-- Tabela Chat
-- -----------------------------------------------------
CREATE TABLE Chat (

  Sala_Conversa varchar(500) NOT NULL,
  Mensagem VARCHAR(45) NOT NULL,
  Data_Hora DATE NOT NULL,
  PRIMARY KEY (Sala_Conversa)
);


-- -----------------------------------------------------
-- Tabela Chat_has_Usuário
-- -----------------------------------------------------
CREATE TABLE Chat_has_Usuário (

  Chat_Sala_Conversa varchar(500) NOT NULL,
  Usuário_idUsuario INT NOT NULL,
  Usuário_ID_Biblioteca INT NOT NULL,
  PRIMARY KEY (Chat_Sala_Conversa, Usuário_idUsuario, Usuário_ID_Biblioteca),

  CONSTRAINT `fk_Chat_has_Usuário_Chat1`
    FOREIGN KEY (Chat_Sala_Conversa)
    REFERENCES Chat (Sala_Conversa)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Chat_has_Usuário_Usuário1`
    FOREIGN KEY (Usuário_idUsuario , Usuário_ID_Biblioteca)
    REFERENCES Usuário (idUsuario , ID_Biblioteca)
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
  PRIMARY KEY (idCarrinho_de_Compras)
);


-- -----------------------------------------------------
-- Tabela Pagamento
-- -----------------------------------------------------
CREATE TABLE Pagamento (

  idPagamento INT NOT NULL,
  Tipo_Pagamento VARCHAR(45) NOT NULL,
  Status_Pagamento VARCHAR(45) NOT NULL,
  Data_Pagamento VARCHAR(45) NOT NULL,
  ID_Carrinho_de_Compras INT NOT NULL,
  PRIMARY KEY (idPagamento, ID_Carrinho_de_Compras),

  CONSTRAINT `fk_Pagamento_Carrinho_de_Compras1`
    FOREIGN KEY (ID_Carrinho_de_Compras)
    REFERENCES Carrinho_de_Compras (idCarrinho_de_Compras)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);


-- -----------------------------------------------------
-- Tabela Compra
-- -----------------------------------------------------
CREATE TABLE Compra (

  idCompra INT NOT NULL,
  Data_da_Compra DATE NOT NULL,
  Valor_Total VARCHAR(45) NOT NULL,
  PRIMARY KEY (idCompra)
);


-- -----------------------------------------------------
-- Tabela Pagamento_has_Compra
-- -----------------------------------------------------
CREATE TABLE Pagamento_has_Compra (
  ID_Pagamento INT NOT NULL,
  ID_Compra INT NOT NULL,
  PRIMARY KEY (ID_Pagamento, ID_Compra),

  CONSTRAINT `fk_Pagamento_has_Compra_Pagamento1`
    FOREIGN KEY (ID_Pagamento)
    REFERENCES Pagamento (idPagamento)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pagamento_has_Compra_Compra1`
    FOREIGN KEY (ID_Compra)
    REFERENCES Compra (idCompra)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE Usuário (    idUsuario INT NOT NULL,   Data_Nascimento DATE NOT NULL,   Nome VARCHAR(45) NOT NULL,   Data_Cadastro VARCHAR(45) NOT NULL,   Email VARCHAR(45) NOT NULL,   Telefone VARCHAR(45) NULL,   ID_Biblioteca INT NOT NULL,   Usuário_Amigo VARCHAR(45) NOT NULL,   Usuário_ID_Biblioteca INT NOT NULL,   Perfil_Usuario_idPerfil_Usuario INT NOT NULL,   Carrinho_de_Compras_idCarrinho_de_Compras INT NOT NULL,   PRIMARY KEY (idUsuario, ID_Biblioteca, Usuário_Amigo, Usuário_ID_Biblioteca, Perfil_Usuario_idPerfil_Usuario, Carrinho_de_Compras_idCarrinho_de_Compras),    CONSTRAINT `fk_Usuario_Biblioteca_de_Jogos`     FOREIGN KEY (ID_Biblioteca)     REFERENCES Biblioteca_de_Jogos (idBiblioteca_de_Jogos)     ON DELETE NO ACTION     ON UPDATE NO ACTION,   CONSTRAINT `fk_Usuário_Amigo`     FOREIGN KEY (Usuário_Amigo , Usuário_ID_Biblioteca)     REFERENCES Usuário (idUsuario , ID_Biblioteca)     ON DELETE NO ACTION     ON UPDATE NO ACTION,   CONSTRAINT `fk_Usuário_Perfil`     FOREIGN KEY (Perfil_Usuario_idPerfil_Usuario)     REFERENCES Perfil_Usuario (`idPerfil_Usuario`)     ON DELETE NO ACTION     ON UPDATE NO ACTION,   CONSTRAINT `fk_Usuário_Carrinho_de_Compras1`     FOREIGN KEY (Carrinho_de_Compras_idCarrinho_de_Compras)     REFERENCES Carrinho_de_Compras (idCarrinho_de_Compras)     ON DELETE NO ACTION     ON UPDATE NO ACTION)
