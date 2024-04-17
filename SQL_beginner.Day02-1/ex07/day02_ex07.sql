SELECT pizzeria.name AS pizzeria_name
  FROM person_visits
  JOIN (SELECT * FROM person WHERE name='Dmitriy') AS person ON person.id=person_visits.person_id
  JOIN pizzeria ON person_visits.pizzeria_id=pizzeria.id
  JOIN menu ON pizzeria.id=menu.pizzeria_id
 WHERE menu.price < 800 AND person_visits.visit_date = '2022-01-08';