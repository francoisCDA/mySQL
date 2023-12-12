/**********************
         exo3
**********************/

-- DROP DATABASE IF EXISTS exercices;

CREATE DATABASE IF NOT EXISTS exercices;

USE exercices ;

DROP TABLE IF EXISTS classe;
DROP TABLE IF EXISTS professeur;
DROP TABLE IF EXISTS etudiant;


CREATE TABLE IF NOT EXISTS professeur(
	id INT NOT NULL AUTO_INCREMENT,
    prenom VARCHAR(30),
    nom VARCHAR(30),
    num_classe INT,
    num_departemnt INT,
    email VARCHAR(30),
    telephone VARCHAR(10),
    
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS etudiant(
	id INT NOT NULL AUTO_INCREMENT,
    prenom VARCHAR(30),
    nom VARCHAR(30),
    num_classe INT,
    gradua_date DATE,
    telephone VARCHAR(10),
    
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS classe(
 num_classe INT,
 etudiant_id INT,
 professeur_id INT,
 CONSTRAINT fk_etudiant_id FOREIGN KEY (etudiant_id) REFERENCES etudiant(id),
 CONSTRAINT fk_professeur_id FOREIGN KEY (professeur_id) REFERENCES professeur(id),
 PRIMARY KEY (num_classe)
 );


ALTER TABLE etudiant
	MODIFY COLUMN telephone VARCHAR(10) NOT NULL;

ALTER TABLE etudiant 
	ADD CONSTRAINT tel_unique2 UNIQUE (telephone);

ALTER TABLE professeur 
	ADD CONSTRAINT tel_mail_unique UNIQUE (telephone,email);
    
ALTER TABLE professeur
	ADD CONSTRAINT fk_num_classe_prof FOREIGN KEY (num_classe) REFERENCES classe(num_classe);
    
ALTER TABLE etudiant
	ADD CONSTRAINT fk_num_classe_etudiant FOREIGN KEY (num_classe) REFERENCES classe(num_classe);
    

