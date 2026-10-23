# Security and privacy

- Require user-authorized data connectors and least-privilege read-only identities. Never request or search for tokens, passwords, cloud profiles, private keys or local credential files.
- Do not hardcode tenant-specific cluster names, usernames, schema names, internal URLs, hostnames, file paths or IDs.
- Never treat SQL text checks as a substitute for server-side authorization.
- Use minimum necessary columns and timeframe; aggregate or pseudonymize before displaying or exporting sensitive rows.
- Account, wallet, identity-linkage, referral and risk signals can expose personal or sensitive commercial data. Only access or disclose them when explicitly authorized.
- Keep outputs within the user's approved destination. Do not post reports or data externally without instruction.
- If a source fails or is unavailable, identify the limitation; never fabricate executed results.
- Public sample data must be fictional. Check source files and Git history for secrets and proprietary data before publishing.
