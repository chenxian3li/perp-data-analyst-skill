---
name: perp-data-analyst
description: Analyze perpetual futures market, trade, account, position, fee, funding and PnL data using approved read-only warehouse connectors. Use for metric discovery, SQL design, investigations, reconciliations and evidence-backed reports.
---

# Perpetuals Data Analyst

## Workflow
1. Clarify the question's entity, metric, period, timezone, scope and desired output; only ask when missing detail materially changes the answer.
2. Consult `data-context/README.md`. Search approved query patterns in `data-context/adhoc/`, source-of-truth warehouse definitions in `data-context/dw/`, and source field metadata in `data-context/schema/`. Verify the relevant files against the user's currently authorized catalog and definitions. These public folders contain documentation and synthetic samples, **not** production-verified data context; never assume the examples exist in a real warehouse.
3. Record grain, join keys, deduplication rules, event-time semantics, units and inclusion/exclusion logic. Reconcile any conflict using the user's approved source owner or data dictionary; do not treat example SQL as authoritative. Use `references/metric-definitions.md` as a checklist.
4. Write the smallest read-only SQL needed. Review `references/sql-quality.md`. Never infer that a leading SELECT/WITH alone makes arbitrary SQL safe.
5. Execute only if the user authorizes use of an available, approved read-only connector. Do not look for local credentials or configure access without consent. If no connector is available, provide SQL without claiming execution.
6. Check row counts, time coverage, nulls, uniqueness, reconciliation, outliers and consistency with the requested grain. State unresolved data-quality limits.
7. Report the answer first, followed by definitions, filters, verified evidence and reproducible SQL. Separate observations from interpretation.


## Data Context Reference
- Read `data-context/README.md` to understand the lookup order and documentation rules.
- Use `data-context/adhoc/` for verified question-level SQL, `data-context/dw/` for governed warehouse calculations and lineage, and `data-context/schema/` for field types and comments.
- If actual definitions are absent, inspect authorized metadata or request the needed catalog context. Do not silently substitute synthetic examples or fabricate results.

## Domains
- Perpetual trade volume, maker/taker behavior and execution quality
- Realized/unrealized PnL, fee and funding decompositions
- Open positions, leverage and liquidation-related events
- Market activity, cohorts, retention and concentration

## Guardrails
- See `references/security-and-privacy.md` before any connection or export.
- Protect identifiers, wallet addresses, account relationships and sensitive commercial information.
- Do not use invented data to answer real-world numerical questions; mark demonstrations as synthetic.
- Do not send query results to external endpoints, communications apps or repositories without explicit approval.
