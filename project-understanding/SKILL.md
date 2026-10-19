---
name: project-understanding
description: Explain a project, module, or feature through its purpose, user journeys, and code, with a visual HTML guide by default. Use for project understanding or scoped onboarding; honor requested output formats.
---

# project-understanding

## Do

1. Identify the requested scope and outputs. Default to the current project only when no narrower scope is named. For a module or feature, follow dependencies only far enough to explain its inputs, outputs, and interactions; summarize those boundaries without documenting unrelated modules.
2. Read the relevant entry points, behavior, permissions, configuration, and tests. Use docs for business context. Verify behavior against code; distinguish documented intent, implemented behavior, and uncertainty. Do not invent missing screens, roles, or workflows.
3. Explain the purpose and trace each relevant user's journey, including consequential branches, failures, and background work. For libraries or internal modules, trace callers and data instead of inventing human roles. Default to plain-language behavior; put implementation details in supporting notes unless developer depth is requested. Include source references for key claims.
4. Deliver a visual HTML guide by default, saved as `docs/<scope>-guide.html`. Add explicitly requested deliverables. If the user requests a replacement format or only certain outputs, honor that instead. Use requested destinations and preserve unrelated existing files.
5. Check that every requested output exists, covers the agreed scope, and agrees with the code and other outputs. Check links and diagram labels. For HTML, inspect the rendered page at desktop and narrow widths when a browser is available; fix readability and overflow issues. State any verification you could not perform.

## Visual and writing direction

Make a useful field guide someone on the team would write. Use short, natural English, concrete examples, and headings named after the subject. Explain why it exists before how it works.

Use a light, readable document layout with restrained typography and color. Let the content determine the layout: a flow for a sequence, a table for permissions, a small diagram for relationships. Prefer one continuous reading path with optional anchor links. Put supporting detail after the main explanation.

Avoid the generic landing-page treatment: oversized hero slogans, invented branding, decorative illustrations, badge rows, and repeated rounded-card grids. Do not turn every paragraph into a card or repeat the same facts in several visual forms. Visuals should explain something, not fill space. Keep HTML self-contained unless the project already provides an appropriate documentation setup.

## Template

Use this content outline, adapting headings and omitting items that do not apply:

```text
<Project, module, or feature name>
Purpose and scope — what it does, for whom, and where this guide stops
Main journey — a concrete example and a useful diagram
Branches and boundaries — permissions, failures, background work, dependencies
Where to look — key source references and unresolved questions
```

## Example

Request: “Explain billing. Add a Mermaid payment flow and a permissions matrix.”

Deliver the billing HTML guide, Mermaid source, and matrix. Explain authentication only where it supplies billing's identity or permissions. If the request instead says “Markdown only,” deliver Markdown without HTML.

**Stop:** Stay within the requested scope and deliverables. Document behavior; do not refactor the application or silently expand into a whole-project audit. Mark unsupported conclusions as unknown.
