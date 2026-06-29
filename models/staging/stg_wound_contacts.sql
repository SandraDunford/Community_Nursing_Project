SELECT
    TRIM(org_code) AS org_code,

    CASE
        WHEN TRIM(org_name) = 'All Submitters' THEN 'All'
        ELSE TRIM(org_name)
    END AS org_name,

    m_contacts,
    f_contacts,
    m_patients,
    f_patients

FROM {{ source('raw', 'wound_contacts') }}