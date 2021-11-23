BEGIN;

CREATE extension pg_trgm WITH SCHEMA public;

CREATE INDEX Alternative_Name_name_uindex ON "AlternativeName" USING GIN (name gin_trgm_ops);
CREATE INDEX Substance_name_index ON "Substance" USING GIN (primary_name gin_trgm_ops);

CREATE OR REPLACE FUNCTION SearchSubstance(name text)
RETURNS SETOF "Substance" AS $$
    SELECT *
    FROM "Substance"
    WHERE
      name <% primary_name
    ORDER BY
      similarity(name, primary_name) DESC
$$ LANGUAGE sql STABLE;

CREATE OR REPLACE FUNCTION SearchSubstances(alternative_name text)
RETURNS SETOF "Substance" AS $$
    SELECT *
    FROM "Substance"
    WHERE id = (
        SELECT substance_id FROM "AlternativeName"
        WHERE
        name <% alternative_name ORDER BY
        similarity(name, alternative_name) DESC
    )
$$ LANGUAGE sql STABLE;