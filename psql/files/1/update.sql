-- увеличение стоимости всех лекарств на 5%
update medicine set cost = 1.05 * medicine.cost;

-- уменьшение оклада для всех должностей на 10%
update position set salary = 0.9 * position.salary;