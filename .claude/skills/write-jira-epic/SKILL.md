---
name: write-jira-epic
description: >
  Write a structured Jira Epic description from rough notes, suitable for both engineers and senior leadership.
  Fetches linked resources (design docs, RFCs, Confluence pages) to enrich the output.
  Use when the user wants to write, draft, or improve a Jira Epic and may provide links alongside rough notes.
  Triggered by: "write-jira-epic", "help me write an epic", "draft an epic", "turn these notes into an epic",
  "write a Jira epic description".
---

# write-jira-epic

Read `references/template.md` before proceeding.

## Process

1. **Fetch linked resources** — If the user provides URLs or document links, fetch their content using the appropriate MCP integration or WebFetch. If a link is inaccessible, note it and continue with what's available.
2. **Draft the Epic** — Follow the template and field guidelines in `references/template.md`.
3. **Handle missing info** — Use `[TODO: ...]` placeholders for critical gaps. Do not invent content. After drafting, list what's missing and ask the user to fill in the gaps.
4. **Present the output** — Wrap the full Epic in a markdown code block. No preamble, no explanation — just the code block, followed by any missing-info questions.
