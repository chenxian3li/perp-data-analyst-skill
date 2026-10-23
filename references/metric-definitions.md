# Metric definition checklist

Treat all definitions as hypotheses until confirmed against the user's approved data dictionary.

- **Trading volume:** agree on notional currency, price source, fill-versus-order grain, maker/taker attribution, self-trade treatment, and calendar boundaries.
- **Fees:** distinguish gross fee, discounts, rebates, incentives, funding payments and fee currency conversions.
- **PnL:** distinguish gross trading PnL, realized and unrealized PnL, position-closing attribution, fees, funding, and net account change.
- **Positions:** agree on snapshot time, direction convention, instrument multiplier, notional, collateral and margin methodology.
- **Liquidations:** distinguish order, fill, position, user and account counts; deduplicate by the desired entity.
- **Spreads/depth:** state mark or mid reference price, sampling window, level aggregation and units such as basis points.
- **Users/accounts:** count at an authorized canonical entity grain; never equate a wallet, account and person without a validated mapping.

Document formula, source fields, filters, grain, null handling, ownership, refresh cadence and verification evidence for every reported KPI.
