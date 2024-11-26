with

 source as (

     select * from {{ source('EU', 'Nervous') }}

 ),

 renamed as (

     select
         TIME,
         Year,
         Value,
         maladie

     from source

 )

 select * from renamed