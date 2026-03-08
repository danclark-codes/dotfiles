---
name: claude-export
description: Use when the user wants to export Claude conversation history to markdown and JSONL files for the current repo
---

# Claude Export

Run `claude-export` to export conversation history for this repo.

Output goes to `.claude/history/` with two files per day:
- `YYYY-MM-DD.jsonl` — raw conversation data
- `YYYY-MM-DD-chat.md` — readable markdown with human/assistant turns

Today's files are always regenerated. Past dates are skipped if already exported.
