
{% macro get_campaign_columns() %}

{% set columns = [
    {"name": "account_id", "datatype": dbt.type_int()},
    {"name": "id", "datatype": dbt.type_int()},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "approval_state", "datatype": dbt.type_string()},
    {"name": "cpc", "datatype": dbt.type_float()},
    {"name": "daily_ad_delivery_model", "datatype": dbt.type_string()},
    {"name": "daily_cap", "datatype": dbt.type_float()},
    {"name": "end_date", "datatype": dbt.type_timestamp()},
    {"name": "is_active", "datatype": dbt.type_boolean()},
    {"name": "name", "datatype": dbt.type_string()},
    {"name": "spending_limit", "datatype": dbt.type_int()},
    {"name": "spending_limit_model", "datatype": dbt.type_string()},
    {"name": "spent", "datatype": dbt.type_float()},
    {"name": "start_date", "datatype": dbt.type_timestamp()},
    {"name": "status", "datatype": dbt.type_string()},
    {"name": "tracking_code", "datatype": dbt.type_string()},
    {"name": "traffic_allocation_model", "datatype": dbt.type_string()}
] %}

{{ fivetran_utils.add_pass_through_columns(columns, var('taboola__campaign_passthrough_columns')) }}

{{ return(columns) }}

{% endmacro %}