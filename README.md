# GlassBox — Public Case Study

GlassBox is an independent iPhone productivity and self-care application. This repository documents the product and its development approach without publishing the private application source code.

## Product summary

GlassBox is built around a simple idea: productivity should help people feel clear, not guilty. It combines everyday planning with reflection and a light self-care layer, helping people return to their routines after imperfect days.

The current experience is organized around five areas:

- **Self** — daily overview, mood, reflection, and personal context
- **Tasks** — lightweight planning and completion flow
- **Habits** — focused daily routines
- **Journal** — notes, gratitude, and reflection
- **Reward** — gentle progression, rewards, and a companion element

## Product areas and capabilities

- Task planning and completion
- Habit tracking and daily focus
- Mood tracking and reflection
- Journal and gratitude entries
- HealthKit-based context
- Rewards and companion progression
- Hungarian and English interface support
- Onboarding, persistence, restore, and reinstall considerations

## Technology stack

Swift · SwiftUI · SwiftData · private CloudKit sync · StoreKit 2 · HealthKit · Sign in with Apple · Xcode · TestFlight

## Current status

GlassBox is currently in TestFlight and preparing for App Store release. The focus is on validation, restore and persistence reliability, and release readiness. No App Store publication is claimed here.

## Development responsibilities

GlassBox is independently designed and developed. The work includes product shaping, SwiftUI development, persistence and sync considerations, localization, issue scoping, manual testing, regression testing, TestFlight validation, and release preparation.

AI tools assist with bounded tasks under human review; they do not replace product decisions, privacy review, or runtime acceptance.

## Testing approach

Testing combines TestFlight builds with manual functional checks, regression passes, issue reproduction, persistence and restore checks, and runtime validation appropriate to the change. A successful build is treated as useful evidence, not as proof of all runtime behavior.

## Selected technical challenges

- Maintaining understandable app state across onboarding, local persistence, sync, restore, and reinstall paths
- Treating CloudKit synchronization and restore behavior as runtime-sensitive work
- Making reward and progression flows safe to re-check during regression testing
- Balancing a calm product experience with clear, testable behavior

## Roadmap direction

The public roadmap direction is intentionally high level: continue validation, improve release readiness, and evolve the iPhone experience after the baseline is reliable. Detailed planning and implementation remain private.

## Screenshots and App Store link

Sanitized public screenshots may be added in [`assets/`](assets/). No screenshots are published yet. An App Store link will be added after a public release.

## Supporting documentation

- [Product overview](docs/product-overview.md)
- [Technical overview](docs/technical-overview.md)
- [Testing and validation](docs/testing-and-validation.md)
- [Development lessons](docs/development-lessons.md)
- [Privacy and source code](docs/privacy-and-source-code.md)

## Source-code boundary

The GlassBox application source repository is intentionally private. This is a portfolio case study, not an open-source distribution.
