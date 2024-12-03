SELECT 
  e.annee,
  DATE(CAST(e.annee AS STRING) || '-01-01') as annee_format,
  e.patho_niv1,
  e.patho_niv2,
  e.patho_niv3,
  e.region,
  e.dept,
  e.region_name,
  e.region_iso,
  e.departement_iso,
  e.libelle_classe_age,
  e.cla_age_5,
  e.libelle_sexe,
  ROUND(100 * SUM(e.Ntop) / SUM(e.Npop), 2) AS prevalence,
  SUM(e.Ntop) AS nombre_pris_en_charge,
  SUM(e.Npop) AS population_susceptible,
  AVG(d.montant_moy) AS montant_moyen,
  SUM(ROUND(e.Ntop * d.montant_moy, 0)) AS montant_total
FROM 
  smart-data-le-wagon.dbt_lcazetou_intermediate.effectif_pathologie_code_iso e
LEFT JOIN 
  {{ ref('dépense_tout_patho') }} d ON e.top = d.top
GROUP BY 
  e.annee, 
  e.patho_niv1, 
  e.patho_niv2, 
  e.patho_niv3, 
  e.region, 
  e.dept, 
  e.region_name, 
  e.region_iso, 
  e.departement_iso, 
  e.libelle_classe_age, 
  e.cla_age_5, 
  e.libelle_sexe
