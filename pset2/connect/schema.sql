CREATE TABLE "users" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "username" TEXT NOT NULL UNIQUE,
    "password" TEXT NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "schools" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "founding_year" INTEGER NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "companies" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "industry" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "users_connections" (
    "user1_id" INTEGER,
    "user2_id" INTEGER,
    PRIMARY KEY ("user1_id", "user2_id")
    FOREIGN KEY ("user1_id") REFERENCES "users"("id")
    FOREIGN KEY ("user2_id") REFERENCES "users"("id")
);

CREATE TABLE "school_connections" (
    "user_id" INTEGER,
    "school_id" INTEGER,
    "start_date" DATE NOT NULL,
    "end_date" DATE,
    "degree_type" TEXT NOT NULL,
    PRIMARY KEY ("user_id", "school_id")
    FOREIGN KEY ("user_id") REFERENCES "users"("id")
    FOREIGN KEY ("school_id") REFERENCES "schools"("id")
);

CREATE TABLE "companies_connections" (
    "user_id" INTEGER,
    "company_id" INTEGER,
    "start_date" DATE NOT NULL,
    "end_date" DATE,
    "title" TEXT NOT NULL,
    PRIMARY KEY ("user_id", "company_id")
    FOREIGN KEY ("user_id") REFERENCES "users"("id")
    FOREIGN KEY ("company_id") REFERENCES "companies"("id")
);
