
with base as (

    select *
    from {{ ref('stg_taboola__targeting_sub_country_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns = adapter.get_columns_in_relation(ref('stg_taboola__targeting_sub_country_tmp')),
                staging_columns = get_targeting_sub_country_columns()
            )
        }}
    from base
),

final as (

    select
        campaign_id,
        index,
        type,
        value

        {{ fivetran_utils.fill_pass_through_columns('taboola__targeting_sub_country_passthrough_columns') }}

    from fields
)

select *
from final