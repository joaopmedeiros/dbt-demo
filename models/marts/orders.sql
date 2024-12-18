with 

orders as (
    
    select * from {{ ref('stg_orders')}}

),

order_items_table as (
    
    select * from {{ ref('order_items')}}

),

order_items_summary as (

    select

        order_items.order_id,
        sum(supply_cost) as order_cost,

    from order_items_table as order_items

    group by 1

),


final as (
    select

        orders.*,
        order_cost

    from orders
    
    left join order_items_summary on orders.order_id = order_items_summary.order_id
)

select * from final
