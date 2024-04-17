WITH cte_pizzeria AS (
  SELECT pizzeria.name AS pizzeria_name, person.gender
  FROM person_visits
  JOIN person ON person.id=person_visits.person_id
  JOIN pizzeria ON pizzeria.id=person_visits.pizzeria_id
)

(SELECT pizzeria_name
  FROM cte_pizzeria
 WHERE gender = 'female'
EXCEPT ALL
SELECT pizzeria_name
  FROM cte_pizzeria
 WHERE gender = 'male')

 UNION ALL

(SELECT pizzeria_name
  FROM cte_pizzeria
 WHERE gender = 'male'
EXCEPT ALL
SELECT pizzeria_name
  FROM cte_pizzeria
 WHERE gender = 'female')

 ORDER BY 1;
