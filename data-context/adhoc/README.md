# Ad Hoc — Verified Analytical SQL

`adhoc/` is for **human-reviewed, reusable read-only SQL** that answers a specific analytical question (for example, market-volume comparison, fee reconciliation, or account activity investigation).

This public release intentionally contains **no validated private-warehouse queries**. The query examples under `../../examples/` are fictional illustrations, **not verified queries**, and must not be represented as approved business definitions.

## Naming and required metadata

Name approved files `<domain>__<question_or_metric>.sql`, for example `trading__daily_volume_by_market.sql`.

Include a header in each approved query:

```sql
-- title: <short title>
-- purpose: <business question>
-- grain: <one output row represents>
-- sources: <approved fully qualified source tables>
-- parameters: <name and meaning of each parameter>
-- time_column: <source event-time column>
-- timezone: <explicit timezone>
-- verified_at: <YYYY-MM-DD>
-- verified_by: <reviewer or owning team>
-- notes: <definitions, inclusions/exclusions, limitations>
```

## Review and maintenance rules

- Add SQL only after the actual tables, fields, metric definitions, and intended result grain have been validated in an authorized environment.
- Keep queries read-only (`SELECT` / safe `WITH ... SELECT`), parameterized when applicable, and scoped to a clear time range.
- Do not include DDL, writes, temporary-table dependencies, hardcoded credentials, or raw sensitive example rows.
- Document maker/taker attribution, fee/funding treatment, units, deduplication, and account exclusions where relevant.
- Revalidate and update metadata when source SQL or definitions change.
