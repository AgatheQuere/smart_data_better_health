{{ config(materialized='table') }}
select *
from `effectif_pathologie_sexe_classe_age_territoire.effectif_pathologie`
where sexe != 9 and patho_niv2 is not null 
and patho_niv3 is not null 
and region != 99 
and dept != '999'
and cla_age_5 != "tsage" 
and patho_niv1 not like "%Total consommants tous%" 
and patho_niv1 not like "%pathologie%" 
and patho_niv2 not like "%Total%" 
and patho_niv1 not like "%Affectations de longue%"
and patho_niv3 not like "%Total%"
