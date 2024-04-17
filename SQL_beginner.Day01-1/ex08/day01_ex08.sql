SELECT order_date,
       CONCAT(new_table.name, ' (age:', new_table.age, ')')
       AS person_information
  FROM person_order 
       NATURAL JOIN 
       (SELECT id AS person_id, name, age FROM person) AS new_table
 ORDER BY order_date, person_information;