/**************************
	  TabletopTresures
***************************/
DROP DATABASE IF EXISTS tabletoptreasures_database ;


CREATE DATABASE IF NOT EXISTS tabletoptreasures_database ;

USE tabletoptreasures_database ;


/**************** Table Clients *******************/

CREATE TABLE IF NOT EXISTS clients(
	id_cl INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    adresse_de_livraison VARCHAR(200),
    telephone VARCHAR(11)
);

INSERT INTO clients (nom,prenom,email,adresse_de_livraison,telephone)
 VALUES
 ('Dubois', 'Marie', 'marie.dubois@example.com', '123 Rue de la Libération, Ville', '+1234567890'),
('Lefebvre', 'Thomas', 'thomas.lefebvre@example.com', '456 Avenue des Roses, Ville', '+9876543210'),
('Martinez', 'Léa', 'lea.martinez@example.com', '789 Boulevard de la Paix, Ville', '+2345678901'),
('Dupuis', 'Antoine', 'antoine.dupuis@example.com', '567 Avenue de la Liberté, Ville', '+3456789012'),
('Morin', 'Camille', 'camille.morin@example.com', '890 Rue de l''Avenir, Ville', '+4567890123'),
('Girard', 'Lucas', 'lucas.girard@example.com', '234 Avenue des Champs, Ville', '+5678901234'),
('Petit', 'Emma', 'emma.petit@example.com', '123 Rue des Étoiles, Ville', '+6789012345'),
('Sanchez', 'Gabriel', 'gabriel.sanchez@example.com', '345 Boulevard du Bonheur, Ville', '+7890123456'),
('Rossi', 'Clara', 'clara.rossi@example.com', '678 Avenue de la Joie, Ville', '+8901234567'),
('Lemoine', 'Hugo', 'hugo.lemoine@example.com', '456 Rue de la Nature, Ville', '+9012345678'),
('Moreau', 'Eva', 'eva.moreau@example.com', '789 Avenue de la Créativité, Ville', '+1234567890'),
('Fournier', 'Noah', 'noah.fournier@example.com', '234 Rue de la Découverte, Ville', '+2345678901'),
('Leroy', 'Léa', 'lea.leroy@example.com', '567 Avenue de l''Imagination, Ville', '+3456789012'),
('Robin', 'Lucas', 'lucas.robin@example.com', '890 Rue de la Création, Ville', '+4567890123'),
('Marchand', 'Anna', 'anna.marchand@example.com', '123 Boulevard de l''Innovation, Ville', '+5678901234');

SELECT * FROM clients;

/**************** Table Catégorie *******************/

CREATE TABLE IF NOT EXISTS categorie(
	id_cat INT AUTO_INCREMENT PRIMARY KEY,
    nom_cat VARCHAR(50) NOT NULL
);

INSERT INTO categorie(nom_cat)
	VALUES
	('Stratégie'),
	('Familial'),
	('Aventure');

SELECT * FROM categorie;

/**************** Table Jeux *******************/

CREATE TABLE IF NOT EXISTS jeux(
	id_je INT AUTO_INCREMENT PRIMARY KEY,
    nom_je VARCHAR(50) NOT NULL,
    descript VARCHAR(150),
    prix INT NOT NULL, -- j'avais mis double mais le INT suffit
    categorie INT NOT NULL,
    CONSTRAINT FOREIGN KEY (categorie) REFERENCES categorie(id_cat)
 );

INSERT INTO jeux(nom_je,descript,prix,categorie)
	VALUES
    ('Catan', 'Jeu de stratégie et de développement de colonies', 30, 1),
	('Dixit', 'Jeu d''association d''images', 25, 2),
	('Les Aventuriers', 'Jeu de plateau d''aventure', 40, 3),
	('Carcassonne', 'Jeu de placement de tuiles', 28, 1),
	('Codenames', 'Jeu de mots et d''indices', 20, 2),
	('Pandemic', 'Jeu de coopération pour sauver le monde', 35, 3),
	('7 Wonders', 'Jeu de cartes et de civilisations', 29, 1),
	('Splendor', 'Jeu de développement économique', 27, 2),
	('Horreur à Arkham', 'Jeu d''enquête et d''horreur', 45, 3),
	('Risk', 'Jeu de conquête mondiale', 22, 1),
	('Citadelles', 'Jeu de rôles et de bluff', 23, 2),
	('Terraforming Mars', 'Jeu de stratégie de colonisation de Mars', 55, 3),
	('Small World', 'Jeu de civilisations fantastiques', 32, 1),
	('7 Wonders Duel', 'Jeu de cartes pour 2 joueurs', 26, 2),
	('Horreur à l''Outreterre', 'Jeu d''aventure horrifique', 38, 3);

SELECT * FROM jeux;

/**************** Table Commandes *******************/

CREATE TABLE IF NOT EXISTS commandes(
	id_cmd INT AUTO_INCREMENT PRIMARY KEY,
	id_client INT NOT NULL,
    date_commande DATE NOT NULL,
    adresse_livraison VARCHAR(200) NOT NULL,
    status_cmd VARCHAR(20)
);

ALTER TABLE commandes
	ADD CONSTRAINT FOREIGN KEY (id_client) REFERENCES clients(id_cl);


/*****************************
Effectuez trois commandes en insérant une nouvelle entrée dans la table
"Commandes". Assurez-vous d'inclure l'ID du client (créé précédemment), la
date de commande, l'adresse de livraison et le statut de la command
******************************/

INSERT INTO commandes(id_client,date_commande,adresse_livraison,status_cmd)
	VALUES
    (5,"2023-09-12",(select adresse_de_livraison from clients where id_cl=5),"expédiée"),
    (3,"2023-10-22",(select adresse_de_livraison from clients where id_cl=3),"expédiée"),
    (5,"2023-10-29",(select adresse_de_livraison from clients where id_cl=5),"expédiée"),
    (10,"2023-11-02",(select adresse_de_livraison from clients where id_cl=10),"annulée"),
    (8,"2023-12-10",(select adresse_de_livraison from clients where id_cl=8),"en préparation");
    
select * from commandes;    

/************************************
Mettez à jour le prix du jeu avec l'ID 3 (Les Aventuriers) pour le fixer à 35 €.
*************************************/

UPDATE jeux SET prix = 35 WHERE id_je = 3;

select * from jeux;


/************************************
Supprimez le jeu avec l'ID 2 (Dixit) de la table "Jeux".
*************************************/

DELETE FROM jeux WHERE id_je = 2 ;

/********************************************************
Étape 3 : Requêtes SQL simples
Table "Categories" 

1. Sélectionnez tous les noms de catégories distinctes.
2. Montrez les catégories avec des noms commençant par "A" ou "S".
3. Quelles catégories ont un ID entre 2 et 5 inclus ?
4. Combien de catégories différentes existent ?
5. Quelle est la catégorie ayant le nom le plus long ?
6. Montrez le nombre de jeux dans chaque catégorie.
7. Affichez les catégories triées par ordre alphabétique inversé.
*************************************/

-- 1 
SELECT DISTINCT nom_cat FROM categorie ; -- ????? les noms de catégorie sont déjà distinct....

-- 2
SELECT nom_cat FROM categorie WHERE nom_cat LIKE "a%" or nom_cat LIKE "s%";

-- 3 
SELECT nom_cat FROM categorie WHERE id_cat BETWEEN 2 AND 5 ;

-- 4
SELECT COUNT(*) as nb_cat FROM categorie;

-- 5
SELECT nom_cat, LENGTH(nom_cat) as nom_lenght FROM categorie ORDER BY nom_lenght DESC LIMIT 1; -- solution naïve

SELECT nom_cat,nom_lenght FROM (SELECT nom_cat, LENGTH(nom_cat) as nom_lenght FROM categorie) as tabl1  WHERE nom_lenght = (SELECT MAX(nom_lenght) AS long_max from (SELECT LENGTH(nom_cat) as nom_lenght FROM categorie) as var )   ; -- solution doliprane

-- 6
SELECT nom_cat, COUNT(*) AS nb_jeux FROM jeux INNER JOIN categorie ON categorie = id_cat GROUP BY categorie ;

-- 7
SELECT nom_cat FROM categorie ORDER BY nom_cat DESC; 


/******************************************
Étape 4 : Requêtes SQL avancées
1. Sélectionnez les noms des clients, noms de jeux et date de commande pour
chaque commande passée.
2. Sélectionnez les noms des clients et le montant total dépensé par chaque client.
Triez les résultats par montant total décroissant.
3. Sélectionnez les noms des jeux, noms de catégories et prix de chaque jeu.
4. Sélectionnez les noms des clients, date de commande et noms de jeux pour
toutes les commandes passées.
5. Sélectionnez les noms des clients, nombre total de commandes par client et
montant total dépensé par client. Incluez uniquement les clients ayant effectué
au moins une commande
*****************************************************/

CREATE TABLE details_commande(                             -- parce qu'une commande peut contenir plusieurs jeux, c'est plus logique que d'alterer la table commande qui n'a rien demandé à personne.
	id_details INT AUTO_INCREMENT PRIMARY KEY,
    num_commande INT NOT NULL,
    id_jeu INT NOT NULL,
    FOREIGN KEY (num_commande) REFERENCES commandes(id_cmd),
	FOREIGN KEY (id_jeu) REFERENCES jeux(id_je)
    );

select * from commandes;

INSERT INTO details_commande ( num_commande, id_jeu ) 
	VALUES
		(1,4),
        (1,5),
        (2,1),
        (3,4), -- oui il a racheté le même jeu
		(3,7),
        (4,5),
        (5,8),
        (5,4);

-- 1 
SELECT num_commande, date_commande, nom, prenom, nom_je 
	FROM details_commande 
		INNER JOIN commandes ON num_commande = id_cmd
        JOIN clients ON id_client = id_cl
        JOIN jeux ON id_jeu = id_je;

-- 2
SELECT nom, prenom, SUM(prix) as ttl
	FROM details_commande 
		INNER JOIN commandes ON num_commande = id_cmd
        INNER JOIN clients ON id_client = id_cl
        INNER JOIN jeux ON id_jeu = id_je
	GROUP BY id_cl
    ORDER BY ttl DESC;  
    
    /*
    11:30:12	SELECT num_commande, date_commande, nom, prenom, nom_je, SUM(prix) as ttl  FROM details_commande    INNER JOIN commandes ON num_commande = id_cmd         JOIN clients ON id_client = id_cl         JOIN jeux ON id_jeu = id_je  GROUP BY id_cl     ORDER BY ttl DESC	Error Code: 1055. Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'tabletoptreasures_database.details_commande.num_commande' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by	0.000 sec
    */

-- 3
SELECT nom_je, nom_cat, prix FROM jeux JOIN categorie ON cat


    