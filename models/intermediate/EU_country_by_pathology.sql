-- ETAPE 1
-- Création de subqueries pour chaque tables causes de décès afin de créer des clés unique pour réaliser les jointures
-- Concatenation du nom du pays "Country" + "-" + de l'année "Year" similaire sur toutes les tables

-- ETAPE 2
-- Jointure des tables sur la plus grande THH (environ 500 lignes), grâce à un INNER JOIN
-- Attention : parti pris de faire le INNER pour une analyse plus homogène de nos résultats sur la même temporalité (à savoir 2011 à 2021)


WITH Sub1 AS (

    SELECT
    *, 
    CONCAT (Country, "_", Year) as Key
    FROM {{ref("stg_raw__Heart")}} 
    )

, Sub2 AS (

    SELECT
    *, 
    CONCAT (Country, "_", Year) as Key
    FROM {{ref("stg_raw__THH")}}
    )

, Sub3 AS (

    SELECT
    *, 
    CONCAT (Country, "_", Year) as Key
    FROM {{ref("stg_raw__cancer")}}
    )    

, Sub4 AS (

    SELECT
    *, 
    CONCAT (Country, "_", Year) as Key
    FROM {{ref("stg_raw__liver")}}
    )

, Sub5 AS (

    SELECT
    *, 
    CONCAT (Country, "_", Year) as Key
    FROM {{ref("stg_raw__nervous")}}
    )

, Sub6 AS (

    SELECT
    *, 
    CONCAT (Country, "_", Year) as Key
    FROM {{ref("stg_raw__pneumonia")}}
    )

SELECT 

THH.Country,
THH.Year,
THH.Key,
THH.value as THH_SDR,
Heart.value as Heart_SDR,
Cancer.value as Cancer_SDR,
Liver.value as Liver_SDR,
Nervous.value as Nervous_SDR,
Pneumonia.value as Pneumonia_SDR

FROM Sub2 as THH 
INNER JOIN Sub1 as Heart
ON THH.Key = Heart.Key 

INNER JOIN Sub3 as Cancer
ON THH.Key = Cancer.Key 

INNER JOIN Sub4 as Liver
ON Liver.Key = THH.Key

INNER JOIN Sub5 as Nervous
ON Nervous.Key = THH.Key

INNER JOIN Sub6 as Pneumonia
ON Pneumonia.Key = THH.Key

