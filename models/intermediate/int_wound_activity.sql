{{ config(materialized='table') }}

SELECT

    org_code,
    org_name,
    age AS age_group,

    (m_patients + f_patients) AS patients,

    (m_referrals + f_referrals) AS referrals,

    NULL AS contacts,

    'Wound Care' AS service_name

FROM {{ ref('stg_wound_ages') }}