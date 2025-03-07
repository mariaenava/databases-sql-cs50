SELECT "players"."first_name", "players"."last_name", "salaries"."salary", "performances"."HR", "performances"."year" FROM "players"
JOIN "salaries" ON "players"."id" = "salaries"."player_id"
JOIN "performances" ON "players"."id" = "performances"."player_id"
WHERE "performances"."year" = "salaries"."year"
ORDER BY "players"."id", "performances"."year" DESC, "performances"."HR" DESC, "salaries"."salary" DESC;

