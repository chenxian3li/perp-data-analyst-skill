# DW — Warehouse Definitions and Transformations

`dw/` documents the **data warehouse layer**: curated tables, transformation or refresh SQL, data lineage, sources and joins, calculation formulas, business-time grain, and refresh rules.

The public release contains only the synthetic `daily_market_volume.sql` example. It **does not contain real warehouse DDL, production pipelines, or proprietary metric logic**.

## File convention

Use one file per logical target object, normally named `<table_name>.sql`. Add descriptive metadata:

```sql
-- object: <catalog.schema.table>
-- purpose: <why the table exists>
-- grain: <one row represents>
-- refresh: <full/incremental and time window, or UNKNOWN>
-- unique_key: <columns, or UNKNOWN>
-- time_column: <column and timezone, or UNKNOWN>
-- owner: <responsible team, or UNKNOWN>
```

## How to interpret a DW definition

- Identify the **final target object** first. Do not treat a staging CTE or temporary table as the final reporting table.
- Trace upstream sources and joins; check key cardinality, deduplication, amount scaling, sign conventions, filtering, and `NULL` treatment.
- Explain fee, funding, and PnL formulas only when the approved definitions explicitly support them.
- Check refresh cadence and snapshot/event-time semantics before comparing tables.
- A file may document `CREATE`, `INSERT`, `DELETE`, or another pipeline operation. Read it as documentation only; **never execute pipeline SQL simply to answer an analytics request**.
- Confirm the target table's actual schema and current version through the approved data catalog or connector.

See `daily_market_volume.sql` for fictional SELECT-only transformation logic.
