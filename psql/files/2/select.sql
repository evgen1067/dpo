-- integer_type
select
    t.integer_type as integer_type
from
    task t
where
        t.integer_type > 100;
-- float_type
select
    t.float_type as float_type
from
    task t
where
        t.float_type > 100.00;
-- char_type
select
    t.char_type as char_type
from
    task t
where
        t.char_type like '%Devil’s%';
-- bool_type
select
    t.bool_type
from
    task t
where
    not t.bool_type;
-- date_type
select
    t.date_type
from
    task t
where
        extract(
                year
                from
                t.date_type
            ) = 2023;
-- time_type
select
    t.time_type
from
    task t
where
        extract(
                minute
                from
                t.time_type
            ) = 5;
-- options_type
select
    t.options_type
from
    task t
where
        t.options_type > 'option 1';
-- integer_array
select
    t.integer_array
from
    task t
where
        t.integer_array[1] > 1;
-- text_array
select
    t.text_array
from
    task t
where
        t.text_array[1][1] = 'training';
-- xml_type
-- https://postgrespro.ru/docs/postgresql/9.4/datatype-xml
select
    t.xml_type::xml
from
    task t;
-- json_type
select
    t.json_type
from
    task t
where
        (t.json_type->>'balance')::numeric > 60;
-- jsonb_type
select
        t.jsonb_type->'name'
from
    task t
where
        t.jsonb_type @> '{"company": "Company 3"}';
-- complex_type
select
    concat(
            (t.complex_type).r,
            ' + ',
            (t.complex_type).i,
            'i'
        )
from
    task t
where
        (t.complex_type).r > 10;
-- money_type
select
    t.money_type
from
    task t
where
        t.money_type :: numeric > 100;
-- binary_type
SELECT
    t.binary_type :: bytea
from
    task t
where
        t.binary_type = 'sadsadsada \153\154\155 \052\251\124' :: bytea;
-- geometry_type
select
    (t.geometry_type :: point)
from
    task t
where
        t.geometry_type |>> point(11.0, 12.2);
-- bit_type
select
    t.bit_type
from
    task t
where
        t.bit_type > B'111111';
-- uuid
select
    t.uuid
from
    task t
where
        t.uuid in (
        '8bdb70f0-dd2e-11ed-b14b-0242ac120002' :: uuid
        );
