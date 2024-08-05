CREATE DATABASE bd_gestion;
USE bd_gestion;

CREATE TABLE gestion_usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    clave VARCHAR(50) NOT NULL
);

INSERT INTO gestion_usuarios (nombre, clave) 
    VALUES ('admin-gestion', 'admin-gestion-clave');

CREATE USER 'bd_usuario'@'%' IDENTIFIED BY 'bd-usuario-clave';
GRANT ALL PRIVILEGES ON bd_gestion.* TO 'bd_usuario'@'%';
FLUSH PRIVILEGES;
EXIT;
