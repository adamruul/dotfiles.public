---
name: write-jira-ticket
description: >
  Write a well-structured Jira ticket title and description optimised for AI coding agents.
  Use when the user wants to write, draft, or improve a Jira ticket — or when they have rough
  notes and want them turned into a precise, actionable ticket. Triggered by: "write-jira-ticket",
  "help me write a ticket", "draft a Jira ticket", "turn this into a ticket", "write a story for this".
---

# write-jira-ticket

Read `references/guidelines.md` before proceeding.

## Process

1. Read the user's input carefully. Identify the core change and why it matters.
2. Check for critical gaps: missing success criteria, missing constraints, unclear scope. If the goal itself is unclear OR the agent could not determine "done" from what's given, ask up to 3 targeted questions. Otherwise skip to step 3.
3. Draft the ticket using the format below.
4. Present the output ready to paste into Jira. No preamble, no explanation.

## Output Format

**Title**
One line. `[Action verb] [what] [where/context]`

**Description**

_What and Why_
[Context, problem statement, and concrete definition of done. Explicit constraints and out-of-scope items.]

_Suggested Approach_ _(omit if no preference)_
[Preferred implementation path and reason.]

_References_
[Links to related tickets, docs, ADRs, Slack threads, or source files. Omit if none.]

## Rules

- Output ONLY the ticket. No wrapper text.
- Do not invent specifics the user didn't provide — infer where safe, flag as `[TODO: ...]` where not.
- One ticket, one change. If the input describes multiple unrelated changes, flag it.
- Apply the writing standards from `references/guidelines.md`.
