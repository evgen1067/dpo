create table if not exists crm_customer
(
    id         integer generated by default as identity primary key,
    created_at timestamp default now(),
    first_name varchar(256),
    last_name  varchar(256),
    phone      varchar(256),
    email      varchar(256)
);

create table if not exists crm_status
(
    id   integer generated by default as identity primary key,
    name varchar(256)
);

create table if not exists crm_order
(
    id          integer generated by default as identity primary key,
    created_at  timestamp default now(),
    customer_id integer references crm_customer (id),
    manager_id  integer,
    status_id   integer references crm_status(id),
    is_paid     bool,
    total_sum   numeric,
    utm_source  text
);

create table if not exists crm_order_history
(
    id         integer generated by default as identity primary key,
    order_id   integer references crm_order(id),
    created_at timestamp default now(),
    field_name varchar(256),
    old_value  numeric,
    new_value  numeric
);


create table if not exists crm_customer_visit
(
    id           integer generated by default as identity primary key,
    customer_id  integer references crm_customer(id),
    created_at   timestamp default now(),
    visit_length integer,
    landing_page text,
    exit_page    text,
    utm_source   text
);

create table if not exists crm_customer_visit_page
(
    id           integer generated by default as identity primary key,
    visit_id     integer references crm_customer_visit(id),
    page         text,
    time_on_page integer
);