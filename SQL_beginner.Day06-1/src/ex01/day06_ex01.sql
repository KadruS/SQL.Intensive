WITH cte_discounts AS (
  SELECT person_id, pizzeria_id, COUNT(person_id) AS order_amount
  FROM person_order
  JOIN menu ON menu.id = person_order.menu_id
 GROUP BY pizzeria_id, person_id
 ORDER BY 1,2
)

INSERT INTO person_discounts(id, person_id, pizzeria_id, discount)
SELECT ROW_NUMBER() OVER() AS id,
       person_id, pizzeria_id, 
       CASE 
          WHEN order_amount = 1 THEN 10.5
          WHEN order_amount = 2 THEN 22
          ELSE 30
       END AS discount
  FROM cte_discounts;

