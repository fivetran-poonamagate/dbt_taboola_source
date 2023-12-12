
with base as (

    select *
    from {{ ref('stg_taboola__partner_type_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns = adapter.get_columns_in_relation(ref('stg_taboola__partner_type_tmp')),
                staging_columns = get_partner_type_columns()
            )
        }}
    from base
),

final as (

    select
        account_id, 
        index,
        type

        {{ fivetran_utils.fill_pass_through_columns('taboola__partner_type_passthrough_columns') }}

    from fields
)

select *
from final