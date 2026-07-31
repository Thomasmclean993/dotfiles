Review the current diff or the files I specify. Security first.

1. Check for security issues first: injection, auth bypass, secrets in code, unsafe deserialization, insecure defaults.
2. Then check correctness: logic errors, edge cases, off-by-one, nil/null handling, race conditions.
3. Then check quality: unnecessary complexity, missing tests, violated conventions.
4. Every finding must include file:line and a one-sentence explanation of the risk.
5. Rank findings: Critical / High / Medium / Low.

Report only real issues. Do not flag style preferences or speculative problems. Do not suggest rewrites.
