INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT 
        generate_series(
          (SELECT COALESCE(MAX(id), 0) + 1 FROM person_order),
          ((SELECT COALESCE(MAX(id), 0) FROM person_order) + (SELECT MAX(id) FROM person))
        ),
        generate_series(
          (SELECT MIN(id) FROM person),
          (SELECT MAX(id) FROM person)
        ),
        (SELECT id FROM menu WHERE pizza_name='Greek pizza'),
        '2022-02-25';