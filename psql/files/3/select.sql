-- Статус заказа | Среднее время пребывания заказа в этом статусе
select s.id                  as status,
       avg(
               date_part('day', (coalesce(oh.created_at, now()) - (select h.created_at
                                                                   from crm_order_history h
                                                                   where h.order_id = oh.order_id
                                                                     and h.new_value = oh.old_value
                                                                     and h.created_at < oh.created_at
                                                                   order by h.created_at desc
                                                                   limit 1)))
           )::numeric(11, 2) as average_days
from crm_order_history oh
         inner join crm_status s on s.id = oh.old_value
where oh.field_name = 'status_id'
group by s.id
order by s.id;

-- ID клиента | Дата последнего визита
select cv.customer_id as customer_id,
       (select tcv.created_at
        from crm_customer_visit tcv
        where tcv.customer_id = cv.customer_id
        order by tcv.created_at desc
        limit 1)      as last_visit
from crm_customer_visit cv
group by cv.customer_id
order by customer_id;

-- ID клиента | Среднее количество просмотров страниц за визит
with pages as (select tcvp.visit_id  as visit_id,
                      count(tcvp.id) as count
               from crm_customer_visit_page tcvp
               group by tcvp.visit_id)
select cv.customer_id as customer_id,
       avg(p.count)      average_page_count
from crm_customer_visit cv
         inner join pages p
                    on p.visit_id = cv.id
group by cv.customer_id
order by customer_id;

-- ID клиента | Адреса страниц с визитами дольше среднего времени визита
-- этого клиента
with customers as (select tcv.customer_id as    customer_id,
                          avg(tcv.visit_length) avg_visit_len
                   from crm_customer_visit tcv
                   group by tcv.customer_id)
select c.customer_id                                as customer_id,
       coalesce(string_agg(tcvp.page, ', '), ' - ') as pages
from customers c
         inner join crm_customer_visit as cv on cv.customer_id = c.customer_id
         left join crm_customer_visit_page tcvp on cv.id = tcvp.visit_id and tcvp.time_on_page >= c.avg_visit_len
group by c.customer_id
order by customer_id;

-- ID клиента | Среднее время между заказами
select
    c.id,
    avg(
        date_part(
            'day',
            o.created_at - (
                select coalesce(prev.created_at, o.created_at)
                from crm_order prev
                where prev.customer_id = o.customer_id
                  and prev.created_at < o.created_at
                order by prev.created_at desc
                limit 1
            )
            )
        )::numeric(11,2) as days
from crm_customer c
    inner join crm_order o
        on c.id = o.customer_id
group by c.id
order by c.id;

-- ID клиента | Количество визитов | Количество заказов
with visits as (
    select
        cv.customer_id as customer_id,
        count(cvp.id) as count
    from crm_customer_visit cv
        inner join crm_customer_visit_page cvp
            on cvp.visit_id = cv.id
    group by cv.customer_id
),
orders as (
    select
        o.customer_id as customer_id,
        count(o.id) as count
    from crm_order o
    group by o.customer_id
)
select
    v.customer_id,
    v.count,
    o.count
from visits v
    inner join orders o
        on o.customer_id = v.customer_id
order by v.customer_id;

select
    case
        when oh.old_value is null
        then extract(epoch from lag(created_at) over w - oh.created_at)
    end
from crm_order_history oh
where oh.field_name = 'status_id'
window w as (
    partition by oh.order_id
    order by oh.created_at desc
        )

-- Статус заказа | Среднее время пребывания заказа в этом статусе
select
    order_id,
    case
        when oh.old_value is null
        then extract(day from lag(created_at, 1) over w - oh.created_at)
        when oh.old_value is not null
        then extract(day from oh.created_at - lead(created_at) over w )
    end
from crm_order_history oh
    where oh.field_name = 'status_id'
window w as (
        partition by oh.order_id
        order by oh.created_at desc
        )