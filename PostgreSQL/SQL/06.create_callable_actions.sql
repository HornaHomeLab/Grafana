CREATE OR REPLACE PROCEDURE run_speedtest()
LANGUAGE plpgsql
AS $$
BEGIN

    CALL run_action_post_request(get_action_id('SpeedTest'));

END;
$$