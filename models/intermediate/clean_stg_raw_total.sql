-- ETAPE 1
-- Création de subqueries pour chaque tables causes de décès afin de créer des clés unique pour réaliser les jointures
-- Concatenation du nom du pays "Country" + "-" + de l'année "Year" similaire sur toutes les tables


SELECT * ,
CONCAT (Country, "_", Year) as Key
FROM {{ref("stg_raw__total")}} 