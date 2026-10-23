-- SYNTHETIC EXAMPLE ONLY — NOT PRODUCTION SQL OR A VERIFIED WAREHOUSE JOB
-- object: demo_analytics.daily_market_volume
-- purpose: Illustrate a daily market-level aggregation from fictional fills
-- grain: one row per trade_date and market_id
-- refresh: not implemented; illustration only
-- unique_key: trade_date, market_id
-- time_column: executed_at (assumed UTC for this example)
-- owner: none; synthetic documentation
-- upstream: demo_exchange.trade_fills
-- note: not verified against any live warehouse; do not treat as a deployed table

SELECT
    CAST(executed_at AS DATE) AS trade_date,
    market_id,
    COUNT(*) AS fill_count,
    SUM(notional_usd) AS volume_usd,
    SUM(fee_usd) AS fees_usd
FROM demo_exchange.trade_fills
GROUP BY 1, 2;
