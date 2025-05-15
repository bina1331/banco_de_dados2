CREATE DATABASE eventos_BD2;
USE eventos_BD2;


CREATE TABLE organizadores (
id_organizadores INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(150) NOT NULL,
contato_email VARCHAR(100) NOT NULL UNIQUE,
telefone VARCHAR(20),
cargo VARCHAR(50) -- campo adicional 
);

CREATE TABLE eventos (
id_evento INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(500) NOT NULL,
tipo_evento VARCHAR(50) NOT NULL,    -- campo adicional 
descricao VARCHAR(1400),
data_inicio DATE NOT NULL,
data_fim DATE NOT NULL,
local_evento VARCHAR(100) NOT NULL,
id_organizadores INT,
FOREIGN KEY (id_organizadores) REFERENCES organizadores(id_organizadores)
);

CREATE TABLE participantes (
id_participantes INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(150) NOT NULL,
email VARCHAR (100) NOT NULL UNIQUE,
telefone VARCHAR(20),
data_inscricao DATE NOT NULL,
status_participantes VARCHAR(20) NOT NULL -- campo adicional
);

CREATE TABLE inscricoes (
id_incricoes INT AUTO_INCREMENT PRIMARY KEY,
id_evento INT NOT NULL,
id_participantes INT NOT NULL,
data_inscricao DATE NOT NULL,
status_pagamento VARCHAR(30) NOT NULL,
status_inscricao VARCHAR(30) NOT NULL, -- campo adicional
FOREIGN KEY (id_evento) REFERENCES eventos(id_evento),
FOREIGN KEY (id_participantes) REFERENCES participantes(id_participantes)
);

INSERT INTO organizadores (nome, contato_email, telefone, cargo) VALUES
('Heloisa Marques', 'heloisa.marques@email.com', '61990010001', 'Coordenadora'),
('Sabrina Cardoso', 'sabrina.cardoso@email.com', '61990010002', 'Assistente'),
('Pedro Almeida', 'lucas.almeida@email.com', '61990010003', 'Diretor'),
('Ana Clara Costa', 'juliana.costa@email.com', '61990010004', 'Organizadora'),
('Huama Rocha', 'mateus.rocha@email.com', '61990010005', 'Analista'),
('Julia Souza', 'aline.souza@email.com', '61990010006', 'Assistente'),
('Alexandre Lima', 'bruno.lima@email.com', '61990010007', 'Coordenador'),
('Camila Torres', 'camila.torres@email.com', '61990010008', 'Diretora'),
('Diego Martins', 'diego.martins@email.com', '61990010009', 'Organizador'),
('Fernanda Ribeiro', 'fernanda.ribeiro@email.com', '61990010010', 'Assistente'),
('Gabriel Monteiro', 'gabriel.monteiro@email.com', '61990010011', 'Coordenador'),
('Helena Freitas', 'helena.freitas@email.com', '61990010012', 'Analista'),
('Igor Fernandes', 'igor.fernandes@email.com', '61990010013', 'Assistente'),
('Joana Prado', 'joana.prado@email.com', '61990010014', 'Diretora'),
('Kevin Duarte', 'kevin.duarte@email.com', '61990010015', 'Organizador'),
('Larissa Mendes', 'larissa.mendes@email.com', '61990010016', 'Coordenadora'),
('Marcos Teixeira', 'marcos.teixeira@email.com', '61990010017', 'Assistente'),
('Nathalia Lopes', 'nathalia.lopes@email.com', '61990010018', 'Diretora'),
('Otávio Castro', 'otavio.castro@email.com', '61990010019', 'Organizador'),
('Patrícia Nunes', 'patricia.nunes@email.com', '61990010020', 'Assistente'),
('Renato Sampaio', 'renato.sampaio@email.com', '61990010021', 'Coordenador'),
('Sandra Vasconcelos', 'sandra.vasconcelos@email.com', '61990010022', 'Organizadora'),
('Tiago Pires', 'tiago.pires@email.com', '61990010023', 'Assistente'),
('Vanessa Rocha', 'vanessa.rocha@email.com', '61990010024', 'Diretora'),
('Wesley Amaral', 'wesley.amaral@email.com', '61990010025', 'Organizador'),
('Yasmin Oliveira', 'yasmin.oliveira@email.com', '61990010026', 'Assistente'),
('Zé Carlos', 'ze.carlos@email.com', '61990010027', 'Coordenador'),
('Andréa Mota', 'andrea.mota@email.com', '61990010028', 'Analista'),
('Bruna Barros', 'bruna.barros@email.com', '61990010029', 'Assistente'),
('Caio Batista', 'caio.batista@email.com', '61990010030', 'Organizador'),
('Daniela Farias', 'daniela.farias@email.com', '61990010031', 'Diretora'),
('Eduardo Luz', 'eduardo.luz@email.com', '61990010032', 'Assistente'),
('Fabiana Reis', 'fabiana.reis@email.com', '61990010033', 'Coordenadora'),
('Gustavo Neves', 'gustavo.neves@email.com', '61990010034', 'Organizador'),
('Hilda Gomes', 'hilda.gomes@email.com', '61990010035', 'Assistente'),
('Isadora Campos', 'isadora.campos@email.com', '61990010036', 'Diretora'),
('João Vitor', 'joao.vitor@email.com', '61990010037', 'Organizador'),
('Kelly Xavier', 'kelly.xavier@email.com', '61990010038', 'Assistente'),
('Leonardo Passos', 'leonardo.passos@email.com', '61990010039', 'Coordenador'),
('Mirela Tavares', 'mirela.tavares@email.com', '61990010040', 'Organizadora');

INSERT INTO eventos (nome_evento, descricao, data_inicio, data_fim, local_evento, id_organizadores, tipo_evento) VALUES
('Workshop de Inovação', 'Oficina sobre metodologias criativas e inovação.', '2025-05-10', '2025-05-10', 'Auditório Central', 1, 'Workshop'),
('Palestra: Futuro da Tecnologia', 'Discussão sobre tendências tecnológicas emergentes.', '2025-05-15', '2025-05-15', 'Sala 101', 2, 'Palestra'),
('Conferência de Sustentabilidade', 'Evento com foco em práticas sustentáveis em empresas.', '2025-05-20', '2025-05-21', 'Centro de Convenções', 3, 'Conferência'),
('Curso de Python Básico', 'Curso introdutório para iniciantes em programação.', '2025-05-22', '2025-05-26', 'Laboratório 3', 4, 'Curso'),
('Seminário de Marketing Digital', 'Seminário voltado para estratégias de marketing online.', '2025-05-25', '2025-05-25', 'Sala 201', 5, 'Seminário'),
('Palestra: UX Design', 'Apresentação sobre boas práticas de design de experiência.', '2025-05-28', '2025-05-28', 'Sala 102', 6, 'Palestra'),
('Workshop de Prototipagem', 'Atividade prática para criar protótipos de apps.', '2025-06-01', '2025-06-01', 'Laboratório 2', 7, 'Workshop'),
('Conferência de Educação', 'Discussão sobre o futuro da educação no Brasil.', '2025-06-05', '2025-06-07', 'Centro Educacional', 8, 'Conferência'),
('Curso de Liderança', 'Curso prático sobre habilidades de liderança.', '2025-06-10', '2025-06-14', 'Sala de Treinamento', 9, 'Curso'),
('Seminário de Carreiras', 'Orientações para planejamento de carreira.', '2025-06-15', '2025-06-15', 'Teatro Universitário', 10, 'Seminário'),
('Palestra: Cibersegurança', 'Como proteger dados e evitar ataques digitais.', '2025-06-18', '2025-06-18', 'Sala 103', 11, 'Palestra'),
('Workshop de Startups', 'Como tirar uma ideia do papel e empreender.', '2025-06-20', '2025-06-20', 'Sala Maker', 12, 'Workshop'),
('Conferência de Dados', 'Discussões sobre Big Data e Data Science.', '2025-06-22', '2025-06-23', 'Auditório A', 13, 'Conferência'),
('Curso de Excel Avançado', 'Planilhas, fórmulas e dashboards no Excel.', '2025-06-25', '2025-06-28', 'Lab 4', 14, 'Curso'),
('Seminário de Psicologia', 'Palestras sobre saúde mental na sociedade moderna.', '2025-06-30', '2025-06-30', 'Auditório B', 15, 'Seminário'),
('Workshop: Fotografia Mobile', 'Aprenda a tirar boas fotos com celular.', '2025-07-02', '2025-07-02', 'Sala Multimídia', 16, 'Workshop'),
('Palestra: Inteligência Artificial', 'O impacto da IA na sociedade.', '2025-07-05', '2025-07-05', 'Sala 104', 17, 'Palestra'),
('Conferência de Tecnologia Educacional', 'Recursos digitais no ensino moderno.', '2025-07-08', '2025-07-09', 'Sala de Eventos', 18, 'Conferência'),
('Curso de Inglês para Viagem', 'Curso rápido para turistas.', '2025-07-10', '2025-07-14', 'Sala 202', 19, 'Curso'),
('Seminário de Cidadania Digital', 'Segurança e ética no uso da internet.', '2025-07-15', '2025-07-15', 'Anfiteatro', 20, 'Seminário'),
('Workshop de Design Gráfico', 'Noções básicas de criação gráfica.', '2025-07-18', '2025-07-18', 'Lab Design', 21, 'Workshop'),
('Palestra: Economia Circular', 'Redução de resíduos e reaproveitamento.', '2025-07-20', '2025-07-20', 'Sala 301', 22, 'Palestra'),
('Conferência Jurídica', 'Novas leis e jurisprudências.', '2025-07-22', '2025-07-24', 'Centro de Eventos Jurídicos', 23, 'Conferência'),
('Curso de Empreendedorismo', 'Desenvolvendo negócios desde o início.', '2025-07-26', '2025-07-30', 'Sala 203', 24, 'Curso'),
('Seminário de Robótica', 'Aplicações práticas da robótica.', '2025-08-01', '2025-08-01', 'Laboratório de Engenharia', 25, 'Seminário'),
('Workshop: Pintura em Tela', 'Técnicas básicas de pintura.', '2025-08-03', '2025-08-03', 'Ateliê 1', 26, 'Workshop'),
('Palestra: Empatia e Liderança', 'O papel da empatia nas relações profissionais.', '2025-08-05', '2025-08-05', 'Sala 304', 27, 'Palestra'),
('Conferência de Saúde Pública', 'Debates sobre políticas públicas de saúde.', '2025-08-08', '2025-08-10', 'Auditório Principal', 28, 'Conferência'),
('Curso de JavaScript', 'Fundamentos e aplicações práticas.', '2025-08-12', '2025-08-16', 'Lab 5', 29, 'Curso'),
('Seminário de Literatura Contemporânea', 'Autores e obras do século XXI.', '2025-08-18', '2025-08-18', 'Biblioteca', 30, 'Seminário'),
('Workshop de Canva', 'Criação de artes gráficas com Canva.', '2025-08-20', '2025-08-20', 'Lab Digital', 31, 'Workshop'),
('Palestra: Fake News', 'Como identificar e combater notícias falsas.', '2025-08-22', '2025-08-22', 'Sala 105', 32, 'Palestra'),
('Conferência de Diversidade', 'A importância da inclusão social.', '2025-08-24', '2025-08-25', 'Auditório Inclusão', 33, 'Conferência'),
('Curso de Fotografia Profissional', 'Uso de câmeras DSLR e técnicas avançadas.', '2025-08-26', '2025-08-30', 'Studio Foto', 34, 'Curso'),
('Seminário de Ética Profissional', 'Postura e decisões no ambiente de trabalho.', '2025-08-31', '2025-08-31', 'Sala Ética', 35, 'Seminário'),
('Workshop de Podcast', 'Como planejar e gravar seu podcast.', '2025-06-11', '2025-06-11', 'Estúdio de Áudio', 36, 'Workshop'),
('Palestra: Mercado de Trabalho', 'Tendências e oportunidades de carreira.', '2025-06-13', '2025-06-13', 'Auditório Jovem', 37, 'Palestra'),
('Conferência Nacional de Tecnologia', 'Grande evento nacional sobre tech.', '2025-06-15', '2025-06-17', 'Pavilhão de Feiras', 38, 'Conferência'),
('Curso de Banco de Dados', 'Modelagem e SQL na prática.', '2025-06-19', '2025-06-23', 'Lab 6', 39, 'Curso'),
('Seminário: Direitos Humanos', 'Reflexões sobre igualdade e respeito.', '2025-06-27', '2025-06-27', 'Auditório D', 40, 'Seminário');

-- Inserindo 40 participantes
INSERT INTO participantes (nome, email, telefone, data_inscricao)
VALUES 
('Heloisa Cardoso', 'heloisa.marques@email.com', '61990010001', '2025-05-05'),
('Sabrina Marques', 'sabrina.cardoso@email.com', '61990010002', '2025-05-05'),
('Ana Souza', 'ana.souza@email.com', '61990010003', '2025-05-06'),
('Carlos Silva', 'carlos.silva@email.com', '61990010004', '2025-05-06'),
('Lucas Pereira', 'lucas.pereira@email.com', '61990010005', '2025-05-07'),
('Julia Lima', 'julia.lima@email.com', '61990010006', '2025-05-07'),
('Pedro Costa', 'pedro.costa@email.com', '61990010007', '2025-05-08'),
('Fernanda Oliveira', 'fernanda.oliveira@email.com', '61990010008', '2025-05-08'),
('Gabriela Martins', 'gabriela.martins@email.com', '61990010009', '2025-05-09'),
('Roberto Ferreira', 'roberto.ferreira@email.com', '61990010010', '2025-05-09'),
('Maria Alves', 'maria.alves@email.com', '61990010011', '2025-05-10'),
('José Pereira', 'jose.pereira@email.com', '61990010012', '2025-05-10'),
('Carla Rodrigues', 'carla.rodrigues@email.com', '61990010013', '2025-05-11'),
('Felipe Santos', 'felipe.santos@email.com', '61990010014', '2025-05-11'),
('Mariana Costa', 'mariana.costa@email.com', '61990010015', '2025-05-12'),
('André Souza', 'andre.souza@email.com', '61990010016', '2025-05-12'),
('Beatriz Oliveira', 'beatriz.oliveira@email.com', '61990010017', '2025-05-13'),
('Tiago Gomes', 'tiago.gomes@email.com', '61990010018', '2025-05-13'),
('Cláudia Silva', 'claudia.silva@email.com', '61990010019', '2025-05-14'),
('Ricardo Lima', 'ricardo.lima@email.com', '61990010020', '2025-05-14'),
('Renata Martins', 'renata.martins@email.com', '61990010021', '2025-05-15'),
('Eduardo Costa', 'eduardo.costa@email.com', '61990010022', '2025-05-15'),
('Juliana Almeida', 'juliana.almeida@email.com', '61990010023', '2025-05-16'),
('Vinícius Santos', 'vinicius.santos@email.com', '61990010024', '2025-05-16'),
('Marcio Souza', 'marcio.souza@email.com', '61990010025', '2025-05-17'),
('Priscila Lima', 'priscila.lima@email.com', '61990010026', '2025-05-17'),
('Roberta Alves', 'roberta.alves@email.com', '61990010027', '2025-05-18'),
('Gustavo Pereira', 'gustavo.pereira@email.com', '61990010028', '2025-05-18'),
('Isabela Ferreira', 'isabela.ferreira@email.com', '61990010029', '2025-05-19'),
('Renan Costa', 'renan.costa@email.com', '61990010030', '2025-05-19'),
('Amanda Rodrigues', 'amanda.rodrigues@email.com', '61990010031', '2025-05-20'),
('Leandro Martins', 'leandro.martins@email.com', '61990010032', '2025-05-20'),
('Luciana Gomes', 'luciana.gomes@email.com', '61990010033', '2025-05-21'),
('Jorge Alves', 'jorge.alves@email.com', '61990010034', '2025-05-21'),
('Carlos Almeida', 'carlos.almeida@email.com', '61990010035', '2025-05-22'),
('Tatiane Lima', 'tatiane.lima@email.com', '61990010036', '2025-05-22'),
('Eduarda Silva', 'eduarda.silva@email.com', '61990010037', '2025-05-23'),
('Marcelo Pereira', 'marcelo.pereira@email.com', '61990010038', '2025-05-23'),
('Tatiane Oliveira', 'tatiane.oliveira@email.com', '61990010039', '2025-05-24'),
('Vinícius Gomes', 'vinicius.gomes@email.com', '61990010040', '2025-05-24');

-- Inserindo 40 inscrições
INSERT INTO inscricoes (id_evento, id_participantes, data_inscricao, status_pagamento, status_inscricao)
VALUES 
(1, 1, '2025-05-05', 'Pago', 'Confirmado'),
(2, 2, '2025-05-05', 'Pago', 'Confirmado'),
(3, 3, '2025-05-06', 'Pendente', 'Aguardando pagamento'),
(4, 4, '2025-05-06', 'Pago', 'Confirmado'),
(5, 5, '2025-05-07', 'Pendente', 'Aguardando pagamento'),
(6, 6, '2025-05-07', 'Pago', 'Confirmado'),
(7, 7, '2025-05-08', 'Pago', 'Confirmado'),
(8, 8, '2025-05-08', 'Pendente', 'Aguardando pagamento'),
(9, 9, '2025-05-09', 'Pago', 'Confirmado'),
(10, 10, '2025-05-09', 'Pendente', 'Aguardando pagamento'),
(11, 11, '2025-05-10', 'Pago', 'Confirmado'),
(12, 12, '2025-05-10', 'Pago', 'Confirmado'),
(13, 13, '2025-05-11', 'Pendente', 'Aguardando pagamento'),
(14, 14, '2025-05-11', 'Pago', 'Confirmado'),
(15, 15, '2025-05-12', 'Pago', 'Confirmado'),
(16, 16, '2025-05-12', 'Pendente', 'Aguardando pagamento'),
(17, 17, '2025-05-13', 'Pago', 'Confirmado'),
(18, 18, '2025-05-13', 'Pendente', 'Aguardando pagamento'),
(19, 19, '2025-05-14', 'Pago', 'Confirmado'),
(20, 20, '2025-05-14', 'Pago', 'Confirmado'),
(21, 21, '2025-05-15', 'Pendente', 'Aguardando pagamento'),
(22, 22, '2025-05-15', 'Pago', 'Confirmado'),
(23, 23, '2025-05-16', 'Pago', 'Confirmado'),
(24, 24, '2025-05-16', 'Pendente', 'Aguardando pagamento'),
(25, 25, '2025-05-17', 'Pago', 'Confirmado'),
(26, 26, '2025-05-17', 'Pendente', 'Aguardando pagamento'),
(27, 27, '2025-05-18', 'Pago', 'Confirmado'),
(28, 28, '2025-05-18', 'Pendente', 'Aguardando pagamento'),
(29, 29, '2025-05-19', 'Pago', 'Confirmado'),
(30, 30, '2025-05-19', 'Pago', 'Confirmado'),
(31, 31, '2025-05-20', 'Pendente', 'Aguardando pagamento'),
(32, 32, '2025-05-20', 'Pago', 'Confirmado'),
(33, 33, '2025-05-21', 'Pendente', 'Aguardando pagamento'),
(34, 34, '2025-05-21', 'Pago', 'Confirmado'),
(35, 35, '2025-05-22', 'Pago', 'Confirmado'),
(36, 36, '2025-05-22', 'Pendente', 'Aguardando pagamento'),
(37, 37, '2025-05-23', 'Pago', 'Confirmado'),
(38, 38, '2025-05-23', 'Pendente', 'Aguardando pagamento'),
(39, 39, '2025-05-24', 'Pago', 'Confirmado'),
(40, 40, '2025-05-24', 'Pendente', 'Aguardando pagamento');









