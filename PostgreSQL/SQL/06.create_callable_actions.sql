CREATE OR REPLACE FUNCTION run_speedtest()
RETURNS void AS $$
BEGIN

    PERFORM run_action_post_request(get_action_id('SpeedTest'));

END;
$$ LANGUAGE plpgsql SECURITY DEFINER;