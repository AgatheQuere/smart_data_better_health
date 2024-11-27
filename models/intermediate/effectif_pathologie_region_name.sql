SELECT *,
CASE
    WHEN region = 01 THEN 'Guadeloupe'
    WHEN region = 02 THEN 'Martinique'
    WHEN region = 03 THEN 'Guyane'
    WHEN region = 04 THEN 'La Réunion'
    WHEN region = 06 THEN 'Mayotte'
    WHEN region = 11 THEN 'Île-de-France'
    WHEN region = 24 THEN 'Centre-Val de Loire'
    WHEN region = 27 THEN 'Bourgogne-Franche-Comté'
    WHEN region = 28 THEN 'Normandie'
    WHEN region = 32 THEN 'Hauts-de-France'
    WHEN region = 44 THEN 'Grand Est'
    WHEN region = 52 THEN 'Pays de la Loire'
    WHEN region = 53 THEN 'Bretagne'
    WHEN region = 75 THEN 'Nouvelle-Aquitaine'
    WHEN region = 76 THEN 'Occitanie'
    WHEN region = 84 THEN 'Auvergne-Rhône-Alpes'
    WHEN region = 93 THEN 'Provence-Alpes-Côte-Azur'
    WHEN region = 94 THEN 'Corse'
    ELSE 'Inconnu'
END as region_name
FROM {{ ref('effectif_utilisable') }}