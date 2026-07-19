{{
    config(
        materialized = "table",
        schema = "smartphones",
        unique_key = "CONCAT(processor_brand, '|', battery_capacity)",
        indexes = [
            {"columns": ["processor_brand", "battery_capacity"], "type": "btree"},
            {"columns": ["count_combinations"], "type": "btree"}
        ]
    )
}}

select
    processor_brand,
    battery_capacity,
    count(*) as count_combinations
from {{ ref("int__smartphones_combination") }}
group by processor_brand, battery_capacity
order by count_combinations desc
limit 10