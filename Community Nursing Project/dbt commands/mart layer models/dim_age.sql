{{ config(materialized='table') }}

SELECT

    ROW_NUMBER() OVER (ORDER BY age_group) AS age_key,

    age_group

FROM (

    SELECT DISTINCT age AS age_group
    FROM {{ ref('stg_dn_age') }}

    UNION

    SELECT DISTINCT age
    FROM {{ ref('stg_wound_ages') }}

    UNION

    SELECT DISTINCT age_group
    FROM {{ ref('stg_eol_age_group') }}

)