
/**********************
         exo1
**********************/

 DROP DATABASE IF EXISTS exercices;

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
    PRIMARY KEY (rue,ville,code_postal)
); 
    
INSERT INTO personne (titre,prenom,nom,telephone,email)
	VALUES
    ('M','Henri','JEAN','0214526621','hj@mail.fr'),
    ('Mme','Maguerite','DUPONT','0214526621','mj@mail.fr'),
    ('Mme','toto','JEAN','0214526621','mj@mail.fr'),
    ('Mme','Steeve','JEANNE','0223526621','sj@mail.fr');
    
INSERT INTO adresse (personne_id,rue,ville,code_postal)
	VALUES
    (1,"12 rue de l'Eglise",'Lille','59000'),
    (1,"12 rue de la place",'Lille','59000'),
    (2,"13 rue de l'Eglise",'Lille','59000'),
    (3,"14 rue de l'Eglise",'Lille','59000');
  

DELETE FROM adresse WHERE personne_id = 3;
DELETE FROM personne WHERE prenom = 'toto';  
    
SELECT* FROM adresse;
SELECT* FROM personne;

UPDATE
	personne
SET 
	telephone = "1231231230" 
WHERE
	nom = 'dupont';
    
    
-- SELECT

SELECT prenom,nom FROM personne ORDER BY nom DESC;
SELECT prenom,nom FROM personne ORDER BY titre;
SELECT prenom,nom FROM personne WHERE email = "sj@mail.fr";