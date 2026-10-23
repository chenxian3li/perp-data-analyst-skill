# Read-only SQL quality controls

1. Inspect table and column metadata using approved metadata access.
2. Use one explicit analytical grain; aggregate each side before joining when grains differ.
3. Limit source tables and columns, filter by time early, avoid accidental cross joins and verify key cardinality.
4. State timezone, inclusive/exclusive intervals and event time versus ingestion time.
5. Handle nulls, zero denominators, duplicate fills, currency conversions and stale snapshots explicitly.
6. Validate with row counts, key uniqueness checks, subtotals and independent reconciliations.
7. Use parameters/bound values when supported; avoid interpolating untrusted identifiers.
8. Reject DDL/DML, unsafe functions and multi-statement execution. Text filtering is not a security boundary; enforce database read-only privileges and connector-level policy.
9. Do not run expensive unrestricted warehouse scans without permission and an appropriate scope.
10. Deliver SQL alongside the metric interpretation and any assumptions.

For a synthetic example, see `examples/sample-queries.sql`.
