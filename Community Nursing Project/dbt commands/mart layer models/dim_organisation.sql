{{ config(materialized='table') }}

SELECT

    ROW_NUMBER() OVER (ORDER BY org_code) AS organisation_key,

    org_code,

    org_name,

    population_area

FROM {{ source('lookup', 'organisation_lookup') }}