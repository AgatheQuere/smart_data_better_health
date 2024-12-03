SELECT
  annee,
  patho_niv1,
  patho_niv2,
  patho_niv3,
  top,
  SUM(Ntop) AS total_pris_en_charge,
  SUM(montant) AS sum_montant,
  AVG(montant_moy) AS montant_moy
FROM {{ source('depense', 'Ameli_depenses') }}
WHERE 
  type_somme NOT LIKE 'Total' 
  AND patho_niv1 NOT LIKE '%Total consommants%'
  AND patho_niv2 IS NOT NULL
  AND patho_niv3 IS NOT NULL
  AND montant IS NOT NULL
GROUP BY 
  annee, 
  patho_niv1, 
  patho_niv2, 
  patho_niv3,
  top
ORDER BY 
  annee, 
  patho_niv1, 
  patho_niv2, 
  patho_niv3,
  top
