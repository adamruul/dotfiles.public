# Jira Ticket Writing Guidelines

Writing for AI coding agents. A coding agent can't ask clarifying questions mid-work — every ambiguity becomes a guess.

## Title

One line. Format: `[Action verb] [what] [where/context]`

- Good: "Add retry logic to payment webhook handler"
- Bad: "Fix bug" or "Update service"

## Description

### What and Why

Describe what needs to change and why. Start with enough context for someone unfamiliar with the history, then state what "done" looks like in concrete, testable terms.

Be explicit about constraints: backward compatibility requirements, performance targets, things out of scope. Agents are prone to scope creep — they'll refactor adjacent code or "improve" things you didn't ask for. Fence them in.

- Bad: "The API is slow, fix it."
- Good: "The /calculations endpoint p99 latency exceeds 2s under normal load, causing downstream timeouts in the settlement pipeline. Reduce p99 to below 500ms at 100 rps. Do not change the API schema or refactor CalcEngine — only modify the query layer."

### Suggested Approach (optional)

If you have a preferred or required implementation path, describe it here and explain why. Leave this out if the outcome is what matters. Prescribe when the approach genuinely matters (e.g. "use batch inserts, not individual writes — we hit DB connection limits last time").

### References

Link to related Jira tickets, design docs, ADRs, Slack threads, or relevant source files. Link rather than paste — copied content goes stale. If linking a long document, point to the specific section.

## Principles

1. Be specific over comprehensive. A focused ticket with clear boundaries beats a thorough one with vague goals.
2. One ticket, one change. If writing "and also..." — split it.
3. Include failure context. If this ticket exists because something broke, include error messages, logs, or reproduction steps.
4. Don't restate the title as acceptance criteria. "It should work correctly" tells the agent nothing.
