# Development lessons

## Clear ownership reduces uncertainty

Different systems answer different questions: issue tracking records current scope and acceptance; version control records the committed change; durable documentation preserves decisions and historical context. Keeping those responsibilities distinct makes work easier to review.

## State, persistence, and sync need extra care

An app can compile while a restore or synchronization path still produces an unexpected user experience. Treating state transitions, persistence, and sync as connected concerns helps keep validation focused on what users actually see.

## Restore is part of the product experience

Reinstall and restore behavior is not only an infrastructure concern. It affects whether the app feels reliable and understandable when a user comes back to it.

## Acceptance criteria make testing practical

Narrow, observable acceptance criteria support better issue reproduction and regression checks. They also make it easier to separate a confirmed fix from a promising-looking build.

## Documentation supports disciplined iteration

Short, current notes about constraints, validation, and decisions reduce rediscovery. Historical knowledge is more useful when it is separated from temporary status.

## AI assistance still needs human review

AI can accelerate research, documentation, implementation support, and structured review. Product decisions, privacy boundaries, validation interpretation, and release acceptance remain human responsibilities.

## Systems troubleshooting transfers well

Experience with technical troubleshooting reinforces habits that matter in app development: establish the symptom, narrow the boundary, collect evidence, avoid assumptions, and record the outcome clearly.
