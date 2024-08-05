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

CREATE OR REPLACE FUNCTION run_action_post_request(action_id int)
RETURNS void AS $$
DECLARE
    ops_id int;
    action_result JSON;
BEGIN
    INSERT INTO operations(start_time,action_id)
    VALUES(clock_timestamp(),action_id)
    RETURNING ID INTO ops_id;

    SELECT post_request(
        (
			SELECT
				endpoint_url
			FROM Actions
			WHERE ID = action_id
        )
	)
    INTO action_result;

    UPDATE operations
    SET 
        Action_Status = action_result,
        End_time = clock_timestamp()
    WHERE ID = ops_id;


END;
$$ LANGUAGE plpgsql SECURITY DEFINER;