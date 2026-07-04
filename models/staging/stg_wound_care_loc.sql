SELECT

    CASE
        WHEN LOWER(TRIM(org_code)) = 'all submitters'
            THEN 'all-orgs'
        ELSE TRIM(org_code)
    END AS org_code,

    LOWER(TRIM(gender)) AS gender,

    LOWER(TRIM(location_name)) AS location_name,

    contacts

FROM {{ source('raw', 'wound_care_loc') }}