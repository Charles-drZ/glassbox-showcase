# HabitEvidenceCore — standalone Swift engineering sample

This is a **newly authored, representative example** inspired by the general problem explained in [Habits: showing only what the evidence proves](../../docs/habits-week-evidence.md). It is **not** copied, extracted, or adapted source code from the private GlassBox application, and these are **not** production test files.

The example isolates one read-only decision: which status can a day cell truthfully display given canonical completion evidence, schedule evidence and whether a write outcome is settled.

| Condition | Display state |
| --- | --- |
| Verified saved completion, settled review | `completed` |
| Verified absence, known planned day | `planned` |
| Verified absence, known unplanned day | `notScheduled` |
| Missing/unreadable evidence, pending write, or result awaiting refresh | `unresolved` |

The key distinction is that **absence of evidence is not evidence of failure**. A pending or rejected operation cannot become an optimistic success badge. After a rejected operation, the caller must obtain authoritative evidence again before projecting a final status.

## Run

Requires Swift 6.0 or newer. From the root of this public repository:

```sh
swift test --package-path samples/HabitEvidenceCore
```

The package uses Swift Testing and has no third-party dependencies, Apple frameworks, persistence, network calls, credentials or app identifiers.

## Scope and limits

This miniature model contains **no writer, data store, migration, synchronization, recovery engine or SwiftUI view**. It does not demonstrate the production GlassBox implementation, reproduce its private tests, or independently validate its runtime and HealthKit behavior. The public package tests only its own, newly authored rules.

[Privacy and source-code boundary](../../docs/privacy-and-source-code.md) · [Back to GlassBox](../../README.md)
