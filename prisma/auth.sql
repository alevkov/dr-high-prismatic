create extension pgcrypto;

-- Set password hash on insert User

CREATE OR REPLACE FUNCTION set_pwd()
RETURNS trigger AS
$BODY$
BEGIN
    NEW.password_hash := crypt(NEW.password_hash, gen_salt('bf', 10));
    RETURN NEW;
END;
$BODY$
LANGUAGE plpgsql;

CREATE TRIGGER hashed_pwd BEFORE INSERT OR UPDATE ON "User"
FOR EACH ROW EXECUTE PROCEDURE set_pwd();

-- Create auth token on insert LoginAttempt

CREATE OR REPLACE FUNCTION check_pwd()
RETURNS trigger AS
$BODY$
BEGIN
    NEW.token := digest((
        SELECT (password_hash||','||email||','||NOW()::TIMESTAMP)
        FROM "User"
        WHERE password_hash = crypt(NEW.password, password_hash)
        AND "User".email = NEW.email
    ), 'sha256');
    IF NEW.token IS NOT NULL THEN
        NEW.at := NOW()::TIMESTAMP;
    ELSE
        NEW.at = NULL;
    END IF;
    NEW.password = NULL;
    RETURN NEW;
END;
$BODY$
LANGUAGE plpgsql;

CREATE TRIGGER loggin_attempt_made BEFORE INSERT ON "LoginAttempt"
FOR EACH ROW EXECUTE PROCEDURE check_pwd();
