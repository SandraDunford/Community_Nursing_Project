SELECT
    TRIM(org_code) AS org_code,
    LOWER(TRIM(gender)) AS gender,
    LOWER(TRIM(age)) AS age_band,
    total_patients
FROM {{ source('raw', 'dn_age') }}