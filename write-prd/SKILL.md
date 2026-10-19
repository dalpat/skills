---
name: write-prd
description: Create a PRD through user interview, codebase exploration, and module design, then submit as a GitHub issue. Use when the user wants to plan a new feature or solve a complex problem before any code is written.
---

# write-prd

**Do:**
1. Ask for the problem and any candidate solutions. Explore the codebase to verify every claim before trusting it.
2. Interview **one decision at a time** — resolve every open design question before writing a word of the PRD.
3. Sketch deep modules: simple interfaces hiding complex implementation. Minimize shared files so the work can later be sliced for parallel implementation.
4. Write the PRD using the template below.
5. Submit it: `gh issue create --title "PRD: <feature>" --body-file <path> --label prd`

**Template:**

```
## Problem
<what hurts today, and who feels it>

## User Stories
- As a <user>, I want <goal> so that <benefit>

## Developer Stories
- As a developer, I need <capability> so that <reason>

## Implementation Decisions
<each resolved design question: the choice made and the alternatives rejected>

## Testing
<what observable behavior proves this works>

## Out of Scope
<what is explicitly excluded from this PRD>
```

**Stop:** No file paths or code snippets in the PRD — they go stale the moment code moves. Do not write the PRD until **every** open decision from the interview is resolved.
