{{
    config(
        materialized = "view",
        schema = "smartphones"
    )
}}

select
    brand_name,
    model,
    price,
    processor_brand,
    num_cores,
    processor_speed,
    battery_capacity
from {{ source("seed__data", "smartphone_cleaned_v5")}}