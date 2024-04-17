-- Session #1
-- 1
BEGIN;
-- 2
UPDATE pizzeria
   SET rating = 2.0
 WHERE id = 1;
-- 3
UPDATE pizzeria
   SET rating = 3.0
 WHERE id = 2;
-- 4
COMMIT;


-- Session #2
-- 1
BEGIN;
-- 2
UPDATE pizzeria
   SET rating = 2.0
 WHERE id = 2;
-- 3
UPDATE pizzeria
   SET rating = 3.0
 WHERE id = 1;
-- 4
COMMIT;