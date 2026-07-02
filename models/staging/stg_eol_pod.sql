SELECT

    CASE
        WHEN LOWER(TRIM(preferred_pod)) IN (
            'hospital',
            'acute hospital'
        ) THEN 'hospital'

        WHEN LOWER(TRIM(preferred_pod)) IN (
            'private residence',
            'home',
            'own home'
        ) THEN 'private residence'

        WHEN LOWER(TRIM(preferred_pod)) = 'hospice'
            THEN 'hospice'

        WHEN LOWER(TRIM(preferred_pod)) IN (
            'care home',
            'nursing home',
            'residential home'
        ) THEN 'care home'

        WHEN LOWER(TRIM(preferred_pod)) = 'other'
            THEN 'other'

        WHEN LOWER(TRIM(preferred_pod)) IN (
            'not recorded',
            'unknown',
            'not known'
        ) THEN 'not recorded'

        ELSE LOWER(TRIM(preferred_pod))
    END AS preferred_place_of_death,

    pod_hospital,

    pod_private,

    pod_hospice,

    pod_carehome,

    pod_other,

    pod_not_recorded

FROM {{ source('raw', 'eol_pod') }}