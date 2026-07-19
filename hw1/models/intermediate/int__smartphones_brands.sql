{{
    config(
        materialized = "table",
        schema = "smartphones",
        unique_key = "brand_name",
        indexes = [{"columns": ["brand_name"], "type": "btree"}]
    )
}}

select distinct
    brand_name
from {{ ref("stg__smartphones") }}