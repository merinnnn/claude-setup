---
name: checkpoint
description: Create a verified Git checkpoint on a Claude feature branch.
---

Before committing:
1. git status
2. confirm branch is not main/master
3. inspect git diff
4. run project verification
5. if verification fails, do not commit
6. stage intended changes
7. inspect staged diff
8. commit semantically
9. report commit hash and verification result

Never force-push.
Never include secrets or unrelated changes.
