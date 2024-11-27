SELECT *,
ROUND(SAFE_DIVIDE(Tot_65causes_SDR,100000)*average_population,0) AS Nb_death_real_pop,
ROUND(SAFE_DIVIDE((SAFE_DIVIDE(Tot_65causes_SDR,100000)*average_population),average_population)*100,4) AS perc_death_real_pop,
FROM {{ref('total_EU_by_pathology2')}} 
