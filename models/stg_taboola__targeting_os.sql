
with base as (

    select *
    from {{ ref('stg_taboola__targeting_os_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns = adapter.get_columns_in_relation(ref('stg_taboola__targeting_os_tmp')),
                staging_columns = get_targeting_os_columns()
            )
        }}
    from base
),

final as (

    select
        campaign_id,
        index,
        os_family,
        sub_categories,
        type

        {{ fivetran_utils.fill_pass_through_columns('taboola__targeting_os_passthrough_columns') }}

    from fields
)

select *
from final