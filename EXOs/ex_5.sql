-- Exercice 5
-- Question 1 :
-- Obtenir la liste des 10 villes les plus peuplées en 2012 :
SELECT ville_nom FROM villes_france_free ORDER BY ville_population_2012 DESC LIMIT 10;

-- Question 2 :
-- Obtenir la liste des 50 villes ayant la plus faible superficie :
SELECT ville_nom FROM villes_france_free ORDER BY ville_surface ASC LIMIT 50;
SELECT ville_nom FROM villes_france_free ORDER BY ville_surface LIMIT 50;

-- Question 3 :
-- Obtenir la liste des départements d’outre-mer, c’est-à-dire ceux dont le numéro de département commençant par “97” :
SELECT * FROM departement WHERE departement_code LIKE '97%';


-- Question 4 :
-- Obtenir le nom des 10 villes les plus peuplées en 2012, ainsi que le nom du département associé :
SELECT ville_nom, departement_nom 
FROM 
	villes_france_free
    LEFT JOIN departement ON departement_code = ville_departement
ORDER BY
	ville_population_2012 DESC
LIMIT 
	10;

-- Question 5 :
-- Obtenir la liste du nom de chaque département, associé à son code et du nombre de commune au sein de ces départements, 
-- en triant afin d’obtenir en priorité les départements qui possèdentle plus de communes :
SELECT 
	departement_nom AS "Departement",
    ville_departement AS "Code Departement",
    COUNT(*) AS nbr_commune
FROM 
	villes_france_free
    JOIN departement ON departement_code = ville_departement
GROUP BY 
	departement_nom, ville_departement
ORDER BY
	nbr_commune DESC;


-- Question 6 :
-- Obtenir la liste des 10 plus grands départements, en termes de superficie :
SELECT 
	departement_nom,
    ville_departement,
    SUM(ville_surface) AS dpt_surface
FROM 
	villes_france_free
    JOIN departement ON departement_code = ville_departement
GROUP BY
	departement_nom,
    ville_departement
ORDER BY
	dpt_surface DESC
LIMIT 
	10;


-- Question 7 :
-- Compter le nombre de villes dont le nom commence par “Saint” :
SELECT COUNT(*) FROM villes_france_free WHERE ville_nom LIKE 'Saint%';


-- Question 8 :
-- Obtenir la liste des villes qui ont un nom existants plusieurs fois, et trier afin d’obtenir en premier celles dont le nom est le plus souvent utilisé par plusieurs communes :
SELECT 
	ville_nom,
    COUNT(*) AS nb_ville
FROM
	villes_france_free
GROUP BY 
	ville_nom
HAVING nb_ville > 1
ORDER BY 
	nb_ville DESC;

-- Question 9 :
-- Obtenir en une seule requête SQL la liste des villes dont la superficie est supérieure à la superficie moyenne :
SELECT 
	ville_nom, ville_surface
FROM villes_france_free
WHERE ville_surface > (SELECT AVG(ville_surface) FROM villes_france_free)
ORDER BY ville_surface;

-- Question 10 :
-- Obtenir la liste des départements qui possèdent plus de 2 millions d’habitants :
SELECT 
	ville_departement,
    departement_nom,
    SUM(ville_population_2012) AS population_2012
FROM
	villes_france_free
INNER JOIN 
	departement ON departement_code = ville_departement
GROUP BY
	ville_departement,
    departement_nom
HAVING 
 population_2012 > 2000000;
 

-- Question 11 :
-- Remplacez les tirets par un espace vide, pour toutes les villes commençantpar “SAINT-” (dans la colonne qui contient les noms en majuscule) :

SELECT COUNT(*) FROM villes_france_free WHERE ville_nom LIKE 'Saint-%';

UPDATE 
	villes_france_free
SET
	ville_nom = REPLACE(ville_nom,'-',' ')
WHERE ville_nom LIKE 'SAINT-%';