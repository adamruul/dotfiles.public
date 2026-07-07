---
name: write-agent-spec
description: >
  Transform rough, vague, or messy instructions into a clear, precise spec ready to paste into an AI coding agent.
  Use when the user wants to write or improve a prompt/spec/instruction for an AI agent, or when they have a rough
  idea they want turned into an agent task. Triggered by: "write-agent-spec", "help me write a spec", "improve this prompt",
  "turn this into an agent task", "write instructions for an agent", or when the user pastes rough notes and wants them
  refined into a proper agent spec.
---

# write-agent-spec

Read `references/good-spec-anatomy.md` before proceeding.

## Process

1. Read the user's rough input carefully. Identify the core intent.
2. Check for critical gaps using the "Common Gaps" table in the reference.
3. If the goal itself is unclear OR critical context is missing that can't be reasonably inferred, ask up to 3 targeted questions. Otherwise skip to step 4.
4. Produce the refined spec using the output format in the reference.

## Rules

- Output ONLY the refined spec. No preamble, no explanation, no "Here is your spec:".
- Do not invent specifics the user didn't provide — infer where safe, flag as `[TODO: ...]` where not.
- Do not contradict the user's original intent. Elaborate and clarify, never redirect.
- Use precise, imperative language. Replace vague verbs per the Precision Language table.
- Omit sections that genuinely don't apply. For small self-contained tasks, collapse where sensible.
- Keep it concise. A good spec is complete, not exhaustive.
