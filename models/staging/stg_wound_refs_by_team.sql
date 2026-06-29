SELECT
    CASE
        WHEN TRIM(org_code) = 'All orgs' THEN 'All'
        ELSE TRIM(org_code)
    END AS org_code,

    TRIM(org_name) AS org_name,

    TRIM(team_type) AS team_type,

    females,
    males

FROM {{ source('raw', 'wound_refs_by_team') }}