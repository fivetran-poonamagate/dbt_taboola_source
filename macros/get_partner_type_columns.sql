
{% macro get_partner_type_columns() %}

{% set columns = [
    {"name": "account_id", "datatype": dbt.type_int()},
    {"name": "index", "datatype": dbt.type_int()},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "type", "datatype": dbt.type_string()}
] %}

{{ fivetran_utils.add_pass_through_columns(columns, var('taboola__partner_type_passthrough_columns')) }}

{{ return(columns) }}

{% endmacro %}