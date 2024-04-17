create table graph
( point1 varchar not null,
  point2 varchar not null,
  cost bigint default 0
);

insert into graph 
values ('a', 'b', 10),
        ('b', 'a', 10),
        ('a', 'c', 15),
        ('c', 'a', 15),
        ('a', 'd', 20),
        ('d', 'a', 20),
        ('b', 'c', 35),
        ('c', 'b', 35),
        ('b', 'd', 25),
        ('d', 'b', 25),
        ('c', 'd', 30),
        ('d', 'c', 30);

WITH RECURSIVE tree AS (
  SELECT point1 AS branch,
    point1, point2, cost, 1 AS len,
    (SELECT COUNT(DISTINCT point1) FROM graph) AS total_len
  FROM graph
  WHERE point1 = 'a'
  UNION
  SELECT (tree.branch || ',' || graph.point1) AS tree,
    graph.point1, graph.point2,
    tree.cost + graph.cost,
    tree.len + 1,
    tree.total_len
  FROM tree
    JOIN graph
    ON tree.point2 = graph.point1
  WHERE branch NOT LIKE ('%' || graph.point1 || '%')
), tour AS (
  SELECT cost AS total_cost,
          ('{' || branch || ',' || 'a' || '}') AS tour
    FROM tree
   WHERE point2 = 'a'
     AND len = total_len
)

SELECT *
  FROM tour
 WHERE total_cost = (SELECT MIN(total_cost) FROM tour)
 ORDER BY total_cost, tour;
