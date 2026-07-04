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

    m_contacts AS male_contacts,

    f_contacts AS female_contacts,

    m_patients AS male_patients,

    f_patients AS female_patients

FROM {{ source('raw', 'wound_contacts') }}