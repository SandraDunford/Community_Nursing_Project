SELECT

    CASE
        WHEN LOWER(TRIM(org_code)) = 'all submitters'
            THEN 'all-orgs'
        ELSE TRIM(org_code)
    END AS org_code,

    LOWER(TRIM(gender)) AS gender,

    LOWER(TRIM(activity_location)) AS activity_location,

    no_care_contacts

FROM {{ source('raw', 'dn_care_location') }}