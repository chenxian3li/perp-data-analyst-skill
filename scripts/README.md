# Runtime Helpers

This directory preserves the optional **runtime helper** layer of the original Skill layout. It is intentionally documentation-only in the public release.

The internal version used environment-specific database execution helpers; **those implementations and defaults are not distributed here**.

If a reusable public helper is added in the future, it should:
- Be connector-agnostic or explicitly documented for a public provider.
- Require the user's own approved credentials and least-privilege read-only access, configured outside the repository.
- Avoid hardcoded account names, internal hosts, regions, paths, and credentials.
- Make any SQL execution opt-in, with clear scope, auditability, and failure reporting.
- Never claim a leading `SELECT` check alone enforces read-only privileges.

No executable helper scripts are bundled in this release; the Skill can use already-authorized tools, or provide SQL without executing it.
