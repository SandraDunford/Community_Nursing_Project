SELECT

    TRIM(org_code) AS org_code,

    CASE
        WHEN LOWER(TRIM(org_name)) = 'all submitters'
            THEN 'all-orgs'
        ELSE LOWER(TRIM(org_name))
    END AS org_name,

    f_care_contacts,

    m_care_contacts,

    total_contacts,

    f_patients,

    m_patients,

    total_patients

FROM {{ source('raw', 'eol_contacts') }}