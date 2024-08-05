CREATE OR REPLACE FUNCTION get_action_completion_status(in_action_id int)
RETURNS float AS $$
DECLARE
    completion_percentage float;
BEGIN

    WITH last_in_progress_ops AS (
        SELECT *
        FROM Operations
        WHERE end_time is NULL 
            AND action_status is NULL 
            AND action_id = in_action_id
        LIMIT 1
    ),

    avg_processing_time AS (
        SELECT EXTRACT(epoch FROM (SELECT
            AVG(end_time - start_time)
        FROM Operations
        WHERE action_id = in_action_id)) AS "seconds"
    ),

    current_processing_time AS (
        SELECT 
            EXTRACT(epoch FROM (NOW() - (SELECT start_time 
                FROM last_in_progress_ops))) AS "seconds"
    )
    
    SELECT
        (SELECT seconds from current_processing_time) / (SELECT seconds FROM avg_processing_time) * 100
    INTO completion_percentage;

    IF completion_percentage IS NULL THEN
        completion_percentage := 0;
    END IF;

    RETURN completion_percentage;

END;
$$ LANGUAGE plpgsql SECURITY DEFINER;