SELECT
    TRIM(region) AS region,

    TRIM(trust) AS trust,

    total,
    qual_clin,
    doctors,
    nurses,
    midwives,
    ambulance_staff,
    science_tech_staff,
    clin_support,
    support_staff,
    infrastructure,
    manager

FROM {{ source('raw', 'workforce_fte_prof') }}