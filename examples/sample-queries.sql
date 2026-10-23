-- Fictional schema: do not execute without substituting approved real table definitions.
-- Daily executed volume, USD, per market; fill-level grain.
SELECT
  CAST(executed_at AS DATE) AS trade_date,
  market_id,
  COUNT(*) AS fills,
  COUNT(DISTINCT account_id) AS active_accounts,
  SUM(notional_usd) AS volume_usd,
  SUM(fee_usd) AS fees_usd
FROM demo_fills
WHERE executed_at >= :start_at
  AND executed_at < :end_at
GROUP BY 1, 2
ORDER BY 1, 2;

-- Fee split by maker/taker, assuming a documented liquidity_role.
SELECT
  liquidity_role,
  SUM(notional_usd) AS volume_usd,
  SUM(fee_usd) AS fees_usd
FROM demo_fills
WHERE executed_at >= :start_at
  AND executed_at < :end_at
GROUP BY 1
ORDER BY 1;
