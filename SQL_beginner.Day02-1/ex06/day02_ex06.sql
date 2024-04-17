SELECT pizza_name, pizzeria.name AS pizzeria_name
  FROM menu
  JOIN person_order ON menu.id=person_order.menu_id
  JOIN (SELECT * FROM person WHERE name IN ('Denis', 'Anna')) AS person ON person.id=person_order.person_id
  JOIN pizzeria ON pizzeria.id=menu.pizzeria_id
 ORDER BY 1, 2;