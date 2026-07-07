---
name: obsidian-cli
description: Interact with Obsidian vaults using the Obsidian CLI to read, create, search, and manage notes, tasks, properties, and more. Also supports plugin and theme development with commands to reload plugins, run JavaScript, capture errors, take screenshots, and inspect the DOM. Use when the user asks to interact with their Obsidian vault, manage notes, search vault content, perform vault operations from the command line, or develop and debug Obsidian plugins and themes.
---

# Obsidian CLI

Use the `obsidian` CLI to interact with a running Obsidian instance. Requires Obsidian to be open.

## Command reference

Run `obsidian help` to see all available commands. This is always up to date. Full docs: https://help.obsidian.md/cli

## Syntax

**Parameters** take a value with `=`. Quote values with spaces:

```bash
obsidian create name="My Note" content="Hello world"
```

**Flags** are boolean switches with no value:

```bash
obsidian create name="My Note" silent overwrite
```

For multiline content use `\n` for newline and `\t` for tab.

## Defaults

Unless the user specifies otherwise, always use these defaults:

| Setting | Default |
|---------|---------|
| Vault | `WorkNotes` |
| Location for new notes | `00 • Inbox` |
| Filename (when no good name exists) | Timestamp: `YYYYMMDDHHMMSS` e.g. `20260707143022` |
| Note template | See **Note Template** below |

## Note Template

All new notes should use this template:

```
---
date_created: {YYYY-MM-DD HH:mm}
claude_session_id: {session_id}
---
# {note_title}
___

{content}
```

- `{note_title}` must match the filename (minus the `.md` extension)
- `{session_id}` comes from `$TERM_SESSION_ID` or fallback `$(date +%s)`
- `{YYYY-MM-DD HH:mm}` comes from `$(date +"%Y-%m-%d %H:%M")`

## Vault Targeting

Always specify `vault="WorkNotes"` as the first parameter:

```bash
obsidian vault="WorkNotes" <command>
```

## File Targeting

Many commands accept `file` or `path` to target a file. Without either, the active file is used.

- `file=<name>` — resolves like a wikilink (name only, no path or extension needed)
- `path=<path>` — exact path from vault root, e.g. `00 • Inbox/note.md`

## Common Patterns

### Create a new note in inbox (default)

```bash
NOTE_TITLE="$(date +%Y%m%d%H%M%S)"
NOTE_DATE="$(date +"%Y-%m-%d %H:%M")"
SESSION_ID="${TERM_SESSION_ID:-$(date +%s)}"

obsidian vault="WorkNotes" create \
  path="00 • Inbox/${NOTE_TITLE}.md" \
  content="---\ndate_created: ${NOTE_DATE}\nclaude_session_id: ${SESSION_ID}\n---\n# ${NOTE_TITLE}\n___\n\n{content here}" \
  silent
```

### Create a note with a descriptive name

When a meaningful title can be inferred from the content, use it as the filename:

```bash
NOTE_TITLE="Meeting Notes Q3 Planning"
NOTE_FILENAME="Meeting Notes Q3 Planning"
NOTE_DATE="$(date +"%Y-%m-%d %H:%M")"
SESSION_ID="${TERM_SESSION_ID:-$(date +%s)}"

obsidian vault="WorkNotes" create \
  path="00 • Inbox/${NOTE_FILENAME}.md" \
  content="---\ndate_created: ${NOTE_DATE}\nclaude_session_id: ${SESSION_ID}\n---\n# ${NOTE_TITLE}\n___\n\n{content here}" \
  silent
```

### Append to an existing note

```bash
obsidian vault="WorkNotes" append file="My Note" content="\n## New Section\n- Item"
```

### Read a note

```bash
obsidian vault="WorkNotes" read file="My Note"
```

### Search vault

```bash
obsidian vault="WorkNotes" search query="search term" limit=10
```

### Daily notes

```bash
# Read today's daily note
obsidian vault="WorkNotes" daily:read

# Append to today's daily note
obsidian vault="WorkNotes" daily:append content="- [ ] New task"
```

### Properties & Metadata

```bash
obsidian vault="WorkNotes" property:set name="status" value="done" file="My Note"
obsidian vault="WorkNotes" property:list file="My Note"
```

### Tags & Backlinks

```bash
obsidian vault="WorkNotes" tags sort=count counts
obsidian vault="WorkNotes" backlinks file="My Note"
```

### Tasks

```bash
obsidian vault="WorkNotes" tasks daily todo
obsidian vault="WorkNotes" tasks daily done
```

## Flags

- `silent` — prevent file from opening in Obsidian
- `overwrite` — overwrite existing file
- `--copy` — copy output to clipboard

## Plugin Development

### Develop/test cycle

```bash
# Reload plugin after code changes
obsidian plugin:reload id=my-plugin

# Check for errors
obsidian dev:errors

# Verify visually
obsidian dev:screenshot path=screenshot.png
obsidian dev:dom selector=".workspace-leaf" text

# Check console
obsidian dev:console level=error
```

### Additional developer commands

```bash
# Run JavaScript in app context
obsidian eval code="app.vault.getFiles().length"

# Inspect CSS
obsidian dev:css selector=".workspace-leaf" prop=background-color

# Toggle mobile emulation
obsidian dev:mobile on
```

## Multi-line Content

Use `\n` for newlines and `\t` for tabs in `content=` values:

```bash
obsidian vault="WorkNotes" create name="Note" content="# Title\n\nParagraph 1\n\nParagraph 2" silent
```
