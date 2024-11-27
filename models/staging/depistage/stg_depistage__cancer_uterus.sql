with 

source as (

    select * from {{ source('depistage', 'cancer_uterus') }}

),

renamed as (

    select
        ann__e as Year,
        region as Area,
        population_insee_cible as Target_Audience,
        nombre_de_femmes_ayant_eu_un_remboursement_pour_au_moins_un_examen_cytologique_ou_un_test_hpv as number_of_women_screened,
        taux_de_couverture_brut____ as crude_standardized_participation_rate ,
        taux_de_couverture_standardis__2____ as standardized_participation_rate

    from source

)

select * from renamed
