SELECT

    CASE
        WHEN LOWER(TRIM(org_code)) = 'all submitters'
            THEN 'all-orgs'
        ELSE TRIM(org_code)
    END AS org_code,

    CASE
        WHEN LOWER(TRIM(org_name)) = 'all submitters'
            THEN 'all-orgs'
        ELSE LOWER(TRIM(org_name))
    END AS org_name,

    fem_referral AS female_referrals,

    male_referral AS male_referrals,

    total_referral AS total_referrals,

    fem_patient AS female_patients,

    male_patient AS male_patients,

    total_patient AS total_patients

FROM {{ source('raw', 'eol_referrals') }}