WITH 
  pepperoni AS (
  SELECT person.name AS pepperoni_name
    FROM person
    JOIN person_order ON person_order.person_id=person.id
    JOIN menu ON menu.id=person_order.menu_id
   WHERE person.gender='female'
     AND menu.pizza_name IN ('pepperoni pizza')
),cheese AS (
  SELECT person.name AS cheese_name
    FROM person
    JOIN person_order ON person_order.person_id=person.id
    JOIN menu ON menu.id=person_order.menu_id
   WHERE person.gender='female'
     AND menu.pizza_name IN ('cheese pizza')
)

SELECT pepperoni_name AS name
  FROM pepperoni
  JOIN cheese ON pepperoni.pepperoni_name=cheese.cheese_name
 ORDER BY 1;
