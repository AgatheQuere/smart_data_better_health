with 

source as (

    select * from {{ source('Depistage_raw', 'depistage_cancer_uterus') }}

),

renamed as (

    select
        annee as Year,
        region as Region,
        population_insee_cible as Target_Audience,
        number_of_women_screened as Number_of_women_screened,
        taux_de_couverture_standardise as Standardized_participation_rate

    from source

)

select * from renamed

