# Good Agent Spec Anatomy

## Required Elements

### Goal

One sentence. Starts with a verb. States the _outcome_, not the method.

Bad: "There's a bug in the auth flow"
Good: "Fix the login redirect loop that occurs when a user with an expired session visits /dashboard"

### Context

What the agent needs to locate and understand the work:

- Relevant file paths or modules
- Language / framework / runtime
- Related components, services, or APIs
- Any recent changes that caused or relate to the issue

### Requirements

Numbered list. Each item is atomic, specific, and verifiable.

Bad: "Make the tests pass"
Good:

1. All existing unit tests in `auth/tests/` must pass
2. Add a test for the redirect loop scenario described above
3. Do not modify the session middleware interface

### Constraints (anti-goals)

What the agent must NOT do. Prevents scope creep and unintended changes.

Examples:

- Do not change the public API
- Do not add new dependencies
- Only modify files in `src/auth/`
- Preserve backwards compatibility with v1 clients

### Success Criteria

How the agent (and reviewer) knows the work is done and correct:

- Test commands to run
- Specific behavior to verify
- Metrics or output to check

---

## Common Gaps in Rough Specs

| Symptom               | What's missing                                 | Ask about                                                           |
| --------------------- | ---------------------------------------------- | ------------------------------------------------------------------- |
| "fix the bug"         | Which bug? Which file?                         | Exact error, file path, reproduction steps                          |
| "improve performance" | Baseline? Target? Where?                       | Current metric, target metric, which endpoint/function              |
| "add feature X"       | Where does it live? What's the interface?      | File/module, inputs/outputs, existing similar feature for reference |
| "make tests pass"     | Which tests? Why are they failing?             | Test file path, error output                                        |
| "refactor this"       | What's wrong with it? What's the target state? | The problem, the desired pattern                                    |
| Vague scope           | What's in/out?                                 | Explicit list of files or modules that are in scope                 |

---

## Precision Language

Replace vague verbs with precise ones:

| Vague        | Precise                                            |
| ------------ | -------------------------------------------------- |
| fix          | resolve, remove, correct                           |
| improve      | reduce latency by X%, increase test coverage to Y% |
| update       | rename, extract, move, replace                     |
| handle       | catch and log, return an error, fallback to        |
| make it work | ensure X returns Y given Z input                   |

---

## Output Format

Structure the spec as:

```
## Goal
[One sentence]

## Context
[Bulleted list of relevant files, tech, background]

## Requirements
1. [Specific, verifiable requirement]
2. ...

## Constraints
- [What not to do]

## Success Criteria
- [How to verify completion]
```

Omit any section that is genuinely not applicable (e.g. a greenfield task may have no constraints).
For simple, small tasks, collapse Requirements + Success Criteria into a single "What to do" section if the task is self-contained and unambiguous.
