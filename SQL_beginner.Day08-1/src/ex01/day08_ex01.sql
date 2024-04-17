-- Session #1
-- 1
BEGIN;
-- 2
SELECT name, rating
  FROM pizzeria
 WHERE name = 'Pizza Hut';
-- 3
UPDATE pizzeria
   SET rating = 4
 WHERE name = 'Pizza Hut';
-- 4
COMMIT;
-- 5
SELECT name, rating
  FROM pizzeria
 WHERE name = 'Pizza Hut';

-- Session #2
-- 1
BEGIN;
-- 2
SELECT name, rating
  FROM pizzeria
 WHERE name = 'Pizza Hut';
-- 3
UPDATE pizzeria
   SET rating = 3.6
 WHERE name = 'Pizza Hut';
-- 4
COMMIT;
-- 5
SELECT name, rating
  FROM pizzeria
 WHERE name = 'Pizza Hut';
