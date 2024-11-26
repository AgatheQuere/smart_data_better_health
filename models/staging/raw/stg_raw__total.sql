with

 source as (

     select * from {{ source('EU', 'Total') }}

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