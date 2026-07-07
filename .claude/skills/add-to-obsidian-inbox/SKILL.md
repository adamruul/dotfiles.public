---
name: add-to-obsidian-inbox
description: Save Claude's most recent response or current conversation context as a new note in the Obsidian WorkNotes inbox. Use when the user says "add to obsidian inbox", "save to inbox", "add this to my inbox", "capture this", or "/add-to-obsidian-inbox".
---

# Add to Obsidian Inbox

Save content as a new note in `~/Obsidian/WorkNotes/00 • Inbox/`.

## Workflow

1. **Determine note title** - Infer a short, descriptive title from the content. Use the user's title if provided.
2. **Gather metadata** - Get current time and session ID via bash.
3. **Write the note** directly to the vault inbox using the `Write` tool.
4. **Confirm** to the user with the note title and full path.

## Note Template

```
---
date_created: {YYYY-MM-DD HH:mm}
claude_session_id: {session_id}
---
# {note_title}
___

{content}
```

## Implementation

### Get metadata

```bash
date +"%Y-%m-%d %H:%M"
echo "${TERM_SESSION_ID:-${CLAUDE_SESSION_ID:-$(date +%s)}}"
```

### Write the file

Use the `Write` tool with:

- **Path**: `~/Obsidian/WorkNotes/00 • Inbox/{sanitized_title}.md`
- **Filename sanitization**: Replace `/`, `:`, `?`, `*`, `\`, `|`, `<`, `>` with `-`

The full file content should be:

```
---
date_created: 2026-06-18 18:05
claude_session_id: w0t7p0:E6E8769D-CCE6-4C2E-B79F-EBEDB5AA8890
---
# Note Title
___

{content here}
```

## Content

Unless the user specifies otherwise, the content is Claude's most recent response in the conversation — the full text, preserving markdown formatting.
