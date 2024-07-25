with cleansed_payments as(
    select * from {{ref('payments')}}
)
select
cps.user_id,
cps.city,
cps.race,
cps.country,
cps.currency,
cps.credit_card_type,
to_decimal(replace(cps.subscription_price,'$'),10,2)subscription_price
from
cleansed_payments cps