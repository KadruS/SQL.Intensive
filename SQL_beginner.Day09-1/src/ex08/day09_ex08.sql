CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10)
RETURNS TABLE(fib integer) AS $$
    WITH RECURSIVE cte_fib(a, b) AS (
        VALUES (0, 1)
        UNION 
        SELECT GREATEST(a, b), a + b
        FROM cte_fib
        WHERE b < pstop
    )
    SELECT a FROM cte_fib;
$$ LANGUAGE sql;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();
