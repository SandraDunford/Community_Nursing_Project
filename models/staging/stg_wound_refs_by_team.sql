SELECT

    CASE
        WHEN LOWER(TRIM(org_code)) = 'all orgs'
            THEN 'all-orgs'
        ELSE TRIM(org_code)
    END AS org_code,

    CASE
        WHEN LOWER(TRIM(org_name)) = 'all orgs'
            THEN 'all-orgs'
        ELSE LOWER(TRIM(org_name))
    END AS org_name,

    LOWER(TRIM(team_type)) AS team_type,

    females AS female_referrals,

    males AS male_referrals

FROM {{ source('raw', 'wound_refs_by_team') }}