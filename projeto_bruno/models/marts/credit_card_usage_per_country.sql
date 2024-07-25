with cleansed_user as(
    select * from {{ref('cleansed_user')}}
),
cleansed_payments as(
    select * from {{ref('cleansed_payments')}}
),
credit_card_usage_per_country as(
    select
    cps.country,
    cps.currency,
    cps.credit_card_type,
    count(*)amount
    from
    cleansed_user user
    inner join cleansed_payments cps
    on user.user_id = cps.user_id
    group by cps.country, cps.currency,cps.credit_card_type
)
select * from credit_card_usage_per_country order by country