CREATE ROLE "grafana" LOGIN PASSWORD 'PoNyK87NB#kax';

GRANT SELECT, INSERT, UPDATE ON Actions, Operations TO "grafana";
GRANT SELECT, UPDATE ON SEQUENCE operations_id_seq TO "grafana";
GRANT SELECT, UPDATE ON SEQUENCE actions_id_seq TO "grafana";

GRANT EXECUTE ON PROCEDURE run_speedtest() TO "grafana";
GRANT EXECUTE ON PROCEDURE download_fund_quotation() TO "grafana";
GRANT EXECUTE ON PROCEDURE calculate_investment_result() TO "grafana";

GRANT EXECUTE ON FUNCTION get_action_id(varchar) TO "grafana";
GRANT EXECUTE ON FUNCTION get_action_completion_status(integer) TO "grafana";