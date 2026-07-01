{{ config(materialized='table') }}

WITH activity AS (

    SELECT * FROM {{ ref('int_dn_activity') }}

    UNION ALL

    SELECT * FROM {{ ref('int_wound_activity') }}

    UNION ALL

    SELECT * FROM {{ ref('int_eol_activity') }}

)

SELECT

    o.organisation_key,

    a.age_key,

    s.service_key,

    g.geography_key,

    activity.patients,

    activity.referrals,

    activity.contacts

FROM activity

LEFT JOIN {{ ref('dim_organisation') }} o
    ON activity.org_code = o.org_code

LEFT JOIN {{ ref('dim_age') }} a
    ON activity.age_group = a.age_group

LEFT JOIN {{ ref('dim_service') }} s
    ON activity.service_name = s.service_name

LEFT JOIN {{ ref('dim_geography') }} g
    ON o.population_area = g.local_authority