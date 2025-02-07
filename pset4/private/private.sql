CREATE TABLE "book_cipher" (
    "sentence_number" INTEGER,
    "character_number" INTEGER,
    "message_length" INTEGER,
    PRIMARY KEY ("sentence_number")
);

INSERT INTO "book_cipher" ("sentence_number","character_number","message_length")
VALUES ('14','98','4'),
('114','3','5'),
('618','72','9'),
('630','7','3'),
('932','12','5'),
('2230','50','7'),
('2346','44','10'),
('3041','14','5');

CREATE VIEW "selected_sentences" AS
SELECT "id", "character_number",  "message_length", "sentence" FROM "sentences"
JOIN "book_cipher" ON "sentences"."id" = "book_cipher"."sentence_number";

CREATE VIEW "message" AS
SELECT substr("sentence", "character_number", "message_length") AS 'phrase' FROM "selected_sentences";
