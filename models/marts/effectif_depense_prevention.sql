SELECT 
    *,
    CASE 
        WHEN patho_niv1 LIKE '%Cancers%' THEN 'https://depistage-cancers-idf.com/'
        WHEN patho_niv1 LIKE '%Diabète%' THEN 'https://idf.org/fr/about-diabetes/diabetes-prevention/'
        WHEN patho_niv1 LIKE '%cardioneurovasculaire%' THEN 'https://www.who.int/fr/news-room/fact-sheets/detail/cardiovascular-diseases-(cvds)#:~:text=Il%20a%20%C3%A9t%C3%A9%20d%C3%A9montr%C3%A9%20qu,le%20risque%20de%20maladie%20cardiovasculaire.'
        WHEN patho_niv1 LIKE '%psychiatriques%' THEN 'https://www.sante.fr/comment-prendre-soin-de-sa-sante-mentale'
        WHEN patho_niv1 LIKE '%respiratoire%' THEN 'https://www.vivre-avec-ma-maladie-respiratoire.fr/comprendre/prevention-et-surveillance-des-risques/'
        ELSE NULL
    END AS Link_prevention
FROM {{ ref('effectif_depense') }} ed

