with 

source as (

    select * from {{ source('Depistage_raw', 'depistage_cancer_sein') }}

),

renamed as (

    select
        annee as Year,
        region as Region,
        departement as Departement,
        population_insee_cible as Target_Audience,
        nombre_de_femmes_depistees as Number_of_women_screened,
        taux_de_participation_standardise as standardized_participation_rate

    from source

)

select * from renamed

