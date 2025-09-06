-- Tabela CategoriaOcorrencia
CREATE TABLE CategoriaOcorrencia (
    codCategoria INT PRIMARY KEY,
    nomeCategoria VARCHAR(100) NOT NULL
);

-- Tabela Endereco
CREATE TABLE Endereco (
    codEndereco INT PRIMARY KEY,
    localDetalhado VARCHAR(150) NOT NULL
);

-- Tabela Pessoa
CREATE TABLE Pessoa (
    codPessoa INT PRIMARY KEY,
    nomeCompleto VARCHAR(100) NOT NULL,
    emailContato VARCHAR(100) UNIQUE,
    chaveAcesso VARCHAR(100) NOT NULL
);

-- Tabela auxiliar: StatusOcorrencia
CREATE TABLE StatusOcorrencia (
    codStatus INT PRIMARY KEY,
    descricaoStatus VARCHAR(50) NOT NULL
);

-- Tabela Ocorrencia (agora com codStatus)
CREATE TABLE Ocorrencia (
    codOcorrencia INT PRIMARY KEY,
    codCategoria INT,
    codEndereco INT,
    codStatus INT,
    momento DATETIME NOT NULL,
    detalhes VARCHAR(255),
    FOREIGN KEY (codCategoria) REFERENCES CategoriaOcorrencia(codCategoria),
    FOREIGN KEY (codEndereco) REFERENCES Endereco(codEndereco),
    FOREIGN KEY (codStatus) REFERENCES StatusOcorrencia(codStatus)
);

-- Tabela Registro
CREATE TABLE Registro (
    codRegistro INT PRIMARY KEY,
    codOcorrencia INT,
    codPessoa INT,
    conteudo TEXT NOT NULL,
    dataRegistro DATETIME NOT NULL,
    FOREIGN KEY (codOcorrencia) REFERENCES Ocorrencia(codOcorrencia),
    FOREIGN KEY (codPessoa) REFERENCES Pessoa(codPessoa)
);

-- Tabela Notificacao
CREATE TABLE Notificacao (
    codNotificacao INT PRIMARY KEY,
    codOcorrencia INT,
    textoAviso VARCHAR(255) NOT NULL,
    momentoAviso DATETIME NOT NULL,
    FOREIGN KEY (codOcorrencia) REFERENCES Ocorrencia(codOcorrencia)
);
