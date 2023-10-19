
{% macro get_targeting_platform_columns() %}

{% set columns = [
    {"name": "campaign_id", "datatype": dbt.type_int()},
    {"name": "index", "datatype": dbt.type_int()},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "type", "datatype": dbt.type_string()},
    {"name": "value", "datatype": dbt.type_string()}
] %}

{{ fivetran_utils.add_pass_through_columns(columns, var('taboola__targeting_platform_passthrough_columns')) }}

{{ return(columns) }}

{% endmacro %}