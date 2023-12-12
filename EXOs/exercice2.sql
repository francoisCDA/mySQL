/**********************
         exo2
**********************/

USE exercices ;

CREATE TABLE compte(
	compte_id INT,
    pseudo VARCHAR(50),
    mot_de_passe VARCHAR(50),
    email VARCHAR(255),
    date_creation DATETIME,
    derniere_connexion VARCHAR(50),
	PRIMARY KEY (compte_id)
);


CREATE TABLE table_des_roles(
	role_id INT,
    libelle VARCHAR(50),
    PRIMARY KEY (role_id)
);

CREATE TABLE compte_role(
	compte_id INT,
    role_id INT,
	date_ajout DATETIME DEFAULT NOW(),
    CONSTRAINT fk_compte_id FOREIGN KEY (compte_id) REFERENCES compte(compte_id),
    CONSTRAINT fk_role_id FOREIGN KEY (role_id) REFERENCES table_des_roles(role_id),
    PRIMARY KEY (compte_id,role_id)
);
