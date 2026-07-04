SELECT

    TRIM(org_code) AS org_code,

    CASE
        WHEN LOWER(TRIM(org_name)) = 'all submitters'
            THEN 'all-orgs'
        ELSE LOWER(TRIM(org_name))
    END AS org_name,

    care_contacts,

    patients

FROM {{ source('raw', 'dn_care_contacts') }}