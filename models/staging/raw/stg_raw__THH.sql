with

 source as (

     select * from {{ source('EU', 'THH') }}

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