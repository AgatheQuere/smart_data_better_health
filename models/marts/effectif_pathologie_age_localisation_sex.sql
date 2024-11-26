select *
from `effectif_pathologie_sexe_classe_age_territoire.effectif_pathologie`
where sexe != 9 and patho_niv2 is not null and patho_niv3 is not null and region != 99 and dept != '999'and cla_age_5 != "tsage"