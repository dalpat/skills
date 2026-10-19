# Skills

> Repo: `skills` · install slug: `dalpat/skills`.

A collection of **micro-skills** for AI agents, grounded in timeless software engineering principles. Each skill is a tiny, composable behavioral trigger — not a lecture.

## Why Micro-Skills?

Modern LLMs are trained on the classics: *The Pragmatic Programmer*, *Clean Code*, *Refactoring*, *Design Patterns*, *The Mythical Man-Month*. They already know these concepts. What they need is **activation** — a precise keyword hook that triggers the right behavior at the right moment.

Each skill separates selection metadata from execution instructions:

```
Frontmatter: name + description (what the skill does and when to use it)
Body:
1. DO (the exact behavior)
2. STOP (the boundary)
```

Do not add `Type`, `Keywords`, or `When` sections to the body. Skill types remain catalog labels; selection guidance belongs in the frontmatter description.

**Target: 50-150 words** — *for 🪄 Incantations.* 🔧 Procedures add a reproducible **Template** and a short **Example**, and may run longer; see [Two kinds of skill](#two-kinds-of-skill-🪄-incantation-vs-🔧-procedure) below. Terseness is a virtue when activating latent knowledge, and a liability when specifying an invented workflow.

## Principles

- **Opt-in, not opt-out** — Only pay the context cost for skills you need in a session.
- **Composable** — Chain skills like Unix pipes: `orient-first | tracer-bullet | guard-hallucination`
- **Testable** — Each skill is small enough to validate independently.
- **Language/Stack Agnostic** — A `fail-fast` skill works for Python, React, or infrastructure.
- **Guardrails at known failure points** — Each skill targets a predictable failure mode in the SDLC (premature solving, XY problems, scope creep) and nudges the agent back on track when it triggers.

> **How skills fire (important):** A skill activates when the agent *matches its `description`* to the situation — it is model-invoked, not a guaranteed interrupt. If you need a behavior to run unconditionally (e.g. force `orient-first` at the start of every session), wire it as a **`SessionStart` hook**, not a skill. Skills are guardrails, not circuit breakers — they depend on the agent being healthy enough to route to them.

## Two kinds of skill: 🪄 Incantation vs 🔧 Procedure

An early experiment (see the [historical approach review](./docs/approach.html)) explored the distinction between invoking an established concept and specifying a workflow. That review covers earlier versions, including skills since removed from the catalog.

- **🪄 Incantation** — a short instruction invokes an established concept, such as "XY Problem", "Tracer Bullet", or "Fail Fast". Keep it brief when that concept supplies enough guidance for the task.
- **🔧 Procedure** — the "keyword" is a name *you invented* ("Session Charter", a 5-item output format, an interview sequence). The model never learned it, so no keyword activates it. The micro-format *backfires*: terse = under-specified = inconsistent. Procedures must be spelled out (a real template, an example) — or made deterministic via a hook/script.

**Litmus test for any new skill:** *Is the keyword a concept the model learned, or a name I made up?* If made up, it's a Procedure — don't pretend a keyword activates it.

## Roadmap

Skills are organized by project phase. Status: ✅ Available | 🚧 Planned · Type: 🪄 Incantation | 🔧 Procedure

### Phase 0: Problem Clarification
| Skill | Status | Type | Trigger |
|-------|--------|------|---------|
| `orient-first` | ✅ | 🔧 | Force orientation before any work begins (floor is latent; charter is invented → [enforce via hook](./hooks)) |
| `ambiguity-detector` | 🚧 | 🪄 | "Where are you guessing instead of knowing?" |

### Phase 1: Ideation / Design
| Skill | Status | Type | Trigger |
|-------|--------|------|---------|
| [`grill-me`](./grill-me/SKILL.md) | ✅ | 🔧 | Stress-test the plan, one question at a time |
| `enforce-contract` | 🚧 | 🪄 | Define pre/post-conditions for the solution (Design by Contract) |
| `simplify-enforcer` | 🚧 | 🪄 | "Is there a simpler way?" (KISS / YAGNI) |

### Phase 2: Planning / Breakdown
| Skill | Status | Type | Trigger |
|-------|--------|------|---------|
| `slice-session` | 🚧 | | Force a single bounded task per session |
| `tracer-bullet` | 🚧 | 🪄 | "Build the thinnest end-to-end path first" |

### Phase 3: Implementation
| Skill | Status | Type | Trigger |
|-------|--------|------|---------|
| `tdd` | 🚧 | 🔧 | Red-green-refactor with vertical slices (the loop must be enforced) |
| `guard-hallucination` | 🚧 | 🔧 | Verify APIs/paths/facts before using them |
| `chunk-summarize` | 🚧 | 🔧 | When context grows, checkpoint and summarize |

### Phase 4: Review / Verification
| Skill | Status | Type | Trigger |
|-------|--------|------|---------|
| `verify-output` | 🚧 | 🪄 | "Does this actually solve the stated problem?" |
| `guard-regression` | 🚧 | 🔧 | Re-run tests, diff output, catch non-determinism |
| `review-assumptions` | 🚧 | 🪄 | "What did you assume? Are those assumptions true?" |

### Phase 5: Handoff / State Preservation
| Skill | Status | Type | Trigger |
|-------|--------|------|---------|
| [`project-understanding`](./project-understanding/SKILL.md) | ✅ | 🔧 | Understand a project, module, or feature; get a visual HTML guide or requested deliverables |
| `hydrate-context` | 🚧 | 🔧 | Load canonical state at session start |
| `snapshot-state` | 🚧 | 🔧 | Persist session state to canonical source |
| `update-adr` | 🚧 | 🔧 | Log irreversible decisions |
| `update-context` | 🚧 | 🔧 | Sharpen glossary, capture resolved terms |

### Phase 6: Completion or Dead End
| Skill | Status | Type | Trigger |
|-------|--------|------|---------|
| `ship-it` | 🚧 | 🔧 | Acceptance criteria met? Merge. |
| `pivot-or-perish` | 🚧 | 🪄 | "Is this still worth pursuing?" |
| `archive-decision` | 🚧 | 🔧 | Log why this was abandoned |

## Installation

Install individual skills using the [Skills CLI](https://skills.sh/). Only ✅ Available skills can be installed:

```bash
npx skills add dalpat/skills --skill orient-first
npx skills add dalpat/skills --skill grill-me
npx skills add dalpat/skills --skill project-understanding
```

Or install globally:

```bash
npx skills add dalpat/skills --skill orient-first -g -y
```

> Skills are plain `SKILL.md` files (frontmatter `name` + `description`, then the body). They also work with any agent that reads the SKILL.md format — e.g. drop a skill folder into `~/.config/opencode/skills/` for [opencode](https://opencode.ai), or `.claude/skills/` for Claude Code.

## Forcing a skill to always run (hooks)

A skill is *model-invoked* — it fires only when the agent matches its `description`. In practice that means subtle triggers can be missed entirely (e.g. an agent may answer an XY question directly instead of pausing). When a behavior must run **unconditionally**, inject it at session start instead of relying on activation.

`orient-first` ships with a ready-made example in [`hooks/`](./hooks):

**Claude Code** — wire the script as a `SessionStart` hook in `.claude/settings.json`:

```json
{
  "hooks": {
    "SessionStart": [
      { "hooks": [ { "type": "command",
          "command": "$CLAUDE_PROJECT_DIR/hooks/orient-first-session-start.sh" } ] }
    ]
  }
}
```

**opencode** — point the global `instructions` array at the directive in `~/.config/opencode/opencode.json`:

```json
{ "instructions": ["~/path/to/skills/hooks/orient-first.directive.md"] }
```

Both inject the orientation directive into every new session, so the behavior runs even on a degraded or distracted agent. Use this pattern for any skill where a missed trigger is unacceptable.

## Contributing

First, apply the **litmus test**: *is the keyword a concept the model learned, or a name you made up?* That decides the format.

**🪄 Incantation** (keyword = a learned concept, e.g. "Tracer Bullet", "Fail Fast"):

Use frontmatter `name` and `description` to identify the skill and explain when it applies. In the body, include:

1. **DO** — the precise behavior to execute
2. **STOP** — the hard boundary (what NOT to do)

Keep it under 150 words. Don't explain background concepts the model already knows or repeat selection guidance in the body.

**🔧 Procedure** (an invented workflow or output format, e.g. `orient-first`, `grill-me`):

Same body structure, plus:

3. **TEMPLATE** — the exact output format, reproducible verbatim
4. **EXAMPLE** — one short worked example

Spell the procedure out fully — terseness here causes inconsistent execution. If the behavior must run every time, pair it with a [hook](#forcing-a-skill-to-always-run-hooks). Before merging, prove it beats the bare model on its trigger (see [`docs/approach.html`](./docs/approach.html) for the eval method).

## License

MIT
