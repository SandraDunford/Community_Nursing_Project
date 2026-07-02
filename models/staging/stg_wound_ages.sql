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

    CASE
        WHEN LOWER(TRIM(age)) IN (
            '85+',
            '85 +',
            '85 and above',
            '85 years and above',
            '85 years and over',
            '85 or above'
        ) THEN '85-plus'

        WHEN LOWER(TRIM(age)) IN (
            'all ages',
            'all age',
            'all-age',
            'all_ages'
        ) THEN 'all-ages'

        ELSE LOWER(TRIM(age))
    END AS age_band,

    m_referrals      AS male_referrals,

    f_referrals      AS female_referrals,

    m_patients       AS male_patients,

    f_patients       AS female_patients

FROM {{ source('raw', 'wound_ages') }}