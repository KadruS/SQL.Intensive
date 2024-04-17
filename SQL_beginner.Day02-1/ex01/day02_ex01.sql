-- version 1
SELECT DISTINCT person_visits.visit_date AS missing_date 
  FROM person_visits LEFT JOIN
       (SELECT visit_date 
          FROM person_visits 
         WHERE person_id=1 OR person_id=2
       )AS v 
        ON person_visits.visit_date=v.visit_date
 WHERE v.visit_date IS NULL
   AND person_visits.visit_date BETWEEN '2022-01-01' AND '2022-01-10'
 ORDER BY missing_date ASC;

-- version 2
SELECT dates::DATE AS missing_date
  FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') AS dates 
       LEFT JOIN
       (SELECT visit_date 
          FROM person_visits 
         WHERE person_id=1 OR person_id=2
       )AS v
       ON dates=v.visit_date
 WHERE v.visit_date IS NULL
 ORDER BY missing_date ASC; 
