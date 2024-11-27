-- ETAPE 1
-- Création de subqueries pour chaque tables causes de décès afin de créer des clés
-- unique pour réaliser les jointures
-- Concatenation du nom du pays "Country" + "-" + de l'année "Year" similaire sur
-- toutes les tables
-- ETAPE 2
<<<<<<< HEAD:models/intermediate/total_EU_death_rate_by_pathology.sql
-- Jointure des tables sur la plus grande THH (environ 500 lignes), grâce à un INNER
-- JOIN
-- Attention : parti pris de faire le INNER pour une analyse plus homogène de nos
-- résultats sur la même temporalité (à savoir 2011 à 2021)
-- ETAPE 3
-- Calcul du SDR European Standardised Death Rate = ROUND((THH.value/100000),4)*100 as
-- death_rate_THH pour chaque cause de décès
with
    sub1 as (
=======
-- Jointure des tables sur la plus grande THH (environ 500 lignes), grâce à un INNER JOIN
-- Attention : parti pris de faire le INNER pour une analyse plus homogène de nos résultats sur la même temporalité (à savoir 2011 à 2021)

>>>>>>> b74af3836d705e1226781da2f1390ee5654ec8ba:models/intermediate/EU_country_by_pathology.sql

        select *, concat(country, "_", year) as key from {{ ref("stg_raw__Heart") }}
    ),
    sub2 as (

        select *, concat(country, "_", year) as key from {{ ref("stg_raw__THH") }}
    ),
    sub3 as (

        select *, concat(country, "_", year) as key from {{ ref("stg_raw__cancer") }}
    ),
    sub4 as (

        select *, concat(country, "_", year) as key from {{ ref("stg_raw__liver") }}
    ),
    sub5 as (

        select *, concat(country, "_", year) as key from {{ ref("stg_raw__nervous") }}
    ),
    sub6 as (

        select *, concat(country, "_", year) as key from {{ ref("stg_raw__pneumonia") }}
    )

select

    thh.country,
    thh.year,
    thh.value,
    round((heart.value / 100000), 6) as death_rate_heart,
    round(((cancer.value / 100000) * 100), 6) as death_rate_cancer,
    round(((liver.value / 100000) * 100), 6) as death_rate_liver,
    round(((nervous.value / 100000) * 100), 6) as death_rate_nervous,
    round(((pneumonia.value / 100000) * 100), 6) as death_rate_pneumonia

from sub2 as thh
inner join sub1 as heart on thh.key = heart.key

inner join sub3 as cancer on thh.key = cancer.key

inner join sub4 as liver on liver.key = thh.key

<<<<<<< HEAD:models/intermediate/total_EU_death_rate_by_pathology.sql
inner join sub5 as nervous on nervous.key = thh.key
=======
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
THH.Key as commun_key,
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
>>>>>>> b74af3836d705e1226781da2f1390ee5654ec8ba:models/intermediate/EU_country_by_pathology.sql

inner join sub6 as pneumonia on pneumonia.key = thh.key
