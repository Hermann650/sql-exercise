SELECT name, stock FROM INGREDIENT 
WHERE stock > (SELECT AVG(stock) FROM INGREDIENT WHERE unit = 'kg') AND unit = 'kg'
ORDER BY stock desc;

SELECT i.name,count(1) as total from drink d
JOIN drink_ingredient di on d.id = di.drink_id
JOIN ingredient i on di.ingredient_id = i.id
GROUP BY i.name
ORDER BY total desc

select name from (
select name, count(1) as total, sum(stock) as total_stock from ingredient i 
join drink_ingredient di on i.id = di.ingredient_id
where unit = 'kg'
group by name desc
) j
where j.total_stock > (select avg(stock) from ingredient where unit = 'kg')

with itable as (
    select name, count(1) as total, sum(stock) as total_stock from ingredient i 
    join drink_ingredient di on i.id = di.ingredient_id
    where unit = 'kg'
    group by name desc
)
select it.name from itable it
where it.total_stock > (select avg(stock) from ingredient where unit = 'kg')

select name, stock from ingredient
having stock < (
	select avg(stock) from ingredient where unit = 'kg'
)
order by stock desc, name asc
limit 10

select f.name, ifnull(note, "No Notes") as order_note, date_format(date_add(record_at, interval 7 day), '%d %M %Y') as max_complaint from food f
join food_cooking_history fch on f.id = fch.food_id
join food_ingredient fi on f.id = fi.food_id
join ingredient i on fi.ingredient_id = i.id
where i.name like '%Chicken%'
group by fch.id