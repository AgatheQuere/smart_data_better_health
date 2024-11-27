with 

source as (

    select * from {{ source('depense', 'Ameli_depenses') }}

),

renamed as (

    select
        annee,
        patho_niv1,
        patho_niv2,
        patho_niv3,
        top,
        dep_niv_1,
        dep_niv_2,
        montant,
        ntop,
        n_recourant_au_poste,
        montant_moy,
        'niveau prioritaire' as niveau_prioritaire,
        tri,
        type_somme

    from source

)

select * from renamed
