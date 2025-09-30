DROP SCHEMA IF EXISTS pelis;
CREATE SCHEMA pelis;
USE pelis;

CREATE TABLE peliculas (
id INT AUTO_INCREMENT PRIMARY KEY,
titulo VARCHAR(50) NOT NULL,
protagonista VARCHAR(50) NOT NULL,
anio INT,
genero VARCHAR(50) NOT NULL,
recaudacion DOUBLE NOT NULL
);

INSERT INTO peliculas (titulo, protagonista, anio, genero, recaudacion) VALUES
('Mommy', 'Anne Dorval', 2014, 'Drama', 13000000.00),
('Scarface', 'Al Pacino', 1983, 'Crimen', 65900000.00),
('Lost in Translation', 'Bill Murray', 2003, 'Comedia dramática', 119700000.00),
('Voley', 'Martín Piroyansky', 2014, 'Comedia', 500000.00),
('Parasite', 'Song Kang-ho', 2019, 'Thriller', 263000000.00),
('Lady Bird', 'Saoirse Ronan', 2017, 'Comedia dramática', 78900000.00),
('Inception', 'Leonardo DiCaprio', 2010, 'Ciencia ficción', 836800000.00),
('Todo sobre mi madre', 'Cecilia Roth', 1999, 'Drama', 67000000.00),
('The Grand Budapest Hotel', 'Ralph Fiennes', 2014, 'Comedia', 174800000.00),
('Dune', 'Timothée Chalamet', 2021, 'Ciencia ficción', 402000000.00);

SELECT * FROM peliculas; 

UPDATE peliculas SET recaudacion = recaudacion + 10000 WHERE id = 1; 
INSERT INTO peliculas (titulo, protagonista, anio, genero, recaudacion) VALUES 
("It's gone", 'John Ghost', 2024, 'Terror', 12000000.00);
SELECT * FROM peliculas; 
DELETE FROM peliculas WHERE id = 11;

-- Ver solo título y año
SELECT titulo, anio FROM peliculas;

-- Todas las películas producidas a partir de cierto año, en orden ascendente o descendente
SELECT * FROM peliculas WHERE anio >= 2005 ORDER BY anio DESC;

-- Ordenar por titulo
SELECT * FROM peliculas ORDER BY titulo DESC;

-- Agrupar por género (1 fila por género)
SELECT genero,
       COUNT(*)        AS total,
       SUM(recaudacion) AS box_office,
       MIN(anio)       AS anio_mas_antiguo,
       MAX(anio)       AS anio_mas_reciente
FROM peliculas
GROUP BY genero;

-- Ver solo las pelis con recaudación menor que X
SELECT * FROM peliculas WHERE recaudacion <= 30000000.00;

-- Ver películas entre un año y otro de producción
SELECT * FROM peliculas WHERE anio BETWEEN 1990 and 2000;

-- Ver cuantas pelis hay en la lista
SELECT COUNT(*) AS total_peliculas FROM peliculas;

-- Ver la suma de todas las recaudaciones
SELECT SUM(recaudacion) AS total_recaudacion FROM peliculas;

-- Ver la media de las recaudaciones
SELECT AVG(recaudacion) AS promedio_recaudacion FROM peliculas;

