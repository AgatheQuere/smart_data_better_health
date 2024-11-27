--ETAPE 1 : création d'une nouvelle table jointe avec les SDR de chaque pays EU_country_by_pathology // et le clean_stg_raw_total
-- ETAPE 2 : Calcul des taux de mortalité par maladie sur la base de l'étude du taux de mortalité des 65 causes (Tot_65_causes) = (THH_SDR/Tot_65causes_SDR)*100

SELECT *,
    CASE
        WHEN Country = 'European Union - 27 countries (from 2020)' THEN 443227781
        WHEN Country = 'Germany' THEN 81741466
        WHEN Country = 'Austria' THEN 8660729
        WHEN Country = 'Belgium' THEN 11270644
        WHEN Country = 'Bulgaria' THEN 7221934
        WHEN Country = 'Cyprus' THEN 863876
        WHEN Country = 'Croatia' THEN 4197940
        WHEN Country = 'Denmark' THEN 5696016
        WHEN Country = 'Spain' THEN 46752247
        WHEN Country = 'Estonia' THEN 1332507
        WHEN Country = 'Finland' THEN 5457998
        WHEN Country = 'France' THEN 65274590
        WHEN Country = 'Greece' THEN 10773223
        WHEN Country = 'Hungary' THEN 9867743
        WHEN Country = 'Ireland' THEN 4817800
        WHEN Country = 'Italy' THEN 59493884
        WHEN Country = 'Latvia' THEN 1965186
        WHEN Country = 'Lithuania' THEN 2983445
        WHEN Country = 'Luxembourg' THEN 573285
        WHEN Country = 'Malta' THEN 466091
        WHEN Country = 'Netherlands' THEN 17094605
        WHEN Country = 'Poland' THEN 38023324
        WHEN Country = 'Portugal' THEN 10434581
        WHEN Country = 'Romania' THEN 20226336
        WHEN Country = 'Slovakia' THEN 5447802
        WHEN Country = 'Slovenia' THEN 2064422
        WHEN Country = 'Sweden' THEN 9897433
        WHEN Country = 'Czechia' THEN 10628682
        WHEN Country = 'Norway' THEN  5160000
        WHEN Country = 'Switzerland' THEN 8460000
        WHEN Country = 'Serbia' THEN 7030000
        WHEN Country = 'Iceland' THEN 339068 
        ELSE NULL
    END AS average_population
FROM {{ref('total_EU_by_pathology')}} 
