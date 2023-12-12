/**************************************
Manipulation des bases de données
***************************************/
-- suppression de la base de donnée
DROP DATABASE IF EXISTS entreprise_demo;

-- Création de base de données
CREATE DATABASE IF NOT EXISTS entreprise_demo 
CHARACTER SET = 'utf8mb4' 
COLLATE = 'utf8mb4_general_ci' ;

-- permet d'afficher toutes les bases de données;

SHOW DATABASES;

-- ALTER DATABASE entreprise_demo COMMENT = 'Base de donnée démo';
ALTER DATABASE entreprise_demo CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
ALTER DATABASE entreprise_demo DEFAULT CHARACTER SET utf8mb4;
-- ALTER DATABASE entreprise_demo ENCRYPTION='Y';


-- Afficher les schémas des bases de données
SELECT * FROM information_schema.SCHEMATA;

USE entreprise_demo;

-- DROP DATABASE IF EXISTS entreprise_demo;


/**************************************
Manipulation des tables
***************************************/

-- creation d'une table si elle n'existe pas

CREATE TABLE IF NOT EXISTS service(
	service_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    libelle VARCHAR(150) NOT NULL
);



CREATE TABLE IF NOT EXISTS salarie(
	salarie_id INT NOT NULL AUTO_INCREMENT, -- clé primaire qui s'auto-incrémente
    prenom VARCHAR(50) NOT NULL, -- obligation de fournir une valeur
	nom VARCHAR(50) NOT NULL,
    age INT NOT NULL CHECK (age > 18 AND age < 65), -- contrante pour vérifier l'age
    salaire FLOAT NOT NULL DEFAULT 1500, -- Valeur par defaut
    service_id INT NOT NULL, -- ajout de la colonne pour la clé étrangère
    PRIMARY KEY (salarie_id),
    CONSTRAINT fk_service_id FOREIGN KEY (service_id) REFERENCES service(service_id) 
);

-- suppression des talbes

-- DROP TABLE IF EXISTS salarie;

SHOW TABLES;

SHOW COLUMNS FROM salarie;
SHOW COLUMNS FROM service;

-- Ajout d'une contrainte après la création de la table
-- ALTER TABLE salarie
	-- 	ADD CONSTRAINT fk_service_id FOREIGN KEY (service_id) REFERENCES service(service);
        
-- Ajout colonne date-heure
ALTER TABLE salarie
		ADD COLUMN date_modification DATETIME;
        
-- modifier la colonne en type DATE
ALTER TABLE salarie
		MODIFY COLUMN date_modification DATE;
        
