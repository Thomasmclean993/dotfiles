Run the test suite and handle failures.

1. Detect the language and test framework (mix test, rspec, go test, jest, pytest, etc.).
2. Run the tests. Show only failures — not the full passing output.
3. For each failure: identify root cause with file:line reference, distinguish test bug from production bug.
4. If I pass `--fix`, apply fixes for each failure. Fix production code if the logic is wrong; fix the test only if the test expectation is wrong. Never silence a test to make it pass.
5. Re-run after fixing to confirm all pass.
