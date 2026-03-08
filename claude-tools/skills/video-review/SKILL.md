---
name: video-review
description: Use when you have an extracted video transcript (and optionally screenshots) and want to generate a comprehensive review document capturing all detail and nuance from the recording. Provide the path to the video file or folder containing transcript files.
---

# Video Review

Generate a comprehensive, exhaustive context document from a video transcript and screenshots.

## Instructions

Given a video file path or folder path from the user:

1. **Locate the transcript and screenshots.** Look for:
   - `<name>-transcript.srt` — timestamped transcript
   - `<name>-transcript.txt` — plain text transcript
   - `<name>-ss-*.jpg` — screenshots

   If the transcript doesn't exist yet, tell the user to run `/video-extract` first.

2. **Read the full SRT transcript** for timestamps and the full TXT transcript for readable content.

3. **Read all screenshots** — view every `<name>-ss-*.jpg` file. Note what's visible in each: dashboards, diagrams, code, UI, slides, whiteboard, participants, etc.

4. **Write `<name>-review.md`** in the same directory as the video. This document must be **exhaustive and comprehensive** — its purpose is to fully capture the content of the recording so someone who wasn't present can understand everything discussed, including nuance, hedging, disagreements, and context.

   ### Document Structure

   ```markdown
   # <Video/Meeting Name> — Review

   ## Summary
   One paragraph orienting the reader: what this recording is, who was involved, the overall purpose.

   ## Participants
   List participants if identifiable from the transcript or screenshots.

   ## Detailed Timeline
   Chronological walkthrough of the entire recording. For each major topic or segment:
   - Timestamp range (e.g., **[00:05:30 - 00:12:45]**)
   - What was discussed in full detail — not bullet summaries but thorough capture
   - Who said what (if distinguishable)
   - Specific numbers, names, configurations, examples mentioned
   - Reactions, caveats, hedging, disagreements
   - Reference screenshots inline: ![Description](./name-ss-00:05:30.jpg)

   ## Technical Details
   All specific technologies, tools, configurations, architecture, numbers, metrics, and technical specifics mentioned. Include exact values, version numbers, configuration details.

   ## Decisions Made
   What was agreed upon, with the reasoning behind each decision. Note who drove or approved each decision.

   ## Ambiguous Points & Items to Clarify
   Things left unresolved, contradictions, unclear statements, items where participants hedged or expressed uncertainty. Flag anything a reader might need to follow up on.

   ## Follow-up Actions
   Specific commitments made: who will do what, by when (if stated). Include soft commitments and suggestions that weren't firmly committed to.
   ```

   ### Writing Guidelines
   - **Completeness over brevity.** Capture everything. A 1-hour call should produce a substantial document.
   - **Preserve nuance.** If someone said "maybe" or "I think" or "we should probably", keep that hedging. Don't upgrade uncertain statements to definitive ones.
   - **Quote directly** when the exact wording matters (technical terms, commitments, disagreements).
   - **Reference screenshots** at the relevant points in the timeline using relative image links.
   - **Don't invent information.** If something is unclear in the transcript, say so rather than guessing.
   - **Capture the implicit.** Note tone shifts, topic changes, things that were conspicuously NOT discussed, questions that went unanswered.

5. **Report the output file path** when complete.
