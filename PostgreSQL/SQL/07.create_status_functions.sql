CREATE OR REPLACE FUNCTION get_action_completion_status(in_action_id int)
RETURNS float AS $$
DECLARE
    completion_percentage float;
BEGIN

    WITH last_in_progress_ops AS (
        SELECT *
        FROM Operations
        WHERE end_time IS NULL 
            AND action_status IS NULL 
            AND action_id = in_action_id
        ORDER BY start_time DESC
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
		CASE
			WHEN (SELECT seconds FROM avg_processing_time) IS NULL THEN -1
			WHEN (SELECT seconds from current_processing_time) IS NULL THEN -2
			ELSE (SELECT seconds from current_processing_time) / (SELECT seconds FROM avg_processing_time) * 100
		END
	INTO completion_percentage;

    IF completion_percentage = -2 THEN
        IF (SELECT 
                action_status ->> 'status' AS "status"
            FROM Operations
            WHERE action_id = in_action_id
                AND end_time IS NOT NULL
            ORDER BY start_time DESC
            LIMIT 1) = 'success' THEN
            
            -- (-10) last action succeeded status code
            completion_percentage := -10;
        ELSE
            -- (-11) last action failed status code
            completion_percentage := -11;
        END IF;
    END IF;

    IF completion_percentage = -1 THEN
        IF (SELECT *
            FROM Operations
            WHERE end_time IS NULL 
                AND action_status IS NULL 
                AND action_id = in_action_id
            ORDER BY start_time DESC
            LIMIT 1) EXISTS THEN

            -- (-12) Processing
            completion_percentage := -12;
        ELSE
            -- (-13) No data available
            completion_percentage := -13;
        END IF;


    END IF;

    RETURN completion_percentage;

END;
$$ LANGUAGE plpgsql SECURITY DEFINER;