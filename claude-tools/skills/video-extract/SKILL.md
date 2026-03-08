---
name: video-extract
description: Use when you have a video recording (mp4) and want to extract a transcript and contextually relevant screenshots. Provide the path to the video file.
---

# Video Extract

Extract transcript and intelligent screenshots from a video recording. All heavy processing happens in a subagent to keep the transcript out of your main context.

## Instructions

Given a video file path from the user, dispatch a single subagent (using the Agent tool) with the following prompt. Do NOT read the transcript yourself — the subagent handles everything and returns a summary.

### Subagent Prompt

```
You are extracting a transcript and contextually relevant screenshots from a video recording.

Video path: <video-path>

## Steps

1. **Extract the transcript:**
   ```bash
   claude-video-transcript "<video-path>"
   ```
   This produces `<name>-transcript.srt` and `<name>-transcript.txt` alongside the video.

2. **Read the full SRT transcript** to understand the content and flow of the conversation.

3. **Identify screenshot timestamps.** Analyze the transcript for moments where a screenshot would add visual context:
   - References to something being shown on screen ("let me show you", "as you can see", "looking at this dashboard")
   - Architecture diagrams or whiteboarding being discussed
   - UI demonstrations or screen sharing
   - Data, charts, or metrics being reviewed
   - Code being shown or discussed
   - Transitions between topics (capture the new visual context)
   - Any moment where participants reference visual content

   Select 10-30 timestamps depending on video length. Bias toward more screenshots — they're cheap and provide valuable context.

4. **Extract screenshots:**
   ```bash
   claude-video-screenshot "<video-path>" <ts1> <ts2> <ts3> ...
   ```

5. **Return a summary** containing:
   - Brief description of what the video is about (2-3 sentences)
   - Duration and approximate number of participants
   - Key topics covered (bulleted list)
   - List of all files created (transcript + screenshots) with full paths
   - For each screenshot: the timestamp and why it was selected
```

### After the subagent returns

Report the subagent's summary to the user. The transcript and screenshot files are now on disk ready for `/video-review` or direct reading.
