/*************************
   Exercice JDBC Etudiants
**************************/

CREATE DATABASE db_etudiant;

USE db_etudiant;

CREATE TABLE etudiant (
	id INT AUTO_INCREMENT PRIMARY KEY,
    last VARCHAR(50),
    first VARCHAR(50),
    num_classe INT,
    graduation DATE
    );

SELECT * FROM etudiant;