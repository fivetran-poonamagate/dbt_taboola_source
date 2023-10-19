
{% macro get_targeting_os_columns() %}

{% set columns = [
    {"name": "campaign_id", "datatype": dbt.type_int()},
    {"name": "index", "datatype": dbt.type_int()},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "os_family", "datatype": dbt.type_string()},
    {"name": "sub_categories", "datatype": dbt.type_string()},
    {"name": "type", "datatype": dbt.type_string()}
] %}

{{ fivetran_utils.add_pass_through_columns(columns, var('taboola__targeting_os_passthrough_columns')) }}

{{ return(columns) }}

{% endmacro %}