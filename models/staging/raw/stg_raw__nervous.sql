with

 source as (

     select * from {{ source('EU', 'Nervous') }}

 ),

 renamed as (

     select
         TIME as Country, #modifier le nom de la colonne par Country (car erreur dans BQ)
         Year,
         Value,
         maladie

     from source

 )

 select * from renamed
 