SELECT
    TRIM(org_code) AS org_code,

    CASE
        WHEN TRIM(org_name) = 'All Submitters'
            THEN 'All'
        ELSE TRIM(org_name)
    END AS org_name,

    fem_referral,

    male_referral,

    total_referral,

    fem_patient,

    male_patient,

    total_patient

FROM {{ source('raw', 'eol_referrals') }}