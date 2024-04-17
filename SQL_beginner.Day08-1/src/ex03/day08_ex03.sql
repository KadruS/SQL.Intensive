-- Session #1
-- 1
BEGIN;
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
BEGIN;
-- 2
UPDATE pizzeria
   SET rating = 3.6
 WHERE name = 'Pizza Hut';
COMMIT;
-- 3
SELECT name, rating
  FROM pizzeria
 WHERE name = 'Pizza Hut';
