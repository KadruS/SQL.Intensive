-- 1 variant
SELECT order_date AS action_date, 
       (SELECT name FROM person WHERE id = person_order.person_id) AS person_name
  FROM person_order

INTERSECT

SELECT visit_date AS action_date, 
       (SELECT name FROM person WHERE id = person_visits.person_id) AS person_name
  FROM person_visits

 ORDER BY action_date ASC, person_name DESC;

-- 2 variant
SELECT order_date AS action_date, person.name AS person_name
  FROM person_order, person
 WHERE person.id = person_order.person_id

INTERSECT

SELECT visit_date AS action_date, person.name AS person_name
  FROM person_visits, person
 WHERE person.id = person_visits.person_id

 ORDER BY action_date ASC, person_name DESC;