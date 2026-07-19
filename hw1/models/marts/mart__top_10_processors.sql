{{
    config(
        materialized = "table",
        schema = "smartphones",
        unique_key = "CONCAT(processor_brand, '|', processor_speed)",
        indexes = [
            {"columns": ["processor_brand", "processor_speed"], "type": "btree", "unique": true},
            {"columns": ["count_processors"], "type": "btree"}
        ]
    )
}}

select
    processor_brand,
    processor_speed,
    sum(combination_count) as count_processors
from {{ ref("int__smartphones_combination") }}
group by processor_brand, processor_speed
order by count_processors desc
limit 10