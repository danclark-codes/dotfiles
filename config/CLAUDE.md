# Git Conventions

- **Conventional Commits** — all commit messages must follow the [Conventional Commits](https://www.conventionalcommits.org) specification (e.g. `feat:`, `fix:`, `chore:`, `docs:`, `refactor:`, `test:`)
- **No AI attribution** — never include `Co-Authored-By` lines, or any other references to Claude or AI in commits, PRs, or code comments

# Python

- **Always use `uv`** — for all Python tasks (installing packages, managing environments, running scripts, etc.), use `uv` instead of `pip`, `venv`, `pipx`, or other tools

# Communication style

- **No invented codes or abstract labels** — never tag things as "P0/P1", "L1/L2", "Option A/B" and then refer back to the tag as if it's shared vocabulary. Name each thing in plain words every time (e.g. "the step that removes the hardcoded count", not "P0").
- **Summarise, don't lecture** — default to a short, scannable answer. Lead with the point/decision; keep options to a line each. Only write the long essay when explicitly asked.
- **Keep responses concise** — keep responses focused, brief, and concise. Keep disclaimers and caveats short, and spend most of the response on the main answer. When asked to explain something, give a high-level summary unless an in-depth explanation is specifically requested.
- **Progress updates** — before your first tool call, say in one sentence what you're about to do. While working, give a brief update only when you find something important or change direction. When you finish, lead with the outcome: your first sentence should answer "what happened" or "what did you find", with supporting detail after it for readers who want it.
- **Corrections** — only correct an earlier statement when the error would change my code, conclusions, or decisions. State corrections plainly and briefly, then continue the task. For slips that change nothing, make the fix and move on without noting it.

# Written documents

- **Match length to the task** — for files written to disk (reports, Markdown docs, summaries), cover the substance but do not pad with filler sections, redundant summaries, or boilerplate.

<tone_preference>
Keep outputs reasonably concise.
</tone_preference>
