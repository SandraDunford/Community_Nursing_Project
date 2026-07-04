SELECT

    CASE
        WHEN LOWER(TRIM(org_code)) = 'all submitters'
            THEN 'all-orgs'
        ELSE TRIM(org_code)
    END AS org_code,

    CASE
        WHEN LOWER(TRIM(org_name)) = 'all submitters'
            THEN 'all-orgs'
        ELSE LOWER(TRIM(org_name))
    END AS org_name,

    LOWER(TRIM(gender)) AS gender,

    CASE
        WHEN LOWER(TRIM(age_group)) IN (
            '85+',
            '85 +',
            '85 and above',
            '85 years and above',
            '85 years and over',
            '85 or above'
        ) THEN '85-plus'

        WHEN LOWER(TRIM(age_group)) IN (
            'all ages',
            'all age',
            'all-age',
            'all_ages'
        ) THEN 'all-ages'

        ELSE LOWER(TRIM(age_group))
    END AS age_group,

    total_patients

FROM {{ source('raw', 'eol_age_groups') }}