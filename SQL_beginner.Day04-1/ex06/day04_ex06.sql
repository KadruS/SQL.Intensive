CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS (
  SELECT pizzeria.name AS pizzeria_name
    FROM person_visits
    JOIN (SELECT * FROM person WHERE name = 'Dmitriy') AS p ON p.id = person_visits.person_id
    JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
    JOIN (SELECT * FROM menu WHERE price < 800) AS m ON m.pizzeria_id = pizzeria.id
   WHERE visit_date = '2022-01-08'
);