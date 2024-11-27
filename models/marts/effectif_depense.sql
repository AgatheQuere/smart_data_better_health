SELECT 
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
e.libelle_sexe,

SUM(e.Ntop) AS nombre_pris_en_charge,
SUM(e.Npop) AS population_susceptible,
AVG(d.montant_moy) AS montant_moyen,
SUM(ROUND(e.Ntop*d.montant_moy,0)) AS montant_total


FROM smart-data-le-wagon.dbt_lcazetou_intermediate.effectif_pathologie_code_iso e
LEFT JOIN {{ ref('dépense_tout_patho') }} d USING (top)

GROUP BY annee, patho_niv1, patho_niv2, patho_niv3, region, dept, region_name, region_iso, departement_iso, libelle_classe_age, cla_age_5, libelle_sexe


