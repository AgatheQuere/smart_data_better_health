SELECT
annee,
patho_niv1,
AVG(Ntop) as nb_prise_en_charge,
SUM(montant) as sum_montant
FROM `smart-data-le-wagon.depense_sante.Ameli_depenses_pathologies_france_2015 _2022`

where type_somme like "Total" AND patho_niv2 IS NULL AND patho_niv3 IS NULL AND patho_niv1 NOT LIKE '%hors pathologie%'
AND dep_niv_1 LIKE 'Dépenses'
group by annee, patho_niv1