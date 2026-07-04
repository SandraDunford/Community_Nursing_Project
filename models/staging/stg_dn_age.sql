SELECT

    TRIM(org_code) AS org_code,

    CASE
        WHEN LOWER(TRIM(org_code)) = 'all submitters' THEN 'all-orgs'
        ELSE TRIM(org_code)
    END AS org_code,

    LOWER(TRIM(gender)) AS gender,

    CASE
        WHEN LOWER(TRIM(age)) IN (
            '85+',
            '85 +',
            '85 and above',
            '85 years and over',
            '85 years and above',
            '85 or above'
        ) THEN '85-plus'

        WHEN LOWER(TRIM(age)) IN (
            'all ages',
            'all age',
            'all-age',
            'all_ages'
        ) THEN 'all-ages'

        ELSE LOWER(TRIM(age))
    END AS age_band,

    total_patients

FROM {{ source('raw', 'dn_age') }}