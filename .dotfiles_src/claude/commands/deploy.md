Run a pre-deployment checklist for the target environment I specify.

1. Confirm the target environment (staging / production / other).
2. Check: all tests passing, no uncommitted changes, branch up to date with main.
3. Check for environment-specific risks: migrations pending, config changes, feature flags, secrets rotation, dependency updates.
4. Check for rollback plan: is there one? Is it documented?
5. List any items that are not ready as blockers. List ready items as confirmed.
6. Do not proceed with deployment automatically — present the checklist and wait for explicit go-ahead.

If target environment is production, require explicit confirmation before any destructive or irreversible steps.
