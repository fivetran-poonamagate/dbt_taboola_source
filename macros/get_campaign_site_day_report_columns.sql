
{% macro get_campaign_site_day_report_columns() %}

{% set columns = [
    {"name": "_fivetran_id", "datatype": dbt.type_string()},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "blocking_level", "datatype": dbt.type_string()},
    {"name": "campaign_id", "datatype": dbt.type_int()},
    {"name": "campaign_name", "datatype": dbt.type_string()},
    {"name": "clicks", "datatype": dbt.type_int()},
    {"name": "conversions", "datatype": dbt.type_int()},
    {"name": "cpa", "datatype": dbt.type_float()},
    {"name": "cpa_actions_num", "datatype": dbt.type_float()},
    {"name": "cpa_actions_num_from_clicks", "datatype": dbt.type_float()},
    {"name": "cpa_actions_num_from_views", "datatype": dbt.type_float()},
    {"name": "cpa_clicks", "datatype": dbt.type_float()},
    {"name": "cpa_conversion_rate", "datatype": dbt.type_float()},
    {"name": "cpa_conversion_rate_clicks", "datatype": dbt.type_float()},
    {"name": "cpa_conversion_rate_views", "datatype": dbt.type_float()},
    {"name": "cpa_views", "datatype": dbt.type_int()},
    {"name": "cpc", "datatype": dbt.type_float()},
    {"name": "cpm", "datatype": dbt.type_float()},
    {"name": "ctr", "datatype": dbt.type_float()},
    {"name": "currency", "datatype": dbt.type_string()},
    {"name": "date_time", "datatype": dbt.type_timestamp()},
    {"name": "impressions", "datatype": dbt.type_int()},
    {"name": "roas", "datatype": dbt.type_float()},
    {"name": "site", "datatype": dbt.type_string()},
    {"name": "site_name", "datatype": dbt.type_string()},
    {"name": "spent", "datatype": dbt.type_float()},
    {"name": "timezone", "datatype": dbt.type_string()},
    {"name": "vcpm", "datatype": dbt.type_float()},
    {"name": "vctr", "datatype": dbt.type_float()},
    {"name": "visible_impressions", "datatype": dbt.type_float()}
] %}

{{ fivetran_utils.add_pass_through_columns(columns, var('taboola__campaign_site_day_report_passthrough_columns')) }}

{{ return(columns) }}

{% endmacro %}