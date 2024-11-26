with

 source as (

     select * from {{ source('EU', 'cancer') }}

 ),

 renamed as (

     select
         Country,
         Year,
         Value,
         maladie

     from source

 )

 select * from renamed