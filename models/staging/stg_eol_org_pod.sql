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

    patient_deaths,

    pod_recorded,

    died_at_pod

FROM {{ source('raw', 'eol_org_pod') }}