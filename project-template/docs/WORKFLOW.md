# Claude development workflow

PLAN → IMPLEMENT → VERIFY → CHECKPOINT → REVIEW → FIX → VERIFY → CHECKPOINT → FINAL REVIEW → MR/PR

## Plan
Use `/plan` before substantial work.

## Checkpoint
After each coherent, verified milestone, use `/checkpoint`.

## Review
Use independent reviewers. Reviewers should be read-only.

## Recovery

```powershell
git log --oneline --decorate -20
git status
git diff
```

Restore from the last verified checkpoint if necessary.

The recovery mechanism is Git, not Claude's memory.
