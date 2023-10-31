
with base as (

    select *
    from {{ ref('stg_taboola__campaign_site_day_report_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns = adapter.get_columns_in_relation(ref('stg_taboola__campaign_site_day_report_tmp')),
                staging_columns = get_campaign_site_day_report_columns()
            )
        }}
    from base
),

final as (

    select
        _fivetran_id as pk,
        blocking_level,
        campaign_id,
        campaign_name,
        clicks,
        conversions,
        cpa,
        cpa_actions_num,
        cpa_actions_num_from_clicks,
        cpa_actions_num_from_views,
        cpa_clicks,
        cpa_conversion_rate,
        cpa_conversion_rate_clicks,
        cpa_conversion_rate_views,
        cpa_views,
        cast(cpc as {{ dbt.type_float() }}) as cpc,
        cast(cpm as {{ dbt.type_float() }}) as cpm,
        cast(ctr as {{ dbt.type_float() }}) as ctr,
        currency,
        cast(date_time as {{ dbt.type_timestamp() }}) as date_time,
        impressions,
        roas,
        site,
        site_name,
        cast(spent as {{ dbt.type_float() }}) as spent,
        timezone,
        cast(vcpm as {{ dbt.type_float() }}) as vcpm,
        cast(vctr as {{ dbt.type_float() }}) as vctr,
        visible_impressions

        {{ fivetran_utils.fill_pass_through_columns('taboola__campaign_site_day_report_passthrough_columns') }}

    from fields
)

select *
from final