-- показать фио врачей, их специальности и заработную плату
select
    concat(
            d.first_name, ' ', d.second_name,
            ' ', d.third_name
        ) as name,
    string_agg(p.name, ', ') as positions,
    sum(p.salary * dp.rate) as salary
from
    doctor d
        inner join doctor_position dp on d.id = dp.id_doctor
        inner join position p on p.id = dp.id_position
group by
    d.id
order by
    name;
-- показать фио пациентов, их суммарную длительность приемов и суммарную стоимость лекарств по рецепту
select
    concat(
            p.first_name, ' ', p.second_name,
            ' ', p.third_name
        ) as name,
    string_agg(
            concat(
                    d.disease_name, ' (', d.severity,
                    ')'
                ),
            ', '
        ) as diagnosis,
    sum(r.duration) as sum_duration,
    sum(m.cost) as sum_cost
from
    patient p
        inner join record r on p.id = r.id_patient
        inner join recipe r2 on r.id = r2.id_record
        inner join medicine m on r2.id_medicine = m.id
        inner join record_diagnosis rd on r.id = rd.id_record
        inner join diagnosis d on d.id = rd.id_diagnosis
group by
    p.id
order by
    name;
-- показать название болезни, выписываемые лекарства и их суммарную стоимость
select
    d.disease_name as disease_name,
    string_agg(m.medicine_name, ', ') as medicine_names,
    sum(m.cost) as sum_cost
from
    diagnosis d
        inner join record_diagnosis rd on d.id = rd.id_diagnosis
        inner join record r on r.id = rd.id_record
        inner join recipe r2 on r.id = r2.id_record
        inner join medicine m on m.id = r2.id_medicine
group by
    d.id;
-- получить степени тяжести болезни, число пациентов с болзенью данной тяжести и пронумеровать их в ТОП-е
with diagnosises as (
    select
        d.severity as severity,
        count(p.id) as count
    from
        diagnosis d
            inner join record_diagnosis rd on d.id = rd.id_diagnosis
            inner join record r on r.id = rd.id_record
            inner join patient p on p.id = r.id_patient
    group by
        d.severity
)
select
            row_number() over (
        order by
            d.count desc
        ),
            d.severity,
            d.count
from
    diagnosises d;
select
            row_number() over w,
            d.severity as severity,
            d.disease_name as disease_name
from
    diagnosis d window w as (partition by d.severity)
order by
    d.severity
