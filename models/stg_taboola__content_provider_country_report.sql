
with base as (

    select *
    from {{ ref('stg_taboola__content_provider_country_report_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns = adapter.get_columns_in_relation(ref('stg_taboola__content_provider_country_report_tmp')),
                staging_columns = get_content_provider_country_report_columns()
            )
        }}
    from base
),

final as (

    select
        _fivetran_id as pk,
        account_id,
        campaigns_num,
        clicks,
        content_provider,
        content_provider_id,
        content_provider_name,
        conversions_value,
        country_name,
        country_value,
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
        cast(date as {{ dbt.type_timestamp() }}) as date,
        impressions,
        roas,
        cast(spent as {{ dbt.type_float() }}) as spent,
        timezone,
        cast(vcpm as {{ dbt.type_float() }}) as vcpm,
        cast(vctr as {{ dbt.type_float() }}) as vctr,
        visible_impressions

        {{ fivetran_utils.fill_pass_through_columns('taboola__content_provider_country_report_passthrough_columns') }}

    from fields
)

select *
from final