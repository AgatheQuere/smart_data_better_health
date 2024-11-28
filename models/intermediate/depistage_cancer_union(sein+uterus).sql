select
    'cancer_sein' as Cancer_type,
    * 
from {{ref("stg_depistage__depistage_cancer_sein")}}

UNION ALL 

select
    'cancer_uterus' as Cancer_type,
    *
from {{ref("stg_depistage__depistage_cancer_uterus")}}