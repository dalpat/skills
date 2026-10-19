#!/usr/bin/env bash
# orient-first as a guaranteed SessionStart hook (Claude Code).
#
# Skills are model-invoked — they fire only when the agent matches their
# `description`. This hook removes that uncertainty for orient-first: it injects
# the orientation directive into every new session as context, so the behavior
# runs unconditionally, even on a degraded or distracted agent.
#
# Wire it up in .claude/settings.json:
#
#   {
#     "hooks": {
#       "SessionStart": [
#         { "hooks": [ { "type": "command",
#             "command": "$CLAUDE_PROJECT_DIR/hooks/orient-first-session-start.sh" } ] }
#       ]
#     }
#   }
#
# SessionStart hooks add their stdout to the session as context. We print the
# shared directive verbatim so the agent orients before touching code.

cat "$(dirname "$0")/orient-first.directive.md"
