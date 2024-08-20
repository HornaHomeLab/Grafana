CREATE OR REPLACE PROCEDURE run_speedtest()
LANGUAGE plpgsql
AS $$
BEGIN

    CALL run_action_request(get_action_id('SpeedTest'));

END;
$$;

CREATE OR REPLACE PROCEDURE download_fund_quotation()
LANGUAGE plpgsql
AS $$
BEGIN

    CALL run_action_request(get_action_id('FundQuotation'));

END;
$$;

CREATE OR REPLACE PROCEDURE calculate_investment_result()
LANGUAGE plpgsql
AS $$
BEGIN

    CALL run_action_request(get_action_id('InvestmentRefund'));

END;
$$