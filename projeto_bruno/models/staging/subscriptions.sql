{{config(materialized='table')}}

with src_subscription as(
    select * from lake_dev_raw.mongo_subscriptions
)
select 
sub.user_id,
sub.plan,
sub.status,
sub.payment_term,
sub.payment_method,
sub.subscription_term
from
src_subscription sub