/**********************
         exo3
**********************/

 DROP DATABASE IF EXISTS exercices;

CREATE DATABASE IF NOT EXISTS exercices;

USE exercices ;

-- DROP TABLE IF EXISTS classe;
-- DROP TABLE IF EXISTS professeur;
-- DROP TABLE IF EXISTS etudiant;

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
	ADD CONSTRAINT tel_unique UNIQUE (telephone);
    
ALTER TABLE professeur 
	ADD CONSTRAINT mail_unique UNIQUE (email);

/*    
ALTER TABLE professeur
	ADD CONSTRAINT fk_num_classe_prof FOREIGN KEY (num_classe) REFERENCES classe(num_classe);
    
ALTER TABLE etudiant
	ADD CONSTRAINT fk_num_classe_etudiant FOREIGN KEY (num_classe) REFERENCES classe(num_classe);
*/
SHOW TABLES;

SHOW COLUMNS FROM professeur;
SHOW COLUMNS FROM etudiant;

-- question 5, tester l'insert de données

-- USE exercices ;

INSERT INTO etudiant (prenom,nom,telephone)
	VALUES ('Toto','Tata','0123456789');

-- INSERT INTO etudiant (prenom,nom,telephone)
-- 	VALUES ('Bill','Gates','0123456789'); -- numero de téléphone doit être unique

INSERT INTO etudiant (prenom,nom,telephone)
	VALUES ('Bill','Gates','0123456788');
    
-- INSERT INTO etudiant (prenom,nom)
-- 	VALUES ('Steeve','Jobs'); -- numero obligatoire
    
INSERT INTO etudiant (prenom,nom,telephone)
	VALUES ('Steeve','Jobs','254125484'); 

INSERT INTO professeur (prenom,nom,num_classe,num_departemnt,email,telephone)
	VALUES 
    ('Jo','Smith',12,4,'jo.smith@hmail.com','1122334455'),
    ('John','Smouth',1,44,'john.smouth@hmail.com','1166334455'),
    ('Johnn','Williams',13,14,'johnn.williams@hmail.com','1122698455'),
    ('Pierre','Henri',15,12,'pierre.henri@hmail.com','1122334665');
    

    
    
SELECT * FROM professeur;
SELECT * FROM etudiant;
