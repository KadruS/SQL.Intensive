-- 1
SELECT name
  FROM pizzeria
 WHERE id NOT IN (SELECT pizzeria_id FROM person_visits);
-- 2
SELECT name
  FROM pizzeria
 WHERE NOT EXISTS (SELECT pizzeria_id FROM person_visits WHERE pizzeria_id=pizzeria.id);

