-- Session #1
-- 1
BEGIN;
UPDATE pizzeria
   SET rating = 5
 WHERE name = 'Pizza Hut';

SELECT name, rating
  FROM pizzeria
 WHERE name = 'Pizza Hut';

-- 2
COMMIT;


-- Session #2
-- 1
SELECT name, rating
  FROM pizzeria
 WHERE name = 'Pizza Hut';

-- 2
SELECT name, rating
  FROM pizzeria
 WHERE name = 'Pizza Hut';
 