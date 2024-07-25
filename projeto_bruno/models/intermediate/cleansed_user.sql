{{config(materialized='table')}}
with cleansed_user as(
    select * from {{ref('user')}}

)
select
user.user_id,
user.email,
user.gender,
user.username,
json_extract_path_text(user.employment::variant,'title') title,
user.credit_card,
json_extract_path_text(user.subscription::variant,'payment_method')payment_method,
user.date_of_birth,
datediff(year,to_date(date_of_birth,'YYYY-MM-DD'),current_date) age
from cleansed_user as user