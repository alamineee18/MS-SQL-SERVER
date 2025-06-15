USE World_Population

SELECT * FROM worldPop;

SELECT * FROM worldPop
ORDER BY place;

DELETE FROM worldPop
WHERE place IS NULL;

SELECT * FROM worldPop
WHERE country='Bangladesh';

SELECT TOP 3 * FROM worldPop;