CREATE DATABASE sistema_ongs;
USE sistema_ongs;

CREATE TABLE doador (
    id_doador INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    telefone VARCHAR(20),
    cpf_cnpj VARCHAR(20) UNIQUE
) ENGINE=InnoDB;

CREATE TABLE beneficiario (
    id_beneficiario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    endereco TEXT,
    telefone VARCHAR(20)
) ENGINE=InnoDB;

CREATE TABLE campanha (
    id_campanha INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    data_inicio DATE,
    data_fim DATE,
    status ENUM('ativa', 'finalizada', 'cancelada') DEFAULT 'ativa'
) ENGINE=InnoDB;

CREATE TABLE doacao (
    id_doacao INT PRIMARY KEY AUTO_INCREMENT,
    id_doador INT,
    id_campanha INT,
    data_doacao DATE,
    valor DECIMAL(10,2),
    tipo_doacao VARCHAR(50),
    FOREIGN KEY (id_doador) REFERENCES doador(id_doador) ON DELETE SET NULL,
    FOREIGN KEY (id_campanha) REFERENCES campanha(id_campanha) ON DELETE SET NULL
) ENGINE=InnoDB;

CREATE TABLE distribuicao (
    id_distribuicao INT PRIMARY KEY AUTO_INCREMENT,
    id_beneficiario INT,
    id_campanha INT,
    data_entrega DATE,
    recurso_entregue TEXT,
    FOREIGN KEY (id_beneficiario) REFERENCES beneficiario(id_beneficiario) ON DELETE CASCADE,
    FOREIGN KEY (id_campanha) REFERENCES campanha(id_campanha) ON DELETE SET NULL
) ENGINE=InnoDB;
