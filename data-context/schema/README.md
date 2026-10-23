# Schema — Source Field Metadata

`schema/` documents **source-database structure**, not connection details or customer records. Expected entries describe database, table, column, original type, nullability, and source comments.

This public release contains `demo_exchange.csv`, a **fully fictional** metadata example. The sample is not a discoverable live catalog and its identifiers must not be used for real queries.

## CSV format

Preserve the six-column, **no-header** layout used by the source-metadata convention:

| Position | Field | Description |
| --- | --- | --- |
| 1 | `source_database` | Logical source database name |
| 2 | `table_name` | Source table name |
| 3 | `column_name` | Field name |
| 4 | `data_type` | Original source data type, without type coercion |
| 5 | `nullable` | `YES` or `NO` |
| 6 | `comment` | Source field description, possibly empty |

Fictional example:

```csv
demo_exchange,trade_fills,fill_id,text,NO,Synthetic unique fill identifier
```

## Rules

- Use one CSV per approved source or logical export; use UTF-8, preserve the declared columns, and apply standard CSV quoting.
- Do not include production-only database names, raw records, addresses, customer IDs, secrets, credentials, endpoint URLs, or restricted schema comments.
- Preserve source data types and nullability rather than inferring business semantics from field names.
- Deduplicate metadata by `source_database.table_name.column_name`; date or version approved source exports outside this file if needed.
- The original source namespace may differ from the reporting warehouse namespace: validate mappings in `../dw/` and the live authorized catalog.
