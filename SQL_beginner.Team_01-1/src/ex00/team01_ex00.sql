WITH cte_last_rate AS (
  SELECT currency.id AS id, 
         currency.name AS name,
         (SELECT rate_to_usd FROM currency
           WHERE currency.updated IN (SELECT MAX(currency.updated) FROM currency)
             AND id = balance.currency_id) AS last_rate
    FROM currency
    JOIN balance ON currency.id = balance.currency_id
   GROUP BY currency.id, currency.name, balance.currency_id
)

SELECT COALESCE("user".name, 'not defined') AS name,
       COALESCE("user".lastname, 'not defined') AS lastname,
       balance.type AS type,
       SUM(money) AS volume,
       COALESCE(cte_last_rate.name, 'not defined') AS currency_name,
       COALESCE(cte_last_rate.last_rate, 1) AS last_rate_to_usd,
       SUM(money) * COALESCE(cte_last_rate.last_rate, 1) AS total_volume_in_usd
  FROM "user"
  FULL JOIN balance ON balance.user_id = "user".id
  LEFT JOIN cte_last_rate ON cte_last_rate.id = balance.currency_id
 GROUP BY "user".name, "user".lastname, balance.type, cte_last_rate.name, cte_last_rate.last_rate
 ORDER BY 1 DESC, 2, 3;

