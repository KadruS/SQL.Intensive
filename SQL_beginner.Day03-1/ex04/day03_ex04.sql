WITH cte_pizzeria AS (
  SELECT pizzeria.name AS pizzeria_name, person.gender
  FROM person_order
  JOIN person ON person.id=person_order.person_id
  JOIN menu ON menu.id=person_order.menu_id
  JOIN pizzeria ON pizzeria.id=menu.pizzeria_id
)

(SELECT pizzeria_name
  FROM cte_pizzeria
 WHERE gender = 'female'
 GROUP BY pizzeria_name
EXCEPT
SELECT pizzeria_name
  FROM cte_pizzeria
 WHERE gender = 'male'
 GROUP BY pizzeria_name)

 UNION

(SELECT pizzeria_name
  FROM cte_pizzeria
 WHERE gender = 'male'
 GROUP BY pizzeria_name
EXCEPT
SELECT pizzeria_name
  FROM cte_pizzeria
 WHERE gender = 'female'
 GROUP BY pizzeria_name);
