CREATE TABLE `alertas` (
  `id_alertas` INT NOT NULL AUTO_INCREMENT UNIQUE,
  `tipo_alerta` VARCHAR(50) NOT NULL,
  `mensagem_alerta` TEXT NOT NULL,
  `data_alerta` DATETIME NOT NULL,
  `utilizador_id` INT NOT NULL,
  PRIMARY KEY (`id_alertas`),
  CONSTRAINT `fk_alertas_1` FOREIGN KEY (`utilizador_id`) REFERENCES `utilizador` (`id_utilizador`)
);

CREATE TABLE `cacifos` (
  `id_cacifo` INT NOT NULL AUTO_INCREMENT UNIQUE,
  `nome` VARCHAR(255) NOT NULL,
  `local_id` INT NOT NULL,
  `estado_cacifos_id` INT NOT NULL,
  PRIMARY KEY (`id_cacifo`),
  CONSTRAINT `fk_cacifos_1` FOREIGN KEY (`local_id`) REFERENCES `local` (`id_local`),
  CONSTRAINT `fk_cacifos_3` FOREIGN KEY (`estado_cacifos_id`) REFERENCES `estado_cacifos` (`id_estado_cacifos`)
);

CREATE TABLE `dispositivos` (
  `id_dispositivos` INT NOT NULL AUTO_INCREMENT UNIQUE,
  `marca_dispositivo` TEXT NOT NULL,
  `modelo_dispositivo` VARCHAR(255) NOT NULL,
  `tipo_dispositivo_id` INT NOT NULL,
  `utilizador_id` INT NOT NULL,
  PRIMARY KEY (`id_dispositivos`),
  CONSTRAINT `fk_dispositivos_1` FOREIGN KEY (`tipo_dispositivo_id`) REFERENCES `tipo_dispositivo` (`id_tipo_dispositivo`),
  CONSTRAINT `fk_dispositivos_2` FOREIGN KEY (`utilizador_id`) REFERENCES `utilizador` (`id_utilizador`)
);

CREATE TABLE `historico` (
  `id_historico` INT NOT NULL AUTO_INCREMENT UNIQUE,
  `hora_inicio` DATETIME NOT NULL,
  `hora_fim` DATETIME NULL,
  `estado_historico` ENUM('ativo','terminado') NOT NULL,
  `utilizador_id` INT NOT NULL,
  `cacifos_id` INT NOT NULL,
  PRIMARY KEY (`id_historico`),
  CONSTRAINT `fk_acessos_1` FOREIGN KEY (`utilizador_id`) REFERENCES `utilizador` (`id_utilizador`),
  CONSTRAINT `fk_historico_2` FOREIGN KEY (`cacifos_id`) REFERENCES `cacifos` (`id_cacifo`)
);

CREATE TABLE `local` (
  `id_local` INT NOT NULL AUTO_INCREMENT UNIQUE,
  `cidade_local` VARCHAR(100) NOT NULL,
  `pais_local` VARCHAR(100) NOT NULL,
  `latitude` DECIMAL(9, 6) NOT NULL,
  `longitude` DECIMAL(9, 6) NOT NULL,
  PRIMARY KEY (`id_local`)
);

CREATE TABLE `tipo_utilizador` (
  `id_tipo_utilizador` INT NOT NULL AUTO_INCREMENT UNIQUE,
  `tipo_utilizador` TEXT NOT NULL,
  PRIMARY KEY (`id_tipo_utilizador`)
);

CREATE TABLE `trotinetes` (
  `id_trotinetes` INT NOT NULL AUTO_INCREMENT UNIQUE,
  `marca_trotinete` TEXT NOT NULL,
  `modelo_trotinete` VARCHAR(255) NOT NULL,
  `ano` DATE NOT NULL,
  `utilizador_id` INT NOT NULL,
  PRIMARY KEY (`id_trotinetes`),
  CONSTRAINT `fk_trotinetes_1` FOREIGN KEY (`utilizador_id`) REFERENCES `utilizador` (`id_utilizador`)
);

CREATE TABLE `utilizador` (
  `id_utilizador` INT NOT NULL AUTO_INCREMENT UNIQUE,
  `nome_utilizador` VARCHAR(100) NOT NULL,
  `email_utilizador` VARCHAR(255) NOT NULL UNIQUE,
  `password_utilizador` VARCHAR(255) NOT NULL,
  `tipo_utilizador_id` INT NOT NULL,
  PRIMARY KEY (`id_utilizador`),
  CONSTRAINT `fk_utilizador_4` FOREIGN KEY (`tipo_utilizador_id`) REFERENCES `tipo_utilizador` (`id_tipo_utilizador`)
);

CREATE TABLE `estado_cacifos` (
  `id_estado_cacifos` INT NOT NULL AUTO_INCREMENT UNIQUE,
  `estado_cacifos` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_estado_cacifos`)
);

CREATE TABLE `tipo_dispositivo` (
  `id_tipo_dispositivo` INT NOT NULL AUTO_INCREMENT UNIQUE,
  `tipo_dispositivo` TEXT NOT NULL,
  PRIMARY KEY (`id_tipo_dispositivo`)
);

CREATE TABLE `portas` (
  `id_portas` INT NOT NULL AUTO_INCREMENT UNIQUE,
  `estado_porta` ENUM('Livre','Ocupado') NOT NULL,
  `cacifos_id` INT NOT NULL,
  PRIMARY KEY (`id_portas`),
  CONSTRAINT `fk_portas_1` FOREIGN KEY (`cacifos_id`) REFERENCES `cacifos` (`id_cacifo`)
);

INSERT INTO tipo_utilizador (tipo_utilizador) VALUES
('admin'),
('normal');

INSERT INTO tipo_dispositivo (tipo_dispositivo) VALUES
('ESP32'),
('Telemóvel'),
('Tablet');

INSERT INTO estado_cacifos (estado_cacifos) VALUES
('Livre'),
('Ocupado'),
('Manutenção');

INSERT INTO local (cidade_local, pais_local, latitude, longitude) VALUES
('Setubal', 'Portugal', 38.52181330513773, -8.838951587677004);

INSERT INTO utilizador (nome_utilizador, email_utilizador, password_utilizador, tipo_utilizador_id) VALUES
('Admin Sistema', 'admin@email.com', 'admin123', 1),
('Rodrigo Belchior', 'belchior@gmail.com', '12345678', 2),
('Rogério Pereira', 'rogerio@gmail.com', '12345678', 2),
('Rodrigo Fonseca ', 'rodrigo@gmail.com', '12345678', 2),
('Matheus Santana ', 'matheus@gmail.com', '12345678', 2);

INSERT INTO dispositivos (marca_dispositivo, modelo_dispositivo, tipo_dispositivo_id, utilizador_id) VALUES
('Espressif', 'ESP32 Pico Kit', 1, 1),
('Samsung', 'Galaxy S21', 2, 1),
('Iphone', '12', 2, 5),
('Iphone', '13', 2, 4),
('Iphone', '15 pro', 2, 4);

INSERT INTO cacifos (nome, local_id, estado_cacifos_id) VALUES
('Instituto Politécnico de Setúbal', 1, 1);

INSERT INTO portas (estado_porta, cacifos_id) VALUES
('Livre', 1),
('Ocupado', 1),
('Livre', 1),
('Livre', 1);

INSERT INTO trotinetes (marca_trotinete, modelo_trotinete, ano, utilizador_id) VALUES
('Urban Glide', '100 Max', '2023-12-24', 2);

INSERT INTO historico (hora_inicio, hora_fim, estado_historico, utilizador_id, cacifos_id) VALUES
('2026-03-27 10:00:00', NULL, 'ativo', 2, 1),
('2026-03-27 10:00:00', '2026-03-27 12:00:00', 'terminado', 2, 1);

INSERT INTO alertas (tipo_alerta, mensagem_alerta, data_alerta, utilizador_id) VALUES
('info', 'Carga iniciada no cacifo A', '2026-03-27 10:00:00', 1),
('aviso', 'Cacifo B ocupado', '2026-03-27 12:00:00', 1);