SELECT

    TRIM(org_code) AS org_code,

    CASE
        WHEN LOWER(TRIM(org_name)) = 'all submitters'
            THEN 'all-orgs'
        ELSE LOWER(TRIM(org_name))
    END AS org_name,

    referrals,

    patients

FROM {{ source('raw', 'dn_referrals') }}