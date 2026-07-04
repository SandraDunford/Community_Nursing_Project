{{ config(materialized='table') }}

SELECT

    ROW_NUMBER() OVER (ORDER BY local_authority) AS geography_key,

    local_authority,

    average_imd_decile AS imd_decile

FROM {{ source('lookup','imd_lookup') }}