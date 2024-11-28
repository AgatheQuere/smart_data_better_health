select *,
CASE
    WHEN region = 'Guadeloupe' THEN 'FR-GUA' -- Guadeloupe
    WHEN region = 'Martinique' THEN 'FR-MTQ' -- Martinique
    WHEN region = 'Guyane' THEN 'FR-GUF' -- Guyane
    WHEN region = 'La Réunion' THEN 'FR-REU' -- La Réunion
    WHEN region = 'Ile-de-France' THEN 'FR-IDF' -- Île-de-France
    WHEN region = 'Centre-Val de Loire' THEN 'FR-CVL' -- Centre-Val de Loire
    WHEN region = 'Bourgogne-Franche-Comté' THEN 'FR-BFC' -- Bourgogne-Franche-Comté
    WHEN region = 'Normandie' THEN 'FR-NOR' -- Normandie
    WHEN region = 'Hauts-de-France' THEN 'FR-HDF' -- Hauts-de-France
    WHEN region = 'Grand Est' THEN 'FR-GES' -- Grand Est
    WHEN region = 'Pays de la Loire' THEN 'FR-PDL' -- Pays de la Loire
    WHEN region = 'Bretagne' THEN 'FR-BRE' -- Bretagne
    WHEN region = 'Nouvelle-Aquitaine' THEN 'FR-NAQ' -- Nouvelle-Aquitaine
    WHEN region = 'Occitanie' THEN 'FR-OCC' -- Occitanie
    WHEN region = 'Auvergne-Rhône-Alpes' THEN 'FR-ARA' -- Auvergne-Rhône-Alpes
    WHEN region = "Provence-Alpes-Côte d'Azur" THEN 'FR-PAC' -- Provence-Alpes-Côte d'Azur
    WHEN region = 'Corse' THEN 'FR-COR' -- Corse
    ELSE 'Inconnu'
END as region_iso
from {{ref("stg_depistage__depistage_cancer_sein")}}
