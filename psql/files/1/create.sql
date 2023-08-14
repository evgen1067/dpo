create table if not exists patient
(
    id            integer generated by default as identity primary key,
    second_name   varchar(256) not null,
    first_name    varchar(256) not null,
    third_name    varchar(256) not null,
    address       varchar(256) not null,
    date_of_birth date         not null,
    phone         varchar(256) not null
);

create table if not exists doctor
(
    id          integer generated by default as identity primary key,
    second_name varchar(256) not null,
    first_name  varchar(256) not null,
    third_name  varchar(256) not null
);

create table if not exists position
(
    id     integer generated by default as identity primary key,
    name   varchar(256) not null,
    salary numeric      not null check (salary > 0)
);

create table if not exists doctor_position
(
    id          integer generated by default as identity primary key,
    id_doctor   integer references doctor (id),
    id_position integer references position (id),
    rate        numeric not null check (rate > 0) check ( rate <= 1 )
);

create table if not exists record
(
    id         integer generated by default as identity primary key,
    date       date    not null,
    time       time    not null,
    duration   integer default 15,
    cabinet    integer NOT NULL,
    id_patient integer references patient (id),
    id_doctor  integer references doctor (id)
);

create table if not exists diagnosis
(
    id           integer generated by default as identity primary key,
    disease_name varchar(256) not null,
    severity     varchar(256) not null
);

create table if not exists record_diagnosis
(
    id           integer generated by default as identity primary key,
    id_record    integer references record (id),
    id_diagnosis integer references diagnosis (id)
);

create table medicine
(
    id            integer generated by default as identity primary key,
    medicine_name varchar(256) not null,
    cost          numeric      not null check ( cost > 0 )
);

create table if not exists recipe
(
    id          integer generated by default as identity primary key,
    quantity    integer not null check ( quantity > 0 ),
    duration    integer not null check ( duration > 0 ),
    dosage      integer not null check ( dosage > 0 ),
    id_record   integer references record (id),
    id_medicine integer references medicine (id)
);