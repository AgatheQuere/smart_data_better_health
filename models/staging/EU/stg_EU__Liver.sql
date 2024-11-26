with 

source as (

    select * from {{ source('EU', 'Liver') }}

),

renamed as (

    select
        country,
        year,
        value,
        maladie

    from source

)

select * from renamed
