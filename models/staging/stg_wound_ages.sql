SELECT
    TRIM(org_code) AS org_code,

    CASE
        WHEN TRIM(org_name) = 'All Submitters' THEN 'All'
        ELSE TRIM(org_name)
    END AS org_name,

    TRIM(Age) AS age,

    m_referrals,
    f_referrals,
    m_patients,
    f_patients

FROM {{ source('raw', 'wound_ages') }}