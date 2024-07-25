with cleansed_payments as(
    select * from {{ref('cleansed_payments')}}
),
cleansed_subscription as (
    select * from {{ref('cleansed_subscription')}}
),
payments_per_plan_credit_card_type as(
    select 
    cs.plan,
    cps.credit_card_type,
    sum(cps.subscription_price)total_price
    from
    cleansed_payments as cps
    inner join cleansed_subscription cs
    on cps.user_id = cs.user_id
    group by cs.plan, cps.credit_card_type
    order by cs.plan, total_price desc
)
select * from payments_per_plan_credit_card_type