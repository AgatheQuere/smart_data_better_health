--ETAPE 1 : création d'une nouvelle table jointe avec les SDR de chaque pays EU_country_by_pathology // et le clean_stg_raw_total
-- ETAPE 2 : Calcul des taux de mortalité par maladie sur la base de l'étude du taux de mortalité des 65 causes (Tot_65_causes) = (THH_SDR/Tot_65causes_SDR)*100

SELECT 
EU_death.Country,
EU_death.Year,
--EU_death.THH_SDR,
--EU_death.Heart_SDR,
--EU_death.Cancer_SDR,
--EU_death.Liver_SDR,
--EU_death.Nervous_SDR,
--EU_death.Pneumonia_SDR,
--Tot_death.value,
ROUND((SAFE_DIVIDE(Cancer_SDR,Tot_death.value))*100,4) AS Cancer_death_rate,
ROUND((SAFE_DIVIDE(Heart_SDR,Tot_death.value))*100,4) AS Heart_death_rate,
ROUND((SAFE_DIVIDE(liver_SDR,Tot_death.value))*100,4) AS Liver_death_rate,
ROUND((SAFE_DIVIDE(nervous_SDR,Tot_death.value))*100,4) AS Nervous_death_rate,
ROUND((SAFE_DIVIDE(Pneumonia_SDR,Tot_death.value))*100,4) AS Pneumonia_death_rate,
ROUND((SAFE_DIVIDE(THH_SDR,Tot_death.value))*100,4) AS THH_death_rate,
Tot_death.value AS Tot_65causes_SDR
FROM {{ref('EU_country_by_pathology')}} as EU_death
INNER JOIN {{ ref ('clean_stg_raw_total')}} as Tot_death
ON commun_key = Tot_death.Key