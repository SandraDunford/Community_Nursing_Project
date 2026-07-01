{{ config(materialized='table') }}

SELECT

    org_code,
    org_name,
    age_group,

    total_patients AS patients,

    total_referral AS referrals,

    NULL AS contacts,

    'End of Life' AS service_name

FROM {{ ref('stg_eol_referrals') }}
LEFT JOIN {{ ref('stg_eol_age_group') }}
USING (org_code)