with

 source as (

     select * from {{ source('EU', 'Nervous') }}

 ),

 renamed as (

     select
         TIME as Country, -- Rename Time as country
         Year,
         Value,
         maladie

     from source

 )

 select * from renamed