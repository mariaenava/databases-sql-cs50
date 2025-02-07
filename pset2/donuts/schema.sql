CREATE TABLE "ingredients" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "unit" TEXT NOT NULL,
    "price_per_unit" REAL NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "donuts" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "gluten_free" BOOLEAN NOT NULL,
    "price_per_donut" REAL NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "donuts_ingedients" (
    "id" INTEGER,
    "donut_id" INTEGER NOT NULL,
    "ingredient_id" INTEGER NOT NULL,
    PRIMARY KEY ("id")
    FOREIGN KEY ("donut_id") REFERENCES "donuts"("id")
    FOREIGN KEY ("ingredient_id") REFERENCES "ingredients"("id")
);


CREATE TABLE "orders" (
    "id" INTEGER,
    "costumer_id" INTEGER NOT NULL,
    PRIMARY KEY ("id")
    FOREIGN KEY ("costumer_id") REFERENCES "costumers"("id")
);

CREATE TABLE "donuts_orders" (
    "id" INTEGER,
    "donut_id" INTEGER NOT NULL,
    "order_id" INTEGER NOT NULL,
    "quantity" INTEGER NOT NULL,
    PRIMARY KEY ("id")
    FOREIGN KEY ("donut_id") REFERENCES "donuts"("id")
    FOREIGN KEY ("order_id") REFERENCES "orders"("id")
);

CREATE TABLE "costumers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    PRIMARY KEY ("id")
);

