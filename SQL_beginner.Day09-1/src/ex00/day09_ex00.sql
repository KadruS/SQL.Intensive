DELETE FROM person WHERE id = 10;

DROP TABLE IF EXISTS person_audit;
CREATE TABLE person_audit
( created timestamp with time zone DEFAULT current_timestamp NOT NULL,
  type_event char(1) DEFAULT 'I' NOT NULL,
  CONSTRAINT ch_type_event CHECK (type_event IN ('I', 'U', 'D')),
  row_id bigint NOT NULL,
  name varchar,
  age integer,
  gender varchar,
  address varchar
);

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit() RETURNS TRIGGER AS $$
  BEGIN 
    IF TG_OP = 'INSERT' THEN
      INSERT INTO person_audit (type_event, row_id, name, age, gender, address)
      SELECT 'I', NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address;
    END IF;
    RETURN NULL;
  END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trg_person_insert_audit
AFTER INSERT ON person
FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_insert_audit();

-- Proverka
INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');

-- Drops
-- DROP TRIGGER trg_person_insert_audit ON person;
-- DROP FUNCTION fnc_trg_person_insert_audit();
-- DELETE FROM person WHERE id = 10;
-- DROP TABLE person_audit;



-- WITH cte_last_rate AS (
--   SELECT currency.id AS id, 
--          currency.name AS name,
--          (SELECT rate_to_usd FROM currency
--            WHERE currency.updated IN (SELECT MAX(currency.updated) FROM currency)
--              AND id = balance.currency_id) AS last_rate
--     FROM currency
--     JOIN balance ON currency.id = balance.currency_id
--    GROUP BY currency.id, currency.name, balance.currency_id
-- )

-- SELECT COALESCE("user".name, 'not defined') AS name,
--        COALESCE("user".lastname, 'not defined') AS lastname,
--        balance.type AS type,
--        SUM(money) AS volume,
--        COALESCE(cte_last_rate.name, 'not defined') AS currency_name,
--        COALESCE(cte_last_rate.last_rate, 1) AS last_rate_to_usd,
--        SUM(money) * COALESCE(cte_last_rate.last_rate, 1) AS total_volume_in_usd
--   FROM "user"
--   FULL JOIN balance ON balance.user_id = "user".id
--   LEFT JOIN cte_last_rate ON cte_last_rate.id = balance.currency_id
--  GROUP BY "user".name, "user".lastname, balance.type, cte_last_rate.name, cte_last_rate.last_rate
--  ORDER BY 1 DESC, 2, 3;


