# Setup Guide — Windows

## 1. Prerequisites

Verify:

```powershell
git --version
claude --version
```

Install Claude Code using Anthropic's current official instructions:
https://code.claude.com/docs/en/overview

Then run:

```text
claude
/doctor
/help
```

## 2. Install this kit

The ZIP contains:

- `user-home/` — user-level Claude configuration
- `project-template/` — project-level configuration
- `scripts/` — safe Git/checkpoint helpers

Do not blindly overwrite an existing CLAUDE.md/settings.json. Merge them.

## 3. User-level configuration

Copy/merge:

```text
user-home/CLAUDE.md
user-home/settings.json
user-home/agents/
```

into:

```text
~/.claude/
```

Copy the user Skills if you want them globally available.

Then run `/memory` in Claude Code.

## 4. Project-level configuration

Copy into a Git repository:

```text
project-template/CLAUDE.md
project-template/.claude/
project-template/scripts/
project-template/docs/
```

Edit:

```text
.claude/project.config.example.json
scripts/verification.ps1
```

to match your project's real formatter, linter, type checker and test commands.

## 5. Git workflow

Claude feature work should use:

```text
feature/claude/<task>
```

Never work directly on main/master for autonomous feature work.

Create a branch:

```powershell
.\scripts\create-claude-branch.ps1 -Name "authentication"
```

At a meaningful verified milestone:

```powershell
.\scripts\claude-checkpoint.ps1 -Message "feat: implement authentication"
```

The checkpoint script refuses protected branches, runs verification, checks the diff, and commits only after verification passes.

## 6. Final MR/PR

When the feature is complete:

```powershell
git status
git log --oneline main..HEAD
git diff main...HEAD
git push -u origin HEAD
```

Run `/final-review` before creating the MR/PR.

The result should be one large feature branch/MR containing all verified checkpoint commits.

## 7. Caveman

Caveman is optional and should be added after measuring a baseline.

Official repository:
https://github.com/JuliusBrussee/caveman

Recommended rollout:
1. Measure one normal Claude Code session.
2. Install the basic Caveman layer.
3. Repeat a comparable task.
4. Compare actual provider usage.
5. Add memory/tool/input compression only if useful.

Do not blindly compress important memory.

## 8. MCP

Start with no additional MCP servers.

Add integrations one at a time and inspect `/mcp`.

MCP tools consume context, so do not install every available server.

## 9. Obsidian

Use Obsidian for durable cross-project knowledge:

```text
Projects/
Engineering/
Architecture Decisions/
Research/
```

Retrieve relevant notes on demand rather than loading the entire vault.

## 10. Agent Teams

Keep Agent Teams disabled initially. Learn ordinary subagents first. Enable teams only for genuinely parallel, complex work.

## 11. First safe test

Use a disposable repository.

Ask Claude:

```text
Inspect the repository only. Do not modify files.
Explain the structure and propose a plan for a small change.
```

Then:

```text
Implement the approved plan on the feature branch.
Run verification.
Create a checkpoint commit only after verification passes.
```

Finally:

```text
Run the final review workflow without modifying code.
```
