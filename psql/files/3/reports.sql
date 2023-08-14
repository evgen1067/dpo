-- Статус заказа | Среднее время пребывания заказа в этом статусе

with epochs as (select s.name as status,
                       coalesce(
                               extract(
                                       epoch
                                       from
                                       coalesce(
                                                       lead(oh.created_at) over w,
                                                       now()
                                           ) - oh.created_at
                                   ),
                               0
                           )  as epochs
                from crm_order_history oh
                         inner join crm_status s on s.id = oh.new_value
                where oh.field_name = 'status_id'
                window w as (
                        partition by oh.order_id
                        order by
                            oh.created_at
                        ))
select e.status                      as status,
       avg(e.epochs)::numeric(11, 2) as avg
from epochs e
group by e.status;

-- ID клиента | Дата последнего визита
select distinct r.*
from (select customer_id as customer_id,
             last_value(created_at) over (
                 partition by customer_id
                 order by
                     created_at range between unbounded preceding
                     and unbounded following
                 )       as last_visit
      from crm_customer_visit) r
order by r.customer_id;

-- ID клиента | Среднее количество просмотров страниц за визит
with visits as (select cv.customer_id as customer_id,
                       cvp.visit_id   as visit_id,
                       row_number() over (
                           partition by cv.customer_id, cvp.visit_id
                           )          as count
                from crm_customer_visit cv
                         inner join crm_customer_visit_page cvp on cv.id = cvp.visit_id),
     counts as (select v.customer_id as customer_id,
                       v.visit_id    as visit_id,
                       last_value(v.count) over (
                           partition by v.customer_id,
                               v.visit_id
                           order by
                               v.count range between unbounded preceding
                               and unbounded following
                           )         as last
                from visits v)
select r.customer_id as customer_id,
       avg(r.last)   as avg
from (select distinct *
      from counts c) r
group by r.customer_id
order by r.customer_id;


-- ID клиента | Адреса страниц с визитами дольше среднего времени визита этого клиента
with averages as (select cv.customer_id       as customer_id,
                         avg(cv.visit_length) as avg_time
                  from crm_customer_visit cv
                  group by cv.customer_id),
     visits as (select cv.customer_id   as customer_id,
                       cvp.page         as page,
                       cvp.time_on_page as time_on_page
                from crm_customer_visit cv
                         inner join crm_customer_visit_page cvp on cv.id = cvp.visit_id)
select a.customer_id as customer_id,
       v.page        as page
from averages a
         inner join visits v on a.customer_id = v.customer_id
    and a.avg_time < v.time_on_page
order by a.customer_id;

-- ID клиента | Среднее время между заказами
with report as (select o.customer_id as customer_id,
                       extract(
                               epoch
                               from
                               lag(o.created_at) over w - o.created_at
                           )         as epochs
                from crm_order o
                window w as (
                        partition by o.customer_id
                        order by
                            o.created_at desc
                        ))
select c.id                  as customer_id,
       coalesce(
               avg(r.epochs),
               0
           )::numeric(11, 2) as average
from crm_customer c
         left join report r on r.customer_id = c.id
group by c.id
order by c.id;

-- ID клиента | Количество визитов | Количество заказов
with visits as (select cv.customer_id      as customer_id,
                       count(cvp.visit_id) as count
                from crm_customer_visit cv
                         inner join crm_customer_visit_page cvp on cv.id = cvp.visit_id
                group by cv.customer_id),
     orders as (select o.customer_id as customer_id,
                       count(o.id)   as count
                from crm_order o
                group by o.customer_id)
select c.id                 as customer_id,
       coalesce(v.count, 0) as visits,
       coalesce(o.count, 0) as orders
from crm_customer c
         left join orders o on o.customer_id = c.id
         left join visits v on v.customer_id = c.id
order by c.id;

-- Источник трафика | Количество визитов с этим источником | Количество созданных заказов | Количество оплаченных заказов | Количество выполненных заказов

with visits as (select cv.utm_source       as utm_source,
                       count(cvp.visit_id) as visits
                from crm_customer_visit cv
                         inner join crm_customer_visit_page cvp on cv.id = cvp.visit_id
                group by cv.utm_source),
     orders as (select o.utm_source as utm_source,
                       count(o.id)  as count_orders
                from crm_order o
                group by o.utm_source),
     payed as (select o.utm_source as utm_source,
                      count(o.id)  as count_orders
               from crm_order o
               where o.status_id = 2
               group by o.utm_source),
     completed as (select o.utm_source as utm_source,
                          count(o.id)  as count_orders
                   from crm_order o
                   where o.status_id = 1
                   group by o.utm_source)
select coalesce(o.utm_source, v.utm_source) as utm_source,
       coalesce(v.visits, 0)                as visits_count,
       coalesce(o.count_orders, 0)          as count_orders,
       coalesce(p.count_orders, 0)          as payed_count,
       coalesce(c.count_orders, 0)          as completed_count
from visits v
         full outer join orders o on v.utm_source = o.utm_source
         left join payed p on (p.utm_source = o.utm_source)
         left join completed c on c.utm_source = o.utm_source;


-- ID менеджера | Среднее время выполнения заказов | Доля отмененных заказов | Сумма выполненных заказов | Средняя стоимость заказа

with completed as (select distinct o.id        as order_id,
                                   extract(
                                           epoch
                                           from
                                           last_value(coh.created_at) over (partition by coh.order_id) -
                                           first_value(coh.created_at) over (partition by coh.order_id)
                                       )       as epochs,
                                   o.total_sum as total_sum
                   from crm_order o
                            inner join crm_order_history coh on o.id = coh.order_id
                   where o.status_id = 1),
     uncompleted as (select o.id as id
                     from crm_order o
                              inner join crm_status cs on cs.id = o.status_id
                         and status_id = 10)
select o.manager_id                                                as manager_id,
       coalesce(
               avg(c.epochs),
               0
           )                                                       as avg_completed_time,
       count(u.id):: numeric(11, 2) / count(o.id):: numeric(11, 2) as fraction,
       coalesce(
               sum(c.total_sum),
               0
           ):: numeric(11, 2)                                      as completed_sum,
       avg(o.total_sum):: numeric(11, 2)                           as average_cost
from crm_order o
         left join completed c on o.id = c.order_id
         left join uncompleted u on u.id = o.id
group by o.manager_id
order by o.manager_id;

-- ID менеджера | Рейтинг менеджера

with managers as (
    select
        distinct
        o.manager_id as manager_id
    from crm_order o
    order by o.manager_id
),
orders as (
    select
        o.id as order_id,
        o.manager_id as manager_id
    from crm_order o
),
completed as (
        select
            o.id as order_id,
            o.manager_id as manager_id
        from crm_order o
        where o.status_id = 1
),
canceled as (
    select
        o.id as order_id,
        o.manager_id as manager_id
    from crm_order o
    where o.status_id = 10
),
complete_time as (
    select distinct o.manager_id as manager_id,
                    extract(
                            epoch
                            from
                            last_value(coh.created_at) over (partition by coh.order_id) -
                            first_value(coh.created_at) over (partition by coh.order_id)
                        )       as epochs,
                    o.total_sum as total_sum
    from crm_order o
             inner join crm_order_history coh on o.id = coh.order_id
    where o.status_id = 1
), report as (
    select
        distinct
        m.manager_id as manager_id,
        coalesce(count(c.order_id) over w, 0)::numeric(11, 2) - coalesce(count(c.order_id) over (), 0)::numeric(11, 2) as completed_count,
        coalesce(avg(ct.epochs) over w, 0)::numeric(11, 2) - coalesce(avg(ct.epochs) over (), 0)::numeric(11, 2) as average_time,
        coalesce(count(cn.order_id) over w, 0)::numeric(11, 2) - coalesce(count(cn.order_id) over (), 0)::numeric(11, 2) as canceled_count
    from managers m
             inner join orders o on o.manager_id = m.manager_id
             left join completed c on c.manager_id = m.manager_id
             left join canceled cn on cn.manager_id = m.manager_id
             left join complete_time ct on ct.manager_id = m.manager_id
    window w as (partition by m.manager_id)
)
select
    r.manager_id,
    (r.completed_count + r.average_time + r.canceled_count) as rate
from report r;

