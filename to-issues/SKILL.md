---
name: to-issues
description: Break a PRD into independently-grabbable GitHub issues using tracer-bullet vertical slices. Use when the user has a PRD or plan and wants implementation tickets that multiple agents can work in parallel.
---

# to-issues

**Do:**
1. Fetch the PRD: `gh issue view <n>`.
2. Break it into thin **vertical** slices — each cuts through ALL layers and is independently testable end-to-end.
3. For each slice, list every file it touches (existing + new + tests).
4. Map overlap: slices that share **zero** files can run in parallel; slices sharing a file must serialize.
5. Create issues in dependency order (blockers first), one per slice, using the template:
   `gh issue create --title "<slice>" --body-file <path>`

**Template (per issue):**

```
## What to build
<the vertical slice, one sentence>

## Acceptance criteria
- [ ] <observable, testable outcome>

## Files
- <path> (new|edit) — <why>

## Blocked by
#<issue> | none

## Parallel-safe
yes (no file overlap) | no (shares <file> with #<issue>)
```

**Example slice:** "Persist the user's theme choice" → Files: `themeStorage.ts` (new), `themeStorage.test.ts` (new) · Blocked by: none · Parallel-safe: yes.

**Stop:** No horizontal slices (a single layer only). Every slice must ship something testable end-to-end on its own.
