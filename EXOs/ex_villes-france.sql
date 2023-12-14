/**********************
     exo4 livre
**********************/

-- DROP DATABASE IF EXISTS exo_villes;

-- CREATE DATABASE IF NOT EXISTS exo_villes;

USE exo_villes;


SELECT * FROM villes_france_free;
SELECT * FROM departement;

-- question 1
SELECT ville_nom,ville_population_2012 FROM villes_france_free ORDER BY ville_population_2012 DESC LIMIT 10;

-- question 2
SELECT ville_nom,ville_surface FROM villes_france_free ORDER BY ville_surface LIMIT 50;

-- question 3
SELECT departement_nom FROM departement WHERE departement_code LIKE "97%";

SELECT ville_nom, departement_nom 
FROM villes_france_free 
INNER JOIN departement ON villes_france_free.ville_departement = departement.departement_code;



-- question 4
SELECT ville_nom, departement_nom 
FROM (SELECT * FROM villes_france_free ORDER BY ville_population_2012 DESC LIMIT 10) as big_cities
INNER JOIN departement ON big_cities.ville_departement = departement.departement_code ORDER BY big_cities.ville_population_2012 DESC;



select ville_departement, count(ville_departement) as cmpt from villes_france_free group by ville_departement ORDER BY cmpt DESC ;

-- question 5 
SELECT 
	departement_nom, departement_code , cmpt
FROM 
	departement 
INNER JOIN 
	(select ville_departement, count(ville_departement) as cmpt from villes_france_free group by ville_departement  ) as trie
	ON 
		trie.ville_departement = departement_code
	ORDER BY cmpt DESC;



select ville_departement, SUM(ville_surface) as surface from villes_france_free group by ville_departement;

-- question 6
SELECT
	departement_nom, surface
FROM 
	departement
INNER JOIN
   (select ville_departement, SUM(ville_surface) as surface from villes_france_free group by ville_departement) as var 
   on 
	var.ville_departement = departement.departement_code
order by surface desc;



SELECT ville_nom FROM villes_france_free where ville_nom like "Saint%";

-- question 7
select count(*) from  (SELECT ville_nom FROM villes_france_free where ville_nom like "Saint%") as saintruc ;


-- question 8

select ville_nom,count(ville_nom) as cmpt from villes_france_free group by ville_nom order by cmpt desc;

-- question 9
select ville_nom, ville_surface from villes_france_free  where ville_surface > (select avg(ville_surface) from villes_france_free ) ;

-- question 10



SELECT
	departement_nom,pop
FROM 
	departement
INNER JOIN
   (select ville_departement, SUM(ville_population_2012) as pop from villes_france_free group by ville_departement) as var 
   on 
	var.ville_departement = departement.departement_code
where pop > 2000000;


-- question 11








