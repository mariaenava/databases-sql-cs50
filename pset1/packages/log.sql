-- *** The Lost Letter ***
--Verificando se os dados do pacote estão corretos:
SELECT "contents", "from_address_id", "to_address_id" FROM "packages"
WHERE "from_address_id" = (
    SELECT "id" FROM "addresses"
    WHERE "address" = '900 Somerville Avenue'
)
AND "to_address_id" = (
    SELECT "id" FROM "addresses"
    WHERE "address" = '2 Finnegan Street'
);

-- Verificando se o endereço destinatário está incorreto
SELECT "contents", "from_address_id", "to_address_id" FROM "packages"
WHERE "from_address_id" = (
    SELECT "id" FROM "addresses"
    WHERE "address" = '900 Somerville Avenue'
)
AND "to_address_id" IN (
    SELECT "id" FROM "addresses"
    WHERE "address" LIKE '2 F% Street'
);

-- Verificando se o pacote foi entregue
SELECT "address_id", "action", "timestamp" FROM "scans"
WHERE "package_id" = (
    SELECT "id" FROM "packages"
    WHERE "from_address_id" = (
        SELECT "id" FROM "addresses"
        WHERE "address" = '900 Somerville Avenue'
)
    AND "to_address_id" IN (
        SELECT "id" FROM "addresses"
        WHERE "address" LIKE '2 F% Street'
)
);

-- Verificando o endrereço em que foi entregue
SELECT "address", "type" FROM "addresses"
WHERE "id" = (
    SELECT "address_id" FROM "scans"
    WHERE "action" = 'Drop'
    AND "package_id" = (
        SELECT "id" FROM "packages"
        WHERE "from_address_id" = (
            SELECT "id" FROM "addresses"
            WHERE "address" = '900 Somerville Avenue'
        )
        AND "to_address_id" IN (
            SELECT "id" FROM "addresses"
            WHERE "address" LIKE '2 F% Street'
        )
    )
);



-- *** The Devious Delivery ***

-- Verificando pacotes sem remetente
SELECT "id", "contents", "to_address_id" FROM "packages"
WHERE "from_address_id" IS NULL;

-- Verificando se foi entregue
SELECT "address_id", "action", "timestamp" FROM "scans"
WHERE "package_id" = (
    SELECT "id" FROM "packages"
    WHERE "from_address_id" IS NULL
);

-- Verificando onde foi entregue
SELECT "address", "type" FROM "addresses"
WHERE "id" = (
    SELECT "address_id" FROM "scans"
    WHERE "package_id" = (
        SELECT "id" FROM "packages"
        WHERE "from_address_id" IS NULL
    )
    AND "action" = 'Drop'
);

-- *** The Forgotten Gift ***

-- Verificando se os dados do pacote estão corretos
SELECT "contents", "from_address_id", "to_address_id" FROM "packages"
WHERE "from_address_id" = (
    SELECT "id" FROM "addresses"
    WHERE "address" = '109 Tileston Street'
)
AND "to_address_id" = (
    SELECT "id" FROM "addresses"
    WHERE "address" = '728 Maple Place'
);

-- Verificando se o pacote foi entregue

SELECT "address_id", "action", "timestamp" FROM "scans"
WHERE "package_id" = (
    SELECT "id" FROM "packages"
    WHERE "from_address_id" = (
        SELECT "id" FROM "addresses"
        WHERE "address" = '109 Tileston Street'
    )
    AND "to_address_id" = (
        SELECT "id" FROM "addresses"
        WHERE "address" = '728 Maple Place'
    )
);

-- Verificando se o pacote está com o motorista

SELECT "name" FROM "drivers"
WHERE "id" = (
    SELECT "driver_id" FROM "scans"
    WHERE "action" = 'Pick'
    AND "package_id" = (
        SELECT "id" FROM "packages"
        WHERE "from_address_id" = (
            SELECT "id" FROM "addresses"
            WHERE "address" = '109 Tileston Street'
        )
        AND "to_address_id" = (
            SELECT "id" FROM "addresses"
            WHERE "address" = '728 Maple Place'
        )
    )
    ORDER BY "timestamp" DESC
);

