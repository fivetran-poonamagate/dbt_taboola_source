
{% macro get_campaign_item_columns() %}

{% set columns = [
    {"name": "id", "datatype": dbt.type_int()},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "approval_state", "datatype": dbt.type_string()},
    {"name": "campaign_id", "datatype": dbt.type_int()},
    {"name": "is_active", "datatype": dbt.type_boolean()},
    {"name": "status", "datatype": dbt.type_string()},
    {"name": "thumbnail_url", "datatype": dbt.type_string()},
    {"name": "title", "datatype": dbt.type_string()},
    {"name": "type", "datatype": dbt.type_string()},
    {"name": "url", "datatype": dbt.type_string()}
] %}

{{ fivetran_utils.add_pass_through_columns(columns, var('taboola__campaign_item_passthrough_columns')) }}

{{ return(columns) }}

{% endmacro %}