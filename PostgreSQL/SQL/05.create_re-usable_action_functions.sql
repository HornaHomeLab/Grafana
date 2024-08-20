CREATE OR REPLACE FUNCTION get_action_id(action_name varchar)
RETURNS int AS $$
DECLARE
    action_id int;
BEGIN
    SELECT
        ID
    INTO action_id
    FROM Actions
    WHERE name = action_name;

    RETURN action_id;

END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

CREATE OR REPLACE PROCEDURE run_action_request(action_id int)
LANGUAGE plpgsql
AS $$
DECLARE
    ops_id int;
    action_url varchar;
    method varchar;
    action_result JSON;
BEGIN

    SELECT
        Endpoint_url
    INTO action_url
    FROM Actions
    WHERE ID = action_id;

    SELECT
        Actions.Method
    INTO method
    FROM Actions
    WHERE ID = action_id;


    INSERT INTO operations(start_time,action_id)
    VALUES(clock_timestamp(),action_id)
    RETURNING ID INTO ops_id;

    COMMIT;

    SELECT invoke_request(
        action_url,
        method
	)
    INTO action_result;

    UPDATE operations
    SET 
        Action_Status = action_result,
        End_time = clock_timestamp()
    WHERE ID = ops_id;


END;
$$;