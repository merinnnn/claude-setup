# Personal Claude Code rules

## Communication
- Be concise.
- Prefer short factual status updates.
- Do not dump large logs/files when targeted evidence is sufficient.

## Engineering
- Inspect before editing.
- For substantial tasks, plan before implementation.
- Do not modify unrelated files.
- Never claim a check passed unless it actually ran.
- Follow existing project conventions.
- Avoid dependencies without justification.

## Context/token discipline
- Keep this file small.
- Put detailed procedures in Skills.
- Delegate large investigations to subagents.
- Return concise findings from subagents.
- Retrieve targeted files/notes instead of whole repositories/vaults.
- Prefer deterministic verification tools over prose reasoning.

## Git safety
- Never do autonomous feature work directly on main/master.
- Use a dedicated feature branch.
- Create verified checkpoint commits at meaningful milestones.
- Inspect status/diff before committing.
- Never force-push or rewrite shared history without explicit approval.
- Never commit secrets or unrelated changes.

## Memory
- CLAUDE.md = durable instructions.
- Auto-memory = stable learned facts.
- Skills = procedures.
- Obsidian = durable cross-project knowledge.
- Keep temporary task state out of permanent memory.
