SELECT
    TRIM(org_code) AS org_code,

    CASE
        WHEN TRIM(org_name) = 'All Submitters'
            THEN 'All'
        ELSE TRIM(org_name)
    END AS org_name,

    fem_procedure,

    male_procedure,

    total_procedure

FROM {{ source('raw', 'eol_procedures') }}