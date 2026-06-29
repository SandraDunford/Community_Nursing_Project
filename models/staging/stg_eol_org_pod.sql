SELECT
    TRIM(org_code) AS org_code,

    CASE
        WHEN TRIM(org_name) = 'All Submitters'
            THEN 'All'
        ELSE TRIM(org_name)
    END AS org_name,

    patient_deaths,

    pod_recorded,

    died_at_pod

FROM {{ source('raw', 'eol_org_pod') }}