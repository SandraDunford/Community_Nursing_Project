SELECT
    CASE
        WHEN TRIM(org_code) = 'All Submitters'
            THEN 'All'
        ELSE TRIM(org_code)
    END AS org_code,

    CASE
        WHEN TRIM(org_name) = 'All Submitters'
            THEN 'All'
        ELSE TRIM(org_name)
    END AS org_name,

    TRIM(gender) AS gender,

    TRIM(age_group) AS age_group,

    total_patients

FROM {{ source('raw', 'eol_age_groups') }}