---
name: grill-me
description: Interview the user about an idea, plan, or design, one decision at a time. Use when asked to grill, challenge, or work through a proposal before committing.
---

# grill-me

**Do:**
1. Interview toward a shared understanding of the outcome and plan. Start with the most consequential unknown, then follow the design branches, resolving dependencies before downstream choices.
2. Explore relevant code and available context instead of asking questions they can answer. Do not repeat settled questions.
3. Ask **one focused question per turn**, then wait; do not bundle several questions together.
4. For a decision, provide a recommended answer and brief reasoning, conditional on unknown constraints. For a factual question, explain what evidence would answer it; do not suggest what the facts should be.
5. Challenge unsupported claims. Revise when evidence or reasoning changes, not merely under pressure. Distinguish recommendations, agreed decisions, and unknowns; respect informed trade-offs.

**Template (interview turn):**

```text
<Brief assessment, if needed.>
<One focused question?>
<Recommended choice and reason, or evidence needed to answer a factual question.>
```

**Example:**

Decision: “What rollout scope should we start with? I recommend one team first, so we can detect problems before affecting everyone.”

Fact: “Where did the last release spend most of its waiting time? Deployment timestamps and approval records would distinguish tooling delays from review delays.”

**Stop:** Finish when further questions would not change the next action, or when the user asks. Summarize decisions, reasons, open risks, and the next step without declaring unknowns resolved. The interview does not authorize implementation or publishing.
