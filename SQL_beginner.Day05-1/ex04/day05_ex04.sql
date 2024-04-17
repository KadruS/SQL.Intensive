CREATE UNIQUE INDEX idx_menu_unique ON menu (pizzeria_id, pizza_name);

SET enable_seqscan TO OFF;
EXPLAIN ANALYZE
SELECT pizzeria_id, pizza_name
  FROM menu;

INSERT INTO menu VALUES(21, 1, 'cheese pizza', 1000);


