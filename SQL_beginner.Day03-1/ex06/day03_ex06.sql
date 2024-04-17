WITH cte_menu AS (
  SELECT menu.pizza_name AS pizza_name, 
         pizzeria.name AS pizzeria_name,
         menu.price AS price
    FROM menu 
    JOIN pizzeria ON pizzeria.id=menu.pizzeria_id         
)

SELECT menu_1.pizza_name,
       menu_1.pizzeria_name AS pizzeria_name_1,
       menu_2.pizzeria_name AS pizzeria_name_2,
       menu_1.price
  FROM cte_menu AS menu_1
 CROSS JOIN cte_menu AS menu_2
            WHERE menu_1.price=menu_2.price
              AND menu_1.pizzeria_name < menu_2.pizzeria_name
              AND menu_1.pizza_name=menu_2.pizza_name
 ORDER BY 1;
    
