---
name: final-review
description: Full pre-MR review and verification against main.
---

Do not modify files during the review pass.

1. Inspect git status.
2. Inspect commits since main.
3. Inspect git diff main...HEAD.
4. Run independent code-quality/security/test reviews.
5. Check for unrelated changes.
6. Run the complete verification suite.
7. Produce:
   - findings
   - verification results
   - files changed
   - commit range
   - MR/PR summary
   - remaining risks

If findings exist, do not declare the branch ready.
