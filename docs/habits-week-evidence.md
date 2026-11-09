[← GlassBox case study](../README.md)

# Habits on iPhone: show only what the evidence proves

**A SwiftUI product decision about weekly history, pending writes and incomplete data.**

GlassBox includes a day-based Habits experience. A recent accepted development slice introduced a seven-day Today/Week overview. The interesting problem was not drawing a calendar grid: it was deciding what each cell could **truthfully say** about a habit.

This public note describes the engineering decision and the bounded validation behind it. The implementation and test code remain private.

## The problem

A scheduled habit is not the same as a completed habit. A missing completion record is not necessarily a missed day, especially when data can be incomplete, a write is still pending, or the historical record is ambiguous.

The UI must distinguish these cases without inventing a weekly target, a streak, or a negative outcome that the underlying evidence does not support.

## The product model

The accepted Week projection reuses the existing schedule/history read path rather than becoming a second writer or calculating its own source of truth.

| Display state | Supported interpretation |
| --- | --- |
| Verified completion | A completion is supported by the canonical saved evidence |
| Planned, no recorded completion | A known scheduled day without a verified completion |
| Not scheduled | The available record supports that the day was not planned |
| Unresolved | History is missing, partial or ambiguous, or an operation is still unverified |

An unresolved cell is **not** shown as a failure. Archived history remains historical; it does not create new obligations.

The Week view is intentionally read-oriented. Selecting a day navigates to the existing daily experience rather than introducing a competing completion workflow.

## Independently runnable public example

The [HabitEvidenceCore Swift Package](../samples/HabitEvidenceCore/) illustrates this **general presentation decision** using newly authored types and tests. It is not taken from the private implementation, does not reproduce the original test suite and does not establish equivalence with the application.

## A race the UI must not hide

A user may check or undo a habit while the canonical write is still unresolved.

The accepted rule is:

1. A pending check or pending undo remains unresolved in the weekly projection.
2. After a verified save, the Week view displays the confirmed canonical result.
3. After a rejected or failed operation, it displays the state recovered by the existing writer — not a guessed optimistic outcome.
4. Recovery of a secondary mirror alone does not invalidate an otherwise verified canonical record.

This makes uncertainty visible at the point where a reassuring but false icon would otherwise be easy to display.

## Alternatives rejected

**Treat every missing completion as a missed habit.** Rejected: absence of evidence is not necessarily evidence of failure.

**Give the Week view its own persistence path.** Rejected: two writers could disagree about the same day.

**Treat pending feedback as saved truth.** Rejected: success must follow the existing verification contract.

**Introduce a new weekly quota or reward calculation.** Rejected as out of scope for this slice; the existing product makes no such claim.

## Validation and what it does not prove

The accepted change was accompanied by a source-scoped qualification on **2026-11-07**:

- 45 executed isolated, CloudKit-disabled macOS host tests across four suites;
- regressions covering pending check/undo, verified saves, rejected operations, identity rejection, retry and mirror recovery;
- Week source checks and existing UI-safety static checks;
- a successful unsigned generic iOS arm64 Debug build.

These outcomes were recorded against a specific private implementation revision. The source, fixtures and full logs are **not publicly reproducible in this showcase**. Host assertions and compilation do **not** prove that the rendered SwiftUI interaction passed simulator or physical-device acceptance.

The subsequently merged Habit Detail and reminder work are separate changes. Their presence does not retrospectively prove this Week UI's physical acceptance. This case study makes no App Store or production-release claim.

## What I learned

Native UI state should communicate what the underlying model actually knows, including when the right answer is *unknown*. The useful architectural boundary is not “SwiftUI versus model” but **projection versus persistence authority**.

That distinction makes the view simpler to reason about, keeps retries recoverable and avoids presenting incomplete historical data as a behavioral judgment about the user.

---

[GlassBox product overview →](../README.md)  
[Testing and validation →](testing-and-validation.md)  
[Settle watchOS engineering →](settle-watchos.md)  
[Apple development workflow →](https://github.com/Charles-drZ/glassbox-development-workflow)
