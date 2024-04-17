COMMENT ON TABLE person_discounts IS 'Table for calculating discounts based on amount of orders in each pizzeria for each person';
COMMENT ON COLUMN person_discounts.id IS 'Unique identifier, Primary key';
COMMENT ON COLUMN person_discounts.person_id IS 'Person identifier, forign key to person table';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Pizzeria identifier, forign key to pizzeria table';
COMMENT ON COLUMN person_discounts.discount IS 'Discount in persent, based on amount of orders';