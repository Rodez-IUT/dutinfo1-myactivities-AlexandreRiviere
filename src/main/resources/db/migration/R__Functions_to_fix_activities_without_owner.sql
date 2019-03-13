CREATE OR REPLACE function get_default_owner() returns "user" as $$
declare
    defaultOwner "user"%rowtype;
    defaultOwnerUsername varchar(500) := 'Default Owner';
begin
	SELECT * INTO DefaultOwner from "user"
	WHERE username = defaultOwnerUsername;
	if not found then
	    insert into "user"(id, username)
	       values(nextval('id_generator'), defaultOwnerUsername);
	    select * into defaultOwner from "user"
	       where username = defaultOwnerUsername;
	end if;
	return defaultOwner;
END
$$ language plpgsql;