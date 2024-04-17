-- Session #1
-- 1
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- 2
SELECT name, rating
  FROM pizzeria
 WHERE name = 'Pizza Hut';
-- 3
SELECT name, rating
  FROM pizzeria
 WHERE name = 'Pizza Hut';
 
COMMIT;

SELECT name, rating
  FROM pizzeria
 WHERE name = 'Pizza Hut';

-- Session #2
-- 1
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- 2
UPDATE pizzeria
   SET rating = 3.0
 WHERE name = 'Pizza Hut';
COMMIT;
-- 3
SELECT name, rating
  FROM pizzeria
 WHERE name = 'Pizza Hut';