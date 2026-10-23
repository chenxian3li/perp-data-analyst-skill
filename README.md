# Perp DEX Data Analyst skill

This public-facing Skill originated from the internal data analyst Skill developed for **APEX Exchange**. It has been adapted for broader **perpetual decentralized exchange (Perp DEX)** analytics while excluding exchange-specific production schemas, SQL, infrastructure configurations, customer data, and confidential business rules.

**Perp DEX Data Analyst skill** helps AI agents analyze perpetual futures and exchange datasets with reproducible, source-backed SQL. It is designed to work with **user-authorized, read-only** data connections, not a built-in exchange database.

## Capabilities

- Analyze trading volume, maker/taker activity, fees, funding, positions, and PnL.
- Investigate market-level and account-level activity, cohorts, and basic risk indicators.
- Discover table metadata, establish metric definitions, review SQL, and validate data quality.
- Deliver scoped, reproducible read-only SQL and evidence-backed reports.

## Repository structure

The repository root is the **Skill root**. The public version intentionally contains only portable instructions, references, and synthetic examples.

```text
perp-data-analyst-skill/
├── README.md
├── SKILL.md
├── agents/
│   └── openai.yaml
├── data-context/
│   ├── README.md
│   ├── adhoc/
│   │   └── README.md
│   ├── dw/
│   │   ├── README.md
│   │   └── daily_market_volume.sql
│   └── schema/
│       ├── README.md
│       └── demo_exchange.csv
├── examples/
│   ├── sample-schema.md
│   └── sample-queries.sql
├── references/
│   ├── metric-definitions.md
│   ├── security-and-privacy.md
│   └── sql-quality.md
└── scripts/
    └── README.md
```

- `SKILL.md` — analysis workflow, data-context lookup order, and safety rules.
- `agents/openai.yaml` — ChatGPT Skill display metadata.
- `data-context/` — **preserves the original data-knowledge architecture** (see [Data Context overview](data-context/README.md)):
  - [`schema/`](data-context/schema/README.md) — source field dictionary: database/table/column names, source types, nullability, and comments.
  - [`dw/`](data-context/dw/README.md) — warehouse table/metric definitions, transformation SQL, lineage, aggregation grain, joins, and refresh logic.
  - [`adhoc/`](data-context/adhoc/README.md) — manually reviewed and verified, reusable SQL for business questions.
- `references/` — general metric definitions, SQL quality standards, and privacy guidance.
- `examples/` — additional fictional query and schema illustrations.
- `scripts/` — runtime helper layer; no environment-specific executables or credentials are included.

The structure of `data-context/` is functional, **not just a placeholder name**: the Skill checks approved ad-hoc examples, DW definitions, and source schema metadata before generating SQL. The public branch contains only documentation and **synthetic** DW/schema examples; it does not include internally verified production definitions. Users must supply or connect their own authorized data context.

## How to install this Skill

The instructions below assume the sanitized files have been published in a **separate public GitHub repository**. The public repository address is `https://github.com/chenxian3li/perp-data-analyst-skill`. Do **not** publish or distribute the original private repository or its Git history.

### 1. ChatGPT Chat on web

1. Download the published public Skill repository or a tagged release.
2. Package the Skill directory as a ZIP, keeping `SKILL.md` at the Skill root alongside `agents/`, `data-context/`, `references/`, `examples/`, and `scripts/`.
3. Open the ChatGPT Skills library (for example, via `/skills` or the available Skills interface).
4. Upload the ZIP and confirm that **Perpetuals Data Analyst** is installed.

The Skill does not include database access. To query live data in ChatGPT, connect an approved, read-only data source. Without one, it can still help develop and review SQL, but it must not claim to have executed queries.

### 2. ChatGPT Work on web

Use the **same installed Skill** as in ChatGPT Chat; no separate Work-specific repository is needed.

1. Install the Skill from the public package using the steps above.
2. Start a Work task for a multi-step investigation, SQL review, or analytical report.
3. Grant access only to data sources and applications authorized for the task.
4. For live queries, ensure an approved warehouse connector is available in that environment.

### 3. Codex on MacBook (local)

Clone the published public repository and expose its root as a Codex Skill:

```bash
PUBLIC_REPO_URL="https://github.com/chenxian3li/perp-data-analyst-skill.git"
mkdir -p "$HOME/Projects" "$HOME/.agents/skills"
git clone "$PUBLIC_REPO_URL" "$HOME/Projects/perp-data-analyst-skill"
ln -s "$HOME/Projects/perp-data-analyst-skill" "$HOME/.agents/skills/perp-data-analyst"
```

Update the local installation with:

```bash
git -C "$HOME/Projects/perp-data-analyst-skill" pull --ff-only
```

Configure any approved database or MCP connection **outside the repository**, with read-only permissions.

### 4. Hermes agent on server

Clone the public repository directly into the Hermes skills directory:

```bash
PUBLIC_REPO_URL="https://github.com/chenxian3li/perp-data-analyst-skill.git"
mkdir -p "$HOME/.hermes/skills"
git clone "$PUBLIC_REPO_URL" "$HOME/.hermes/skills/perp-data-analyst"
```

Update the installation with:

```bash
git -C "$HOME/.hermes/skills/perp-data-analyst" pull --ff-only
```

Configure any external connector, database identity, or server-specific path separately. Do not commit credentials or infrastructure configuration.

## Usage

1. Connect an approved data source with a least-privilege read-only identity.
2. Provide or connect your own authorized source schema, DW definitions, and validated SQL using the `data-context/` conventions. The bundled examples are **fictional**, not actual production definitions.
3. Ask an analytical question, such as “What changed in daily trading volume by market?” or “Reconcile trading fees and realized PnL for a given period.”
4. Review query scope, assumptions, and validation checks before any live execution.

The examples are educational and must be adapted to the user's authorized data model.

## Safety and limitations

- The Skill does not grant access to a warehouse or replace server-side read-only authorization.
- Do not execute DDL, DML, or multi-statement SQL in an analytical workflow.
- Confirm ambiguous definitions and disclose data-quality limitations rather than guessing.
- Do not expose customer identifiers, wallet information, internal business rules, or other sensitive data without explicit authorization.

## Before public release

This branch is a **release candidate**, not proof of authorization to publish. Obtain any necessary intellectual-property and disclosure approvals, perform a complete secret and confidential-data review, test examples against synthetic fixtures, and add a license only with the rights holder's approval. Publish a clean, independently rooted repository rather than exporting private Git history.
