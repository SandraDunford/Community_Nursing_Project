SELECT
    TRIM(org_code) AS org_code,

    CASE
        WHEN TRIM(org_name) = 'All submitters'
            THEN 'All'
        ELSE TRIM(org_name)
    END AS org_name,

    referrals,
    patients

FROM {{ source('raw', 'dn_referrals') }}