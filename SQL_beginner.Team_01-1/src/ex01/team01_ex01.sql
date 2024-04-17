-- insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29'); 
-- insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');
 
CREATE OR REPLACE FUNCTION rate (currency_id bigint, balance_date timestamp) RETURNS numeric AS $$

DECLARE 
	rate numeric = 0;	
BEGIN
		SELECT rate_to_usd 
          FROM currency
         WHERE id = currency_id
           AND updated <= balance_date
         ORDER BY updated DESC
         LIMIT 1
          INTO rate;
         
         IF rate IS NULL
         THEN
            SELECT rate_to_usd 
              FROM currency
             WHERE id = currency_id
               AND updated > balance_date
             ORDER BY updated ASC
             LIMIT 1
              INTO rate;
          END IF;
          RETURN rate;        
END;
$$ LANGUAGE plpgsql;
  
  
  WITH user_balance AS (
                     SELECT 
                            "user".name AS name,
                            "user".lastname AS lastname,
                            currency.name AS currency_name,
                            currency.id AS currency_id,
                            balance.updated AS updated,
                            balance.money
                     FROM balance
                          FULL JOIN "user"
                                 ON "user".id = balance.user_id
                               JOIN currency 
                                 ON currency.id = balance.currency_id
  ), all_rate AS   (
                   SELECT  *, (SELECT rate FROM rate(currency_id:=currency_id, balance_date:=updated) )
                     FROM user_balance
  ), pre_result AS (
                   SELECT COALESCE (name, 'not defined') AS name,
                          COALESCE (lastname,'not defined') AS lastname,
                          currency_name,
                          CAST (rate * money AS FLOAT) AS currency_in_usd,
                          updated
                     FROM all_rate
                     GROUP BY name,
                           lastname,
                           currency_name,
                           currency_in_usd,
                           updated             
  )
 
  SELECT name,
         lastname,
         currency_name,
         currency_in_usd
    FROM pre_result
   ORDER BY name DESC,
            lastname,
            currency_name   