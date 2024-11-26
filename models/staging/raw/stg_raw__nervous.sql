with

 source as (

     select * from {{ source('EU', 'Nervous') }}

 ),

 renamed as (

     select
<<<<<<< HEAD
         TIME as Country, -- Rename Time as country
=======
         TIME as Country, #modifier le nom de la colonne par Country (car erreur dans BQ)
>>>>>>> 17dc45c3a417e69d27632f5ca1d5c8853840186f
         Year,
         Value,
         maladie

     from source

 )

 select * from renamed
 