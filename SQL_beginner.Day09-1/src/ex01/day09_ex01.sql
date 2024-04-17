CREATE OR REPLACE FUNCTION fnc_trg_person_update_audit() RETURNS TRIGGER AS $$
  BEGIN
    IF TG_OP = 'UPDATE' THEN
      INSERT INTO person_audit (type_event, row_id, name, age, gender, address)
      SELECT 'U', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address;
    END IF;
    RETURN NULL;
  END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trg_person_update_audit
 AFTER UPDATE ON person
 FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_update_audit();

-- Proverki
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;

-- Drops
-- DROP TRIGGER trg_person_update_audit ON person;
-- DROP FUNCTION fnc_trg_person_update_audit();


