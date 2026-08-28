# Claude Code Ultimate — Token-Efficient Engineering Setup

A starter framework for Claude Code focused on:
- token/context efficiency
- safe persistent memory
- plan → implement → verify → checkpoint → review
- specialist subagents
- Caveman integration as an optional optimisation layer
- Obsidian as targeted long-term knowledge
- Git feature branches with verified checkpoint commits
- one final MR/PR into main

Start with SETUP.md.

Design principles:
1. Protect main.
2. Use a dedicated feature branch for autonomous work.
3. Make verified checkpoint commits at meaningful milestones.
4. Never claim verification without actually running it.
5. Keep CLAUDE.md small.
6. Put procedures in Skills.
7. Prefer short-lived specialist subagents.
8. Keep MCP servers minimal.
9. Keep temporary session state out of permanent memory.
10. Measure token usage before adding optimisation layers.
