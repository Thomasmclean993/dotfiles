---
name: security-review-precommit
description: Security review of pending changes. Trigger automatically before running any git commit, especially when the diff touches auth, secrets, input handling, deserialization, permissions, or dependencies. Do not wait for the user to ask — run this check first, then proceed with the commit.
---

# Security Review (pre-commit)

Before committing, review the staged/pending diff for security issues.

1. Check for security issues first: injection, auth bypass, secrets in code, unsafe deserialization, insecure defaults, path traversal, SSRF.
2. Check newly added or updated dependencies for known-risk patterns (unpinned versions, unmaintained packages).
3. Every finding must include file:line and a one-sentence explanation of the risk.
4. Rank findings: Critical / High / Medium / Low.

Report only real issues — do not flag style preferences or speculative problems.

If Critical or High findings are found, stop and surface them to the user before committing. Do not commit until they are acknowledged or fixed. Low/Medium findings can be reported alongside the commit.
