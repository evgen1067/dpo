-- Запрос №1 --- страница товара.
explain analyse (
  select
    *
  from
    crm_order_product
  where
    active = true
    and id = 4
);
-- Запрос №2 --- список товаров по умолчанию.
explain analyse (
  select
    id,
    code,
    name,
    price
  from
    crm_order_product
  where
    active = true
  order by
    sort
  limit
    100
);
-- Запрос №3 --- список товаров, отсортированный по цене.
explain analyse (
  select
    id,
    code,
    name,
    price
  from
    crm_order_product
  where
    active = true
  order by
    price desc
  limit
    100
);
-- Запрос №4 --- список товаров, отобранный менеджером.
explain analyze (
  select
    id,
    code,
    name,
    price
  from
    crm_order_product
  where
    active = true
    and id in (1, 5, 7, 8, 10, 34)
  order by
    sort
  limit
    100
);
-- Запрос №5 --- поиск товаров.
explain analyse (
  select
    id,
    code,
    name,
    price
  from
    crm_order_product
  where
    active = true
    and name like '%r%'
  limit
    100
);
-- Запрос №6 --- отчет по недавно добавленным товарам.
explain analyse (
  select
    *
  from
    crm_order_product
  where
    active = true
    and created_at > '2018-12-01 00:00:00'
  limit
    100
);

-- B Tree
create index btree_idx_id_order_product on crm_order_product using btree (id);

-- Partial Index
create index idx_active_true_order_product on crm_order_product (id) where active = TRUE;

-- Hash Index
create index hash_idx_id_order_product on crm_order_product using hash (id);

-- Gin Index для полнотекстового поиска и поиска по содержимому полей типа JSON
create index gin_idx_name_order_product on crm_order_product using gin (name gin_trgm_ops);

-- Brin Index для таблиц, в которых часть данных уже по своей природе как-то отсортирована
create index brin_idx_created_at_order_product on crm_order_product using brin (created_at);

explain analyze (
  select
    custom_fields->'message' as error_message
  from
    crm_order_product
  where
    custom_fields @> '{ "error": true }'
);

create index gin_idx_custom_fields_order_product on crm_order_product using gin (custom_fields jsonb_path_ops);