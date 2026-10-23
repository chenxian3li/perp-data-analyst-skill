# Fictional example schema

All identifiers are fictitious and for documentation only.

- `demo_markets(market_id TEXT PRIMARY KEY, quote_asset TEXT)`
- `demo_fills(fill_id TEXT PRIMARY KEY, account_id TEXT, market_id TEXT, executed_at TIMESTAMP, side TEXT, notional_usd DECIMAL, fee_usd DECIMAL, liquidity_role TEXT)`
- `demo_funding_events(event_id TEXT PRIMARY KEY, account_id TEXT, market_id TEXT, event_at TIMESTAMP, funding_usd DECIMAL)`
- `demo_positions(account_id TEXT, market_id TEXT, snapshot_at TIMESTAMP, size_contracts DECIMAL, unrealized_pnl_usd DECIMAL)`

The tables, values, relationships and calculations have no connection to any particular exchange. Confirm the actual warehouse model and semantics first.
