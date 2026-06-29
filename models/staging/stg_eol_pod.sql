SELECT
    TRIM(preferred_pod) AS preferred_place_of_death,

    pod_hospital,

    pod_private,

    pod_hospice,

    pod_carehome,

    pod_other,

    pod_not_recorded

FROM {{ source('raw', 'eol_pod') }}