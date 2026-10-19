---
name: orient-first
description: Force orientation before any work begins. Activates at the start of any agent session to prevent premature "helping." Use when the user opens a new session, shares a vague idea, reports a bug, or asks to work on existing code.
---

# orient-first

**Do:** Produce a Session Charter in *exactly* this format before any other action:

```
## Session Charter
**Mode:** ideation | feature | bug | comprehension | modification
**Known:** <facts, constraints, existing code>
**Unknown:** <assumptions, missing context, risks>
**Goal (one):** <the single bounded outcome for this session>
**Out of scope:** <what you will NOT touch>
```

**Example (bug mode):**

```
## Session Charter
**Mode:** bug
**Known:** Login returns 500; stack trace points at auth.ts; reproduces on staging
**Unknown:** Token expiry vs DB timeout; no server logs captured yet
**Goal (one):** Identify the root cause of the 500 (the fix is a separate session)
**Out of scope:** Refactoring auth, any frontend change
```

**Stop:** Do not read or explore beyond what the charter needs. If the request is a single vague sentence, ask clarifying questions *before* filling the charter — never guess to populate it.
