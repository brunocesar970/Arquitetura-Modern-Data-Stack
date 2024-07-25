{{config(materialized='table')}}
with src_user as(
select * from lake_dev_raw.mongo_user

)
select 
user.user_id,
user.email,
user.gender,
user.username,
user.employment,
user.credit_card,
user.subscription,
user.date_of_birth
from src_user as user