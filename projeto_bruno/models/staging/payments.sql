{{config(materialized='table')}}

with src_payments as(

select * from lake_dev_raw.mongo_payments

)
select
pay.user_id,
pay.city,
pay.race,
pay.country,
pay.currency,
pay.credit_card_type,
pay.subscription_price
from src_payments as pay