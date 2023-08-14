CREATE TYPE options AS ENUM ('option 1', 'option 2', 'option 3');

CREATE TYPE complex AS
(
    r double precision,
    i double precision
);

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

create table if not exists task
(
    uuid          uuid      default uuid_generate_v1(),
    integer_type  integer,
    float_type    numeric,
    char_type     varchar(150),
    bool_type     boolean,
    date_type     date,
    time_type     time,
    datetime_type timestamp default now(),
    options_type  options,
    integer_array integer[],
    text_array    text[][],
    xml_type      xml,
    json_type     json,
    jsonb_type    jsonb,
    complex_type  complex,
    money_type    money,
    binary_type   bytea,
    geometry_type point,
    bit_type      bit varying
);