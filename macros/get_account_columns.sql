
{% macro get_account_columns() %}

{% set columns = [
    {"name": "id", "datatype": dbt.type_int()},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "account_id", "datatype": dbt.type_string()},
    {"name": "is_active", "datatype": dbt.type_boolean()},
    {"name": "language", "datatype": dbt.type_string()},
    {"name": "name", "datatype": dbt.type_string()},
    {"name": "parent_network", "datatype": dbt.type_string()},
    {"name": "timezone", "datatype": dbt.type_string()},
    {"name": "type", "datatype": dbt.type_string()}
] %}

{{ fivetran_utils.add_pass_through_columns(columns, var('taboola__account_passthrough_columns')) }}

{{ return(columns) }}

{% endmacro %}