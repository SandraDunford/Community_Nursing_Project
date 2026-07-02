{{ config(materialized='table') }}

SELECT

    org_code,
    org_name,
    NULL AS age_group,

    patients,
    referrals,

    NULL AS contacts,

    'District Nursing' AS service_name

FROM {{ ref('stg_dn_referrals') }}