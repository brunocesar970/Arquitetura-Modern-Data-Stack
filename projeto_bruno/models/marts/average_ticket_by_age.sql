{{config(materialized='view')}}
with cleansed_user as(
    select * from {{ref('cleansed_user')}}
),
cleansed_payments as(
    select * from {{ref('cleansed_payments')}}
),
average_ticket_by_age as(
    select
    user.age,
    round(avg(cps.subscription_price),2) ticket_medio
    from cleansed_user user
    inner join cleansed_payments cps
    on user.user_id = cps.user_id
    group by user.age
)
select * from average_ticket_by_age order by ticket_medio desc