SELECT person.name AS person_name1,
       p.name AS person_name2,
       person.address AS common_address
  FROM person
  CROSS JOIN person AS p
     WHERE person.name != p.name
        AND person.address = p.address
            AND person.id > p.id
 ORDER BY 1, 2, 3;