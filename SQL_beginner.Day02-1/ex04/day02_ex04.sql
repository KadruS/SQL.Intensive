SELECT pizza_name, pizzeria.name AS pizzeria_name, price
  FROM (SELECT * 
          FROM menu 
         WHERE pizza_name 
            IN ('mushroom pizza', 'pepperoni pizza')
       ) AS m
       JOIN pizzeria ON m.pizzeria_id = pizzeria.id
 ORDER BY 1, 2;
