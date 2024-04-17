-- Session #1
-- 1
BEGIN;
-- 2
SELECT SUM(rating)
  FROM pizzeria;
-- 3
SELECT SUM(rating)
  FROM pizzeria;
 
COMMIT;

SELECT SUM(rating)
  FROM pizzeria;

-- Session #2
-- 1
BEGIN;
-- 2
UPDATE pizzeria
   SET rating = 1
 WHERE name = 'Pizza Hut';
COMMIT;
-- 3
SELECT SUM(rating)
  FROM pizzeria;