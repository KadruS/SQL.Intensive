SELECT person.name,
       pizza_name,
       price,
       ROUND(price - ((price/100) * discount)) AS discount_price,
       pizzeria.name AS pizzeria_name

  FROM person_order
  JOIN person ON person.id = person_order.person_id
  JOIN menu ON menu.id = person_order.menu_id
  JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
  JOIN person_discounts ON person_discounts.pizzeria_id = pizzeria.id AND person_discounts.person_id = person.id

 ORDER BY 1,2;