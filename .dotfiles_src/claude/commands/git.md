Read the current git diff (staged and unstaged). Then:

1. Draft a conventional commit message in the format: `<type>(<scope>): <description>`
   - Types: feat, fix, refactor, test, docs, chore, ci, perf
   - Scope: the module, file, or area affected
   - Description: imperative mood, lowercase, no period
2. Show me the full commit message and wait for my approval before running any git commands.
3. Once approved, stage relevant files and commit.
4. If I ask for a PR or MR, create one using `gh pr create` with a summary of changes and a test plan.

Never commit without approval. Never use --no-verify.
