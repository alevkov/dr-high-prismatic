create or replace function get_uuid() returns uuid as
$BODY$
begin
    return gen_random_uuid();
end;
$BODY$
language plpgsql;