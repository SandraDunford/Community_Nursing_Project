SELECT
    CASE
        WHEN TRIM(org_code) = 'All Submitters'
            THEN 'All'
        ELSE TRIM(org_code)
    END AS org_code,

    TRIM(gender) AS gender,

    TRIM(activity_location) AS activity_location,

    no_care_contacts

FROM {{ source('raw', 'dn_care_location') }}