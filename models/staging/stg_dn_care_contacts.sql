SELECT
    TRIM(org_code) AS org_code,

    CASE
        WHEN TRIM(org_name) = 'All Submitters'
            THEN 'All'
        ELSE TRIM(org_name)
    END AS org_name,

    care_contacts,
    patients

FROM {{ source('raw', 'dn_care_contacts') }}