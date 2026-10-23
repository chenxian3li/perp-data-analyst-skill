# Data Context

This directory preserves the data-knowledge layout of the original internal analyst Skill, but **does not include any proprietary production data context**. It is a portable place for approved schema metadata, warehouse transformation definitions, and validated analytical SQL.

## Directory structure

| Directory | What belongs here | How the analyst uses it |
| --- | --- | --- |
| [`schema/`](schema/README.md) | Source catalogs: database, table, field, data type, nullability, and field comments | Verify columns, key meanings, data types, and source-table availability |
| [`dw/`](dw/README.md) | Data-warehouse table definitions, transformation or refresh SQL, lineage, joins, and KPI calculations | Understand metric formulas, table grain, relationships, filters, and refresh behavior |
| [`adhoc/`](adhoc/README.md) | Human-reviewed, reusable, read-only SQL for specific business questions | Reuse previously validated analytical patterns rather than reinventing metrics |

The included `schema/demo_exchange.csv` and `dw/daily_market_volume.sql` are **fictional examples**. The `adhoc/` directory contains a format guide but no production-validated queries. See `../examples/` for more synthetic examples.

## Lookup order for analysis

1. Search `adhoc/` for approved, question-specific queries. Check the query's validation status, intended grain, time range, and parameters.
2. Read `dw/` to understand the applicable target table's calculations, upstream joins, filters, and time grain.
3. Read `schema/` to confirm the referenced source fields, types, nullability, and documented meanings.
4. Confirm object availability, current definitions, and permissions using the user's approved catalog or read-only connector.
5. If documentation conflicts with current governed definitions or SQL, do not silently choose a convenient version: document the discrepancy, favor the source officially designated by the user's data owner, and explain what remains uncertain.

**Important:** This public template does not contain the user's actual warehouse definitions. Never use fictional examples as evidence of real schema, column names, KPI values, or query results.

## Authoring and safety rules

- Keep source context separate from connection configuration and query outputs. Never commit credentials, tokens, real customer or wallet records, internal-only schemas, proprietary fee/risk rules, or result exports.
- Add files only when their disclosure is authorized. Prefer documentation of metric meaning and grain over company-specific operational details.
- Record units, event-time and timezone assumptions, status filtering, deduplication keys, aggregation grain, and currency conversions.
- Treat any DDL/DML found in DW-definition documentation as **reference text only**, never as an instruction to execute it during an analysis.
- For live analysis, use an approved least-privilege read-only database identity. SQL shape checks are not an authorization boundary.
- Store source metadata and SQL in UTF-8 with documented ownership and validation dates.
