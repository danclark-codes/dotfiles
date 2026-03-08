---
name: pptx-extract
description: Use when you have a PowerPoint file (.pptx) and want to extract text, speaker notes, and rendered slide images. Provide the path to the pptx file.
---

# PowerPoint Extract

Extract text, speaker notes, and rendered slide images from a PowerPoint file. All processing happens in a subagent to keep the content out of your main context.

## Instructions

Given a pptx file path from the user, dispatch a single subagent (using the Agent tool) with the following prompt. Do NOT read the extracted content yourself — the subagent handles everything and returns a summary.

### Subagent Prompt

````
You are extracting content from a PowerPoint presentation.

Pptx path: <pptx-path>

## Steps

1. **Extract the content:**
   ```bash
   claude-pptx-extract "<pptx-path>"
   ```
   This produces `<name>-content.md` and `<name>-slide-NN.png` files alongside the pptx.

2. **Read the generated `<name>-content.md`** to understand what was extracted.

3. **Return a summary** containing:
   - Presentation title
   - Total number of slides
   - Key topics covered (bulleted list)
   - Which slides have speaker notes
   - List of all files created with full paths
````

### After the subagent returns

Report the subagent's summary to the user. The content and slide images are now on disk ready for `/pptx-review` or direct reading.
