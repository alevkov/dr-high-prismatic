create function "SearchSubstances"(alternative_name text) returns SETOF "Substance"
    stable
    language sql
as
$$
SELECT *
    FROM "Substance"
    WHERE id = (
        SELECT substance_id FROM "AlternativeName"
        WHERE
        name <% alternative_name ORDER BY
        similarity(name, alternative_name) DESC
    )
$$;

alter function "SearchSubstances"(text) owner to postgres;
