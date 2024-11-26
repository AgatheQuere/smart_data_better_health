with

 source as (

     select * from {{ source('EU', 'Heart') }}

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
 