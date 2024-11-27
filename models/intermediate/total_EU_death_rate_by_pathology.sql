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
THH.value as death_rate_THH,
Heart.value as death_rate_heart,
Cancer.value as death_rate_cancer,
Liver.value as death_rate_liver,
Nervous.value as death_rate_nervous,
Pneumonia.value as death_rate_pneumonia
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