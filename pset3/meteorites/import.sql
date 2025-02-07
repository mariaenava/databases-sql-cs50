--importing csv data into a temporary table
.import --csv meteorites.csv temp

--cleaning data into the temporary table
--#1
UPDATE "temp" SET "mass" = NULL
WHERE "mass" = '';

UPDATE "temp" SET "year" = NULL
WHERE "year" = '';

UPDATE "temp" SET "lat" = NULL
WHERE "lat" = '';

UPDATE "temp" SET "long" = NULL
WHERE "long" = '';

--#2
UPDATE "temp"
SET "mass" = ROUND("mass", 2),
    "year" = ROUND("year", 2),
    "lat" = ROUND("lat", 2),
    "long" = ROUND("long", 2);

--#3
DELETE FROM "temp"
WHERE "nametype" LIKE '%Relict%';


--creating the meteorites table
CREATE TABLE "meteorites" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "class" TEXT NOT NULL,
    "mass" REAL,
    "discovery" TEXT NOT NULL CHECK("discovery" IN ('Fell', 'Found')),
    "year" INTEGER DEFAULT NULL,
    "lat" REAL DEFAULT NULL,
    "long" REAL DEFAULT NULL,
    PRIMARY KEY ("id")
);

--tranfering the clean data inta meteorites table
INSERT INTO "meteorites" ("name", "class", "mass", "discovery", "year", "lat", "long")
SELECT "name", "class", "mass", "discovery", "year", "lat", "long" FROM "temp"
ORDER BY "year", "name";
