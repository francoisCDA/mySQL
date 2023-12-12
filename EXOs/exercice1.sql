
/**********************
         exo1
**********************/

CREATE DATABASE IF NOT EXISTS exercices;

USE exercices ;

CREATE TABLE personne(
	personne_id INT NOT NULL AUTO_INCREMENT,
    titre VARCHAR(3),
    prenom VARCHAR(20),
    nom VARCHAR(30),
    telephone VARCHAR(10),
    email VARCHAR(30),
    PRIMARY KEY (personne_id)
);

CREATE TABLE adresse(
	personne_id INT,
    rue VARCHAR(30),
    ville VARCHAR(30),
    code_postal CHAR(5),
    CONSTRAINT fk_personne_id FOREIGN KEY (personne_id) REFERENCES personne(personne_id),
    PRIMARY KEY (rue,ville,code_postale)
); 
	