-- CTE
WITH cte_dates AS (
   (SELECT dates::DATE
              FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') AS dates
   )
) 
SELECT dates AS missing_date 
  FROM cte_dates
       LEFT JOIN
       (SELECT visit_date
          FROM person_visits
         WHERE person_id=1 OR person_id=2
       ) AS v
       ON dates=v.visit_date
 WHERE v.visit_date IS NULL
 ORDER BY missing_date ASC;

  