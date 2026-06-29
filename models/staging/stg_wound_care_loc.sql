SELECT
    TRIM(org_code) AS org_code,

    TRIM(gender) AS gender,

    TRIM(location_name) AS location_name,

    contacts

FROM {{ source('raw', 'wound_care_loc') }}