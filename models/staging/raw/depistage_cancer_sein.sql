with

 source as (

     select * from {{ source('depistage', 'cancer_sein') }}

 ),

 renamed as (

     select 
     Ann__e as Year,
     Region_ as Area,
     Population_Insee_cible as Target_Audience,
     Nombre_de_femmes_d__pist__es as Number_of_women_screened,
     Taux_de_participation_Insee_standardis__2____ as Standardized_participation_rate


     from source

 )

 select * from renamed