
USE streaming_BD2;

CREATE TABLE conteudos (
    id_conteudos INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    tipo ENUM('filme', 'série', 'documentário') NOT NULL,
    genero VARCHAR(20),
    ano_lancamento DATE,
    duracao_minutos INT CHECK (duracao_minutos > 0),
    classificacao_etaria VARCHAR(10),
    status_disponibilidade ENUM('disponível', 'indisponível') DEFAULT 'disponível',
    idioma_original VARCHAR(30) DEFAULT 'Inglês'
);

CREATE TABLE plano_assinatura (
    id_assinatura INT AUTO_INCREMENT PRIMARY KEY,
    nome_plano VARCHAR(50) NOT NULL UNIQUE,
    preco_mensal DECIMAL NOT NULL,
    resolucao_maxima VARCHAR(20) NOT NULL,
    numero_telas INT NOT NULL CHECK (numero_telas > 0),
    downloads_offline BOOLEAN DEFAULT FALSE
);

CREATE TABLE usuarios (
    id_usuarios INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(250) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    data_cadastro DATE NOT NULL,
    id_assinatura INT,
    idioma_preferido VARCHAR(20),
    FOREIGN KEY (id_assinatura) REFERENCES plano_assinatura(id_assinatura)
);

CREATE TABLE historico_visualizacao (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuarios INT NOT NULL,
    id_conteudos INT NOT NULL,
    data_visualizacao DATE NOT NULL,
    progresso_percentual DECIMAL CHECK (progresso_percentual >= 0 AND progresso_percentual <= 100),
    dispositivo_usado VARCHAR(50),
    FOREIGN KEY (id_usuarios) REFERENCES usuarios(id_usuarios),
    FOREIGN KEY (id_conteudos) REFERENCES conteudos(id_conteudos)
);

CREATE TABLE avaliacoes (
    id_avaliacoes INT AUTO_INCREMENT PRIMARY KEY,
    id_usuarios INT NOT NULL,
    id_conteudos INT NOT NULL,
    nota INT NOT NULL CHECK (nota BETWEEN 0 AND 5),
    comentario TEXT,
    data_avaliacao DATE,
    FOREIGN KEY (id_usuarios) REFERENCES usuarios(id_usuarios),
    FOREIGN KEY (id_conteudos) REFERENCES conteudos(id_conteudos)
);

INSERT INTO conteudos (titulo, tipo, genero, ano_lancamento, duracao_minutos, classificacao_etaria, status_disponibilidade, idioma_original)
VALUES
('O Senhor dos Anéis: A Sociedade do Anel', 'filme', 'Aventura, Fantasia', '2001-12-19', 178, '12 anos', 'disponível', 'Inglês'),
('Stranger Things', 'série', 'Terror, Ficção científica', '2016-07-15', 50, '16 anos', 'disponível', 'Inglês'),
('O Poderoso Chefão', 'filme', 'Crime, Drama', '1972-03-24', 175, '18 anos', 'disponível', 'Inglês'),
('Breaking Bad', 'série', 'Drama, Crime', '2008-01-20', 47, '18 anos', 'disponível', 'Inglês'),
('The Witcher', 'série', 'Aventura, Fantasia', '2019-12-20', 60, '16 anos', 'disponível', 'Inglês'),
('The Office', 'série', 'Comédia', '2005-03-24', 22, '12 anos', 'disponível', 'Inglês'),
('Vingadores: Ultimato', 'filme', 'Ação, Aventura, Ficção científica', '2019-04-26', 181, '12 anos', 'disponível', 'Inglês'),
('The Mandalorian', 'série', 'Ação, Aventura, Ficção científica', '2019-11-12', 45, '12 anos', 'disponível', 'Inglês'),
('Matrix', 'filme', 'Ação, Ficção científica', '1999-03-31', 136, '14 anos', 'disponível', 'Inglês'),
('Narcos', 'série', 'Crime, Drama', '2015-08-28', 50, '18 anos', 'disponível', 'Inglês'),
('Titanic', 'filme', 'Drama, Romance', '1997-12-19', 195, '12 anos', 'disponível', 'Inglês'),
('Dark', 'série', 'Drama, Mistério, Ficção científica', '2017-12-01', 60, '16 anos', 'disponível', 'Alemão'),
('Friends', 'série', 'Comédia', '1994-09-22', 22, '10 anos', 'disponível', 'Inglês'),
('Jurassic Park', 'filme', 'Aventura, Ficção científica', '1993-06-11', 127, '10 anos', 'disponível', 'Inglês'),
('The Crown', 'série', 'Biografia, Drama', '2016-11-04', 58, '12 anos', 'disponível', 'Inglês'),
('Peaky Blinders', 'série', 'Crime, Drama', '2013-09-12', 60, '18 anos', 'disponível', 'Inglês'),
('Game of Thrones', 'série', 'Aventura, Drama, Fantasia', '2011-04-17', 60, '18 anos', 'disponível', 'Inglês'),
('Avengers: Infinity War', 'filme', 'Ação, Aventura, Ficção científica', '2018-04-27', 149, '12 anos', 'disponível', 'Inglês'),
('Shrek', 'filme', 'Animação, Aventura, Comédia', '2001-04-22', 90, 'Livre', 'disponível', 'Inglês'),
('The Walking Dead', 'série', 'Terror, Drama', '2010-10-31', 45, '16 anos', 'disponível', 'Inglês'),
('The Social Network', 'filme', 'Drama', '2010-10-01', 120, '12 anos', 'disponível', 'Inglês'),
('Piratas do Caribe: A Maldição do Pérola Negra', 'filme', 'Ação, Aventura, Fantasia', '2003-07-09', 143, '12 anos', 'disponível', 'Inglês'),
('The Queen’s Gambit', 'série', 'Drama', '2020-10-23', 60, '10 anos', 'disponível', 'Inglês'),
('Spider-Man: No Way Home', 'filme', 'Ação, Aventura', '2021-12-17', 148, '12 anos', 'disponível', 'Inglês'),
('Loki', 'série', 'Ação, Aventura, Fantasia', '2021-06-09', 50, '12 anos', 'disponível', 'Inglês'),
('Chernobyl', 'série', 'Drama, Histórico', '2019-05-06', 60, '14 anos', 'disponível', 'Inglês'),
('Iron Man', 'filme', 'Ação, Aventura, Ficção científica', '2008-05-02', 126, '12 anos', 'disponível', 'Inglês'),
('The Office (UK)', 'série', 'Comédia', '2001-07-09', 30, '10 anos', 'disponível', 'Inglês'),
('Black Mirror', 'série', 'Drama, Sci-fi, Thriller', '2011-12-04', 60, '16 anos', 'disponível', 'Inglês'),
('Money Heist', 'série', 'Crime, Drama, Mistério', '2017-05-02', 45, '16 anos', 'disponível', 'Espanhol'),
('Hunger Games', 'filme', 'Ação, Ficção científica, Drama', '2012-03-23', 142, '12 anos', 'disponível', 'Inglês'),
('The Umbrella Academy', 'série', 'Aventura, Comédia, Drama', '2019-02-15', 50, '12 anos', 'disponível', 'Inglês'),
('La Casa de Papel', 'série', 'Crime, Drama, Mistério', '2017-05-02', 60, '16 anos', 'disponível', 'Espanhol'),
('Toy Story', 'filme', 'Animação, Aventura, Comédia', '1995-11-22', 81, 'Livre', 'disponível', 'Inglês'),
('The Expanse', 'série', 'Ficção científica', '2015-11-23', 60, '14 anos', 'disponível', 'Inglês');


INSERT INTO plano_assinatura (nome_plano, preco_mensal, resolucao_maxima, numero_telas, downloads_offline)
VALUES
('Plano Básico', 19.90, '720p', 1, TRUE),
('Plano Padrão', 29.90, '1080p', 2, TRUE),
('Plano Premium', 39.90, '4K', 4, TRUE),
('Plano Família', 49.90, '4K', 6, TRUE),
('Plano Econômico', 9.90, '480p', 1, FALSE),
('Plano de Estudante', 14.90, '720p', 1, TRUE),
('Plano Ultra', 59.90, '8K', 5, TRUE),
('Plano Exclusivo', 69.90, '8K', 10, TRUE),
('Plano Inicial', 7.90, '480p', 1, FALSE),
('Plano 4K Plus', 44.90, '4K', 4, TRUE),
('Plano Elite', 79.90, '8K', 8, TRUE),
('Plano Convidado', 0.00, '480p', 1, FALSE),
('Plano Executivo', 55.90, '4K', 3, TRUE),
('Plano Single', 19.90, '720p', 1, FALSE),
('Plano Duo', 24.90, '1080p', 2, TRUE),
('Plano Família Plus', 54.90, '4K', 6, TRUE),
('Plano Corporativo', 99.90, '8K', 20, TRUE),
('Plano Empresarial', 120.00, '8K', 30, TRUE),
('Plano Conforto', 39.90, '1080p', 4, TRUE),
('Plano Jovem', 24.90, '1080p', 2, TRUE),
('Plano Full HD', 34.90, '1080p', 3, TRUE),
('Plano 3 Telas', 39.90, '4K', 3, TRUE),
('Plano VIP', 99.90, '8K', 10, TRUE),
('Plano Inicial Plus', 15.90, '720p', 1, FALSE),
('Plano Premium Plus', 59.90, '4K', 5, TRUE),
('Plano Standard', 25.90, '1080p', 2, TRUE),
('Plano Max', 59.90, '4K', 5, TRUE),
('Plano Teen', 19.90, '1080p', 2, TRUE),
('Plano Família Premium', 69.90, '4K', 6, TRUE),
('Plano Super', 99.90, '8K', 10, TRUE);


INSERT INTO usuarios (nome, email, telefone, data_cadastro, id_assinatura, idioma_preferido)
VALUES
('Sabrina Cardoso', 'bina@gmail.com', '11987654321', '2021-05-10', 1, 'Inglês'),
('Heloisa marques', 'helomarques@gmail.com', '11987654322', '2020-07-15', 2, 'Inglês'),
('Carlos Souza', 'carlos@gmail.com', '11987654323', '2019-09-20', 3, 'Português'),
('Ana Costa', 'ana@gmail.com', '11987654324', '2021-03-11', 4, 'Espanhol'),
('Lucas Santos', 'lucas@gmail.com', '11987654325', '2019-01-25', 5, 'Inglês'),
('Julia Pereira', 'julia@gmail.com', '11987654326', '2020-10-30', 6, 'Português'),
('Fernanda Alves', 'fernanda@gmail.com', '11987654327', '2018-04-19', 7, 'Inglês'),
('Ricardo Lima', 'ricardo@gmail.com', '11987654328', '2021-11-05', 8, 'Alemão'),
('Paula Martins', 'paula@gmail.com', '11987654329', '2021-06-12', 1, 'Português'),
('Gabriel Rocha', 'gabriel@gmail.com', '11987654330', '2020-08-21', 2, 'Inglês'),
('Patricia Costa', 'patricia@gmail.com', '11987654331', '2017-12-11', 3, 'Inglês'),
('Ricardo Costa', 'ricardoc@gmail.com', '11987654332', '2021-04-02', 4, 'Espanhol'),
('Fernanda Souza', 'fernandas@gmail.com', '11987654333', '2019-02-28', 5, 'Inglês'),
('Gabriel Alves', 'gabriela@gmail.com', '11987654334', '2021-07-17', 6, 'Português'),
('Amanda Lima', 'amanda@gmail.com', '11987654335', '2020-11-18', 7, 'Inglês'),
('Andréa Silva', 'andrea@gmail.com', '11987654336', '2020-05-10', 8, 'Inglês'),
('Carlos Oliveira', 'carlosol@gmail.com', '11987654337', '2021-12-20', 9, 'Português'),
('Rita Fernandes', 'rita@gmail.com', '11987654338', '2018-11-30', 10, 'Inglês'),
('Mariana Costa', 'mariana@gmail.com', '11987654339', '2019-10-04', 3, 'Português'),
('Victor Silva', 'victor@gmail.com', '11987654340', '2020-03-05', 4, 'Inglês'),
('Larissa Oliveira', 'larissa@gmail.com', '11987654341', '2021-10-15', 5, 'Inglês'),
('Tiago Pereira', 'tiago@gmail.com', '11987654342', '2021-07-10', 6, 'Português'),
('Isabela Martins', 'isabela@gmail.com', '11987654343', '2021-06-25', 7, 'Inglês'),
('Eduardo Rocha', 'eduardo@gmail.com', '11987654344', '2021-05-01', 8, 'Inglês'),
('Tatiane Souza', 'tatiane@gmail.com', '11987654345', '2021-04-18', 9, 'Português'),
('Caio Lima', 'caio@gmail.com', '11987654346', '2021-06-08', 10, 'Inglês');







