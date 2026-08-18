
CREATE DATABASE livraria_guesser_m3;
USE livraria_guesser_m3;

CREATE TABLE livros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    autor VARCHAR(100)NOT NULL,
    ano INT NOT NULL
);