with 

source as (

    select * from {{ source('depistage', 'cancer_sein') }}

),

renamed as (

    select
        ann__e as Year,
        region_ as Area,
        population_insee_cible as Target_Audience,
        nombre_de_femmes_d__pist__es as Number_of_women_screened,
        taux_de_participation_insee_standardis__2____ as standardized_participation_rate

    from source

)

select * from renamed
