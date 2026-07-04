SELECT
    TRIM(local_authority) AS local_authority,

    imd_rank,

    imd_decile

FROM {{ source('raw', 'imd_la') }}