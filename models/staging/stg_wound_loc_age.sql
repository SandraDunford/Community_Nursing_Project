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

    LOWER(TRIM(location)) AS care_location,

    age_0_4,
    age_5_9,
    age_10_14,
    age_15_18,
    age_19_24,
    age_25_29,
    age_30_34,
    age_35_39,
    age_40_44,
    age_45_49,
    age_50_54,
    age_55_59,
    age_60_64,
    age_65_69,
    age_70_74,
    age_75_79,
    age_80_84,
    age_85_plus,
    age_unknown

FROM {{ source('raw', 'wound_loc_age') }}