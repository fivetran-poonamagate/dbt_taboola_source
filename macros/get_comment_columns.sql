
{% macro get_comment_columns() %}

{% set columns = [
    {"name": "account_id", "datatype": dbt.type_int()},
    {"name": "campaign_id", "datatype": dbt.type_int()},
    {"name": "index", "datatype": dbt.type_int()},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "comment", "datatype": dbt.type_string()}
] %}

{{ fivetran_utils.add_pass_through_columns(columns, var('taboola__comment_passthrough_columns')) }}

{{ return(columns) }}

{% endmacro %}