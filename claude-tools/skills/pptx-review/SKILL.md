---
name: pptx-review
description: Use when you have an extracted PowerPoint presentation (content markdown and slide images) and want to generate a comprehensive review document. Provide the path to the pptx file or folder containing extracted files.
---

# PowerPoint Review

Generate a comprehensive, exhaustive review document from extracted PowerPoint content and slide images.

## Instructions

Given a pptx file path or folder path from the user, dispatch a single subagent (using the Agent tool) with the following prompt. Do NOT read the extracted content yourself — the subagent handles everything and returns the output file path.

### Subagent Prompt

````
You are generating a comprehensive review document from an extracted PowerPoint presentation.

Pptx path: <pptx-path>

## Steps

1. **Locate the extracted files.** Look for:
   - `<name>-content.md` — extracted text and speaker notes
   - `<name>-slide-*.png` — rendered slide images

   If `<name>-content.md` does not exist, respond with: "No extracted content found. Run `/pptx-extract` first."

2. **Read the full `<name>-content.md`** to understand all slide text, structure, and speaker notes.

3. **View all slide images** — open every `<name>-slide-*.png` file. Note what's visible in each: diagrams, charts, tables, code, screenshots, layouts, branding, visual hierarchy, etc.

4. **Write `<name>-review.md`** in the same directory as the pptx file. This document must be **exhaustive and comprehensive** — its purpose is to fully capture the content of the presentation so someone who hasn't seen it can understand everything, including visual details that only appear in the slide images.

   ### Document Structure

   ```markdown
   # <Presentation Name> — Review

   ## Summary
   What this presentation is about, its intended audience, and its purpose. One to two paragraphs orienting the reader.

   ## Slide-by-Slide Walkthrough
   Thorough walkthrough of every slide. For each slide:
   - **Slide N: <Title>**
   - Full capture of all text content, bullet points, and speaker notes
   - Description of visual layout, images, and design elements
   - Inline image reference: ![Slide N](./name-slide-NN.png)

   ## Key Themes & Arguments
   The narrative arc of the presentation. What story is being told? What are the main points and how do they build on each other? What is the presenter trying to convince the audience of?

   ## Technical Details
   All specific technologies, tools, configurations, architecture, numbers, metrics, data points, and technical specifics mentioned. Include exact values, version numbers, URLs, configuration details.

   ## Diagrams & Visuals
   Detailed descriptions of what charts, diagrams, flowcharts, architecture diagrams, and other visuals convey. Describe axes, labels, trends, relationships, and key takeaways from each visual. An LLM reviewing this document later will not be able to see the images — your descriptions must stand alone.

   ## Gaps & Ambiguities
   Things left unclear, missing context, assumptions made without justification, questions the presentation raises but doesn't answer, areas where a reader might need additional information.
   ```

   ### Writing Guidelines
   - **Completeness over brevity.** Capture everything. A 30-slide deck should produce a substantial document.
   - **Preserve nuance.** If a slide uses hedging language ("potential", "proposed", "estimated"), keep that. Don't upgrade tentative statements to definitive ones.
   - **Reference slide images** at relevant points using relative image links: `![Slide N](./name-slide-NN.png)`
   - **Don't invent information.** If something is unclear from the content or images, say so rather than guessing.
   - **Describe visuals thoroughly.** An LLM reviewing this document later won't see the images. Your descriptions of charts, diagrams, and visual elements must fully convey what they show.

5. **Return the output file path** when complete.
````

### After the subagent returns

Report the output file path to the user. The review document is now on disk for reference.
