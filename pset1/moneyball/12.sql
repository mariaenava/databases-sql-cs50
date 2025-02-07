SELECT "first_name", "last_name" FROM (
        SELECT "players"."first_name", "players"."last_name" FROM "players"
        JOIN "salaries" ON "players"."id" = "salaries"."player_id"
        JOIN "performances" ON "players"."id" = "performances"."player_id"
        AND "salaries"."year" = "performances"."year"
        WHERE "performances"."H" > 0
        AND "performances"."year" = 2001
        ORDER BY ("salaries"."salary"/"performances"."H"), "players"."id"
        LIMIT 10
    )

INTERSECT

SELECT "first_name", "last_name" FROM (
    SELECT "players"."first_name", "players"."last_name" FROM "players"
    JOIN "salaries" ON "players"."id" = "salaries"."player_id"
    JOIN "performances" ON "players"."id" = "performances"."player_id"
    AND "salaries"."year" = "performances"."year"
    WHERE "performances"."RBI" > 0
    AND "performances"."year" = 2001
    ORDER BY ("salaries"."salary"/"performances"."RBI"), "players"."id"
    LIMIT 10
);
