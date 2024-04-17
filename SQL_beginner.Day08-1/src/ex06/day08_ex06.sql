-- Session #1
-- 1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
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
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- 2
UPDATE pizzeria
   SET rating = 5
 WHERE name = 'Pizza Hut';
COMMIT;
-- 3
SELECT SUM(rating)
  FROM pizzeria;