SELECT "name" FROM "schools"
WHERE "district_id" IN (
    SELECT "id" FROM "districts"
    WHERE "city" = 'Cambridge'
    AND "name" = 'Cambridge'
);
